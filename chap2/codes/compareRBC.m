%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'compareRBC';
M_.dynare_version = '4.6.2';
oo_.dynare_version = '4.6.2';
options_.dynare_version = '4.6.2';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('compareRBC.log');
M_.exo_names = cell(1,1);
M_.exo_names_tex = cell(1,1);
M_.exo_names_long = cell(1,1);
M_.exo_names(1) = {'e_a'};
M_.exo_names_tex(1) = {'e\_a'};
M_.exo_names_long(1) = {'e_a'};
M_.endo_names = cell(3,1);
M_.endo_names_tex = cell(3,1);
M_.endo_names_long = cell(3,1);
M_.endo_names(1) = {'k'};
M_.endo_names_tex(1) = {'k'};
M_.endo_names_long(1) = {'k'};
M_.endo_names(2) = {'a'};
M_.endo_names_tex(2) = {'a'};
M_.endo_names_long(2) = {'a'};
M_.endo_names(3) = {'c'};
M_.endo_names_tex(3) = {'c'};
M_.endo_names_long(3) = {'c'};
M_.endo_partitions = struct();
M_.param_names = cell(6,1);
M_.param_names_tex = cell(6,1);
M_.param_names_long = cell(6,1);
M_.param_names(1) = {'alpha'};
M_.param_names_tex(1) = {'alpha'};
M_.param_names_long(1) = {'alpha'};
M_.param_names(2) = {'beta'};
M_.param_names_tex(2) = {'beta'};
M_.param_names_long(2) = {'beta'};
M_.param_names(3) = {'delta'};
M_.param_names_tex(3) = {'delta'};
M_.param_names_long(3) = {'delta'};
M_.param_names(4) = {'rho_A'};
M_.param_names_tex(4) = {'rho\_A'};
M_.param_names_long(4) = {'rho_A'};
M_.param_names(5) = {'Css'};
M_.param_names_tex(5) = {'Css'};
M_.param_names_long(5) = {'Css'};
M_.param_names(6) = {'Kss'};
M_.param_names_tex(6) = {'Kss'};
M_.param_names_long(6) = {'Kss'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 3;
M_.param_nbr = 6;
M_.orig_endo_nbr = 3;
M_.aux_vars = [];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
options_.linear = true;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.linear_decomposition = false;
M_.nonzero_hessian_eqs = [];
M_.hessian_eq_zero = isempty(M_.nonzero_hessian_eqs);
M_.orig_eq_nbr = 3;
M_.eq_nbr = 3;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 1 3 0;
 2 4 6;
 0 5 7;]';
M_.nstatic = 0;
M_.nfwrd   = 1;
M_.npred   = 1;
M_.nboth   = 1;
M_.nsfwrd   = 2;
M_.nspred   = 2;
M_.ndynamic   = 3;
M_.dynamic_tmp_nbr = [1; 0; 0; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , 'Budget constraint' ;
  2 , 'name' , 'Euler equation' ;
  3 , 'name' , 'Productivity shock' ;
};
M_.mapping.k.eqidx = [1 2 ];
M_.mapping.a.eqidx = [1 2 3 ];
M_.mapping.c.eqidx = [1 2 ];
M_.mapping.e_a.eqidx = [3 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [1 2 ];
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(3, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(6, 1);
M_.endo_trends = struct('deflator', cell(3, 1), 'log_deflator', cell(3, 1), 'growth_factor', cell(3, 1), 'log_growth_factor', cell(3, 1));
M_.NNZDerivatives = [11; 0; -1; ];
M_.static_tmp_nbr = [1; 0; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
M_.params(1) = 0.40;
alpha = M_.params(1);
M_.params(2) = 0.99;
beta = M_.params(2);
M_.params(3) = 0.025;
delta = M_.params(3);
M_.params(4) = 0.85;
rho_A = M_.params(4);
M_.params(6) = ((1/M_.params(2)-(1-M_.params(3)))/M_.params(1))^(1/(M_.params(1)-1));
Kss = M_.params(6);
M_.params(5) = M_.params(6)^M_.params(1)-M_.params(3)*M_.params(6);
Css = M_.params(5);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (.007)^2;
oo_.dr.eigval = check(M_,options_,oo_);
options_.irf = 30;
var_list_ = {'c';'k';'a'};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
k1 = Kss^(alpha-1);
k2 = Kss^(alpha-1)*alpha+(1-delta);
k3 = Css/Kss;
c1 = beta*alpha*Kss^(alpha-1);
c2 = beta*alpha*Kss^(alpha-1)*(alpha-1);
Fcs = roots([-k3 (-1+k3*c2+k2) -k2*c2]);
Fc 	= Fcs(find((Fcs<1).*(Fcs>0)));
Fk = k2 - k3*Fc;
Gc = ((Fc-c2)*k1-c1*rho_A)/((Fc-c2)*k3+1-rho_A);
Gk = k1-k3*Gc;
F = [ 	Fk,	Gk*rho_A,	0;
0,	rho_A,		0;
Fc,	Gc*rho_A,	0];
G = [ Gk;	1;	Gc];
myIRF = zeros(M_.endo_nbr,options_.irf+1);
save('compareRBC_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('compareRBC_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('compareRBC_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('compareRBC_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('compareRBC_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('compareRBC_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('compareRBC_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
