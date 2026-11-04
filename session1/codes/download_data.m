% Course: Bayesian Techniques in Macroeconomics (2026-2027)
% Instructor: Gauthier Vermandel
% Institution: Universite Paris-Dauphine PSL
function download_data()
%DOWNLOAD_DATA Download the real-GDP demonstration dataset with call_dbnomics.
% Run from this codes folder. The generated MAT file is not distributed.
code_dir = fileparts(mfilename('fullpath'));
addpath(code_dir);
[data, series_table, periods] = call_dbnomics('OECD/QNA/USA.B1_GS1.LNBQRSA.Q');
% Matrix column 1 contains datenums. periods contains fractional calendar years.
save(fullfile(code_dir, 'btm_demo_data.mat'), 'data', 'series_table', 'periods');
fprintf('Saved %d observations to btm_demo_data.mat.\n', size(data,1));
end
