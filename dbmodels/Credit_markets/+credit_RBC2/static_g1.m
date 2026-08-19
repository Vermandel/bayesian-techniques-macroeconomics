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
    T = credit_RBC2.static_g1_tt(T, y, x, params);
end
g1 = zeros(19, 19);
g1(1,4)=params(5);
g1(1,13)=1;
g1(1,17)=(-1);
g1(2,1)=1;
g1(3,5)=(-params(6));
g1(3,6)=1;
g1(3,13)=1;
g1(4,5)=(-(1-params(4)));
g1(4,7)=1;
g1(4,8)=(-params(4));
g1(4,15)=(-1);
g1(5,1)=params(2)*params(9)*T(3);
g1(5,5)=T(7);
g1(5,6)=T(7);
g1(5,8)=(-(params(2)*params(9)*T(3)));
g1(5,10)=params(2)*params(9)*T(3)-T(7);
g1(5,14)=(-(params(2)*params(9)*T(3)));
g1(5,18)=(-(params(2)*params(9)*T(3)));
g1(6,8)=(-(1-(1-params(3))));
g1(6,9)=params(3);
g1(6,19)=params(3);
g1(7,3)=params(5);
g1(7,11)=1;
g1(7,17)=(-1);
g1(8,1)=(-T(2));
g1(8,7)=params(4)*T(4)/T(3);
g1(8,8)=(-(params(4)*T(4)/T(3)));
g1(8,12)=T(2);
g1(8,14)=T(2)+1-params(3)-T(1);
g1(8,18)=T(2);
g1(9,14)=1;
g1(9,19)=1;
g1(10,5)=T(5);
g1(10,6)=T(6)+T(9);
g1(10,7)=(-T(5));
g1(10,12)=T(9);
g1(11,1)=(-(T(1)*params(1)));
g1(11,12)=(-(1-params(1)/params(2)));
g1(12,1)=T(1)*(params(2)*params(9)*T(3)-T(7));
g1(12,3)=T(8);
g1(12,5)=0.3333333333333333*T(6);
g1(12,6)=0.3333333333333333*T(6);
g1(12,7)=(-T(4));
g1(12,9)=params(3)*T(3);
g1(12,10)=T(1)*(params(2)*params(9)*T(3)-T(7))-(params(2)*params(9)*T(3)-T(7));
g1(13,2)=(-((T(4)*(1-params(7))-params(3)*T(3))/T(4)));
g1(13,7)=1;
g1(13,9)=(-(params(3)*T(3)/T(4)));
g1(13,16)=(-params(7));
g1(14,2)=T(4)*(1-params(7))-params(3)*T(3);
g1(14,3)=(-T(8));
g1(14,4)=(-(T(4)*(1-params(7))-params(3)*T(3)-T(8)));
g1(15,15)=1-params(12);
g1(16,16)=1-params(13);
g1(17,17)=1-params(14);
g1(18,19)=1-params(16);
g1(19,18)=1-params(15);
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
