% Course: Bayesian Techniques in Macroeconomics (2026-2027)
% Instructor: Gauthier Vermandel
% Institution: Universite Paris-Dauphine PSL
%
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
	r(t)  = (1-rho+rho*y(t))/(beta*y(t));
    Euc(t) = mean(1./yf(y(t-1),ey));
    uc(t)  = 1/y(t-1);
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
