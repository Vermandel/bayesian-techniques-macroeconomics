% Course: Bayesian Techniques in Macroeconomics (2026-2027)
% Instructor: Gauthier Vermandel
% Institution: Universite Paris-Dauphine PSL
%
mu    = 0.1;    % mean 
sig   = 1;      % std
T     = 1000;    % number of draws

% data generating process
y_obs = mu + sig*randn(T,1);


% try one theta1=[mu1,sig1]
mu1  = 2;
sig1 = 1;
% try one theta2=[mu2,sig2]
mu2  = 0.1;
sig2 = 0.6;

% initial value for the loop
LL2 = 1; LL1 = 1; LLtrue=1;
% compute LK
for t = 1:T
   LL1 = LL1 * 1/(sig1*sqrt(2*pi)) * exp(-(y_obs(t)-mu1)^2/(2*sig1^2));
   LL2 = LL2 * 1/(sig2*sqrt(2*pi)) * exp(-(y_obs(t)-mu2)^2/(2*sig2^2));
   LLtrue = LLtrue * 1/(sig*sqrt(2*pi)) * exp(-(y_obs(t)-mu)^2/(2*sig^2));
end

% Keep the products above to expose floating-point underflow.
% Compare candidates using sums of analytic Gaussian log densities instead.
% Taking log(LL1) after multiplication cannot recover an underflowed product.
logLL1 = sum(-log(sig1*sqrt(2*pi)) - (y_obs-mu1).^2/(2*sig1^2));
logLL2 = sum(-log(sig2*sqrt(2*pi)) - (y_obs-mu2).^2/(2*sig2^2));
logLLtrue = sum(-log(sig*sqrt(2*pi)) - (y_obs-mu).^2/(2*sig^2));
candidate_names = {'True DGP', 'Candidate 1', 'Candidate 2'};
log_likelihoods = [logLLtrue, logLL1, logLL2];
[~, best_candidate] = max(log_likelihoods);
fprintf('Density products [true, candidate 1, candidate 2]: %.6g %.6g %.6g\n', ...
	LLtrue, LL1, LL2);
fprintf('Log likelihoods [true, candidate 1, candidate 2]: %.6f %.6f %.6f\n', ...
	log_likelihoods);
fprintf('Highest sample log likelihood: %s\n', candidate_names{best_candidate});

% support of the distribution
minx = norminv(0.01,mu,sig);
maxx = norminv(0.99,mu,sig);

% plotting result
h=figure;
subplot(1,2,1)
xs = minx:0.01:maxx;
plot(xs,normpdf(xs,mu,sig),'LineWidth',2)
hold on;
plot(xs,normpdf(xs,mu1,sig1),'LineWidth',2)
plot(xs,normpdf(xs,mu2,sig2),'LineWidth',2)
hold off;
legend('N(0.1,1) (true)','N(2,1)','N(0.1,0.6)')
title('distributions comparison')
subplot(1,2,2)
hist(y_obs,20);
title('histogram of fake data')

