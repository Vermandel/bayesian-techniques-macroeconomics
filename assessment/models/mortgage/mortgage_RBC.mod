% G. Vermandel Dynare code


%----------------------------------------------------------------
% 0. Housekeeping (close all graphic windows)
%----------------------------------------------------------------

close all;

%----------------------------------------------------------------
% 1. Defining variables
%----------------------------------------------------------------

var y (long_name='output'),
	c (long_name='consumption'),
	r (long_name='real rate'),
	q (long_name='house price'),
	b (long_name='borrowing'),
	phi_I (long_name='shadow value borrowing'),
	h_I (long_name='housing impatient'),
	h_P (long_name='housing patient'),
	c_I (long_name='consumption impatient'),
	c_P (long_name='consumption patient'),
	l_I (long_name='labor impatient'),
	l_P (long_name='labor patient'),
	w_P (long_name='real wage patient'),
	w_I (long_name='real wage impatient'),
	lb_I (long_name='marginal utility in consumption impatient'),
	lb_P (long_name='marginal utility in consumption patient'),
	e_a e_m e_h e_c;
varexo eta_a eta_m eta_h eta_c;
parameters 	beta_I beta_P lambda sigmaL delta j m
			% shocks 
			rho_a rho_m rho_h rho_c ;

%----------------------------------------------------------------
% 2. Calibration
%----------------------------------------------------------------
beta_I 	= .95;		% Discount factor impatient household
beta_P 	= .99;		% Discount factor patient household
lambda 	= .75;		% Share of patient households
j		= .0924;	% Preference parameter on housing
m		= .85;		% LTV ratio of collateral constraint
sigmaL 	= 1;		% Disutility of labor
delta	= .02;		% Depreciation rate of housing

rho_a	= .95;		% productivity AR
rho_m	= .8;		% collateral AR
rho_h	= .8;		% hours work shock AR
rho_c	= .8;		% preference shock AR


	
%
%----------------------------------------------------------------
% 3. Model
%----------------------------------------------------------------	
model(linear);
	#Lss	= 1/3;		% labor supply in ss
	#Rss	= 1/beta_P;
	#Lss_P	= Lss; 
	#Lss_I 	= Lss;
	#Yss	= Lss_P^lambda * Lss_I^(1-lambda);
	#Wss_P	= lambda*Yss/Lss_P;
	#Wss_I	= (1-lambda)*Yss/Lss_I;
	#PHIss_I= 1-beta_I/beta_P;	
	#Css_I 	= Wss_I*Lss_I/(1+delta*j/(1-(1-delta)*beta_I-PHIss_I*m)+(Rss-1)/Rss*m*j/((1-(1-delta)*beta_I-PHIss_I*m)));
	#LBss_I = (Css_I)^-1;
	#Hss_I 	= j/((1-(1-delta)*beta_I-PHIss_I*m)*LBss_I);
 	#Hss_P	= (Yss - delta*Hss_I  - Css_I)/((1-(1-delta)*beta_P)/j+delta);
	#Css	= Yss - delta*(Hss_I+Hss_P);
	#Css_P	= Css - Css_I;
	#LBss_P	= (Css_P)^-1;
	#Bss	= (m * Hss_I)/Rss;
	#chi_I	= LBss_I*Wss_I/(Lss_I^sigmaL); 
	#chi_P	= LBss_P*Wss_P/(Lss_P^sigmaL); 
	#Hss	= Hss_I + Hss_P;


 
	%% HOUSEHOLDS
	[name='marginal utility consumption']
	lb_I = e_c-c_I;
	lb_P = e_c-c_P;
	[name='Euler consumption']
	-PHIss_I*phi_I 	= lb_I(+1)-lb_I+r;
	0	= lb_P(+1)-lb_P+r;
	[name='FOC h']
	e_h + sigmaL*l_I = lb_I+w_I;
	e_h + sigmaL*l_P	= lb_P+w_P;
	[name='housing utility']
	q = j/(Hss_I*LBss_I)*(-h_I-lb_I) + (1-delta)*beta_I*(lb_I(+1)-lb_I+q(+1)) + PHIss_I*m*(lb_I(+1)-lb_I+q(+1));
	q = j/(Hss_P*LBss_P)*(-h_P-lb_P) + (1-delta)*beta_P*(lb_P(+1)-lb_P+q(+1));
	[name='budget constraint']
	Css_I*c_I + Hss_I*(h_I-(1-delta)*h_I(-1)) + Rss*Bss*(r(-1)+b(-1)) = Bss*b + Wss_I*Lss_I*(w_I+l_I);
	[name='borrowing constraint']
	b+r = e_m+q(+1)+h_I;
	
	%% FIRMS
	[name='Technology']
	y = e_a+lambda *l_P + (1-lambda)*l_I;
	[name='Wage returns']
	w_P = y-l_P;
	w_I = y-l_I;
		[name='Aggregate constraint']
		Yss*y = Css*c + Hss_I*(h_I-(1-delta)*h_I(-1)) + Hss_P*(h_P-(1-delta)*h_P(-1));
	[name='Aggregate consumption']
	Css*c = Css_I*c_I + Css_P*c_P;
	[name='housing stock']
	0 = Hss_I*h_I + Hss_P*h_P;

	% shock process
	e_a = rho_a*e_a(-1)+eta_a;
	e_m = rho_m*e_m(-1)+eta_m;
	e_h = rho_h*e_h(-1)+eta_h;
	e_c = rho_c*e_c(-1)+eta_c;

end;

%----------------------------------------------------------------
% 4. Computation
%----------------------------------------------------------------
resid(1);
check;

%%%%% SIMULATING THE MODEL
shocks;
	var eta_a;  stderr 1;
	var eta_m;  stderr 1;
	var eta_h;  stderr 1;
	var eta_c;  stderr 1;
end;

stoch_simul(order=1, irf=25);	

