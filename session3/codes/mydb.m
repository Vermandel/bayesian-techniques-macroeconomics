% Course: Bayesian Techniques in Macroeconomics (2026-2027)
% Instructor: Gauthier Vermandel
% Institution: Universite Paris-Dauphine PSL
%
code_dir = fileparts(mfilename('fullpath'));
addpath(code_dir);

%% Getting US output through db.nomics
% quarterly real output
[my_mat,~,T] = call_dbnomics('OECD/QNA/USA.B1_GS1.LNBQRSA.Q');
% Convert the returned datenums to datetime for date-aware plots.
T = datetime(my_mat(:,1), 'ConvertFrom', 'datenum');

% selecting the 2nd column to select GDP
gross_y = my_mat (:,2);
% Taking in logs
ln_y =  log(gross_y);


% computing the slope of the growth of output
% Using OLS
X = [ones(length(ln_y),1) (1:length(ln_y))'];
OLS= X\ln_y; % OLS regression
trend_y = X*OLS;
gamma = exp(OLS(2)); % quarterly gross trend growth



% deviation from the trend
ln_gap = ln_y-trend_y;
% demeaning // removing the steady state
y = ln_gap-mean(ln_gap);

% Plotting log(GDP) + trend
figure;
plot(T,ln_y,T,trend_y)
title('Real GDP and estimated log-linear trend')
% Plotting GDP % variation around its trend
figure;
plot(T,y)
title('Real GDP variations around the trend')


save mydata.mat y T trend_y OLS gamma;
