% The Estimation of the aggregate matching function
%--------------------------------------------------------------------------

function L = loglikelihood(X0,Y,X,x0,P0)

% Defining parameters to minimize over
%--------------------------------------

% elements of the variance-covariance matrix
Q   = exp(X0(1));
R   = exp(X0(2));
C   = 0;
% transition matrix for match efficiency
F   = 1;
% elements of observatoin equation
M   = 1;
A   = X0(3);

% calling the Kalman filter routine
[x_1, Sigma, ytilde] = KalmanFilter(Y,X,x0,P0,Q,R,C,F,M,A);

T = max(size(Y));
like = zeros(T,1);

for t = 1:T
    like(t)  = -0.5*log(det(Sigma(t))) - 0.5*ytilde(t)'*(Sigma(t))^(-1)*ytilde(t); % per period log likelihood 
end

L = -(sum(like(17:end)) - (T-16)/2*log(2*pi));       % negative total log likelihood
