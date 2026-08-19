function g2 = dynamic_g2(T, y, x, params, steady_state, it_, T_flag)
% function g2 = dynamic_g2(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g2
%

if T_flag
    T = dyn_toy_model.dynamic_g2_tt(T, y, x, params, steady_state, it_);
end
g2_i = zeros(8,1);
g2_j = zeros(8,1);
g2_v = zeros(8,1);

g2_i(1)=1;
g2_i(2)=1;
g2_i(3)=1;
g2_i(4)=1;
g2_i(5)=2;
g2_i(6)=2;
g2_i(7)=2;
g2_i(8)=2;
g2_j(1)=1;
g2_j(2)=5;
g2_j(3)=21;
g2_j(4)=25;
g2_j(5)=7;
g2_j(6)=9;
g2_j(7)=17;
g2_j(8)=19;
g2_v(1)=(-(exp(x(it_, 1))*getPowerDeriv(y(1),params(2),2)));
g2_v(2)=T(3);
g2_v(3)=g2_v(2);
g2_v(4)=(-T(1));
g2_v(5)=(-(T(2)*T(4)*T(4)*T(6)));
g2_v(6)=(-(T(2)*(T(5)*(-1)/(y(4)*y(4))+T(4)*(-y(2))/(y(4)*y(4))*T(6))));
g2_v(7)=g2_v(6);
g2_v(8)=(-(T(2)*((-y(2))/(y(4)*y(4))*(-y(2))/(y(4)*y(4))*T(6)+T(5)*(-((-y(2))*(y(4)+y(4))))/(y(4)*y(4)*y(4)*y(4)))));
g2 = sparse(g2_i,g2_j,g2_v,2,25);
end
