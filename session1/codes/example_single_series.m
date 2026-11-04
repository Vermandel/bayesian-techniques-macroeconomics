%% One series: Austrian inflation excluding energy
% Run from the repository root.
code_dir = fileparts(mfilename('fullpath'));
addpath(code_dir);

[output_mat, output_table, dates_nb] = call_dbnomics( ...
    'Eurostat/prc_hicp_manr/M.RCH_A.TOT_X_NRG.AT');

% Column 1: MATLAB dates; column 2: observations.
inflation_AT = output_mat(:, 2);
disp(output_table(1:min(5, height(output_table)), :));

% dates_nb is 2020.00, 2020.08, ... for a monthly series.
fprintf('%d observations; first readable date: %.2f\n', ...
    numel(inflation_AT), dates_nb(1));
