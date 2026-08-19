% Toy model of unemployment
% gauthier@vermandel.fr

%----------------------------------------------------------------
% 0. Housekeeping (close all graphic windows)
%----------------------------------------------------------------

close all;

%----------------------------------------------------------------
% 1. Defining variables
%----------------------------------------------------------------

var rr (long_name='real rate'),
	c (long_name='consumption'),
	n (long_name='employment'),
	u (long_name='unemployment'),
	w (long_name='real wage'),
	y (long_name='output'),
	k (long_name='capital'),
	i (long_name='investment'),
	lb (long_name='marginal utility in consumption'),
	q (long_name='shadow price capital'),
	x v_H v_P;
var e_a e_g e_c e_m e_i;


varexo eta_a eta_g eta_c eta_m eta_i;

parameters beta delta alpha sigmaC sigmaL Uss delta_N phi gy  eta gamma kappa
			rho_a rho_g rho_c rho_m rho_i;
            
            
%----------------------------------------------------------------
% 2. Calibration
%----------------------------------------------------------------
delta_N = .1;		% separation rate
eta		= .5;		% negotiation share
phi		= 0.15;		% shape hiring cost function
beta 	= 0.993; 	% Discount factor firms
delta 	= 0.025;	% Depreciation rate
alpha 	= 0.30;		% Capital share
gy 		= 0.2;   	% Public spending in GDP
sigmaC 	= 1;		% Consumption risk aversion
sigmaL 	= 2; 		% Elasticity of labor
kappa	= 4;		% adjustment costs on investment
gamma	= .5;		% unemployment insurance as % of real wage
Uss 	= .075;		% structural unemployment rate

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
	% updating parameters
	#Rss	= 1/beta;
	#Nss 	= 1-Uss;
	#Kss	= Nss*((Rss-(1-delta))/(alpha))^(1/(alpha-1));
	#Yss	= Kss^alpha*Nss^(1-alpha);
	#Iss	= delta*Kss;
	#Xss 	= delta_N*Nss/Uss;	
	#Gam 	= 0.01*Yss/(Xss^(1+phi)*Uss/(1+phi));
	#VPss 	= Gam*Xss^phi;
	#VHss 	= eta/(1-eta)*VPss;
	#Wss 	= (1-alpha)*Yss/Nss - VPss  + beta*((1-delta_N)*VPss);
	#Css  	= (1-gy)*Yss-Iss-Gam/(1+phi)*Xss^(1+phi)*Uss;
	#LBss 	= Css^-sigmaC;
	#chi 	= ((1-gamma)*Wss - VHss*(1-beta*(1-delta_N)))*LBss;
	#b		= gamma*Wss;

	%% Household
	[name='marginal utility of consumption']
	lb = e_c-sigmaC*c;
	[name='Euler']
	lb(+1)-lb+rr = 0;
	[name='Labor Supply']
	VHss*v_H = Wss*w  + chi/LBss*lb + beta*(1-delta_N)*VHss*(lb(+1)-lb+v_H(+1));
	[name='Employment law of motion']
	n = (1-delta_N)*n(-1) + Xss*Uss/Nss*(x+u);
	[name='Unemployment rate']
	u = -Nss/Uss*n;

	%% Production
	[name='technology']
	y = e_a+alpha*k(-1)+(1-alpha)*n;
	[name='Capital law of motion']
	delta*(e_i+i) = k-(1-delta)*k(-1);
	[name='FOC k']
	beta*((1-delta)*q(+1)+alpha*Yss/Kss*(y(+1)-k)) = q+rr;
	[name='FOC i']
 	e_i+q =  kappa*(i-i(-1)) - beta*kappa*(i(+1)-i);
	[name='FOC n']
	VPss*v_P = (1-alpha)*Yss/Nss*(y-n) - Wss*w + beta*(1-delta_N)*VPss*(lb(+1)-lb+v_P(+1));
	[name='FOC x']
	phi*x = v_P;

	[name='wage']
	%-e_m = VPss/VHss*(e_m+v_P-v_H);
	-e_m = VPss/VHss*(e_m+v_P);
	
	VHss 	= eta/(1-eta)*VPss;
	%% AGGREGATION
	[name='Resources Constraint']
	y = Css/Yss*c + Iss/Yss*i + gy*e_g + Gam/(1+phi)*Xss^(1+phi)*Uss*((1+phi)*x+u);
	
	[name='productivity shock']
	e_a = rho_a*e_a(-1)+eta_a;
	[name='spending shock']
	e_g = rho_g*e_g(-1)+eta_g;
	[name='preference shock']
	e_c = rho_c*e_c(-1)+eta_c;
	[name='investment shock']
	e_i = rho_i*e_i(-1)+eta_i;
	[name='negotiation power shock']
    e_m = rho_m*e_m(-1)+eta_m;
end;

    
%----------------------------------------------------------------
% 4. Computation
%----------------------------------------------------------------


%%% SIMULATIONS
% this should be remove to set your estimation block after this
shocks;
	var eta_a;	stderr 1;
	var eta_g;	stderr 1;
	var eta_c;	stderr 1;
	var eta_m;	stderr 1;
	var eta_i;	stderr 1;
end;
	
resid(1);
check;
stoch_simul(irf=30,order=1) y c i rr u x ;

