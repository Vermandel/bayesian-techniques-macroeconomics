function T = static_resid_tt(T, y, x, params)
% function T = static_resid_tt(T, y, x, params)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%
% Output:
%   T         [#temp variables by 1]  double   vector of temporary terms
%

assert(length(T) >= 11);

T(1) = 0.925*((1/params(1)-(1-params(2)))/params(3))^(1/(params(3)-1));
T(2) = T(1)^params(3)*0.925^(1-params(3));
T(3) = (0.925*params(6)/.075)^(1+params(7));
T(4) = T(2)*0.01/(.075*T(3)/(1+params(7)));
T(5) = T(4)*(0.925*params(6)/.075)^params(7);
T(6) = T(5)*params(9)/(1-params(9));
T(7) = (1-params(3))*T(2)/0.925;
T(8) = T(7)-T(5)+params(1)*T(5)*(1-params(6));
T(9) = .075*T(3)*T(4)/(1+params(7));
T(10) = T(5)/T(6);
T(11) = (T(2)*(1-params(8))-params(2)*T(1)-T(9))/T(2);

end
