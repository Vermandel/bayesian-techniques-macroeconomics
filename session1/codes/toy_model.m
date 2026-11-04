% Course: Bayesian Techniques in Macroeconomics (2026-2027)
% Instructor: Gauthier Vermandel
% Institution: Universite Paris-Dauphine PSL
%
% Local additive-Gaussian illustration with a certainty-equivalent rate.
% The Gaussian law permits non-positive endowment, so the exact inverse-
% consumption expectation is not an ordinary finite expectation.
% This guard stops an inadmissible draw. It never clips or redraws shocks,
% and a successful finite sample does not make the Gaussian economy global.
% Preserve the existing 10,000-period illustration. The exercise uses 400.
T=10000;
e = .1*[0;randn(T,1)];
rho = .85;
beta=.99;

y=zeros(size(e));
r=zeros(size(e));
y(1) = 1;
r(1) = 1/beta;
for t = 2:(T+1)
	y(t) = 1-rho+rho*y(t-1) + e(t);
	assert(isfinite(y(t)) && y(t)>0, 'BTM:NonPositiveEndowment', ...
		'Local Gaussian illustration stopped at a non-positive or non-finite endowment.');
	r(t) = (1-rho+rho*y(t))/(beta*y(t));
end

figure;
subplot(1,2,1)
plot(1:T,y(2:end)')
subplot(1,2,2)
plot(1:T,r(2:end)')
