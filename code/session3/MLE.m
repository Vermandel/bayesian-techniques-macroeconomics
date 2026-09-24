% Course: Bayesian Techniques in Macroeconomics (2026-2027)
% Instructor: Gauthier Vermandel
% Institution: Universite Paris-Dauphine PSL
%
mu    = 0.1;    % mean 
sig   = 1;      % std
T     = 5000;    % number of draws

% data generating process
y_obs = mu + sig*randn(T,1);

% declare a function that compute the minus of the 
% likelihood function
llk = @(x) -( -T/2*log(2*pi*x(2)^2)  -1/(2*x(2)^2)*((y_obs-x(1))'*(y_obs-x(1))));

% Maximum likelihood estimation
% use fmincon to estimate theta
theta0 = [0 5]; % initial guess 
theta_MLE = fmincon(llk,theta0,[],[],[],[],[-Inf 1e-8]);

% explore the neighborhood of the max of the llk function
x1=linspace(0,.5,100);
x2=linspace(0.5,5,100);
llk1 = nan(size(x1));
llk2 = nan(size(x1));
for i=1:100
    llk1(i) = llk([x1(i) sig]);
    llk2(i) = llk([mu x2(i)]);    
end



% plotting result
figure;
subplot(1,2,1)
plot(x1,-llk1,'LineWidth',2)
hold on;
plot(mu,-llk([mu sig]),'ro')
hold off;
legend('LLK','True value')
title('LLK function for different \mu')
subplot(1,2,2)
plot(x2,-llk2,'LineWidth',2)
hold on;
plot(sig,-llk([mu sig]),'ro')
hold off;
title('LLK function for different \sigma')
legend('LLK','True value')
