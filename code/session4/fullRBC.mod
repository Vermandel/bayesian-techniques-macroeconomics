close all;
%----------------------------------------------------------------
% 0. Housekeeping (close all graphic windows)
%----------------------------------------------------------------

close all;

%----------------------------------------------------------------
% 1. Defining variables
%----------------------------------------------------------------

var y c k i h w r z q dy e_a e_g e_h e_i;


varexo eta_a eta_g eta_h eta_i;

parameters beta delta alpha sigmaC sigmaL hc chi gy kappa rho_a rho_g rho_h rho_i Zss Iss Css Yss;

%----------------------------------------------------------------
% 2. Calibration
%----------------------------------------------------------------



%Parametres exogenes RBC Cycles
beta 	= 0.99; 	%Discount Factor
delta 	= 0.025;	%Depreciation rate
alpha 	= 0.36;		%Capital share
gy 		= 0.2;   	%Public spending in GDP
sigmaC 	= 2;		%Consumption risk
sigmaL 	= 1; 		%Elasticity of labor
kappa	= 4;		%Investment Adjustment cost
hc		= 0;		% consumption habits

% autoregressive roots parameters
rho_a	= 0.95;
rho_g	= 0.95;
rho_h	= 0.95;
rho_i	= 0.95;


Rss		= 1/beta;
Hss		= 1/3;
Zss		= (Rss-(1-delta));
Kss		= Hss*(Zss/alpha)^(1/(alpha-1));
Yss		= Kss^alpha*Hss^(1-alpha);
Iss		= delta*Kss;
Wss		= (1-alpha)*Yss/Hss;
Css		= (1-gy)*Yss-Iss;
chi		= Wss/((Hss^sigmaL)*((Css-hc*Css))^sigmaC);


%----------------------------------------------------------------
% 3. Model
%----------------------------------------------------------------

model(linear); 
	%% Household
	[name='Euler']
	1/sigmaC*r =(c(+1)-hc*c)-(c-hc*c(-1));
	[name='Labor Supply']
	w = e_h+ sigmaL*h + sigmaC/(1-hc)*(c-hc*c(-1));
	
	%% Capital supply
	[name='No arbitrage Bonds-Capital']
	r=beta*(Zss*z(+1)+(1-delta)*q(+1))-q; 
	[name='Capital law of motion']
	e_i + delta*i = k - (1-delta)*k(-1);
	[name='shadow value of capital']
	e_i + q = kappa*(i-i(-1))*Iss - beta*kappa*(i(+1)-i);
			
	%% Production
	[name='technology']
	y = e_a+alpha*k(-1)+(1-alpha)*h;
	[name='Inputs Cost minimization']
	z=y-k(-1);
	w=y-h;
	
	[name='Resources Constraint']
	y = Css/Yss*c + Iss/Yss*i + gy*e_g;
	
	[name='Measurement: output growth']
	dy = y-y(-1);
	
	
	[name='shocks']
	e_a = rho_a*e_a(-1)+eta_a;
	e_g = rho_g*e_g(-1)+eta_g;
	e_h = rho_h*e_h(-1)+eta_h;
	e_i = rho_i*e_i(-1)+eta_i;
	
end;

%----------------------------------------------------------------
% 4. Computation
%----------------------------------------------------------------



estimated_params;
    stderr   eta_a,	.7,	0,	inf,	inv_gamma_pdf,	.1,	2;
			rho_a,	.8,		0,	1,		beta_pdf,		.5,	.2;
end;

varobs dy;


estimation(
	datafile=mydata,		% data file
	first_obs=1,			% sample starting date to compute likelihood
	mh_replic=20000,		% number of mcmc draws 
	mh_jscale=0.2,			% scale covariance in gaussian noise of candidate parameters
	prefilter=1,			% discard the sample mean
	bayesian_irf			% trigger the computation of bayesian irfs
	) y c k ;

/*
% uncomment to reload result
estimation(datafile=mydata,first_obs=1,mh_replic=0,mh_jscale=0.5,prefilter=1,load_mh_file,mode_file=RBC_estim_mode,mode_compute=0) y c k;
*/
