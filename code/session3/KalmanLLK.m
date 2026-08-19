function [llk] = KalmanLLK(theta,Y,x0,Esig0,Q,R,F,G,H)

% estimating the variance
Q=theta;

% apply the kalman filter
[~, Omega, S] = KF(Y,x0,Esig0,Q,R,F,G,H);
T=size(Y,2);

% compute llk
llk = -T/2*log(2*pi);
for t = 1:T
    llk = llk -0.5*log(det(Omega(t))) - 0.5*S(t)'*inv(Omega(t))*S(t);
end

llk = - llk;