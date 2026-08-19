function [x_hat, Omega, S] = KF(Y,x0,Esig0,Q,R,F,G,H)

T = size(Y,2);           
n = size(F,1);

% allocating memory
Sigma   = nan(n,n,T);		% Sigma_{t}
ESigma  = nan(n,n,T);		% E_{t-1}(Sigma_{t})
x_hat   = nan(n,T);    		% x_{t}
Ex_hat  = nan(n,T);			% E_{t-1}(x_{t})
Omega   = nan(T,1);			% conditional forecast error variance
S  		= nan(T,1);			% conditional forecast error mean

% initial values
ESigma(:,:,1)   = Esig0;		% E_{0}(Sigma_{1})
Ex_hat(:,1)     = x0;		% E_{0}(x_{1})

% Start recursion
for t = 1:T
    
	% Conditional forecast error variance
    Omega(t) 	= H*ESigma(:,:,t)*H' + R ;
    % Prediction error
	S(t)   		= Y(t) - (H)*Ex_hat(:,t);
	% Kalman Update 
    K           = (ESigma(:,:,t)'*(H)' )*(Omega(t))^(-1);
    
    % Update state mean
    x_hat(:,t)  = Ex_hat(:,t) + K*S(t); 
	% Update state variance-covaiance
    Sigma(:,:,t) = ESigma(:,:,t) - K*H*ESigma(:,:,t); 
    
	% forecast state mean and state variance-covariance
    Ex_hat(:,t+1)  	= F*x_hat(:,t); 
    ESigma(:,:,t+1) = F*Sigma(:,:,t)*F' + G*Q*G';
	

end
