% Course: Bayesian Techniques in Macroeconomics (2026-2027)
% Instructor: Gauthier Vermandel
% Institution: Universite Paris-Dauphine PSL
%
% file that simulates the RBC model

% number of period
T = 150;
% parameters
rho = 0.95;
beta = .99;
delta=0.025;
chi	= 0.01;
sde  = 0.01;

% policy rule coefficients
ck = 1-delta; 
Sk = (1-chi);
Sc = (1+ck-Sk)/ck;
Tk = (rho-(1-chi)-ck*rho*beta)/(rho-(1-chi)-ck*Sc);
Tc = (1-Tk)/ck;

% matrix form of the policy rule
% x(t) = F*x(t-1) + G*e(t)
% x = [ k, a, c]';
F = [	Sk Tk*rho 	0;
		0	rho		0;
		Sc	Tc*rho	0];
G = [	Tk;	1;	Tc ];

% get shocks
e = randn(size(G,2),T)*sde;

% get the path of the variables
y_ = zeros(size(F,2),T+1);
for t = 2:(T+1)
	y_(:,t) = F*y_(:,t-1) + G*e(:,t-1);
end

% plot it
figure
subplot(3,1,1)
plot(y_(1,:))
title('Capital')
subplot(3,1,2)
plot(y_(2,:))
title('Productivity')
subplot(3,1,3)
plot(y_(3,:))
title('Consumption')


c_obs =  y_(3,:);

% y = H*x + v;
H = [0  0  1];

Q = sde^2;
R = 0;
x0 = zeros(3,1);
ESig0 = eye(3);
[x_hat, Omega, prediction_error] = KF(c_obs,x0,ESig0,Q,R,F,G,H);

figure
subplot(2,1,1)
plot(1:length(c_obs),c_obs,1:length(c_obs),H*x_hat,'--')
legend('Observed consumption','Filtered consumption')
title('Kalman filter: observed and filtered consumption')
subplot(2,1,2)
plot(1:length(c_obs),prediction_error)
title('One-step-ahead prediction errors')
xlabel('Period')

assert(all(isfinite(Omega)) && all(Omega > 0), ...
    'The Kalman filter returned an invalid innovation variance.');



