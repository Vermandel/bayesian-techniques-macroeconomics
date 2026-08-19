% 0) First load the data and create variables
% 1) Second, relying on the data provided estimate the 
%    aggregate matching function and associated match efficiency
%==========================================================================

clear all
clc

%--------------------------------------------------------------------------
% The state-space model being used is written as:
% y_t =  M'*x_t + A p_t + w_{t}
% zeta_{t+1} = F*x_t + v_{t+1}
% 
% E[v_{t+1};w_{t}][v_{t+1};w_{t}]'=[Q,C;C,R]
% E[v_{t+1};w_{t}] = [0;0]
%--------------------------------------------------------------------------

%% 0. load data and create variables
%--------------------------------------------------------------------------

load data

T   = size(matchdata,1);    % sample lenght (in months)
M   = matchdata(:,1);       % number of hires 
V   = matchdata(:,2);       % number of vacancies
U   = matchdata(:,3);       % number of unemployed

% create dependent and independent variables
Y   = log(M./U);            % job finding rate of the unemployed
X   = [log(V./U)];          % labor market tightness

%% 1. estimate aggregate matching function
%--------------------------------------------------------------------------

% Initial values for Kalman recursion (p_0 and Sig_0)

x0   = 0;
P0      = 10^5;

% initial values for coefficients

beta    = inv(X'*X)*X'*Y;
resid   = Y - X*beta;

Rini    = resid'*resid/(T-1);
Qini    = 0.5*Rini;
muini   = beta;

% Chris Sims minimizatin algorithm
X0ini= [log(Qini),log(Rini),muini];
M0 = ones(max(size(X0ini)),max(size(X0ini)))*10^(-4);
crit = 10^(-13);
iter = 350;
% [fval,res,gh,He,itct,fcount,retcodeh] = csminwel(@(X0)loglikelihood_match_full(X0,Y, ...
%     X,x0,P0),X0ini,M0,[],crit,iter);

[res,fval] = fminsearch(@(X0)Loglikelihood(X0,Y, ...
    X,x0,P0),X0ini);

% using results to run Kalman filter again

% elements of the variance-covariance matrix
Qest    = exp(res(1));
Rest    = exp(res(2));
Cest    = 0;
% transition matrix for match efficiency
Fest    = 1;
% elements of observatoin equation
Mest    = 1;
Aest    = res(3);

[xt, Sigma, ytilde] = KalmanFilter(Y,X,x0,P0,Qest,Rest,Cest,Fest,Mest,Aest);

tM = 2001-1/12:1/12:2015+4/12;
figure
plot(tM,xt,'k','LineWidth',2)
title('Matching efficiency')

disp('estimated parameters')
disp('       Q         R        nu')
disp([Qest, Rest, Aest])


