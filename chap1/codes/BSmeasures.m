% get real US GDP
[mydata,~,T] = call_dbnomics('OECD/QNA/USA.B1_GS1.LNBQRSA.Q');
% statistics
gdp = log(mydata(:,2));
% Linear Trend
y_lin = gdp-detrend(gdp,1);
y_hp    = hpfilter(gdp,1600);
y_bp    = gdp-bpass(gdp,6,32);
% plot result
figure;
subplot(3,1,1)
plot(T,gdp)
title('log(GDP)')
xlim([min(T) max(T)])
subplot(3,1,2)
plot(T,y_lin,'r',T,y_hp,'g--',T,y_bp,'k:')
title('Trend measures')
xlim([min(T) max(T)])
legend('Linear','HP','BP','Location','south')
subplot(3,1,3)
plot(T,gdp-y_lin,'r',T,gdp-y_hp,'g--',T,gdp-y_bp,'k:')
title('BS cycle measures')
xlim([min(T) max(T)])
legend('Linear','HP','BP','Location','south')

figure;
plot(T(2:end),diff(y_lin),'r',T(2:end),diff(y_hp),'g--',T(2:end),diff(y_bp),'k:')
title('Trend measures')
xlim([min(T) max(T)])
legend('Linear','HP','BP','Location','south')
