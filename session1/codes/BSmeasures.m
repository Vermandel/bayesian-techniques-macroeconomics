% Course: Bayesian Techniques in Macroeconomics (2026-2027)
% Instructor: Gauthier Vermandel
% Institution: Universite Paris-Dauphine PSL
%
code_dir = fileparts(mfilename('fullpath'));
addpath(code_dir);

% get real US GDP
[mydata,~,T] = call_dbnomics('OECD/QNA/USA.B1_GS1.LNBQRSA.Q');
% Convert the returned datenums to datetime for date-aware plots.
T = datetime(mydata(:,1), 'ConvertFrom', 'datenum');
% statistics
gdp = log(mydata(:,2));
% Linear Trend
y_lin = gdp-detrend(gdp,1);
y_hp    = hpfilter(gdp,'Smoothing',1600);
% bpass returns the 6--32-quarter band. Its complement contains both
% low- and high-frequency movements, not a pure low-frequency trend.
y_bp    = gdp-bpass(gdp,6,32);
% plot result
figure;
subplot(3,1,1)
plot(T,gdp)
title('log(GDP)')
xlim([min(T) max(T)])
subplot(3,1,2)
plot(T,y_lin,'r',T,y_hp,'g--',T,y_bp,'k:')
title('Linear/HP trends and band-pass complement')
xlim([min(T) max(T)])
legend('Linear trend','HP trend','BP complement','Location','south')
subplot(3,1,3)
plot(T,gdp-y_lin,'r',T,gdp-y_hp,'g--',T,gdp-y_bp,'k:')
title('Business-cycle measures')
xlim([min(T) max(T)])
legend('Linear','HP','BP cycle','Location','south')

figure;
plot(T(2:end),diff(y_lin),'r',T(2:end),diff(y_hp),'g--',T(2:end),diff(y_bp),'k:')
title('Changes in trends and band-pass complement')
xlim([min(T) max(T)])
legend('Linear trend','HP trend','BP complement','Location','south')
