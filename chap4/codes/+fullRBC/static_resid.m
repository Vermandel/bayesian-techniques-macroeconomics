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
    T = fullRBC.static_resid_tt(T, y, x, params);
end
residual = zeros(14, 1);
residual(1) = 1/params(4)*y(7);
lhs = y(6);
rhs = y(13)+params(5)*y(5)+(y(2)-y(2)*params(6))*params(4)/(1-params(6));
residual(2) = lhs - rhs;
lhs = y(7);
rhs = params(1)*(params(14)*y(8)+(1-params(2))*y(9))-y(9);
residual(3) = lhs - rhs;
lhs = y(14)+params(2)*y(4);
rhs = y(3)-(1-params(2))*y(3);
residual(4) = lhs - rhs;
residual(5) = y(9)+y(14);
lhs = y(1);
rhs = y(11)+y(3)*params(3)+y(5)*(1-params(3));
residual(6) = lhs - rhs;
lhs = y(8);
rhs = y(1)-y(3);
residual(7) = lhs - rhs;
lhs = y(6);
rhs = y(1)-y(5);
residual(8) = lhs - rhs;
lhs = y(1);
rhs = y(2)*params(16)/params(17)+y(4)*params(15)/params(17)+params(8)*y(12);
residual(9) = lhs - rhs;
residual(10) = y(10);
lhs = y(11);
rhs = y(11)*params(10)+x(1);
residual(11) = lhs - rhs;
lhs = y(12);
rhs = y(12)*params(11)+x(2);
residual(12) = lhs - rhs;
lhs = y(13);
rhs = y(13)*params(12)+x(3);
residual(13) = lhs - rhs;
lhs = y(14);
rhs = y(14)*params(13)+x(4);
residual(14) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
