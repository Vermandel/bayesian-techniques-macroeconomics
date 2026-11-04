% Course: Bayesian Techniques in Macroeconomics (2026-2027)
% Instructor: Gauthier Vermandel
% Institution: Universite Paris-Dauphine PSL
%
% Conditional Monte Carlo illustration, not a bootstrap of data/residuals.
% The historical filename is retained. Fresh Gaussian innovations are drawn
% once and reused across dates as common random numbers (T draws per date).
% T=100 and the original calibration are intentionally unchanged.
% The additive Gaussian law allows non-positive consumption and has no
% ordinary finite inverse-consumption expectation. A positive finite sample
% does not repair this. These rates are local finite-sample illustrations,
% not exact risk prices. Stop invalid samples without clipping or redrawing.
T=100;
sd_e = 0.1;
e    = sd_e *[0;randn(T,1)];
rho  = .85;
beta =.99;

ey = sd_e*randn(T,1);
yf = @(y,e) (1-rho+rho*y + e);

y=zeros(size(e));
r=zeros(size(e));
re=zeros(size(e));
Euc =zeros(size(e));
uc =zeros(size(e));
y(1) = 1;
r(1) = 1/beta;
for t = 2:(T+1)
	y(t)  = 1-rho+rho*y(t-1) + e(t);
	assert(isfinite(y(t)) && y(t)>0, 'BTM:NonPositiveEndowment', ...
		'Local Gaussian illustration stopped at a non-positive or non-finite endowment.');
	r(t)  = (1-rho+rho*y(t))/(beta*y(t));
	% Both rates condition on the same current endowment y(t).
	future_y = yf(y(t),ey);
	assert(all(isfinite(future_y)) && all(future_y>0), 'BTM:NonPositiveFutureEndowment', ...
		'Conditional Monte Carlo stopped at a non-positive or non-finite future draw.');
    Euc(t) = mean(1./future_y);
    uc(t)  = 1/y(t);
    re(t)  = uc(t)/(beta*Euc(t));
end


figure;
subplot(1,2,1)
plot(1:T,y(2:end)')
subplot(1,2,2)
plot(1:T,r(2:end)')


figure;
subplot(1,2,1)
plot(1:T,y(2:end)')
subplot(1,2,2)
plot(1:T,r(2:end)',1:T,re(2:end)',':')
