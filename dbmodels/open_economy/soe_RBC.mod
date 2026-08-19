close all;
%format long

%----------------------------------------------------------------
% 1. Defining variables
%----------------------------------------------------------------

var c_H (long_name='home consumption'),
	r_H (long_name='home real rate'),
	w_H (long_name='home real wage'),
	h_H (long_name='home hours'),
	y_H (long_name='home output'),
	p_H (long_name='home relative price'),
	b_H (long_name='purchase of foreign assets of country H'),
	lb_H (long_name='home marginal utility in consumption'),
	ex_H (long_name='home exports'),
	c_F (long_name='foreign consumption'),
	r_F (long_name='foreign real rate'),
	w_F (long_name='foreign real wage'),
	h_F (long_name='foreign hours'),
	y_F (long_name='foreign production'),
	p_F (long_name='foreign relative price'),
	b_F (long_name='purchase of foreign assets of country F'),
	lb_F (long_name='foreign marginal utility in consumption'),
	ex_F (long_name='foreign exports'),
	rer (long_name='real exchange rate'),
	e_z_H e_p_H e_r_H e_x_H
	e_z_F e_p_F e_r_F e_x_F
	e_e;

varexo	eta_z_H eta_p_H eta_r_H eta_x_H eta_z_F eta_p_F eta_r_F eta_x_F eta_e;

parameters	sigmaC sigmaH beta alpha chi_B chi_H chi_F  mu alpha_C n rho phi_pi phi_y 
			rho_e Yss_H Yss_F Css_H Css_F Bss_H Bss_F Rss_H Rss_F
			rho_z_H rho_r_H rho_p_H rho_x_H
			rho_z_F rho_r_F rho_p_F rho_x_F
			;

%----------------------------------------------------------------
% 2. Calibration
%----------------------------------------------------------------
sigmaC		= 1.5;		% risk aversion
sigmaH		= 2;		% labor supply
beta		= .994;		% discount factor
alpha		= .7;		% share of labor in production
chi_B		= 0.007;	% cost of foreign debt
mu			= 2;		% Substitution between home/foreign goods
alpha_C		= .1;		% Share of home goods in consumption basket
n			= .4;	% share of home country
					% size of foreign country 1-n
rho_z_H 	= .95;
rho_p_H 	= .95;
rho_r_H		= .4;
rho_x_H		= .4;
rho_z_F 	= .95;
rho_p_F 	= .95;
rho_r_F		= .4;
rho_x_F		= .4;
rho_e		= .1;
%% SS
Hss_H		= 1/3;
Hss_F		= 1/3;
Yss_H		= Hss_H^alpha;
Yss_F		= Hss_F^alpha;
Css_H		= (Yss_H-alpha_C/(1-alpha_C)*(1-n)/n*Yss_F)/((1-alpha_C)-alpha_C^2/(1-alpha_C));
Css_F		= 1/(1-alpha_C)*Yss_F-alpha_C/(1-alpha_C)*Css_H*n/(1-n);
LBss_H 		= (Css_H)^-sigmaC;
LBss_F 		= (Css_F)^-sigmaC;
Rss_H		= 1/beta;
Rss_F		= 1/beta;
Bss_H		= (((1-alpha_C)*Css_H + alpha_C*Css_F*(1-n)/n) - Css_H)/(1-Rss_F);
Bss_F		= -n/(1-n)*Bss_H;
RERss		= 1;
Wss_H		= 1/Hss_H*(alpha*Yss_H);
Wss_F		= 1/Hss_F*(alpha*Yss_F);
Pss_H		= 1; Pss_F		= 1;
EXss_H 		= alpha_C*Css_F*(1-n);
EXss_F 		= alpha_C*Css_H*n;
chi_H		= LBss_H*Wss_H/(Hss_H^sigmaH);
chi_F		= LBss_F*Wss_H/(Hss_F^sigmaH);


%----------------------------------------------------------------
% 3. Model (the number refers to the equation in the paper)
%----------------------------------------------------------------
model;
	[name='FOC c']
	lb_H = -sigmaC*c_H;
	lb_F = -sigmaC*c_F;
	[name='Euler equation']
	lb_H = lb_H(+1) + r_H;
	lb_F = lb_F(+1) + r_F;
	[name='Labor Supply']
	sigmaH*h_H = lb_H+w_H;
	sigmaH*h_F = lb_F+w_F;
	
	[name='Production function']
	y_H = e_z_H + alpha*h_H;
	y_F = e_z_F + alpha*h_F;
	[name='FOC h']
	w_H = y_H-h_H;
	w_F = y_F-h_F;
	[name='Resources constraint']
	Yss_H*y_H = (1-alpha_C)*Css_H*(-mu*p_H+c_H) + (1-n)/n*alpha_C*Css_F*(-mu*(p_H-rer)+c_F+e_x_F);
	Yss_F*y_F = (1-alpha_C)*Css_F*(-mu*p_F+c_F) + n/(1-n)*alpha_C*Css_H*(-mu*(p_F+rer)+c_H+e_x_H);

	[name='CES price index']
	0 = (1-alpha_C)*p_H + alpha_C*rer;
	0 = (1-alpha_C)*p_F - alpha_C*rer;
	
	%%% Common macro variables from the Home country perspective
	[name='Net Foreign assets accumulation']
	Bss_H*b_H = Rss_F*Bss_H*(r_F(-1)+b_H(-1)+rer-rer(-1)) + (1-alpha_C)*Css_H*((1-mu)*p_H+c_H) + alpha_C*(1-n)/n*Css_F*((1-mu)*p_H+mu*rer+c_F+e_x_F) - Css_H*c_H;
	[name='International financial markets accounting']
	n*Bss_H*b_H + (1-n)*Bss_F*b_F = 0;
	[name='Real exchange rate']
	rer(+1)-rer = r_H-r_F-e_e+chi_B*Bss_H*b_H;
	[name='Exports']
	ex_H = e_x_H - mu*(p_H-rer) + c_F;
	ex_F = e_x_F - mu*(p_F+rer) + c_H;
	
	[name='Country specific shocks']
	e_z_H = rho_z_H*e_z_H(-1) + eta_z_H;
	e_p_H = rho_p_H*e_p_H(-1) + eta_p_H;
	e_r_H = rho_r_H*e_r_H(-1) + eta_r_H;
	e_x_H = rho_x_H*e_x_H(-1) + eta_x_H;
	e_z_F = rho_z_F*e_z_F(-1) + eta_z_F;
	e_p_F = rho_p_F*e_p_F(-1) + eta_p_F;
	e_r_F = rho_r_F*e_r_F(-1) + eta_r_F;
	e_x_F = rho_x_F*e_x_F(-1) + eta_x_F;
	e_e   = rho_e*e_e(-1)     + eta_e;
	
end;

%steady;
resid(1);
check;


%% SIMULATIONS
shocks;
var eta_z_H;  stderr 0.01;
var eta_p_H;  stderr 0.01;
var eta_r_H;  stderr 0.01;
var eta_e;	  stderr 0.01;
var eta_x_H;  stderr 0.01;
end;

stoch_simul(order=1, irf=20) y_H y_F c_H c_F  r_H r_F rer ex_H ex_F;
