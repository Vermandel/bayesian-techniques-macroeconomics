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
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'credit_RBC';
M_.dynare_version = '4.5.5';
oo_.dynare_version = '4.5.5';
options_.dynare_version = '4.5.5';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('credit_RBC.log');
M_.exo_names = 'eta_a';
M_.exo_names_tex = 'eta\_a';
M_.exo_names_long = 'eta_a';
M_.exo_names = char(M_.exo_names, 'eta_g');
M_.exo_names_tex = char(M_.exo_names_tex, 'eta\_g');
M_.exo_names_long = char(M_.exo_names_long, 'eta_g');
M_.exo_names = char(M_.exo_names, 'eta_c');
M_.exo_names_tex = char(M_.exo_names_tex, 'eta\_c');
M_.exo_names_long = char(M_.exo_names_long, 'eta_c');
M_.exo_names = char(M_.exo_names, 'eta_m');
M_.exo_names_tex = char(M_.exo_names_tex, 'eta\_m');
M_.exo_names_long = char(M_.exo_names_long, 'eta_m');
M_.exo_names = char(M_.exo_names, 'eta_i');
M_.exo_names_tex = char(M_.exo_names_tex, 'eta\_i');
M_.exo_names_long = char(M_.exo_names_long, 'eta_i');
M_.endo_names = 'rr';
M_.endo_names_tex = 'rr';
M_.endo_names_long = 'rr';
M_.endo_names = char(M_.endo_names, 'c');
M_.endo_names_tex = char(M_.endo_names_tex, 'c');
M_.endo_names_long = char(M_.endo_names_long, 'c');
M_.endo_names = char(M_.endo_names, 'c_E');
M_.endo_names_tex = char(M_.endo_names_tex, 'c\_E');
M_.endo_names_long = char(M_.endo_names_long, 'c_E');
M_.endo_names = char(M_.endo_names, 'c_H');
M_.endo_names_tex = char(M_.endo_names_tex, 'c\_H');
M_.endo_names_long = char(M_.endo_names_long, 'c_H');
M_.endo_names = char(M_.endo_names, 'h');
M_.endo_names_tex = char(M_.endo_names_tex, 'h');
M_.endo_names_long = char(M_.endo_names_long, 'h');
M_.endo_names = char(M_.endo_names, 'w');
M_.endo_names_tex = char(M_.endo_names_tex, 'w');
M_.endo_names_long = char(M_.endo_names_long, 'w');
M_.endo_names = char(M_.endo_names, 'y');
M_.endo_names_tex = char(M_.endo_names_tex, 'y');
M_.endo_names_long = char(M_.endo_names_long, 'y');
M_.endo_names = char(M_.endo_names, 'k');
M_.endo_names_tex = char(M_.endo_names_tex, 'k');
M_.endo_names_long = char(M_.endo_names_long, 'k');
M_.endo_names = char(M_.endo_names, 'i');
M_.endo_names_tex = char(M_.endo_names_tex, 'i');
M_.endo_names_long = char(M_.endo_names_long, 'i');
M_.endo_names = char(M_.endo_names, 'l');
M_.endo_names_tex = char(M_.endo_names_tex, 'l');
M_.endo_names_long = char(M_.endo_names_long, 'l');
M_.endo_names = char(M_.endo_names, 'lb_E');
M_.endo_names_tex = char(M_.endo_names_tex, 'lb\_E');
M_.endo_names_long = char(M_.endo_names_long, 'lb_E');
M_.endo_names = char(M_.endo_names, 'phi_E');
M_.endo_names_tex = char(M_.endo_names_tex, 'phi\_E');
M_.endo_names_long = char(M_.endo_names_long, 'phi_E');
M_.endo_names = char(M_.endo_names, 'lb_H');
M_.endo_names_tex = char(M_.endo_names_tex, 'lb\_H');
M_.endo_names_long = char(M_.endo_names_long, 'lb_H');
M_.endo_names = char(M_.endo_names, 'q');
M_.endo_names_tex = char(M_.endo_names_tex, 'q');
M_.endo_names_long = char(M_.endo_names_long, 'q');
M_.endo_names = char(M_.endo_names, 'e_a');
M_.endo_names_tex = char(M_.endo_names_tex, 'e\_a');
M_.endo_names_long = char(M_.endo_names_long, 'e_a');
M_.endo_names = char(M_.endo_names, 'e_g');
M_.endo_names_tex = char(M_.endo_names_tex, 'e\_g');
M_.endo_names_long = char(M_.endo_names_long, 'e_g');
M_.endo_names = char(M_.endo_names, 'e_c');
M_.endo_names_tex = char(M_.endo_names_tex, 'e\_c');
M_.endo_names_long = char(M_.endo_names_long, 'e_c');
M_.endo_names = char(M_.endo_names, 'e_m');
M_.endo_names_tex = char(M_.endo_names_tex, 'e\_m');
M_.endo_names_long = char(M_.endo_names_long, 'e_m');
M_.endo_names = char(M_.endo_names, 'e_i');
M_.endo_names_tex = char(M_.endo_names_tex, 'e\_i');
M_.endo_names_long = char(M_.endo_names_long, 'e_i');
M_.endo_partitions = struct();
M_.param_names = 'beta_E';
M_.param_names_tex = 'beta\_E';
M_.param_names_long = 'beta_E';
M_.param_names = char(M_.param_names, 'beta_H');
M_.param_names_tex = char(M_.param_names_tex, 'beta\_H');
M_.param_names_long = char(M_.param_names_long, 'beta_H');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, 'alpha');
M_.param_names_long = char(M_.param_names_long, 'alpha');
M_.param_names = char(M_.param_names, 'sigmaC');
M_.param_names_tex = char(M_.param_names_tex, 'sigmaC');
M_.param_names_long = char(M_.param_names_long, 'sigmaC');
M_.param_names = char(M_.param_names, 'sigmaL');
M_.param_names_tex = char(M_.param_names_tex, 'sigmaL');
M_.param_names_long = char(M_.param_names_long, 'sigmaL');
M_.param_names = char(M_.param_names, 'chi');
M_.param_names_tex = char(M_.param_names_tex, 'chi');
M_.param_names_long = char(M_.param_names_long, 'chi');
M_.param_names = char(M_.param_names, 'gy');
M_.param_names_tex = char(M_.param_names_tex, 'gy');
M_.param_names_long = char(M_.param_names_long, 'gy');
M_.param_names = char(M_.param_names, 'mh');
M_.param_names_tex = char(M_.param_names_tex, 'mh');
M_.param_names_long = char(M_.param_names_long, 'mh');
M_.param_names = char(M_.param_names, 'mk');
M_.param_names_tex = char(M_.param_names_tex, 'mk');
M_.param_names_long = char(M_.param_names_long, 'mk');
M_.param_names = char(M_.param_names, 'kappa');
M_.param_names_tex = char(M_.param_names_tex, 'kappa');
M_.param_names_long = char(M_.param_names_long, 'kappa');
M_.param_names = char(M_.param_names, 'hh');
M_.param_names_tex = char(M_.param_names_tex, 'hh');
M_.param_names_long = char(M_.param_names_long, 'hh');
M_.param_names = char(M_.param_names, 'rho_a');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_a');
M_.param_names_long = char(M_.param_names_long, 'rho_a');
M_.param_names = char(M_.param_names, 'rho_g');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_g');
M_.param_names_long = char(M_.param_names_long, 'rho_g');
M_.param_names = char(M_.param_names, 'rho_c');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_c');
M_.param_names_long = char(M_.param_names_long, 'rho_c');
M_.param_names = char(M_.param_names, 'rho_m');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_m');
M_.param_names_long = char(M_.param_names_long, 'rho_m');
M_.param_names = char(M_.param_names, 'rho_i');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_i');
M_.param_names_long = char(M_.param_names_long, 'rho_i');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 5;
M_.endo_nbr = 19;
M_.param_nbr = 17;
M_.orig_endo_nbr = 19;
M_.aux_vars = [];
M_.Sigma_e = zeros(5, 5);
M_.Correlation_matrix = eye(5, 5);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('credit_RBC_static');
erase_compiled_function('credit_RBC_dynamic');
M_.orig_eq_nbr = 19;
M_.eq_nbr = 19;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 1 12 0;
 0 13 0;
 2 14 0;
 3 15 0;
 0 16 0;
 0 17 0;
 0 18 31;
 4 19 0;
 5 20 32;
 6 21 0;
 0 22 33;
 0 23 0;
 0 24 34;
 0 25 35;
 7 26 0;
 8 27 0;
 9 28 0;
 10 29 0;
 11 30 36;]';
M_.nstatic = 4;
M_.nfwrd   = 4;
M_.npred   = 9;
M_.nboth   = 2;
M_.nsfwrd   = 6;
M_.nspred   = 11;
M_.ndynamic   = 15;
M_.equations_tags = {
  1 , 'name' , 'marginal utility of consumption' ;
  2 , 'name' , 'Euler' ;
  3 , 'name' , 'Labor Supply' ;
  4 , 'name' , 'technology' ;
  5 , 'name' , 'Borrowing constraint' ;
  6 , 'name' , 'Capital law of motion' ;
  7 , 'name' , 'FOC c' ;
  8 , 'name' , 'FOC k' ;
  9 , 'name' , 'FOC i' ;
  10 , 'name' , 'FOC h' ;
  11 , 'name' , 'FOC l' ;
  12 , 'name' , 'balance sheet' ;
  13 , 'name' , 'Resources Constraint' ;
  14 , 'name' , 'Total consumption' ;
  15 , 'name' , 'shocks' ;
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:5];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(19, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(5, 1);
M_.params = NaN(17, 1);
M_.NNZDerivatives = [86; -1; -1];
close all;
M_.params( 2 ) = 0.993;
beta_H = M_.params( 2 );
M_.params( 1 ) = 0.980;
beta_E = M_.params( 1 );
M_.params( 3 ) = 0.025;
delta = M_.params( 3 );
M_.params( 4 ) = 0.30;
alpha = M_.params( 4 );
M_.params( 8 ) = 0.2;
gy = M_.params( 8 );
M_.params( 12 ) = 0.3;
hh = M_.params( 12 );
M_.params( 5 ) = 1;
sigmaC = M_.params( 5 );
M_.params( 6 ) = 1;
sigmaL = M_.params( 6 );
M_.params( 10 ) = 0.8;
mk = M_.params( 10 );
M_.params( 9 ) = 1;
mh = M_.params( 9 );
M_.params( 11 ) = 4;
kappa = M_.params( 11 );
M_.params( 13 ) = 0.95;
rho_a = M_.params( 13 );
M_.params( 14 ) = 0.95;
rho_g = M_.params( 14 );
M_.params( 15 ) = 0.95;
rho_c = M_.params( 15 );
M_.params( 16 ) = 0.95;
rho_m = M_.params( 16 );
M_.params( 17 ) = 0.95;
rho_i = M_.params( 17 );
rho_r	= 0.40;
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (1)^2;
M_.Sigma_e(2, 2) = (1)^2;
M_.Sigma_e(3, 3) = (1)^2;
M_.Sigma_e(4, 4) = (1)^2;
M_.Sigma_e(5, 5) = (1)^2;
resid(1);
options_.irf = 30;
options_.order = 1;
var_list_ = char('y','c_E','c_H','i','rr','q');
info = stoch_simul(var_list_);
save('credit_RBC_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('credit_RBC_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('credit_RBC_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('credit_RBC_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('credit_RBC_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('credit_RBC_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('credit_RBC_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
