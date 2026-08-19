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
    T = unemployment_RBC.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(18, 1);
lhs = y(17);
rhs = y(24)-params(4)*y(10);
residual(1) = lhs - rhs;
residual(2) = y(29)-y(17)+y(9);
lhs = y(20)*T(6);
rhs = y(13)*T(8)+y(17)*((1-params(10))*T(8)-(1-params(1)*(1-params(6)))*T(6))+y(31)*params(1)*(1-params(6))*T(6);
residual(3) = lhs - rhs;
lhs = y(11);
rhs = (1-params(6))*y(1)+params(6)*(y(19)+y(12));
residual(4) = lhs - rhs;
lhs = y(12);
rhs = y(11)*(-12.33333333333333);
residual(5) = lhs - rhs;
lhs = y(14);
rhs = y(22)+params(3)*y(2)+(1-params(3))*y(11);
residual(6) = lhs - rhs;
lhs = params(2)*y(16);
rhs = y(15)-(1-params(2))*y(2);
residual(7) = lhs - rhs;
lhs = params(1)*((1-params(2))*y(30)+(y(27)-y(15))*params(3)*T(2)/T(1));
rhs = y(9)+y(18);
residual(8) = lhs - rhs;
lhs = y(18)+y(26);
rhs = params(11)*(y(16)-y(3))-params(1)*params(11)*(y(28)-y(16));
residual(9) = lhs - rhs;
lhs = y(21)*T(5);
rhs = (y(14)-y(11))*T(7)-y(13)*T(8)+(y(29)-y(17)+y(32))*params(1)*(1-params(6))*T(5);
residual(10) = lhs - rhs;
lhs = params(7)*y(19);
rhs = y(21);
residual(11) = lhs - rhs;
lhs = (-y(25));
rhs = (y(21)+y(25)-y(20))*T(10);
residual(12) = lhs - rhs;
lhs = y(14);
rhs = params(8)*y(23)+y(10)*T(11)+y(16)*params(2)*T(1)/T(2)+(y(12)+(1+params(7))*y(19))*T(9);
residual(13) = lhs - rhs;
lhs = y(22);
rhs = params(12)*y(4)+x(it_, 1);
residual(14) = lhs - rhs;
lhs = y(23);
rhs = params(13)*y(5)+x(it_, 2);
residual(15) = lhs - rhs;
lhs = y(24);
rhs = params(14)*y(6)+x(it_, 3);
residual(16) = lhs - rhs;
lhs = y(26);
rhs = params(16)*y(8)+x(it_, 5);
residual(17) = lhs - rhs;
lhs = y(25);
rhs = params(15)*y(7)+x(it_, 4);
residual(18) = lhs - rhs;

end
