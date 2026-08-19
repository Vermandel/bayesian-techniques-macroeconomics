function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
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
%   g1
%

if T_flag
    T = credit_RBC2.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(19, 38);
g1(1,13)=params(5);
g1(1,22)=1;
g1(1,26)=(-1);
g1(2,10)=1;
g1(2,22)=(-1);
g1(2,32)=1;
g1(3,14)=(-params(6));
g1(3,15)=1;
g1(3,22)=1;
g1(4,14)=(-(1-params(4)));
g1(4,16)=1;
g1(4,2)=(-params(4));
g1(4,24)=(-1);
g1(5,10)=params(2)*params(9)*T(3);
g1(5,14)=T(7);
g1(5,15)=T(7);
g1(5,17)=(-(params(2)*params(9)*T(3)));
g1(5,19)=params(2)*params(9)*T(3)-T(7);
g1(5,33)=(-(params(2)*params(9)*T(3)));
g1(5,27)=(-(params(2)*params(9)*T(3)));
g1(6,2)=1-params(3);
g1(6,17)=(-1);
g1(6,18)=params(3);
g1(6,28)=params(3);
g1(7,12)=params(5);
g1(7,20)=1;
g1(7,26)=(-1);
g1(8,10)=(-T(2));
g1(8,29)=T(8);
g1(8,17)=(-T(8));
g1(8,20)=(-(1-params(3)+T(8)));
g1(8,31)=1-params(3)+T(8);
g1(8,21)=T(2);
g1(8,23)=(-T(1));
g1(8,33)=1-params(3)+T(2);
g1(8,27)=T(2);
g1(9,3)=params(10);
g1(9,18)=(-(params(10)+params(1)*params(10)));
g1(9,30)=params(1)*params(10);
g1(9,23)=1;
g1(9,28)=1;
g1(10,14)=T(5);
g1(10,15)=T(6)+T(9);
g1(10,16)=(-T(5));
g1(10,21)=T(9);
g1(11,10)=(-(T(1)*params(1)));
g1(11,20)=T(1)*params(1);
g1(11,31)=(-(T(1)*params(1)));
g1(11,21)=(-(1-params(1)/params(2)));
g1(12,1)=T(1)*(params(2)*params(9)*T(3)-T(7));
g1(12,12)=T(10);
g1(12,14)=0.3333333333333333*T(6);
g1(12,15)=0.3333333333333333*T(6);
g1(12,16)=(-T(4));
g1(12,18)=params(3)*T(3);
g1(12,4)=T(1)*(params(2)*params(9)*T(3)-T(7));
g1(12,19)=(-(params(2)*params(9)*T(3)-T(7)));
g1(13,11)=(-(((1-params(7))*T(4)-params(3)*T(3))/T(4)));
g1(13,16)=1;
g1(13,18)=(-(params(3)*T(3)/T(4)));
g1(13,25)=(-params(7));
g1(14,11)=(1-params(7))*T(4)-params(3)*T(3);
g1(14,12)=(-T(10));
g1(14,13)=(-((1-params(7))*T(4)-params(3)*T(3)-T(10)));
g1(15,5)=(-params(12));
g1(15,24)=1;
g1(15,34)=(-1);
g1(16,6)=(-params(13));
g1(16,25)=1;
g1(16,35)=(-1);
g1(17,7)=(-params(14));
g1(17,26)=1;
g1(17,36)=(-1);
g1(18,9)=(-params(16));
g1(18,28)=1;
g1(18,38)=(-1);
g1(19,8)=(-params(15));
g1(19,27)=1;
g1(19,37)=(-1);

end
