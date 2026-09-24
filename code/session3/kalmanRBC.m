% Course: Bayesian Techniques in Macroeconomics (2026-2027)
% Instructor: Gauthier Vermandel
% Institution: Universite Paris-Dauphine PSL
%
%%% 
%%% New Classical Growth Model
%%% gauthier@vermandel.fr
%%% DSGE course @dauphine
%%% Solution by hand of the RBC model


% number of endogenous
endo_nbr = 3;
% number of exogenous
exo_nbr  = 1;
% number of simulations
Tsim	 = 200;

% Calibration
alpha		= 0.40;				% capital share in production 
beta    	= 0.99;				% discount factor
delta    	= 0.025;			% depreciation rate
rho_A		= 0.85;				% shock autocorrelation


% steady states
Kss			= ((1/beta-(1-delta))/alpha)^(1/(alpha-1));
Css			= Kss^alpha - delta*Kss;

% shock covariance
Q = .007^2;


%%% Solve the model
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
Fc 	= Fcs((Fcs<1) & (Fcs>0));
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

%% Simulate the model
x_ = zeros(endo_nbr,Tsim+1);
e_ = randn(exo_nbr,Tsim)*chol(Q);
for t = 2:(Tsim+1)
	x_(:,t) = F*x_(:,t-1)+G*e_(t-1);
end
% remove initial period of all zeros
x_ = x_(:,2:end);


% let us assume that we only observe consumption
% selection matrix pick third variables of x:
H = [0 0 1];
% that satisfies (no measurement errors):
y_obs = H *x_;

% set initial value
% should be steady state
x0 		= zeros(3,1);
Esig0 	= eye(3);
R		= 0;

% use the Kalman filter
[x_hat, Omega, S] = KF(y_obs,x0,Esig0,Q,R,F,G,H);


% Suppose now that we want to estimate 
% the covariance of error Sige

% Maximum likelihood estimation
% use fmincon to estimate theta
theta0 = Q; % initial guess for the innovation variance
theta_MLE = fmincon(@(theta) KalmanLLK(theta,y_obs,x0,Esig0,Q,R,F,G,H), ...
    theta0,[],[],[],[],eps,[]);
disp(['Estimated standard deviation of errors is ' num2str(sqrt(theta_MLE))])



