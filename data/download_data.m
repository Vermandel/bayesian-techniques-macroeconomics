% Course: Bayesian Techniques in Macroeconomics (2026-2027)
% Instructor: Gauthier Vermandel
% Institution: Universite Paris-Dauphine PSL
%
function download_data()
%DOWNLOAD_DATA Fetch a small reproducible DBnomics demonstration dataset.
% Run this function from the repository root (or add that root to the path).
root = fileparts(fileparts(mfilename('fullpath')));
addpath(root);
[data, names, periods] = btm_call_dbnomics('OECD/QNA/USA.B1_GS1.LNBQRSA.Q');
save(fullfile(fileparts(mfilename('fullpath')), 'btm_demo_data.mat'), ...
     'data', 'names', 'periods');
fprintf('Saved %d observations to data/btm_demo_data.mat.\n', size(data, 1));
end
