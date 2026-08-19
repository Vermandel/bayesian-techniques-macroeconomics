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
M_.fname = 'unemployment_RBC';
M_.dynare_version = '4.5.4';
oo_.dynare_version = '4.5.4';
options_.dynare_version = '4.5.4';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('unemployment_RBC.log');
M_.parameter_used_with_lead_lag = true;
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
M_.endo_names = char(M_.endo_names, 'n');
M_.endo_names_tex = char(M_.endo_names_tex, 'n');
M_.endo_names_long = char(M_.endo_names_long, 'n');
M_.endo_names = char(M_.endo_names, 'u');
M_.endo_names_tex = char(M_.endo_names_tex, 'u');
M_.endo_names_long = char(M_.endo_names_long, 'u');
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
M_.endo_names = char(M_.endo_names, 'lb');
M_.endo_names_tex = char(M_.endo_names_tex, 'lb');
M_.endo_names_long = char(M_.endo_names_long, 'lb');
M_.endo_names = char(M_.endo_names, 'q');
M_.endo_names_tex = char(M_.endo_names_tex, 'q');
M_.endo_names_long = char(M_.endo_names_long, 'q');
M_.endo_names = char(M_.endo_names, 'x');
M_.endo_names_tex = char(M_.endo_names_tex, 'x');
M_.endo_names_long = char(M_.endo_names_long, 'x');
M_.endo_names = char(M_.endo_names, 'v_H');
M_.endo_names_tex = char(M_.endo_names_tex, 'v\_H');
M_.endo_names_long = char(M_.endo_names_long, 'v_H');
M_.endo_names = char(M_.endo_names, 'v_P');
M_.endo_names_tex = char(M_.endo_names_tex, 'v\_P');
M_.endo_names_long = char(M_.endo_names_long, 'v_P');
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
M_.param_names = 'beta';
M_.param_names_tex = 'beta';
M_.param_names_long = 'beta';
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
M_.param_names = char(M_.param_names, 'delta_N');
M_.param_names_tex = char(M_.param_names_tex, 'delta\_N');
M_.param_names_long = char(M_.param_names_long, 'delta_N');
M_.param_names = char(M_.param_names, 'chi');
M_.param_names_tex = char(M_.param_names_tex, 'chi');
M_.param_names_long = char(M_.param_names_long, 'chi');
M_.param_names = char(M_.param_names, 'phi');
M_.param_names_tex = char(M_.param_names_tex, 'phi');
M_.param_names_long = char(M_.param_names_long, 'phi');
M_.param_names = char(M_.param_names, 'gy');
M_.param_names_tex = char(M_.param_names_tex, 'gy');
M_.param_names_long = char(M_.param_names_long, 'gy');
M_.param_names = char(M_.param_names, 'b');
M_.param_names_tex = char(M_.param_names_tex, 'b');
M_.param_names_long = char(M_.param_names_long, 'b');
M_.param_names = char(M_.param_names, 'Gam');
M_.param_names_tex = char(M_.param_names_tex, 'Gam');
M_.param_names_long = char(M_.param_names_long, 'Gam');
M_.param_names = char(M_.param_names, 'eta');
M_.param_names_tex = char(M_.param_names_tex, 'eta');
M_.param_names_long = char(M_.param_names_long, 'eta');
M_.param_names = char(M_.param_names, 'gamma');
M_.param_names_tex = char(M_.param_names_tex, 'gamma');
M_.param_names_long = char(M_.param_names_long, 'gamma');
M_.param_names = char(M_.param_names, 'epsilon');
M_.param_names_tex = char(M_.param_names_tex, 'epsilon');
M_.param_names_long = char(M_.param_names_long, 'epsilon');
M_.param_names = char(M_.param_names, 'kappa');
M_.param_names_tex = char(M_.param_names_tex, 'kappa');
M_.param_names_long = char(M_.param_names_long, 'kappa');
M_.param_names = char(M_.param_names, 'rho');
M_.param_names_tex = char(M_.param_names_tex, 'rho');
M_.param_names_long = char(M_.param_names_long, 'rho');
M_.param_names = char(M_.param_names, 'phi_y');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_y');
M_.param_names_long = char(M_.param_names_long, 'phi_y');
M_.param_names = char(M_.param_names, 'phi_pi');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_pi');
M_.param_names_long = char(M_.param_names_long, 'phi_pi');
M_.param_names = char(M_.param_names, 'psi');
M_.param_names_tex = char(M_.param_names_tex, 'psi');
M_.param_names_long = char(M_.param_names_long, 'psi');
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
M_.param_names = char(M_.param_names, 'pi');
M_.param_names_tex = char(M_.param_names_tex, 'pi');
M_.param_names_long = char(M_.param_names_long, 'pi');
M_.param_names = char(M_.param_names, 'r');
M_.param_names_tex = char(M_.param_names_tex, 'r');
M_.param_names_long = char(M_.param_names_long, 'r');
M_.param_names = char(M_.param_names, 'mc');
M_.param_names_tex = char(M_.param_names_tex, 'mc');
M_.param_names_long = char(M_.param_names_long, 'mc');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 5;
M_.endo_nbr = 18;
M_.param_nbr = 27;
M_.orig_endo_nbr = 18;
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
erase_compiled_function('unemployment_RBC_static');
erase_compiled_function('unemployment_RBC_dynamic');
M_.orig_eq_nbr = 18;
M_.eq_nbr = 18;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 9 0;
 0 10 0;
 1 11 0;
 0 12 0;
 0 13 0;
 0 14 27;
 2 15 0;
 3 16 28;
 0 17 29;
 0 18 30;
 0 19 0;
 0 20 31;
 0 21 32;
 4 22 0;
 5 23 0;
 6 24 0;
 7 25 0;
 8 26 33;]';
M_.nstatic = 5;
M_.nfwrd   = 5;
M_.npred   = 6;
M_.nboth   = 2;
M_.nsfwrd   = 7;
M_.nspred   = 8;
M_.ndynamic   = 13;
M_.equations_tags = {
  1 , 'name' , 'marginal utility of consumption' ;
  2 , 'name' , 'Euler' ;
  3 , 'name' , 'Labor Supply' ;
  4 , 'name' , 'Employment law of motion' ;
  5 , 'name' , 'Unemployment rate' ;
  6 , 'name' , 'technology' ;
  7 , 'name' , 'Capital law of motion' ;
  8 , 'name' , 'FOC k' ;
  9 , 'name' , 'FOC i' ;
  10 , 'name' , 'FOC n' ;
  11 , 'name' , 'FOC x' ;
  12 , 'name' , 'wage' ;
  13 , 'name' , 'Resources Constraint' ;
  14 , 'name' , 'shocks' ;
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:5];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(18, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(5, 1);
M_.params = NaN(27, 1);
M_.NNZDerivatives = [72; -1; -1];
close all;
M_.params( 6 ) = .1;
delta_N = M_.params( 6 );
M_.params( 12 ) = .65;
eta = M_.params( 12 );
M_.params( 8 ) = 0.05;
phi = M_.params( 8 );
M_.params( 1 ) = 0.993;
beta = M_.params( 1 );
M_.params( 2 ) = 0.025;
delta = M_.params( 2 );
M_.params( 3 ) = 0.30;
alpha = M_.params( 3 );
M_.params( 9 ) = 0.2;
gy = M_.params( 9 );
M_.params( 4 ) = 1;
sigmaC = M_.params( 4 );
M_.params( 5 ) = 2;
sigmaL = M_.params( 5 );
M_.params( 14 ) = 10;
epsilon = M_.params( 14 );
M_.params( 19 ) = 140;
psi = M_.params( 19 );
M_.params( 15 ) = 4;
kappa = M_.params( 15 );
M_.params( 13 ) = .85;
gamma = M_.params( 13 );
M_.params( 20 ) = 0.95;
rho_a = M_.params( 20 );
M_.params( 21 ) = 0.95;
rho_g = M_.params( 21 );
M_.params( 22 ) = 0.95;
rho_c = M_.params( 22 );
M_.params( 23 ) = 0.95;
rho_m = M_.params( 23 );
M_.params( 24 ) = 0.95;
rho_i = M_.params( 24 );
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
oo_.dr.eigval = check(M_,options_,oo_);
options_.irf = 30;
options_.order = 1;
var_list_ = char('y','c','i','rr','u','x');
info = stoch_simul(var_list_);
save('unemployment_RBC_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('unemployment_RBC_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('unemployment_RBC_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('unemployment_RBC_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('unemployment_RBC_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('unemployment_RBC_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('unemployment_RBC_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
disp('Note: 1 warning(s) encountered in the preprocessor')
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
