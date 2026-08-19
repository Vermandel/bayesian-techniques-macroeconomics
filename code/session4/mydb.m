[output_table,~,T] = call_dbnomics('OECD/QNA/USA.B1_GE.CQRSA.Q','OECD/QNA/USA.P31DC.CQRSA.Q','OECD/QNA/USA.P51.CQRSA.Q','OECD/QNA/USA.B1_GE.DNBSA.Q','OECD/MEI/USA.HOHWMN02.STSA.Q','OECD/MEI/USA.LFACTTTT.STSA.Q','OECD/KEI/IR3TIB01.USA.ST.Q');
% Output, Consumption, Investment, Deflator, Weekly Hours, Active Pop, Nominal Rate

% select non NaN ids
idx 			= find(~isnan(sum(output_table(:,2:end),2)));
output_table 	= output_table(idx,:);
T				= T(idx);


% we normalize to one prices and in population for 2015
id2015 = find(T==2015);
pop = output_table(:,5)/output_table(id2015,5);
def = output_table(:,7)/output_table(id2015,7);


%% taking in real growth rates per capita
dy  = 100*diff(log(output_table(:,2)./(pop.*def)));
dc  = 100*diff(log(output_table(:,3)./(pop.*def)));
di  = 100*diff(log(output_table(:,4)./(pop.*def)));
% hours worked as a fraction per day instead of weekly amount
dh	= 100*output_table(2:end,6)/(7*24);

% output gap
y = 100*detrend(log(log(output_table(:,2)./(pop.*def))));
y = y - mean(y);

% inflation rate
dp  = 100*diff(log(output_table(:,5)));
% quarterly interest rate
dr	= output_table(2:end,8)/4;

T = T(2:end);

% save into myobs.mat
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

