% Toy model of borrowing constraint for entrepreneurs
% gauthier@vermandel.fr

%----------------------------------------------------------------
% 0. Housekeeping (close all graphic windows)
%----------------------------------------------------------------

close all;

%----------------------------------------------------------------
% 1. Defining variables
%----------------------------------------------------------------

var rr (long_name='real rate'), 
	c (long_name='total consumption'),
	c_E (long_name='entrepreneur consumption'),
	c_H (long_name='household consumption'),
	h (long_name='hours worked'),
	w (long_name='real wage'),
	y (long_name='output'),
	k (long_name='physical capital'),
	i (long_name='investment'),
	l (long_name='real loans'), 
	lb_E  (long_name='marginal utility in consumption entrepreneur'),
	phi_E (long_name='borrowing value'),
	lb_H (long_name='marginal utility in consumption household'),
	q (long_name='house price');
var    e_a e_g e_c e_m e_i;


varexo eta_a eta_g eta_c eta_m eta_i;

parameters beta_E beta_H delta alpha sigmaC sigmaL gy mh mk kappa hh
			rho_a rho_g rho_c rho_m rho_i;
            
            
%----------------------------------------------------------------
% 2. Calibration
%----------------------------------------------------------------

beta_H 	= 0.993; 	% Discount factor firms
beta_E  = 0.980;	% Discount factor entrepreneurs
delta 	= 0.025;	% Depreciation rate
alpha 	= 0.30;		% Capital share
gy 		= 0.2;   	% Public spending in GDP
hh		= 0.3;		% Consumption habits
sigmaC 	= 1;		% Consumption risk aversion
sigmaL 	= 1; 		% Elasticity of labor
mk      = 0.8;		% Capital borrowing constraint
mh      = 1;		% Labor borrowing constraint
kappa	= 4;		% adjustment costs on investment

% autoregressive roots parameters
rho_a	= 0.95;
rho_g	= 0.95;
rho_c	= 0.95;
rho_m  	= 0.95;
rho_i	= 0.95;

	
%----------------------------------------------------------------
% 3. Model
%----------------------------------------------------------------

model(linear); 
	#Hss		= 1/3;
	#Rss		= 1/beta_H;
	#PHIss_E	= 1-beta_E/beta_H;
	#Kss		= Hss*(((1-PHIss_E*mk/Rss)/beta_E-(1-delta))/(alpha))^(1/(alpha-1));
	#Yss		= Kss^alpha*Hss^(1-alpha);
	#Iss		= delta*Kss;
	#Wss		= (1-alpha)*Yss/Hss/(1+mh*PHIss_E);
	#Lss		= mk*Kss/Rss - mh*Wss*Hss;
	#Css_E 		= -delta*Kss - Wss*Hss + Yss + (1-Rss)*Lss;
	#Css_H  	= (1-gy)*Yss-Iss - Css_E;
	#Css		= Css_E+Css_H;
	#LBss_E 	= (Css_E)^-sigmaC;
	#LBss_H 	= (Css_H)^-sigmaC;
	#chi		= LBss_H*Wss/(Hss^sigmaL);

	%% Household
	[name='marginal utility of consumption']
	lb_H = e_c-sigmaC*c_H;
	[name='Euler']
	lb_H(+1)-lb_H+rr = 0;
	[name='Labor Supply']
	w+lb_H = sigmaL*h;
   	
	%% Production
	[name='technology']
	y = e_a+alpha*k(-1) + (1-alpha)*h;
	[name='Borrowing constraint']
	Lss*l = (mk*Kss/Rss)*(e_m+q(+1)+k-rr) - mh*Wss*Hss*(w+h);
	[name='Capital law of motion']
	delta*(i+e_i) = k-(1-delta)*k(-1);
	[name='FOC c']
	lb_E = e_c-sigmaC*c_E;
	[name='FOC k']
	(1-delta)*q(+1)+alpha*Yss/Kss*(y(+1)-k)
	+ ((1-delta)+alpha*Yss/Kss)*(lb_E(+1)-lb_E)
	+ PHIss_E*mk*(phi_E+q(+1)+e_m-rr) = q*Rss;
	[name='FOC i']
	e_i+q = kappa*(i-i(-1)) - beta_E*kappa*(i(+1)-i);
	[name='FOC h']
	Wss*w+mh*PHIss_E*Wss*(w+phi_E) = (1-alpha)*Yss/Hss*(y-h);
	[name='FOC l']
	-PHIss_E*phi_E = beta_E*Rss*(lb_E(+1)-lb_E+rr);

	%% AGGREGATION
	[name='balance sheet']
	Css_E*c_E + Iss*i + Wss*Hss*(w+h) + Rss*Lss*(rr(-1)+l(-1)) = Yss*y + Lss*l;
	[name='Resources Constraint']
	y = Css/Yss*c + Iss/Yss*i + gy*e_g;
	[name='Total consumption']
	Css*c = Css_E*c_E + Css_H*c_H;
	
	[name='shocks']
	e_a = rho_a*e_a(-1)+eta_a;
	e_g = rho_g*e_g(-1)+eta_g;
	e_c = rho_c*e_c(-1)+eta_c;
	e_i = rho_i*e_i(-1)+eta_i;
    e_m = rho_m*e_m(-1)+eta_m;
end;

    
%----------------------------------------------------------------
% 4. Computation
%----------------------------------------------------------------

	
shocks;
	var eta_a;	stderr 1;
	var eta_g;	stderr 1;
	var eta_c;	stderr 1;
	var eta_m;	stderr 1;
	var eta_i;	stderr 1;
end;
	
resid(1);
%check;

stoch_simul(irf=30,order=1) y c_E c_H i rr q;


	
	