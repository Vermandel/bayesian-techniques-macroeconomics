function [residual, g1, g2, g3] = modele_version5_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(32, 1);
T41 = 1-0.5*params(10)*(y(15)/y(3)-1)^2;
T52 = y(2)^params(11);
T53 = y(37)*T52;
T55 = y(11)^(1-params(11));
T68 = 1+y(15)*(y(15)*3/y(3)-4)/y(3);
T75 = params(1)*y(43)/y(19);
T79 = params(10)*(1-params(9))*T75*y(44);
T82 = y(40)/y(15)-1;
T83 = T79*T82;
T84 = (y(40)/y(15))^2;
T149 = params(13)/2*(y(18)-(steady_state(12)))^2;
lhs =y(45)/y(22)*params(2)*y(7)/y(42);
rhs =1;
residual(1)= lhs-rhs;
lhs =y(22);
rhs =y(10)^(-params(3));
residual(2)= lhs-rhs;
lhs =y(22)*y(12);
rhs =params(5)*y(11)^params(4);
residual(3)= lhs-rhs;
lhs =y(14);
rhs =y(15)*T41+(1-params(9))*y(2);
residual(4)= lhs-rhs;
lhs =y(13);
rhs =T53*T55;
residual(5)= lhs-rhs;
lhs =y(20);
rhs =1+y(20)*params(10)/2*T68-T83*T84;
residual(6)= lhs-rhs;
lhs =y(20)*y(7)/y(42);
rhs =y(44)*y(21)*params(8)+(1-y(21))*(params(11)*y(41)*y(39)/y(14)+(1-params(9))*y(44));
residual(7)= lhs-rhs;
lhs =y(19);
rhs =y(9)^(-params(3));
residual(8)= lhs-rhs;
lhs =y(12);
rhs =y(13)*(1-params(11))*y(17)/y(11)/(1+y(21)*params(7));
residual(9)= lhs-rhs;
lhs =1;
rhs =y(21)+y(7)*T75/y(42);
residual(10)= lhs-rhs;
lhs =y(16);
rhs =y(14)*y(44)*y(42)*params(8)/y(7)-y(11)*y(12)*params(7);
residual(11)= lhs-rhs;
lhs =y(16)+y(13)*y(17)+y(13)*(1-y(17));
rhs =y(15)+y(9)+y(12)*y(11)+y(4)*y(1)/y(18)+T149;
residual(12)= lhs-rhs;
lhs =y(13);
rhs =T149+y(15)+y(8)+params(6)*(steady_state(7))*y(38);
residual(13)= lhs-rhs;
lhs =y(8);
rhs =y(10)+y(9);
residual(14)= lhs-rhs;
residual(15) = 1-params(12)+y(17)*params(12)-y(18)*params(13)*(y(18)-(steady_state(12)))+y(39)*y(42)*T75*params(13)*(y(42)-(steady_state(12)))/y(13);
lhs =y(7)-(steady_state(1));
rhs =params(16)*(y(1)-(steady_state(1)))+(y(18)-(steady_state(12)))*(1-params(16))*params(15)+x(it_, 3);
residual(16)= lhs-rhs;
lhs =log(y(37));
rhs =params(17)*log(y(5))+x(it_, 1);
residual(17)= lhs-rhs;
lhs =log(y(38));
rhs =params(19)*log(y(6))+x(it_, 2);
residual(18)= lhs-rhs;
lhs =y(28);
rhs =log(y(13)/(steady_state(7)));
residual(19)= lhs-rhs;
lhs =y(24);
rhs =log(y(9)/(steady_state(3)));
residual(20)= lhs-rhs;
lhs =y(25);
rhs =log(y(10)/(steady_state(4)));
residual(21)= lhs-rhs;
lhs =y(29);
rhs =log(y(14)/(steady_state(8)));
residual(22)= lhs-rhs;
lhs =y(30);
rhs =log(y(15)/(steady_state(9)));
residual(23)= lhs-rhs;
lhs =y(26);
rhs =log(y(11)/(steady_state(5)));
residual(24)= lhs-rhs;
lhs =y(27);
rhs =log(y(12)/(steady_state(6)));
residual(25)= lhs-rhs;
lhs =y(23);
rhs =log(y(7)/(steady_state(1)));
residual(26)= lhs-rhs;
lhs =y(31);
rhs =log(y(16)/(steady_state(10)));
residual(27)= lhs-rhs;
lhs =y(32);
rhs =log(y(17)/(steady_state(11)));
residual(28)= lhs-rhs;
lhs =y(33);
rhs =log(y(18)/(steady_state(12)));
residual(29)= lhs-rhs;
lhs =y(36);
rhs =log(y(21)/(steady_state(15)));
residual(30)= lhs-rhs;
lhs =y(34);
rhs =log(y(19)/(steady_state(13)));
residual(31)= lhs-rhs;
lhs =y(35);
rhs =log(y(20)/(steady_state(14)));
residual(32)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(32, 48);

  %
  % Jacobian matrix
  %

T452 = (-(params(1)*y(43)))/(y(19)*y(19));
  g1(1,7)=y(45)/y(22)*params(2)/y(42);
  g1(1,42)=(-(y(45)/y(22)*params(2)*y(7)))/(y(42)*y(42));
  g1(1,22)=y(7)*params(2)*(-y(45))/(y(22)*y(22))/y(42);
  g1(1,45)=y(7)*params(2)*1/y(22)/y(42);
  g1(2,10)=(-(getPowerDeriv(y(10),(-params(3)),1)));
  g1(2,22)=1;
  g1(3,11)=(-(params(5)*getPowerDeriv(y(11),params(4),1)));
  g1(3,12)=y(22);
  g1(3,22)=y(12);
  g1(4,2)=(-(1-params(9)));
  g1(4,14)=1;
  g1(4,3)=(-(y(15)*(-(0.5*params(10)*(-y(15))/(y(3)*y(3))*2*(y(15)/y(3)-1)))));
  g1(4,15)=(-(T41+y(15)*(-(0.5*params(10)*2*(y(15)/y(3)-1)*1/y(3)))));
  g1(5,11)=(-(T53*getPowerDeriv(y(11),1-params(11),1)));
  g1(5,13)=1;
  g1(5,2)=(-(T55*y(37)*getPowerDeriv(y(2),params(11),1)));
  g1(5,37)=(-(T52*T55));
  g1(6,3)=(-(y(20)*params(10)/2*(y(3)*y(15)*(-(y(15)*3))/(y(3)*y(3))-y(15)*(y(15)*3/y(3)-4))/(y(3)*y(3))));
  g1(6,15)=(-(y(20)*params(10)/2*(y(15)*3/y(3)-4+y(15)*3/y(3))/y(3)-(T84*T79*(-y(40))/(y(15)*y(15))+T83*(-y(40))/(y(15)*y(15))*2*y(40)/y(15))));
  g1(6,40)=T84*T79*1/y(15)+T83*2*y(40)/y(15)*1/y(15);
  g1(6,19)=T84*T82*params(10)*y(44)*(1-params(9))*T452;
  g1(6,43)=T84*T82*params(10)*y(44)*(1-params(9))*params(1)/y(19);
  g1(6,20)=1-params(10)/2*T68;
  g1(6,44)=T84*T82*params(10)*(1-params(9))*T75;
  g1(7,7)=y(20)*1/y(42);
  g1(7,39)=(-((1-y(21))*params(11)*y(41)/y(14)));
  g1(7,14)=(-((1-y(21))*(-(params(11)*y(41)*y(39)))/(y(14)*y(14))));
  g1(7,41)=(-((1-y(21))*params(11)*y(39)/y(14)));
  g1(7,42)=y(20)*(-y(7))/(y(42)*y(42));
  g1(7,20)=y(7)/y(42);
  g1(7,44)=(-(y(21)*params(8)+(1-params(9))*(1-y(21))));
  g1(7,21)=(-(y(44)*params(8)-(params(11)*y(41)*y(39)/y(14)+(1-params(9))*y(44))));
  g1(8,9)=(-(getPowerDeriv(y(9),(-params(3)),1)));
  g1(8,19)=1;
  g1(9,11)=(-((-(y(13)*(1-params(11))*y(17)))/(y(11)*y(11))/(1+y(21)*params(7))));
  g1(9,12)=1;
  g1(9,13)=(-((1-params(11))*y(17)/y(11)/(1+y(21)*params(7))));
  g1(9,17)=(-(y(13)*(1-params(11))/y(11)/(1+y(21)*params(7))));
  g1(9,21)=(-((-(y(13)*(1-params(11))*y(17)/y(11)*params(7)))/((1+y(21)*params(7))*(1+y(21)*params(7)))));
  g1(10,7)=(-(T75/y(42)));
  g1(10,42)=(-((-(y(7)*T75))/(y(42)*y(42))));
  g1(10,19)=(-(y(7)*T452/y(42)));
  g1(10,43)=(-(y(7)*params(1)/y(19)/y(42)));
  g1(10,21)=(-1);
  g1(11,7)=(-((-(y(14)*y(44)*y(42)*params(8)))/(y(7)*y(7))));
  g1(11,11)=y(12)*params(7);
  g1(11,12)=y(11)*params(7);
  g1(11,14)=(-(y(44)*y(42)*params(8)/y(7)));
  g1(11,16)=1;
  g1(11,42)=(-(y(14)*y(44)*params(8)/y(7)));
  g1(11,44)=(-(y(14)*y(42)*params(8)/y(7)));
  g1(12,1)=(-(y(4)/y(18)));
  g1(12,9)=(-1);
  g1(12,11)=(-y(12));
  g1(12,12)=(-y(11));
  g1(12,13)=y(17)+1-y(17);
  g1(12,15)=(-1);
  g1(12,4)=(-(y(1)/y(18)));
  g1(12,16)=1;
  g1(12,18)=(-((-(y(4)*y(1)))/(y(18)*y(18))+params(13)/2*2*(y(18)-(steady_state(12)))));
  g1(13,8)=(-1);
  g1(13,13)=1;
  g1(13,15)=(-1);
  g1(13,18)=(-(params(13)/2*2*(y(18)-(steady_state(12)))));
  g1(13,38)=(-(params(6)*(steady_state(7))));
  g1(14,8)=1;
  g1(14,9)=(-1);
  g1(14,10)=(-1);
  g1(15,13)=(-(y(39)*y(42)*T75*params(13)*(y(42)-(steady_state(12)))))/(y(13)*y(13));
  g1(15,39)=y(42)*T75*params(13)*(y(42)-(steady_state(12)))/y(13);
  g1(15,17)=params(12);
  g1(15,18)=(-(params(13)*(y(18)-(steady_state(12)))+y(18)*params(13)));
  g1(15,42)=y(39)*(T75*params(13)*(y(42)-(steady_state(12)))+y(42)*T75*params(13))/y(13);
  g1(15,19)=y(39)*y(42)*(y(42)-(steady_state(12)))*params(13)*T452/y(13);
  g1(15,43)=y(39)*y(42)*(y(42)-(steady_state(12)))*params(13)*params(1)/y(19)/y(13);
  g1(16,1)=(-params(16));
  g1(16,7)=1;
  g1(16,18)=(-((1-params(16))*params(15)));
  g1(16,48)=(-1);
  g1(17,5)=(-(params(17)*1/y(5)));
  g1(17,37)=1/y(37);
  g1(17,46)=(-1);
  g1(18,6)=(-(params(19)*1/y(6)));
  g1(18,38)=1/y(38);
  g1(18,47)=(-1);
  g1(19,13)=(-(1/(steady_state(7))/(y(13)/(steady_state(7)))));
  g1(19,28)=1;
  g1(20,9)=(-(1/(steady_state(3))/(y(9)/(steady_state(3)))));
  g1(20,24)=1;
  g1(21,10)=(-(1/(steady_state(4))/(y(10)/(steady_state(4)))));
  g1(21,25)=1;
  g1(22,14)=(-(1/(steady_state(8))/(y(14)/(steady_state(8)))));
  g1(22,29)=1;
  g1(23,15)=(-(1/(steady_state(9))/(y(15)/(steady_state(9)))));
  g1(23,30)=1;
  g1(24,11)=(-(1/(steady_state(5))/(y(11)/(steady_state(5)))));
  g1(24,26)=1;
  g1(25,12)=(-(1/(steady_state(6))/(y(12)/(steady_state(6)))));
  g1(25,27)=1;
  g1(26,7)=(-(1/(steady_state(1))/(y(7)/(steady_state(1)))));
  g1(26,23)=1;
  g1(27,16)=(-(1/(steady_state(10))/(y(16)/(steady_state(10)))));
  g1(27,31)=1;
  g1(28,17)=(-(1/(steady_state(11))/(y(17)/(steady_state(11)))));
  g1(28,32)=1;
  g1(29,18)=(-(1/(steady_state(12))/(y(18)/(steady_state(12)))));
  g1(29,33)=1;
  g1(30,21)=(-(1/(steady_state(15))/(y(21)/(steady_state(15)))));
  g1(30,36)=1;
  g1(31,19)=(-(1/(steady_state(13))/(y(19)/(steady_state(13)))));
  g1(31,34)=1;
  g1(32,20)=(-(1/(steady_state(14))/(y(20)/(steady_state(14)))));
  g1(32,35)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],32,2304);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],32,110592);
end
end
end
end
