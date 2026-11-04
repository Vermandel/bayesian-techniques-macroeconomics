% Course: Bayesian Techniques in Macroeconomics (2026-2027)
% Instructor: Gauthier Vermandel
% Institution: Universite Paris-Dauphine PSL
%
code_dir = fileparts(mfilename('fullpath'));
addpath(code_dir);

[output_table,~,T] = call_dbnomics('OECD/QNA/USA.B1_GE.CQRSA.Q','OECD/QNA/USA.P31DC.CQRSA.Q','OECD/QNA/USA.P51.CQRSA.Q','OECD/QNA/USA.B1_GE.DNBSA.Q','OECD/MEI/USA.HOHWMN02.STSA.Q','OECD/MEI/USA.LFACTTTT.STSA.Q','OECD/KEI/IR3TIB01.USA.ST.Q');
% Convert the returned datenums to datetime for date-aware plots.
T = datetime(output_table(:,1), 'ConvertFrom', 'datenum');
% Current-price output, consumption, investment, GDP deflator,
% manufacturing weekly hours, labour force and annualized nominal interest rate.

% select non NaN ids
idx 			= find(~isnan(sum(output_table(:,2:end),2)));
output_table 	= output_table(idx,:);
T				= T(idx);


% Check the aligned complete-case dates BEFORE taking any first difference.
% Seven series are retained. Never turn an internal gap into quarterly growth.
quarter_id = 4*year(T) + ceil(month(T)/3);
if numel(T) < 2 || any(diff(quarter_id) ~= 1)
	error('BTM:NonConsecutiveQuarters', ...
		'Aligned data must contain consecutive quarters. Inspect missing or duplicate dates before computing growth.');
end

% Normalize prices and the labour-force scale to one in the first quarter of 2015.
% This is output per labour-force participant, not output per total resident.
id2015 = find(year(T)==2015,1,'first');
assert(~isempty(id2015),'The aligned dataset does not contain a 2015 observation.');
pop = output_table(:,7)/output_table(id2015,7);
def = output_table(:,5)/output_table(id2015,5);


%% Real growth rates per labour-force participant, in percentage points
dy  = 100*diff(log(output_table(:,2)./(pop.*def)));
dc  = 100*diff(log(output_table(:,3)./(pop.*def)));
di  = 100*diff(log(output_table(:,4)./(pop.*def)));
% hours worked as a fraction per day instead of weekly amount
dh	= 100*output_table(2:end,6)/(7*24);

% Output gap in log units for RBC_estim.mod.
% Match the dates of the growth observations by removing the first level.
y = detrend(log(output_table(:,2)./(pop.*def)));
y = y(2:end);
y = y - mean(y);

% inflation rate
dp  = 100*diff(log(output_table(:,5)));
% quarterly interest rate
dr	= output_table(2:end,8)/4;

T = T(2:end);

% Save aligned data. y is in log units and dy is in percentage points.
save mydata y dy dc di dh T dp dr;

figure;
subplot(2,2,1)
plot(T,dy)
xlim([min(T) max(T)]);
title('output growth')
subplot(2,2,2)
plot(T,dc)
xlim([min(T) max(T)]);
title('consumption growth')
subplot(2,2,3)
plot(T,di)
xlim([min(T) max(T)]);
title('investment growth')
subplot(2,2,4)
plot(T,dh)
xlim([min(T) max(T)]);
title('hours worked')

