function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
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
%   residual
%

if T_flag
    T = fullRBC.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(14, 1);
lhs = 1/params(4)*y(15);
rhs = y(23)-params(6)*y(10)-(y(10)-params(6)*y(2));
residual(1) = lhs - rhs;
lhs = y(14);
rhs = y(21)+params(5)*y(13)+(y(10)-params(6)*y(2))*params(4)/(1-params(6));
residual(2) = lhs - rhs;
lhs = y(15);
rhs = params(1)*(params(14)*y(25)+(1-params(2))*y(26))-y(17);
residual(3) = lhs - rhs;
lhs = y(22)+params(2)*y(12);
rhs = y(11)-(1-params(2))*y(3);
residual(4) = lhs - rhs;
lhs = y(17)+y(22);
rhs = params(9)*(y(12)-y(4))*params(15)-params(1)*params(9)*(y(24)-y(12));
residual(5) = lhs - rhs;
lhs = y(9);
rhs = y(19)+y(3)*params(3)+y(13)*(1-params(3));
residual(6) = lhs - rhs;
lhs = y(16);
rhs = y(9)-y(3);
residual(7) = lhs - rhs;
lhs = y(14);
rhs = y(9)-y(13);
residual(8) = lhs - rhs;
lhs = y(9);
rhs = y(10)*params(16)/params(17)+y(12)*params(15)/params(17)+params(8)*y(20);
residual(9) = lhs - rhs;
lhs = y(18);
rhs = y(9)-y(1);
residual(10) = lhs - rhs;
lhs = y(19);
rhs = params(10)*y(5)+x(it_, 1);
residual(11) = lhs - rhs;
lhs = y(20);
rhs = params(11)*y(6)+x(it_, 2);
residual(12) = lhs - rhs;
lhs = y(21);
rhs = params(12)*y(7)+x(it_, 3);
residual(13) = lhs - rhs;
lhs = y(22);
rhs = params(13)*y(8)+x(it_, 4);
residual(14) = lhs - rhs;

end
