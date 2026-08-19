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

Q = 0.01; 
R = 0;
P = G*Q*G';         % Initial error covariance
x = zeros(3,1);     % Initial condition on the state
ye = zeros(length(c_obs),1);
ycov = zeros(length(c_obs),1); 

for t = 1:length(c_obs)
  % Measurement update
  Mn = P*H'/(H*P*H'+R);
  x = x + Mn*(c_obs(i)-H*x);   % x[n|n]
  P = (eye(3)-Mn*H)*P;      % P[n|n]

  ye(i) = H*x;
  errcov(i) = H*P*H';

  % Time update
  x = F*x + B*u(i);        % x[n+1|n]
  P = F*P*F' + B*Q*B';     % P[n+1|n]
end

RBC_kf = ss(F,G,[0  0  1],0,T,'inputname',{'e'},'outputname','c','StateName',{'k','a','c'});

[kalmf,L,P,M] = kalman(Plant,Q,R);



