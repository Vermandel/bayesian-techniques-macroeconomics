% Course: Bayesian Techniques in Macroeconomics (2026-2027)
% Instructor: Gauthier Vermandel
% Institution: Universite Paris-Dauphine PSL
%
course_root = fileparts(fileparts(fileparts(mfilename('fullpath'))));
addpath(course_root);

% get real US GDP
[mydata,~,T] = btm_call_dbnomics('OECD/QNA/USA.B1_GS1.LNBQRSA.Q');
% extract and apply logs
gdp = mydata(:,2);
y   = log(gdp);
% Estimate OLS trends on a numeric time index; keep T for date-aware plots.
t = (0:numel(T)-1)';
X = [ones(size(t)) t];
slope1 = X\gdp;
slope2 = X\y;
% generate the trend
trend1 = X*slope1;
trend2 = X*slope2;
% draw results
figure;
subplot(1,2,1)
plot(T,gdp,T,trend1)
title('Level GDP')
subplot(1,2,2)
plot(T,y,T,trend2)
title('Log GDP')
