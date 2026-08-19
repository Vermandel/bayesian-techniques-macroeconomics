function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
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
%   g1
%

if T_flag
    T = unemployment_RBC.static_g1_tt(T, y, x, params);
end
g1 = zeros(18, 18);
g1(1,2)=params(4);
g1(1,9)=1;
g1(1,16)=(-1);
g1(2,1)=1;
g1(3,5)=(-T(8));
g1(3,9)=(-(T(8)*(1-params(10))-T(6)*(1-params(1)*(1-params(6)))));
g1(3,12)=T(6)-T(6)*params(1)*(1-params(6));
g1(4,3)=1-(1-params(6));
g1(4,4)=(-params(6));
g1(4,11)=(-params(6));
g1(5,3)=12.33333333333333;
g1(5,4)=1;
g1(6,3)=(-(1-params(3)));
g1(6,6)=1;
g1(6,7)=(-params(3));
g1(6,14)=(-1);
g1(7,7)=(-(1-(1-params(2))));
g1(7,8)=params(2);
g1(8,1)=(-1);
g1(8,6)=params(1)*params(3)*T(2)/T(1);
g1(8,7)=params(1)*(-(params(3)*T(2)/T(1)));
g1(8,10)=params(1)*(1-params(2))-1;
g1(9,10)=1;
g1(9,18)=1;
g1(10,3)=T(7);
g1(10,5)=T(8);
g1(10,6)=(-T(7));
g1(10,13)=T(5)-T(5)*params(1)*(1-params(6));
g1(11,11)=params(7);
g1(11,13)=(-1);
g1(12,12)=T(10);
g1(12,13)=(-T(10));
g1(12,17)=(-1)-T(10);
g1(13,2)=(-T(11));
g1(13,4)=(-T(9));
g1(13,6)=1;
g1(13,8)=(-(params(2)*T(1)/T(2)));
g1(13,11)=(-((1+params(7))*T(9)));
g1(13,15)=(-params(8));
g1(14,14)=1-params(12);
g1(15,15)=1-params(13);
g1(16,16)=1-params(14);
g1(17,18)=1-params(16);
g1(18,17)=1-params(15);
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
