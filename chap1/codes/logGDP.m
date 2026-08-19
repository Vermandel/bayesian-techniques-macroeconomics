% get real US GDP
[mydata,~,T] = call_dbnomics('OECD/QNA/USA.B1_GS1.LNBQRSA.Q');
% extract and apply logs
gdp = mydata(:,2);
y   = log(gdp);
% estimate OLS
slope1 = [ones(size(T)) T]\gdp;
slope2 = [ones(size(T)) T]\y;
% generate the trend
trend1 = slope1(1) + slope1(2)*T;
trend2 = slope2(1) + slope2(2)*T;
% draw results
figure;
subplot(1,2,1)
plot(T,gdp,T,trend1)
title('Level GDP')
subplot(1,2,2)
plot(T,y,T,trend2)
title('Log GDP')