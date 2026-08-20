% Reproducible baseline gate. Run from this directory.
assert(exist('dynare','file') == 2, 'Dynare is not on the MATLAB path.');
dynare soe_RBC.mod noclearall;
assert(exist('oo_','var') == 1, 'Dynare did not return oo_.');
