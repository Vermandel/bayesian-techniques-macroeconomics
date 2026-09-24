// Course: Bayesian Techniques in Macroeconomics (2026-2027)
// Instructor: Gauthier Vermandel
// Institution: Universite Paris-Dauphine PSL
//
%%% 
%%% New Classical Growth Model
%%% gauthier@vermandel.fr
%%% DSGE course @dauphine
%%% 

var k a c;
parameters  alpha beta delta rho_A Css Kss;
varexo e_a;

% Calibration
alpha		= 0.40;				% capital share in production 
beta    	= 0.99;				% discount factor
delta    	= 0.025;			% depreciation rate
rho_A		= 0.85;				% shock autocorrelation

% steady states
Kss			= ((1/beta-(1-delta))/alpha)^(1/(alpha-1));
Css			= Kss^alpha - delta*Kss;

% Model
model(linear);
	[name='Budget constraint']
	k = Kss^(alpha-1)*a + (Kss^(alpha-1)*alpha + (1-delta))*k(-1) - Css/Kss*c;
	[name='Euler equation']
	c = c(+1) - beta*alpha*Kss^(alpha-1)*(a(+1) + (alpha-1)*k);
	[name='Productivity shock']
	a = rho_A*a(-1)+e_a;
end;

% shock calibration
shocks;
	var e_a;  stderr .007;
end;

% check the stability 
check;

% perform stochastic simulations
stoch_simul(irf=30) c k a;

% model in dynare reads as
% y(t) = F*x(t-1) + G*e(t)
% y : all variables
% k : state variables
Fdynare = oo_.dr.ghx;
Gdynare = oo_.dr.ghu;


%%% Compare RBCs with Dynare
%% extract parameters
k1 = Kss^(alpha-1);
k2 = Kss^(alpha-1)*alpha+(1-delta);
k3 = Css/Kss;
c1 = beta*alpha*Kss^(alpha-1);
c2 = beta*alpha*Kss^(alpha-1)*(alpha-1);
%% Get closed-form solution of the form:
% x(t) = F*x(t-1) + G*e(t)
% 1) Compute matrix F:
% find roots of the equation - roots([A*x^2 B*x C])
Fcs = roots([-k3 (-1+k3*c2+k2) -k2*c2]);
% pick the stable one
Fc 	= Fcs(find((Fcs<1).*(Fcs>0)));
Fk = k2 - k3*Fc;
% 2) Compute matrix G:
Gc = ((Fc-c2)*k1-c1*rho_A)/((Fc-c2)*k3+1-rho_A);
Gk = k1-k3*Gc;

% build model's matrices
% x = [ k, a, c]'
F = [ 	Fk,	Gk*rho_A,	0;
		0,	rho_A,		0;
		Fc,	Gc*rho_A,	0];
G = [ Gk;	1;	Gc];

%% Simulate an IRF
x_ = zeros(M_.endo_nbr,options_.irf+1);
e_ = zeros(M_.exo_nbr,options_.irf+1);
% initial x(0) = 0 : model is at steady state
% shock in t=2;
e_(:,2) = chol(M_.Sigma_e);
for t = 2:(options_.irf+1)
	x_(:,t) = F*x_(:,t-1)+G*e_(t);
end

% draw result
figure;
subplot(1,3,1)
plot(1:options_.irf,x_(1,2:end),1:options_.irf,oo_.irfs.k_e_a,'o')
title('k')
subplot(1,3,2)
plot(1:options_.irf,x_(2,2:end),1:options_.irf,oo_.irfs.a_e_a,'o')
title('a')
subplot(1,3,3)
plot(1:options_.irf,x_(3,2:end),1:options_.irf,oo_.irfs.c_e_a,'o')
title('c')
legend('By hand solution','Dynare')