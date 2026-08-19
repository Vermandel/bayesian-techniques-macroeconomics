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
M_.fname = 'modele_version5';
M_.dynare_version = '4.5.5';
oo_.dynare_version = '4.5.5';
options_.dynare_version = '4.5.5';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('modele_version5.log');
M_.exo_names = 'eta_a';
M_.exo_names_tex = 'eta\_a';
M_.exo_names_long = 'eta_a';
M_.exo_names = char(M_.exo_names, 'eta_g');
M_.exo_names_tex = char(M_.exo_names_tex, 'eta\_g');
M_.exo_names_long = char(M_.exo_names_long, 'eta_g');
M_.exo_names = char(M_.exo_names, 'eta_r');
M_.exo_names_tex = char(M_.exo_names_tex, 'eta\_r');
M_.exo_names_long = char(M_.exo_names_long, 'eta_r');
M_.endo_names = 'r';
M_.endo_names_tex = 'r';
M_.endo_names_long = 'r';
M_.endo_names = char(M_.endo_names, 'c');
M_.endo_names_tex = char(M_.endo_names_tex, 'c');
M_.endo_names_long = char(M_.endo_names_long, 'c');
M_.endo_names = char(M_.endo_names, 'ci');
M_.endo_names_tex = char(M_.endo_names_tex, 'ci');
M_.endo_names_long = char(M_.endo_names_long, 'ci');
M_.endo_names = char(M_.endo_names, 'ch');
M_.endo_names_tex = char(M_.endo_names_tex, 'ch');
M_.endo_names_long = char(M_.endo_names_long, 'ch');
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
M_.endo_names = char(M_.endo_names, 'mc');
M_.endo_names_tex = char(M_.endo_names_tex, 'mc');
M_.endo_names_long = char(M_.endo_names_long, 'mc');
M_.endo_names = char(M_.endo_names, 'pi');
M_.endo_names_tex = char(M_.endo_names_tex, 'pi');
M_.endo_names_long = char(M_.endo_names_long, 'pi');
M_.endo_names = char(M_.endo_names, 'phic');
M_.endo_names_tex = char(M_.endo_names_tex, 'phic');
M_.endo_names_long = char(M_.endo_names_long, 'phic');
M_.endo_names = char(M_.endo_names, 'q');
M_.endo_names_tex = char(M_.endo_names_tex, 'q');
M_.endo_names_long = char(M_.endo_names_long, 'q');
M_.endo_names = char(M_.endo_names, 'phil');
M_.endo_names_tex = char(M_.endo_names_tex, 'phil');
M_.endo_names_long = char(M_.endo_names_long, 'phil');
M_.endo_names = char(M_.endo_names, 'lambda');
M_.endo_names_tex = char(M_.endo_names_tex, 'lambda');
M_.endo_names_long = char(M_.endo_names_long, 'lambda');
M_.endo_names = char(M_.endo_names, 'ln_r');
M_.endo_names_tex = char(M_.endo_names_tex, 'ln\_r');
M_.endo_names_long = char(M_.endo_names_long, 'ln_r');
M_.endo_names = char(M_.endo_names, 'ln_ci');
M_.endo_names_tex = char(M_.endo_names_tex, 'ln\_ci');
M_.endo_names_long = char(M_.endo_names_long, 'ln_ci');
M_.endo_names = char(M_.endo_names, 'ln_ch');
M_.endo_names_tex = char(M_.endo_names_tex, 'ln\_ch');
M_.endo_names_long = char(M_.endo_names_long, 'ln_ch');
M_.endo_names = char(M_.endo_names, 'ln_h');
M_.endo_names_tex = char(M_.endo_names_tex, 'ln\_h');
M_.endo_names_long = char(M_.endo_names_long, 'ln_h');
M_.endo_names = char(M_.endo_names, 'ln_w');
M_.endo_names_tex = char(M_.endo_names_tex, 'ln\_w');
M_.endo_names_long = char(M_.endo_names_long, 'ln_w');
M_.endo_names = char(M_.endo_names, 'ln_y');
M_.endo_names_tex = char(M_.endo_names_tex, 'ln\_y');
M_.endo_names_long = char(M_.endo_names_long, 'ln_y');
M_.endo_names = char(M_.endo_names, 'ln_k');
M_.endo_names_tex = char(M_.endo_names_tex, 'ln\_k');
M_.endo_names_long = char(M_.endo_names_long, 'ln_k');
M_.endo_names = char(M_.endo_names, 'ln_i');
M_.endo_names_tex = char(M_.endo_names_tex, 'ln\_i');
M_.endo_names_long = char(M_.endo_names_long, 'ln_i');
M_.endo_names = char(M_.endo_names, 'ln_l');
M_.endo_names_tex = char(M_.endo_names_tex, 'ln\_l');
M_.endo_names_long = char(M_.endo_names_long, 'ln_l');
M_.endo_names = char(M_.endo_names, 'ln_mc');
M_.endo_names_tex = char(M_.endo_names_tex, 'ln\_mc');
M_.endo_names_long = char(M_.endo_names_long, 'ln_mc');
M_.endo_names = char(M_.endo_names, 'ln_pi');
M_.endo_names_tex = char(M_.endo_names_tex, 'ln\_pi');
M_.endo_names_long = char(M_.endo_names_long, 'ln_pi');
M_.endo_names = char(M_.endo_names, 'ln_phic');
M_.endo_names_tex = char(M_.endo_names_tex, 'ln\_phic');
M_.endo_names_long = char(M_.endo_names_long, 'ln_phic');
M_.endo_names = char(M_.endo_names, 'ln_q');
M_.endo_names_tex = char(M_.endo_names_tex, 'ln\_q');
M_.endo_names_long = char(M_.endo_names_long, 'ln_q');
M_.endo_names = char(M_.endo_names, 'ln_phil');
M_.endo_names_tex = char(M_.endo_names_tex, 'ln\_phil');
M_.endo_names_long = char(M_.endo_names_long, 'ln_phil');
M_.endo_names = char(M_.endo_names, 'e_a');
M_.endo_names_tex = char(M_.endo_names_tex, 'e\_a');
M_.endo_names_long = char(M_.endo_names_long, 'e_a');
M_.endo_names = char(M_.endo_names, 'e_g');
M_.endo_names_tex = char(M_.endo_names_tex, 'e\_g');
M_.endo_names_long = char(M_.endo_names_long, 'e_g');
M_.endo_partitions = struct();
M_.param_names = 'betai';
M_.param_names_tex = 'betai';
M_.param_names_long = 'betai';
M_.param_names = char(M_.param_names, 'betah');
M_.param_names_tex = char(M_.param_names_tex, 'betah');
M_.param_names_long = char(M_.param_names_long, 'betah');
M_.param_names = char(M_.param_names, 'sigmac');
M_.param_names_tex = char(M_.param_names_tex, 'sigmac');
M_.param_names_long = char(M_.param_names_long, 'sigmac');
M_.param_names = char(M_.param_names, 'sigmal');
M_.param_names_tex = char(M_.param_names_tex, 'sigmal');
M_.param_names_long = char(M_.param_names_long, 'sigmal');
M_.param_names = char(M_.param_names, 'chi');
M_.param_names_tex = char(M_.param_names_tex, 'chi');
M_.param_names_long = char(M_.param_names_long, 'chi');
M_.param_names = char(M_.param_names, 'g');
M_.param_names_tex = char(M_.param_names_tex, 'g');
M_.param_names_long = char(M_.param_names_long, 'g');
M_.param_names = char(M_.param_names, 'mh');
M_.param_names_tex = char(M_.param_names_tex, 'mh');
M_.param_names_long = char(M_.param_names_long, 'mh');
M_.param_names = char(M_.param_names, 'mk');
M_.param_names_tex = char(M_.param_names_tex, 'mk');
M_.param_names_long = char(M_.param_names_long, 'mk');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_names = char(M_.param_names, 'theta');
M_.param_names_tex = char(M_.param_names_tex, 'theta');
M_.param_names_long = char(M_.param_names_long, 'theta');
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, 'alpha');
M_.param_names_long = char(M_.param_names_long, 'alpha');
M_.param_names = char(M_.param_names, 'epsilon');
M_.param_names_tex = char(M_.param_names_tex, 'epsilon');
M_.param_names_long = char(M_.param_names_long, 'epsilon');
M_.param_names = char(M_.param_names, 'psi');
M_.param_names_tex = char(M_.param_names_tex, 'psi');
M_.param_names_long = char(M_.param_names_long, 'psi');
M_.param_names = char(M_.param_names, 'piSS');
M_.param_names_tex = char(M_.param_names_tex, 'piSS');
M_.param_names_long = char(M_.param_names_long, 'piSS');
M_.param_names = char(M_.param_names, 'tlphi');
M_.param_names_tex = char(M_.param_names_tex, 'tlphi');
M_.param_names_long = char(M_.param_names_long, 'tlphi');
M_.param_names = char(M_.param_names, 'rho');
M_.param_names_tex = char(M_.param_names_tex, 'rho');
M_.param_names_long = char(M_.param_names_long, 'rho');
M_.param_names = char(M_.param_names, 'rho_a');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_a');
M_.param_names_long = char(M_.param_names_long, 'rho_a');
M_.param_names = char(M_.param_names, 'rho_r');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_r');
M_.param_names_long = char(M_.param_names_long, 'rho_r');
M_.param_names = char(M_.param_names, 'rho_g');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_g');
M_.param_names_long = char(M_.param_names_long, 'rho_g');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 3;
M_.endo_nbr = 32;
M_.param_nbr = 19;
M_.orig_endo_nbr = 32;
M_.aux_vars = [];
M_.Sigma_e = zeros(3, 3);
M_.Correlation_matrix = eye(3, 3);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('modele_version5_static');
erase_compiled_function('modele_version5_dynamic');
M_.orig_eq_nbr = 32;
M_.eq_nbr = 32;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 1 7 0;
 0 8 0;
 0 9 0;
 0 10 0;
 0 11 0;
 0 12 0;
 0 13 39;
 2 14 0;
 3 15 40;
 4 16 0;
 0 17 41;
 0 18 42;
 0 19 43;
 0 20 44;
 0 21 0;
 0 22 45;
 0 23 0;
 0 24 0;
 0 25 0;
 0 26 0;
 0 27 0;
 0 28 0;
 0 29 0;
 0 30 0;
 0 31 0;
 0 32 0;
 0 33 0;
 0 34 0;
 0 35 0;
 0 36 0;
 5 37 0;
 6 38 0;]';
M_.nstatic = 20;
M_.nfwrd   = 6;
M_.npred   = 5;
M_.nboth   = 1;
M_.nsfwrd   = 7;
M_.nspred   = 6;
M_.ndynamic   = 12;
M_.equations_tags = {
  1 , 'name' , 'Euler' ;
  3 , 'name' , 'Labor Supply' ;
  4 , 'name' , 'Capital law of motion' ;
  5 , 'name' , 'Technology' ;
  6 , 'name' , 'FOC i' ;
  7 , 'name' , 'FOC k' ;
  8 , 'name' , 'FOC ci' ;
  9 , 'name' , 'FOC h' ;
  10 , 'name' , 'FOC l' ;
  11 , 'name' , 'Borrowing constraint' ;
  12 , 'name' , 'balance sheet' ;
  13 , 'name' , 'Resources Constraint' ;
  14 , 'name' , 'Aggregate Consumption' ;
  15 , 'name' , 'Price rigities' ;
  16 , 'name' , 'Taylor rule' ;
  17 , 'name' , 'shocks' ;
  19 , 'name' , 'Linearized counterpart' ;
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:3];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(32, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(3, 1);
M_.params = NaN(19, 1);
M_.NNZDerivatives = [113; -1; -1];
close all;
M_.params( 2 ) = 0.993;
betah = M_.params( 2 );
M_.params( 1 ) = 0.985;
betai = M_.params( 1 );
M_.params( 9 ) = 0.025;
delta = M_.params( 9 );
M_.params( 11 ) = 0.3;
alpha = M_.params( 11 );
M_.params( 6 ) = .2;
g = M_.params( 6 );
M_.params( 3 ) = 1;
sigmac = M_.params( 3 );
M_.params( 4 ) = 1;
sigmal = M_.params( 4 );
M_.params( 8 ) = 0.8;
mk = M_.params( 8 );
M_.params( 7 ) = 1;
mh = M_.params( 7 );
M_.params( 10 ) = 4;
theta = M_.params( 10 );
M_.params( 16 ) = 0.8;
rho = M_.params( 16 );
M_.params( 15 ) = 1.5;
tlphi = M_.params( 15 );
M_.params( 13 ) = 80;
psi = M_.params( 13 );
M_.params( 12 ) = 10;
epsilon = M_.params( 12 );
M_.params( 17 ) = 0.95;
rho_a = M_.params( 17 );
M_.params( 19 ) = 0.95;
rho_g = M_.params( 19 );
M_.params( 18 ) = 0.95;
rho_r = M_.params( 18 );
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (0.01)^2;
M_.Sigma_e(2, 2) = (0.01)^2;
M_.Sigma_e(3, 3) = (0.01)^2;
resid(1);
steady;
oo_.dr.eigval = check(M_,options_,oo_);
options_.irf = 60;
options_.order = 1;
var_list_ = char('y','c','i','pi','q','l');
info = stoch_simul(var_list_);
save('modele_version5_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('modele_version5_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('modele_version5_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('modele_version5_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('modele_version5_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('modele_version5_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('modele_version5_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
