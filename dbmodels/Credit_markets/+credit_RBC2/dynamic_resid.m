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
    T = credit_RBC2.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(19, 1);
lhs = y(22);
rhs = y(26)-params(5)*y(13);
residual(1) = lhs - rhs;
residual(2) = y(32)-y(22)+y(10);
lhs = y(22)+y(15);
rhs = params(6)*y(14);
residual(3) = lhs - rhs;
lhs = y(16);
rhs = y(24)+params(4)*y(2)+(1-params(4))*y(14);
residual(4) = lhs - rhs;
lhs = y(19)*(params(2)*params(9)*T(3)-T(7));
rhs = (y(27)+y(33)+y(17)-y(10))*params(2)*params(9)*T(3)-(y(15)+y(14))*T(7);
residual(5) = lhs - rhs;
lhs = params(3)*(y(18)+y(28));
rhs = y(17)-(1-params(3))*y(2);
residual(6) = lhs - rhs;
lhs = y(20);
rhs = y(26)-params(5)*y(12);
residual(7) = lhs - rhs;
lhs = (1-params(3))*y(33)+(y(29)-y(17))*T(8)+(y(31)-y(20))*(1-params(3)+T(8))+(y(27)+y(33)+y(21)-y(10))*T(2);
rhs = T(1)*y(23);
residual(8) = lhs - rhs;
lhs = y(28)+y(23);
rhs = params(10)*(y(18)-y(3))-params(1)*params(10)*(y(30)-y(18));
residual(9) = lhs - rhs;
lhs = y(15)*T(6)+(y(15)+y(21))*T(9);
rhs = (y(16)-y(14))*T(5);
residual(10) = lhs - rhs;
lhs = y(21)*(-(1-params(1)/params(2)));
rhs = (y(10)+y(31)-y(20))*T(1)*params(1);
residual(11) = lhs - rhs;
lhs = y(12)*T(10)+y(18)*params(3)*T(3)+(y(15)+y(14))*0.3333333333333333*T(6)+(y(1)+y(4))*T(1)*(params(2)*params(9)*T(3)-T(7));
rhs = y(19)*(params(2)*params(9)*T(3)-T(7))+y(16)*T(4);
residual(12) = lhs - rhs;
lhs = y(16);
rhs = params(7)*y(25)+y(11)*((1-params(7))*T(4)-params(3)*T(3))/T(4)+y(18)*params(3)*T(3)/T(4);
residual(13) = lhs - rhs;
lhs = y(11)*((1-params(7))*T(4)-params(3)*T(3));
rhs = y(12)*T(10)+y(13)*((1-params(7))*T(4)-params(3)*T(3)-T(10));
residual(14) = lhs - rhs;
lhs = y(24);
rhs = params(12)*y(5)+x(it_, 1);
residual(15) = lhs - rhs;
lhs = y(25);
rhs = params(13)*y(6)+x(it_, 2);
residual(16) = lhs - rhs;
lhs = y(26);
rhs = params(14)*y(7)+x(it_, 3);
residual(17) = lhs - rhs;
lhs = y(28);
rhs = params(16)*y(9)+x(it_, 5);
residual(18) = lhs - rhs;
lhs = y(27);
rhs = params(15)*y(8)+x(it_, 4);
residual(19) = lhs - rhs;

end
