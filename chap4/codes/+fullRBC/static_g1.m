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
    T = fullRBC.static_g1_tt(T, y, x, params);
end
g1 = zeros(14, 14);
g1(1,7)=1/params(4);
g1(2,2)=(-params(4));
g1(2,5)=(-params(5));
g1(2,6)=1;
g1(2,13)=(-1);
g1(3,7)=1;
g1(3,8)=(-(params(1)*params(14)));
g1(3,9)=(-(params(1)*(1-params(2))-1));
g1(4,3)=(-(1-(1-params(2))));
g1(4,4)=params(2);
g1(4,14)=1;
g1(5,9)=1;
g1(5,14)=1;
g1(6,1)=1;
g1(6,3)=(-params(3));
g1(6,5)=(-(1-params(3)));
g1(6,11)=(-1);
g1(7,1)=(-1);
g1(7,3)=1;
g1(7,8)=1;
g1(8,1)=(-1);
g1(8,5)=1;
g1(8,6)=1;
g1(9,1)=1;
g1(9,2)=(-(params(16)/params(17)));
g1(9,4)=(-(params(15)/params(17)));
g1(9,12)=(-params(8));
g1(10,10)=1;
g1(11,11)=1-params(10);
g1(12,12)=1-params(11);
g1(13,13)=1-params(12);
g1(14,14)=1-params(13);
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
