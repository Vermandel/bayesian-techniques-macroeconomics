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
M_.fname = 'credit_RBC2';
M_.dynare_version = '4.6.3';
oo_.dynare_version = '4.6.3';
options_.dynare_version = '4.6.3';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('credit_RBC2.log');
M_.exo_names = cell(5,1);
M_.exo_names_tex = cell(5,1);
M_.exo_names_long = cell(5,1);
M_.exo_names(1) = {'eta_a'};
M_.exo_names_tex(1) = {'eta\_a'};
M_.exo_names_long(1) = {'eta_a'};
M_.exo_names(2) = {'eta_g'};
M_.exo_names_tex(2) = {'eta\_g'};
M_.exo_names_long(2) = {'eta_g'};
M_.exo_names(3) = {'eta_c'};
M_.exo_names_tex(3) = {'eta\_c'};
M_.exo_names_long(3) = {'eta_c'};
M_.exo_names(4) = {'eta_m'};
M_.exo_names_tex(4) = {'eta\_m'};
M_.exo_names_long(4) = {'eta_m'};
M_.exo_names(5) = {'eta_i'};
M_.exo_names_tex(5) = {'eta\_i'};
M_.exo_names_long(5) = {'eta_i'};
M_.endo_names = cell(19,1);
M_.endo_names_tex = cell(19,1);
M_.endo_names_long = cell(19,1);
M_.endo_names(1) = {'rr'};
M_.endo_names_tex(1) = {'rr'};
M_.endo_names_long(1) = {'rr'};
M_.endo_names(2) = {'c'};
M_.endo_names_tex(2) = {'c'};
M_.endo_names_long(2) = {'c'};
M_.endo_names(3) = {'c_E'};
M_.endo_names_tex(3) = {'c\_E'};
M_.endo_names_long(3) = {'c_E'};
M_.endo_names(4) = {'c_H'};
M_.endo_names_tex(4) = {'c\_H'};
M_.endo_names_long(4) = {'c_H'};
M_.endo_names(5) = {'h'};
M_.endo_names_tex(5) = {'h'};
M_.endo_names_long(5) = {'h'};
M_.endo_names(6) = {'w'};
M_.endo_names_tex(6) = {'w'};
M_.endo_names_long(6) = {'w'};
M_.endo_names(7) = {'y'};
M_.endo_names_tex(7) = {'y'};
M_.endo_names_long(7) = {'y'};
M_.endo_names(8) = {'k'};
M_.endo_names_tex(8) = {'k'};
M_.endo_names_long(8) = {'k'};
M_.endo_names(9) = {'i'};
M_.endo_names_tex(9) = {'i'};
M_.endo_names_long(9) = {'i'};
M_.endo_names(10) = {'l'};
M_.endo_names_tex(10) = {'l'};
M_.endo_names_long(10) = {'l'};
M_.endo_names(11) = {'lb_E'};
M_.endo_names_tex(11) = {'lb\_E'};
M_.endo_names_long(11) = {'lb_E'};
M_.endo_names(12) = {'phi_E'};
M_.endo_names_tex(12) = {'phi\_E'};
M_.endo_names_long(12) = {'phi_E'};
M_.endo_names(13) = {'lb_H'};
M_.endo_names_tex(13) = {'lb\_H'};
M_.endo_names_long(13) = {'lb_H'};
M_.endo_names(14) = {'q'};
M_.endo_names_tex(14) = {'q'};
M_.endo_names_long(14) = {'q'};
M_.endo_names(15) = {'e_a'};
M_.endo_names_tex(15) = {'e\_a'};
M_.endo_names_long(15) = {'e_a'};
M_.endo_names(16) = {'e_g'};
M_.endo_names_tex(16) = {'e\_g'};
M_.endo_names_long(16) = {'e_g'};
M_.endo_names(17) = {'e_c'};
M_.endo_names_tex(17) = {'e\_c'};
M_.endo_names_long(17) = {'e_c'};
M_.endo_names(18) = {'e_m'};
M_.endo_names_tex(18) = {'e\_m'};
M_.endo_names_long(18) = {'e_m'};
M_.endo_names(19) = {'e_i'};
M_.endo_names_tex(19) = {'e\_i'};
M_.endo_names_long(19) = {'e_i'};
M_.endo_partitions = struct();
M_.param_names = cell(16,1);
M_.param_names_tex = cell(16,1);
M_.param_names_long = cell(16,1);
M_.param_names(1) = {'beta_E'};
M_.param_names_tex(1) = {'beta\_E'};
M_.param_names_long(1) = {'beta_E'};
M_.param_names(2) = {'beta_H'};
M_.param_names_tex(2) = {'beta\_H'};
M_.param_names_long(2) = {'beta_H'};
M_.param_names(3) = {'delta'};
M_.param_names_tex(3) = {'delta'};
M_.param_names_long(3) = {'delta'};
M_.param_names(4) = {'alpha'};
M_.param_names_tex(4) = {'alpha'};
M_.param_names_long(4) = {'alpha'};
M_.param_names(5) = {'sigmaC'};
M_.param_names_tex(5) = {'sigmaC'};
M_.param_names_long(5) = {'sigmaC'};
M_.param_names(6) = {'sigmaL'};
M_.param_names_tex(6) = {'sigmaL'};
M_.param_names_long(6) = {'sigmaL'};
M_.param_names(7) = {'gy'};
M_.param_names_tex(7) = {'gy'};
M_.param_names_long(7) = {'gy'};
M_.param_names(8) = {'mh'};
M_.param_names_tex(8) = {'mh'};
M_.param_names_long(8) = {'mh'};
M_.param_names(9) = {'mk'};
M_.param_names_tex(9) = {'mk'};
M_.param_names_long(9) = {'mk'};
M_.param_names(10) = {'kappa'};
M_.param_names_tex(10) = {'kappa'};
M_.param_names_long(10) = {'kappa'};
M_.param_names(11) = {'hh'};
M_.param_names_tex(11) = {'hh'};
M_.param_names_long(11) = {'hh'};
M_.param_names(12) = {'rho_a'};
M_.param_names_tex(12) = {'rho\_a'};
M_.param_names_long(12) = {'rho_a'};
M_.param_names(13) = {'rho_g'};
M_.param_names_tex(13) = {'rho\_g'};
M_.param_names_long(13) = {'rho_g'};
M_.param_names(14) = {'rho_c'};
M_.param_names_tex(14) = {'rho\_c'};
M_.param_names_long(14) = {'rho_c'};
M_.param_names(15) = {'rho_m'};
M_.param_names_tex(15) = {'rho\_m'};
M_.param_names_long(15) = {'rho_m'};
M_.param_names(16) = {'rho_i'};
M_.param_names_tex(16) = {'rho\_i'};
M_.param_names_long(16) = {'rho_i'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 5;
M_.endo_nbr = 19;
M_.param_nbr = 16;
M_.orig_endo_nbr = 19;
M_.aux_vars = [];
M_.Sigma_e = zeros(5, 5);
M_.Correlation_matrix = eye(5, 5);
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
M_.orig_eq_nbr = 19;
M_.eq_nbr = 19;
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
 1 10 0;
 0 11 0;
 0 12 0;
 0 13 0;
 0 14 0;
 0 15 0;
 0 16 29;
 2 17 0;
 3 18 30;
 4 19 0;
 0 20 31;
 0 21 0;
 0 22 32;
 0 23 33;
 5 24 0;
 6 25 0;
 7 26 0;
 8 27 0;
 9 28 0;]';
M_.nstatic = 6;
M_.nfwrd   = 4;
M_.npred   = 8;
M_.nboth   = 1;
M_.nsfwrd   = 5;
M_.nspred   = 9;
M_.ndynamic   = 13;
M_.dynamic_tmp_nbr = [10; 0; 0; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
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
  16 , 'name' , 'e_g' ;
  17 , 'name' , 'e_c' ;
  18 , 'name' , 'e_i' ;
  19 , 'name' , 'e_m' ;
};
M_.mapping.rr.eqidx = [2 5 8 11 12 ];
M_.mapping.c.eqidx = [13 14 ];
M_.mapping.c_E.eqidx = [7 12 14 ];
M_.mapping.c_H.eqidx = [1 14 ];
M_.mapping.h.eqidx = [3 4 5 10 12 ];
M_.mapping.w.eqidx = [3 5 10 12 ];
M_.mapping.y.eqidx = [4 8 10 12 13 ];
M_.mapping.k.eqidx = [4 5 6 8 ];
M_.mapping.i.eqidx = [6 9 12 13 ];
M_.mapping.l.eqidx = [5 12 ];
M_.mapping.lb_E.eqidx = [7 8 11 ];
M_.mapping.phi_E.eqidx = [8 10 11 ];
M_.mapping.lb_H.eqidx = [1 2 3 ];
M_.mapping.q.eqidx = [5 8 9 ];
M_.mapping.e_a.eqidx = [4 15 ];
M_.mapping.e_g.eqidx = [13 16 ];
M_.mapping.e_c.eqidx = [1 7 17 ];
M_.mapping.e_m.eqidx = [5 8 19 ];
M_.mapping.e_i.eqidx = [6 9 18 ];
M_.mapping.eta_a.eqidx = [15 ];
M_.mapping.eta_g.eqidx = [16 ];
M_.mapping.eta_c.eqidx = [17 ];
M_.mapping.eta_m.eqidx = [19 ];
M_.mapping.eta_i.eqidx = [18 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [1 8 9 10 15 16 17 18 19 ];
M_.exo_names_orig_ord = [1:5];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(19, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(5, 1);
M_.params = NaN(16, 1);
M_.endo_trends = struct('deflator', cell(19, 1), 'log_deflator', cell(19, 1), 'growth_factor', cell(19, 1), 'log_growth_factor', cell(19, 1));
M_.NNZDerivatives = [79; 0; -1; ];
M_.static_tmp_nbr = [9; 0; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
close all;
M_.params(2) = 0.993;
beta_H = M_.params(2);
M_.params(1) = 0.980;
beta_E = M_.params(1);
M_.params(3) = 0.025;
delta = M_.params(3);
M_.params(4) = 0.30;
alpha = M_.params(4);
M_.params(7) = 0.2;
gy = M_.params(7);
M_.params(11) = 0.3;
hh = M_.params(11);
M_.params(5) = 1;
sigmaC = M_.params(5);
M_.params(6) = 1;
sigmaL = M_.params(6);
M_.params(9) = 0.8;
mk = M_.params(9);
M_.params(8) = 1;
mh = M_.params(8);
M_.params(10) = 4;
kappa = M_.params(10);
M_.params(12) = 0.95;
rho_a = M_.params(12);
M_.params(13) = 0.95;
rho_g = M_.params(13);
M_.params(14) = 0.95;
rho_c = M_.params(14);
M_.params(15) = 0.95;
rho_m = M_.params(15);
M_.params(16) = 0.95;
rho_i = M_.params(16);
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
var_list_ = {'y';'c_E';'c_H';'i';'rr';'q'};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
save('credit_RBC2_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('credit_RBC2_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('credit_RBC2_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('credit_RBC2_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('credit_RBC2_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('credit_RBC2_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('credit_RBC2_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
