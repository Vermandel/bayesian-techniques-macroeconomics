% The Kalman filter recursion

function [xt, Sigma, ytilde] = KalmanFilter(Y,X,x0,P0,Q,R,C,F,M,A)

% State-space notation
%
% y_t = M'*x_t + w_t,          
% x_{t+1} = F*x_t + v_{t+1}   
%
% E[v_{t+1};w_t]*[v_{t+1};w_t]' = [Q,C';C,R]
% E[v_{t+1};w_{t}] = [0;0]
%
%==========================================================================
% Structure: Input:  Y      - matrix of observables (1xT)
%                    X      - matrix of observable regressors (pxT)
%                    x0  - initial value for state mean (1xT)
%                    P0     - initial value for state MSE (1x1xT)
%                    R      - observation innovation variance 
%                    Q      - state innovation variance 
%                    C      - covariance between state and observation
%                    innovations 
%                    F      - state transition matrix 
%                    M      - coefficients on states in observation eq. 
%                    A      - coefficients on observable regressors
%
%            Output: xtt - filtered (updated, x(t|t)) state
%                    Sigma  - conditional variance of forecast errors
%                    ytilde - conditional forecast errors
%==========================================================================

% basics

T = max(size(Y));           % sample length

% allocating memory

Ptt     = zeros(1,1,T);     % P_{t|t}
Ptt_1   = zeros(1,1,T);     % P_{t|t-1}
xt   = zeros(1,T);       % x_{t|t}
xt_1 = zeros(1,T);       % x_{t|t-1}
Sigma   = zeros(T,1);       % cond. forecast error variance
ytilde  = zeros(T,1);       % cond. forecast error

% initial values
Ptt_1(:,:,1)    = P0;       % P(1|0)
xt_1(:,1)    	= x0;    % x(0|0)

for t=1:T
    % define necessary matrices
    Sigma(t)    = M'*Ptt_1(:,:,t)*M + R + M'*C + C'*M;
    ytilde(t)   = Y(t) - A*X(t) - M'*xt_1(:,t);
    K           = (Ptt_1(:,:,t)*M + C)*(Sigma(t))^(-1);
    
    % Kalman filter recursions
    xt(:,t)  = xt_1(:,t) + K*ytilde(t);               % update state mean
    Ptt(:,:,t)  = Ptt_1(:,:,t) - K*(M'*Ptt_1(:,:,t) + C');  % update state variance-covariance matrix
    
    xt_1(:,t+1)  = F*xt(:,t);                         % forecast state mean
    Ptt_1(:,:,t+1)  = F*Ptt(:,:,t)*F' + Q;                  % forecast state varicance-covariance matrix     
end
