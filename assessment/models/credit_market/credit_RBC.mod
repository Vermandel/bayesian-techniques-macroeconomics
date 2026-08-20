% Toy model of borrowing constraint for entrepreneurs
% gauthier@vermandel.fr

%----------------------------------------------------------------
% 0. Housekeeping (close all graphic windows)
%----------------------------------------------------------------

close all;

%----------------------------------------------------------------
% 1. Defining variables
%----------------------------------------------------------------

var rr c c_E c_H h w y k i l lb_E phi_E lb_H q;
var    e_a e_g e_c e_m e_i;


varexo eta_a eta_g eta_c eta_m eta_i;

parameters beta_E beta_H delta alpha sigmaC sigmaL chi gy mh mk kappa hh
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

model; 
	%% Household
	[name='marginal utility of consumption']
	lb_H = e_c*(c_H-hh*c_H(-1))^-sigmaC;
	[name='Euler']
	beta_H*lb_H(+1)/lb_H*rr = 1;
	[name='Labor Supply']
	w*lb_H = chi*(h^sigmaL);
   	
	%% Production
	[name='technology']
	y = e_a*(k(-1)^alpha)*(h^(1-alpha));
	[name='Borrowing constraint']
	l = e_m*mk*q(+1)*k/rr - mh*w*h;
	[name='Capital law of motion']
	i*e_i*(1-(kappa/2)*(i/i(-1)-1)^2) = k-(1-delta)*k(-1);
	[name='FOC c']
	lb_E = e_c*(c_E-hh*c_E(-1))^-sigmaC;
	[name='FOC k']
	((1-delta)*q(+1)+alpha*y(+1)/k)*beta_E*lb_E(+1)/lb_E + phi_E*q(+1)*e_m*mk/rr = q;
	[name='FOC i']
	e_i*q = 1 + e_i*q*(kappa/2)*( 1 + ( 3*i/i(-1)-4 )*i/i(-1) )
			  + beta_E*lb_E(+1)/lb_E*e_i(+1)*q(+1)*kappa*(1-i(+1)/i)*(i(+1)/i)^2;
	[name='FOC h']
	w = (1-alpha)*y/(h*(1+mh*phi_E));
	[name='FOC l']
	1-phi_E = beta_E*lb_E(+1)/lb_E*rr;

	%% AGGREGATION
	[name='balance sheet']
	c_E + i + w*h + rr(-1)*l(-1) = y + l;
	[name='Resources Constraint']
	y = c + i + gy*steady_state(y)*e_g;
	[name='Total consumption']
	c = c_E + c_H;
	
	[name='shocks']
	log(e_a) = rho_a*log(e_a(-1))+eta_a;
	log(e_g) = rho_g*log(e_g(-1))+eta_g;
	log(e_c) = rho_c*log(e_c(-1))+eta_c;
	log(e_i) = rho_i*log(e_i(-1))+eta_i;
    log(e_m) = rho_m*log(e_m(-1))+eta_m;
end;

    
%----------------------------------------------------------------
% 4. Computation
%----------------------------------------------------------------
steady_state_model;
		rr		= 1/beta_H;
	h		= 1/3;
	q		= 1;
	phi_E	= 1-beta_E/beta_H;
	k		= h*(((1-phi_E*mk/rr)/beta_E-(1-delta))/(alpha))^(1/(alpha-1));
	y		= k^alpha*h^(1-alpha);
	i		= delta*k;
	w		= (1-alpha)*y/h/(1+mh*phi_E);
	l		= mk*k/rr - mh*w*h;
	c_E 	= -delta*k - w*h + y + (1-rr)*l;
	c_H  	= (1-gy)*y-i - c_E;
	c		= c_E+c_H;
	lb_E 	= (c_E-hh*c_E)^-sigmaC;
	lb_H 	= (c_H-hh*c_H)^-sigmaC;
	chi		= lb_H*w/(h^sigmaL);
	e_a 	= 1;
	e_g 	= 1;
	e_c 	= 1;
	e_m 	= 1;
	e_i 	= 1;
end;

	
shocks;
	var eta_a;	stderr 1;
	var eta_g;	stderr 1;
	var eta_c;	stderr 1;
	var eta_m;	stderr 1;
	var eta_i;	stderr 1;
end;
	
resid(non_zero);
check;

stoch_simul(irf=30,order=1) y c_E c_H i rr q;


	
	
