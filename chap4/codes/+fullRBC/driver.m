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
M_.fname = 'fullRBC';
M_.dynare_version = '4.6.1';
oo_.dynare_version = '4.6.1';
options_.dynare_version = '4.6.1';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('fullRBC.log');
M_.exo_names = cell(4,1);
M_.exo_names_tex = cell(4,1);
M_.exo_names_long = cell(4,1);
M_.exo_names(1) = {'eta_a'};
M_.exo_names_tex(1) = {'eta\_a'};
M_.exo_names_long(1) = {'eta_a'};
M_.exo_names(2) = {'eta_g'};
M_.exo_names_tex(2) = {'eta\_g'};
M_.exo_names_long(2) = {'eta_g'};
M_.exo_names(3) = {'eta_h'};
M_.exo_names_tex(3) = {'eta\_h'};
M_.exo_names_long(3) = {'eta_h'};
M_.exo_names(4) = {'eta_i'};
M_.exo_names_tex(4) = {'eta\_i'};
M_.exo_names_long(4) = {'eta_i'};
M_.endo_names = cell(14,1);
M_.endo_names_tex = cell(14,1);
M_.endo_names_long = cell(14,1);
M_.endo_names(1) = {'y'};
M_.endo_names_tex(1) = {'y'};
M_.endo_names_long(1) = {'y'};
M_.endo_names(2) = {'c'};
M_.endo_names_tex(2) = {'c'};
M_.endo_names_long(2) = {'c'};
M_.endo_names(3) = {'k'};
M_.endo_names_tex(3) = {'k'};
M_.endo_names_long(3) = {'k'};
M_.endo_names(4) = {'i'};
M_.endo_names_tex(4) = {'i'};
M_.endo_names_long(4) = {'i'};
M_.endo_names(5) = {'h'};
M_.endo_names_tex(5) = {'h'};
M_.endo_names_long(5) = {'h'};
M_.endo_names(6) = {'w'};
M_.endo_names_tex(6) = {'w'};
M_.endo_names_long(6) = {'w'};
M_.endo_names(7) = {'r'};
M_.endo_names_tex(7) = {'r'};
M_.endo_names_long(7) = {'r'};
M_.endo_names(8) = {'z'};
M_.endo_names_tex(8) = {'z'};
M_.endo_names_long(8) = {'z'};
M_.endo_names(9) = {'q'};
M_.endo_names_tex(9) = {'q'};
M_.endo_names_long(9) = {'q'};
M_.endo_names(10) = {'dy'};
M_.endo_names_tex(10) = {'dy'};
M_.endo_names_long(10) = {'dy'};
M_.endo_names(11) = {'e_a'};
M_.endo_names_tex(11) = {'e\_a'};
M_.endo_names_long(11) = {'e_a'};
M_.endo_names(12) = {'e_g'};
M_.endo_names_tex(12) = {'e\_g'};
M_.endo_names_long(12) = {'e_g'};
M_.endo_names(13) = {'e_h'};
M_.endo_names_tex(13) = {'e\_h'};
M_.endo_names_long(13) = {'e_h'};
M_.endo_names(14) = {'e_i'};
M_.endo_names_tex(14) = {'e\_i'};
M_.endo_names_long(14) = {'e_i'};
M_.endo_partitions = struct();
M_.param_names = cell(17,1);
M_.param_names_tex = cell(17,1);
M_.param_names_long = cell(17,1);
M_.param_names(1) = {'beta'};
M_.param_names_tex(1) = {'beta'};
M_.param_names_long(1) = {'beta'};
M_.param_names(2) = {'delta'};
M_.param_names_tex(2) = {'delta'};
M_.param_names_long(2) = {'delta'};
M_.param_names(3) = {'alpha'};
M_.param_names_tex(3) = {'alpha'};
M_.param_names_long(3) = {'alpha'};
M_.param_names(4) = {'sigmaC'};
M_.param_names_tex(4) = {'sigmaC'};
M_.param_names_long(4) = {'sigmaC'};
M_.param_names(5) = {'sigmaL'};
M_.param_names_tex(5) = {'sigmaL'};
M_.param_names_long(5) = {'sigmaL'};
M_.param_names(6) = {'hc'};
M_.param_names_tex(6) = {'hc'};
M_.param_names_long(6) = {'hc'};
M_.param_names(7) = {'chi'};
M_.param_names_tex(7) = {'chi'};
M_.param_names_long(7) = {'chi'};
M_.param_names(8) = {'gy'};
M_.param_names_tex(8) = {'gy'};
M_.param_names_long(8) = {'gy'};
M_.param_names(9) = {'kappa'};
M_.param_names_tex(9) = {'kappa'};
M_.param_names_long(9) = {'kappa'};
M_.param_names(10) = {'rho_a'};
M_.param_names_tex(10) = {'rho\_a'};
M_.param_names_long(10) = {'rho_a'};
M_.param_names(11) = {'rho_g'};
M_.param_names_tex(11) = {'rho\_g'};
M_.param_names_long(11) = {'rho_g'};
M_.param_names(12) = {'rho_h'};
M_.param_names_tex(12) = {'rho\_h'};
M_.param_names_long(12) = {'rho_h'};
M_.param_names(13) = {'rho_i'};
M_.param_names_tex(13) = {'rho\_i'};
M_.param_names_long(13) = {'rho_i'};
M_.param_names(14) = {'Zss'};
M_.param_names_tex(14) = {'Zss'};
M_.param_names_long(14) = {'Zss'};
M_.param_names(15) = {'Iss'};
M_.param_names_tex(15) = {'Iss'};
M_.param_names_long(15) = {'Iss'};
M_.param_names(16) = {'Css'};
M_.param_names_tex(16) = {'Css'};
M_.param_names_long(16) = {'Css'};
M_.param_names(17) = {'Yss'};
M_.param_names_tex(17) = {'Yss'};
M_.param_names_long(17) = {'Yss'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 4;
M_.endo_nbr = 14;
M_.param_nbr = 17;
M_.orig_endo_nbr = 14;
M_.aux_vars = [];
options_.varobs = cell(1, 1);
options_.varobs(1)  = {'dy'};
options_.varobs_id = [ 10  ];
M_.Sigma_e = zeros(4, 4);
M_.Correlation_matrix = eye(4, 4);
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
M_.orig_eq_nbr = 14;
M_.eq_nbr = 14;
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
 1 9 0;
 2 10 23;
 3 11 0;
 4 12 24;
 0 13 0;
 0 14 0;
 0 15 0;
 0 16 25;
 0 17 26;
 0 18 0;
 5 19 0;
 6 20 0;
 7 21 0;
 8 22 0;]';
M_.nstatic = 4;
M_.nfwrd   = 2;
M_.npred   = 6;
M_.nboth   = 2;
M_.nsfwrd   = 4;
M_.nspred   = 8;
M_.ndynamic   = 10;
M_.dynamic_tmp_nbr = [0; 0; 0; 0; ];
M_.equations_tags = {
  1 , 'name' , 'Euler' ;
  2 , 'name' , 'Labor Supply' ;
  3 , 'name' , 'No arbitrage Bonds-Capital' ;
  4 , 'name' , 'Capital law of motion' ;
  5 , 'name' , 'shadow value of capital' ;
  6 , 'name' , 'technology' ;
  7 , 'name' , 'Inputs Cost minimization' ;
  8 , 'name' , 'w' ;
  9 , 'name' , 'Resources Constraint' ;
  10 , 'name' , 'Measurement: output growth' ;
  11 , 'name' , 'shocks' ;
  12 , 'name' , 'e_g' ;
  13 , 'name' , 'e_h' ;
  14 , 'name' , 'e_i' ;
};
M_.mapping.y.eqidx = [6 7 8 9 10 ];
M_.mapping.c.eqidx = [1 2 9 ];
M_.mapping.k.eqidx = [4 6 7 ];
M_.mapping.i.eqidx = [4 5 9 ];
M_.mapping.h.eqidx = [2 6 8 ];
M_.mapping.w.eqidx = [2 8 ];
M_.mapping.r.eqidx = [1 3 ];
M_.mapping.z.eqidx = [3 7 ];
M_.mapping.q.eqidx = [3 5 ];
M_.mapping.dy.eqidx = [10 ];
M_.mapping.e_a.eqidx = [6 11 ];
M_.mapping.e_g.eqidx = [9 12 ];
M_.mapping.e_h.eqidx = [2 13 ];
M_.mapping.e_i.eqidx = [4 5 14 ];
M_.mapping.eta_a.eqidx = [11 ];
M_.mapping.eta_g.eqidx = [12 ];
M_.mapping.eta_h.eqidx = [13 ];
M_.mapping.eta_i.eqidx = [14 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [1 2 3 4 11 12 13 14 ];
M_.exo_names_orig_ord = [1:4];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(14, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(4, 1);
M_.params = NaN(17, 1);
M_.endo_trends = struct('deflator', cell(14, 1), 'log_deflator', cell(14, 1), 'growth_factor', cell(14, 1), 'log_growth_factor', cell(14, 1));
M_.NNZDerivatives = [51; 0; -1; ];
M_.static_tmp_nbr = [0; 0; 0; 0; ];
close all;
close all;
M_.params(1) = 0.99;
beta = M_.params(1);
M_.params(2) = 0.025;
delta = M_.params(2);
M_.params(3) = 0.36;
alpha = M_.params(3);
M_.params(8) = 0.2;
gy = M_.params(8);
M_.params(4) = 2;
sigmaC = M_.params(4);
M_.params(5) = 1;
sigmaL = M_.params(5);
M_.params(9) = 4;
kappa = M_.params(9);
M_.params(6) = 0;
hc = M_.params(6);
M_.params(10) = 0.95;
rho_a = M_.params(10);
M_.params(11) = 0.95;
rho_g = M_.params(11);
M_.params(12) = 0.95;
rho_h = M_.params(12);
M_.params(13) = 0.95;
rho_i = M_.params(13);
Rss		= 1/beta;
Hss		= 1/3;
M_.params(14) = Rss-(1-M_.params(2));
Zss = M_.params(14);
Kss		= Hss*(Zss/alpha)^(1/(alpha-1));
M_.params(17) = Kss^M_.params(3)*Hss^(1-M_.params(3));
Yss = M_.params(17);
M_.params(15) = M_.params(2)*Kss;
Iss = M_.params(15);
Wss		= (1-alpha)*Yss/Hss;
M_.params(16) = (1-M_.params(8))*M_.params(17)-M_.params(15);
Css = M_.params(16);
M_.params(7) = Wss/(Hss^M_.params(5)*(M_.params(16)-M_.params(16)*M_.params(6))^M_.params(4));
chi = M_.params(7);
estim_params_.var_exo = zeros(0, 10);
estim_params_.var_endo = zeros(0, 10);
estim_params_.corrx = zeros(0, 11);
estim_params_.corrn = zeros(0, 11);
estim_params_.param_vals = zeros(0, 10);
estim_params_.var_exo = [estim_params_.var_exo; 1, .7, 0, Inf, 4, .1, 2, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 10, .8, 0, 1, 1, .5, .2, NaN, NaN, NaN ];
options_.bayesian_irf = true;
options_.mh_jscale = 0.2;
options_.mh_replic = 20000;
options_.prefilter = 1;
options_.datafile = 'mydata';
options_.first_obs = 1;
options_.order = 1;
var_list_ = {'y';'c';'k'};
oo_recursive_=dynare_estimation(var_list_);
save('fullRBC_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('fullRBC_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('fullRBC_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('fullRBC_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('fullRBC_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('fullRBC_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('fullRBC_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
