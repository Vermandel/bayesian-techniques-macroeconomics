% Course: Bayesian Techniques in Macroeconomics (2026-2027)
% Instructor: Gauthier Vermandel
% Institution: Universite Paris-Dauphine PSL
%
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
	r(t) = (1-rho+rho*y(t))/(beta*y(t));
end

figure;
subplot(1,2,1)
plot(1:T,y(2:end)')
subplot(1,2,2)
plot(1:T,r(2:end)')
