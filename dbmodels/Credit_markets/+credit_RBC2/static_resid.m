function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = credit_RBC2.static_resid_tt(T, y, x, params);
end
residual = zeros(19, 1);
lhs = y(13);
rhs = y(17)-params(5)*y(4);
residual(1) = lhs - rhs;
residual(2) = y(1);
lhs = y(13)+y(6);
rhs = params(6)*y(5);
residual(3) = lhs - rhs;
lhs = y(7);
rhs = y(15)+params(4)*y(8)+(1-params(4))*y(5);
residual(4) = lhs - rhs;
lhs = (params(2)*params(9)*T(3)-T(7))*y(10);
rhs = params(2)*params(9)*T(3)*(y(8)+y(18)+y(14)-y(1))-T(7)*(y(6)+y(5));
residual(5) = lhs - rhs;
lhs = params(3)*(y(9)+y(19));
rhs = y(8)-(1-params(3))*y(8);
residual(6) = lhs - rhs;
lhs = y(11);
rhs = y(17)-params(5)*y(3);
residual(7) = lhs - rhs;
lhs = (1-params(3))*y(14)+(y(7)-y(8))*params(4)*T(4)/T(3)+T(2)*(y(18)+y(14)+y(12)-y(1));
rhs = T(1)*y(14);
residual(8) = lhs - rhs;
residual(9) = y(14)+y(19);
lhs = T(6)*y(6)+(y(6)+y(12))*T(9);
rhs = T(5)*(y(7)-y(5));
residual(10) = lhs - rhs;
lhs = y(12)*(-(1-params(1)/params(2)));
rhs = y(1)*T(1)*params(1);
residual(11) = lhs - rhs;
lhs = T(8)*y(3)+params(3)*T(3)*y(9)+0.3333333333333333*T(6)*(y(6)+y(5))+(y(1)+y(10))*T(1)*(params(2)*params(9)*T(3)-T(7));
rhs = (params(2)*params(9)*T(3)-T(7))*y(10)+T(4)*y(7);
residual(12) = lhs - rhs;
lhs = y(7);
rhs = params(7)*y(16)+y(2)*(T(4)*(1-params(7))-params(3)*T(3))/T(4)+y(9)*params(3)*T(3)/T(4);
residual(13) = lhs - rhs;
lhs = (T(4)*(1-params(7))-params(3)*T(3))*y(2);
rhs = T(8)*y(3)+(T(4)*(1-params(7))-params(3)*T(3)-T(8))*y(4);
residual(14) = lhs - rhs;
lhs = y(15);
rhs = y(15)*params(12)+x(1);
residual(15) = lhs - rhs;
lhs = y(16);
rhs = y(16)*params(13)+x(2);
residual(16) = lhs - rhs;
lhs = y(17);
rhs = y(17)*params(14)+x(3);
residual(17) = lhs - rhs;
lhs = y(19);
rhs = y(19)*params(16)+x(5);
residual(18) = lhs - rhs;
lhs = y(18);
rhs = y(18)*params(15)+x(4);
residual(19) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
