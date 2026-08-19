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
    T = unemployment_RBC.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(18, 37);
g1(1,10)=params(4);
g1(1,17)=1;
g1(1,24)=(-1);
g1(2,9)=1;
g1(2,17)=(-1);
g1(2,29)=1;
g1(3,13)=(-T(8));
g1(3,17)=(-((1-params(10))*T(8)-(1-params(1)*(1-params(6)))*T(6)));
g1(3,20)=T(6);
g1(3,31)=(-(params(1)*(1-params(6))*T(6)));
g1(4,1)=(-(1-params(6)));
g1(4,11)=1;
g1(4,12)=(-params(6));
g1(4,19)=(-params(6));
g1(5,11)=12.33333333333333;
g1(5,12)=1;
g1(6,11)=(-(1-params(3)));
g1(6,14)=1;
g1(6,2)=(-params(3));
g1(6,22)=(-1);
g1(7,2)=1-params(2);
g1(7,15)=(-1);
g1(7,16)=params(2);
g1(8,9)=(-1);
g1(8,27)=params(1)*params(3)*T(2)/T(1);
g1(8,15)=params(1)*(-(params(3)*T(2)/T(1)));
g1(8,18)=(-1);
g1(8,30)=params(1)*(1-params(2));
g1(9,3)=params(11);
g1(9,16)=(-(params(11)+params(1)*params(11)));
g1(9,28)=params(1)*params(11);
g1(9,18)=1;
g1(9,26)=1;
g1(10,11)=T(7);
g1(10,13)=T(8);
g1(10,14)=(-T(7));
g1(10,17)=params(1)*(1-params(6))*T(5);
g1(10,29)=(-(params(1)*(1-params(6))*T(5)));
g1(10,21)=T(5);
g1(10,32)=(-(params(1)*(1-params(6))*T(5)));
g1(11,19)=params(7);
g1(11,21)=(-1);
g1(12,20)=T(10);
g1(12,21)=(-T(10));
g1(12,25)=(-1)-T(10);
g1(13,10)=(-T(11));
g1(13,12)=(-T(9));
g1(13,14)=1;
g1(13,16)=(-(params(2)*T(1)/T(2)));
g1(13,19)=(-((1+params(7))*T(9)));
g1(13,23)=(-params(8));
g1(14,4)=(-params(12));
g1(14,22)=1;
g1(14,33)=(-1);
g1(15,5)=(-params(13));
g1(15,23)=1;
g1(15,34)=(-1);
g1(16,6)=(-params(14));
g1(16,24)=1;
g1(16,35)=(-1);
g1(17,8)=(-params(16));
g1(17,26)=1;
g1(17,37)=(-1);
g1(18,7)=(-params(15));
g1(18,25)=1;
g1(18,36)=(-1);

end
