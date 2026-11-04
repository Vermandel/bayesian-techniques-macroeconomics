%% Reproduce the chart from the source document
code_dir = fileparts(mfilename('fullpath'));
addpath(code_dir);

[~, output_table] = call_dbnomics( ...
    'Eurostat/prc_hicp_manr/M.RCH_A.TOT_X_NRG.AT+BE+DE+FR');

time = datenum(output_table.Properties.RowNames);
countries = output_table.Properties.VariableNames;
figure;
plot(time, output_table.AT, time, output_table.BE, ...
     time, output_table.DE, time, output_table.FR);
datetick('x', 'yyyy', 'keeplimits');
legend(countries, 'Location', 'best');
title('Inflation excluding energy');
ylabel('Annual percentage change');
