function [output_table, series_names, T] = call_dbnomics(varargin)
root = fileparts(fileparts(fileparts(mfilename('fullpath'))));
addpath(root);
[output_table, series_names, T] = btm_call_dbnomics(varargin{:});
end
