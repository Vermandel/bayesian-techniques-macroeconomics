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
Q = 1^2;


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

%% Simulate the model
x_ = zeros(endo_nbr,Tsim+1);
e_ = randn(exo_nbr,Tsim)*chol(Q);
for t = 2:(Tsim+1)
	x_(:,t) = F*x_(:,t-1)+G*e_(t-1);
end
% remove inital period of all zeros
x_ = x_(:,2:end);


% let us assume that we only observe consumption
% selection matrix pick third variables of x:
H = [0 0 1];
% that satisfies:
y_obs = H *x_;

%% Apply inversion filter
x_hat = zeros(endo_nbr,Tsim+1);
e_hat = zeros(exo_nbr,Tsim+1);
for t = 2:(Tsim+1)
	% invert the model
	e_hat(:,t) = inv(H*G)*(y_obs(:,t-1)-H*F*x_hat(:,t-1));
	% feed the model with new shock
	x_hat(:,t) = F*x_hat(:,t-1)+G*e_hat(:,t);
end
% remove initial period
e_hat = e_hat(:,2:end);
x_hat = x_hat(:,2:end);

% compare
figure;
subplot(1,2,1)
plot(1:Tsim,e_hat,1:Tsim,e_,'o')
title('Shocks')
legend('Filtered','True')
subplot(1,2,2)
plot(1:Tsim,H*x_hat,1:Tsim,H*x_,'o')
title('Observable (c_{t})')
legend('Smoothed','True')



% Suppose now that we want to estimate 
% the covariance of error Q

% prior mean & std of Q
mu_Sige = 1;
sd_Sige = .1;

T = length(e_hat);

% The likelihood function reads as follows:
llk = @(x) ( -T/2*log(2*pi*x)  -1/(2)*e_hat*inv(x)*e_hat');
% Prior reads as
lnprior = @(x)  log(normpdf(x,mu_Sige,sd_Sige));

% draw prior:
figure;
xx=0:.01:5;
plot(xx,exp(lnprior(xx)));
xlabel('\theta')
ylabel('p(\theta)')
title('Prior for $\hat{Q}$','Interpreter','latex')

% Bayesian estimation
% use fmincon to estimate theta
theta0 = [0.01]; % initial guess e
theta_MLE = fmincon(@(x) -llk(x),theta0);
theta_BE = fmincon(@(x) -(llk(x) + lnprior(x)),theta0);
disp('Mode:')
disp(['MLE: Est. Q ' num2str(theta_MLE)])
disp(['BE : Est. Q ' num2str(theta_BE)])

% compute covariance across estimated parameters
H = hessian(@(x)-(llk(x) + lnprior(x)),theta_BE, [0.01;1])
P = chol(inv(H));
% jump parameter that explore the density
c=2.2;
% number of draw per chain
MCsims = 20000;

% initialization
theta_mcmc = nan(1,MCsims);
AR_mcmc    = nan(1,MCsims);
pdata_mcmc    = nan(1,MCsims);
theta_mcmc(1) = theta_BE;
pdata_mcmc(1) = llk(theta_BE) + lnprior(theta_BE);
accept = 0;
best_thetai = theta_BE;
best_pdata = llk(best_thetai) + lnprior(best_thetai);

% start MCMC
for i = 2:MCsims
		% random gaussian shock on parameter
		theta = max(best_thetai + c^2*P'*randn,0.00001);
		% compute new data density
		pdata = llk(theta) + lnprior(theta);
		
		% check whether this draw is relevant
		% probability of acceptance
		r     = min(exp(pdata-best_pdata),1);     
		if (rand<r && r >= 0)
				best_pdata = pdata;
				best_thetai = theta;
				accept = accept+1;
				disp([num2str(i) ' accept - AR:' num2str(100*accept/(i-1)) '%']);
		else
				disp([num2str(i) ' reject - AR:' num2str(100*accept/(i-1)) '%']);
		end
		theta_mcmc(i)=best_thetai;
		pdata_mcmc(i)=best_pdata;
		AR_mcmc(i) = 100*accept/(i-1);
end

figure;
subplot(1,3,1)
hist(theta_mcmc,100)
title('Posterior of $\hat{Q}$','Interpreter','latex')
xlabel('Q')
ylabel('density')
subplot(1,3,2)
plot(pdata_mcmc)
title('$LLK(\theta|Y) + log(p(\theta))$','Interpreter','latex')
xlabel('draws')
subplot(1,3,3)
plot(AR_mcmc)
title('Acceptation rate','Interpreter','latex')
xlabel('draws')
ylabel('%')

% discard the beginning of the sample, the burn-in phase, to ensure choice of initial values does not matter
disp(['BE : Mean of Q is ' num2str(sqrt(mean(theta_mcmc(ceil(.1*MCsims):end))))])
