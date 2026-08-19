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
    T = fullRBC.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(14, 30);
g1(1,2)=(-params(6));
g1(1,10)=(-((-params(6))-1));
g1(1,23)=(-1);
g1(1,15)=1/params(4);
g1(2,2)=(-(params(4)/(1-params(6))*(-params(6))));
g1(2,10)=(-(params(4)/(1-params(6))));
g1(2,13)=(-params(5));
g1(2,14)=1;
g1(2,21)=(-1);
g1(3,15)=1;
g1(3,25)=(-(params(1)*params(14)));
g1(3,17)=1;
g1(3,26)=(-(params(1)*(1-params(2))));
g1(4,3)=1-params(2);
g1(4,11)=(-1);
g1(4,12)=params(2);
g1(4,22)=1;
g1(5,4)=(-(params(15)*(-params(9))));
g1(5,12)=(-(params(1)*params(9)+params(9)*params(15)));
g1(5,24)=params(1)*params(9);
g1(5,17)=1;
g1(5,22)=1;
g1(6,9)=1;
g1(6,3)=(-params(3));
g1(6,13)=(-(1-params(3)));
g1(6,19)=(-1);
g1(7,9)=(-1);
g1(7,3)=1;
g1(7,16)=1;
g1(8,9)=(-1);
g1(8,13)=1;
g1(8,14)=1;
g1(9,9)=1;
g1(9,10)=(-(params(16)/params(17)));
g1(9,12)=(-(params(15)/params(17)));
g1(9,20)=(-params(8));
g1(10,1)=1;
g1(10,9)=(-1);
g1(10,18)=1;
g1(11,5)=(-params(10));
g1(11,19)=1;
g1(11,27)=(-1);
g1(12,6)=(-params(11));
g1(12,20)=1;
g1(12,28)=(-1);
g1(13,7)=(-params(12));
g1(13,21)=1;
g1(13,29)=(-1);
g1(14,8)=(-params(13));
g1(14,22)=1;
g1(14,30)=(-1);

end
