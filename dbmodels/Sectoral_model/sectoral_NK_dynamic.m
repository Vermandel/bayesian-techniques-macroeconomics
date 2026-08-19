function [residual, g1, g2, g3] = sectoral_NK_dynamic(y, x, params, steady_state, it_)
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
T17 = (y(16)-params(13)*y(1))^(-params(5));
T23 = params(1)*y(55)/y(38);
T33 = params(8)*y(19)^params(6);
T37 = (y(20)/y(19))^params(10);
T44 = (y(21)/y(19))^params(10);
T57 = y(2)^params(3);
T58 = y(40)*T57;
T60 = y(20)^(1-params(3));
T66 = y(3)^params(4);
T67 = y(40)*T66;
T69 = y(21)^(1-params(4));
T76 = params(16)/2;
T82 = 1-T76*(y(29)/y(4)-1)^2;
T120 = 1+y(29)*(y(29)*3/y(4)-4)/y(4);
T126 = params(16)*y(56)*T23*y(57);
T129 = 1-y(49)/y(29);
T130 = T126*T129;
T131 = (y(49)/y(29))^2;
T164 = y(47)*y(55)*params(1)*params(20)/y(38)/y(25);
T166 = T164*y(53);
T189 = y(48)*y(55)*params(1)*params(21)/y(38)/y(26);
T191 = T189*y(54);
T202 = params(20)/2*(y(35)-(steady_state(21)))^2;
T211 = params(21)/2*(y(36)-(steady_state(22)))^2;
T228 = y(30)^(-params(11));
T229 = y(45)*(1-params(7))*T228;
T234 = y(31)^(-params(11));
T235 = params(7)*y(46)*T234;
T260 = y(7)^params(17);
T266 = (steady_state(23))*(y(34)/(steady_state(20)))^params(19);
T270 = (y(24)/(steady_state(10)))^params(18);
T271 = T266*T270;
T273 = T271^(1-params(17));
lhs =y(38);
rhs =y(41)*T17;
residual(1)= lhs-rhs;
lhs =T23*y(15);
rhs =1;
residual(2)= lhs-rhs;
lhs =y(38)*y(22);
rhs =T33*T37;
residual(3)= lhs-rhs;
lhs =y(38)*y(23);
rhs =T33*T44;
residual(4)= lhs-rhs;
lhs =y(19)^(1+params(10));
rhs =y(20)^(1+params(10))+y(21)^(1+params(10));
residual(5)= lhs-rhs;
lhs =y(25);
rhs =T58*T60;
residual(6)= lhs-rhs;
lhs =y(26);
rhs =T67*T69;
residual(7)= lhs-rhs;
lhs =y(29)*y(42)*T82;
rhs =y(27)+y(28)-(1-params(2))*(y(2)+y(3));
residual(8)= lhs-rhs;
lhs =(1-params(2))*y(56)+params(3)*y(50)*y(47)/y(27);
rhs =y(15)*y(39);
residual(9)= lhs-rhs;
lhs =(1-params(2))*y(56)+params(4)*y(51)*y(48)/y(28);
rhs =y(15)*y(39);
residual(10)= lhs-rhs;
lhs =y(42)*y(39);
rhs =1+T76*y(42)*y(39)*T120+T130*T131;
residual(11)= lhs-rhs;
lhs =y(22);
rhs =y(25)*(1-params(3))*y(32)/y(20);
residual(12)= lhs-rhs;
lhs =y(23);
rhs =y(26)*(1-params(4))*y(33)/y(21);
residual(13)= lhs-rhs;
residual(14) = (1-params(14))*y(30)+y(32)*params(14)*y(44)-params(20)*y(35)*(y(35)-(steady_state(21)))+T166*(y(53)-(steady_state(21)));
residual(15) = (1-params(15))*y(31)+y(33)*y(44)*params(15)-params(21)*y(36)*(y(36)-(steady_state(22)))+T191*(y(54)-(steady_state(22)));
lhs =y(25)*params(9);
rhs =y(29)+y(17)+y(25)*T202;
residual(16)= lhs-rhs;
lhs =y(26)*(1-params(9));
rhs =y(18)+y(26)*T211;
residual(17)= lhs-rhs;
lhs =y(24);
rhs =y(25)*y(30)*params(9)+y(26)*y(31)*(1-params(9));
residual(18)= lhs-rhs;
lhs =y(17);
rhs =y(16)*T229;
residual(19)= lhs-rhs;
lhs =y(18);
rhs =y(16)*T235;
residual(20)= lhs-rhs;
lhs =y(30)/y(5);
rhs =y(35)/y(34);
residual(21)= lhs-rhs;
lhs =y(31)/y(6);
rhs =y(36)/y(34);
residual(22)= lhs-rhs;
lhs =1;
rhs =(1-params(7))*y(30)^(1-params(11))+params(7)*y(31)^(1-params(11));
residual(23)= lhs-rhs;
lhs =y(15);
rhs =y(37)/y(52);
residual(24)= lhs-rhs;
lhs =y(37);
rhs =T260*T273*y(43);
residual(25)= lhs-rhs;
lhs =log(y(40));
rhs =params(22)*log(y(8))+x(it_, 1);
residual(26)= lhs-rhs;
lhs =log(y(41));
rhs =params(23)*log(y(9))+x(it_, 2);
residual(27)= lhs-rhs;
lhs =log(y(42));
rhs =params(24)*log(y(10))+x(it_, 3);
residual(28)= lhs-rhs;
lhs =log(y(43));
rhs =params(25)*log(y(11))+x(it_, 4);
residual(29)= lhs-rhs;
lhs =log(y(44));
rhs =params(26)*log(y(12))+x(it_, 5);
residual(30)= lhs-rhs;
lhs =log(y(45));
rhs =params(27)*log(y(13))+x(it_, 6);
residual(31)= lhs-rhs;
lhs =log(y(46));
rhs =params(28)*log(y(14))+x(it_, 7);
residual(32)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(32, 64);

  %
  % Jacobian matrix
  %

T336 = getPowerDeriv(y(16)-params(13)*y(1),(-params(5)),1);
T345 = params(8)*getPowerDeriv(y(19),params(6),1);
T349 = getPowerDeriv(y(20)/y(19),params(10),1);
T357 = getPowerDeriv(y(21)/y(19),params(10),1);
T393 = getPowerDeriv(T271,1-params(17),1);
  g1(1,1)=(-(y(41)*(-params(13))*T336));
  g1(1,16)=(-(y(41)*T336));
  g1(1,38)=1;
  g1(1,41)=(-T17);
  g1(2,15)=T23;
  g1(2,38)=y(15)*(-(params(1)*y(55)))/(y(38)*y(38));
  g1(2,55)=y(15)*params(1)/y(38);
  g1(3,19)=(-(T37*T345+T33*(-y(20))/(y(19)*y(19))*T349));
  g1(3,20)=(-(T33*T349*1/y(19)));
  g1(3,22)=y(38);
  g1(3,38)=y(22);
  g1(4,19)=(-(T44*T345+T33*(-y(21))/(y(19)*y(19))*T357));
  g1(4,21)=(-(T33*T357*1/y(19)));
  g1(4,23)=y(38);
  g1(4,38)=y(23);
  g1(5,19)=getPowerDeriv(y(19),1+params(10),1);
  g1(5,20)=(-(getPowerDeriv(y(20),1+params(10),1)));
  g1(5,21)=(-(getPowerDeriv(y(21),1+params(10),1)));
  g1(6,20)=(-(T58*getPowerDeriv(y(20),1-params(3),1)));
  g1(6,25)=1;
  g1(6,2)=(-(T60*y(40)*getPowerDeriv(y(2),params(3),1)));
  g1(6,40)=(-(T57*T60));
  g1(7,21)=(-(T67*getPowerDeriv(y(21),1-params(4),1)));
  g1(7,26)=1;
  g1(7,3)=(-(T69*y(40)*getPowerDeriv(y(3),params(4),1)));
  g1(7,40)=(-(T66*T69));
  g1(8,2)=1-params(2);
  g1(8,27)=(-1);
  g1(8,3)=1-params(2);
  g1(8,28)=(-1);
  g1(8,4)=y(29)*y(42)*(-(T76*(-y(29))/(y(4)*y(4))*2*(y(29)/y(4)-1)));
  g1(8,29)=y(42)*T82+y(29)*y(42)*(-(T76*2*(y(29)/y(4)-1)*1/y(4)));
  g1(8,42)=y(29)*T82;
  g1(9,15)=(-y(39));
  g1(9,47)=params(3)*y(50)/y(27);
  g1(9,27)=(-(params(3)*y(50)*y(47)))/(y(27)*y(27));
  g1(9,50)=params(3)*y(47)/y(27);
  g1(9,39)=(-y(15));
  g1(9,56)=1-params(2);
  g1(10,15)=(-y(39));
  g1(10,48)=params(4)*y(51)/y(28);
  g1(10,28)=(-(params(4)*y(51)*y(48)))/(y(28)*y(28));
  g1(10,51)=params(4)*y(48)/y(28);
  g1(10,39)=(-y(15));
  g1(10,56)=1-params(2);
  g1(11,4)=(-(T76*y(42)*y(39)*(y(4)*y(29)*(-(y(29)*3))/(y(4)*y(4))-y(29)*(y(29)*3/y(4)-4))/(y(4)*y(4))));
  g1(11,29)=(-(T76*y(42)*y(39)*(y(29)*3/y(4)-4+y(29)*3/y(4))/y(4)+T131*T126*(-((-y(49))/(y(29)*y(29))))+T130*(-y(49))/(y(29)*y(29))*2*y(49)/y(29)));
  g1(11,49)=(-(T131*T126*(-(1/y(29)))+T130*2*y(49)/y(29)*1/y(29)));
  g1(11,38)=(-(T131*T129*params(16)*y(56)*y(57)*(-(params(1)*y(55)))/(y(38)*y(38))));
  g1(11,55)=(-(T131*T129*params(16)*y(56)*y(57)*params(1)/y(38)));
  g1(11,39)=y(42)-T120*y(42)*T76;
  g1(11,56)=(-(T131*T129*params(16)*T23*y(57)));
  g1(11,42)=y(39)-T120*T76*y(39);
  g1(11,57)=(-(T131*T129*params(16)*T23*y(56)));
  g1(12,20)=(-((-(y(25)*(1-params(3))*y(32)))/(y(20)*y(20))));
  g1(12,22)=1;
  g1(12,25)=(-((1-params(3))*y(32)/y(20)));
  g1(12,32)=(-(y(25)*(1-params(3))/y(20)));
  g1(13,21)=(-((-(y(26)*(1-params(4))*y(33)))/(y(21)*y(21))));
  g1(13,23)=1;
  g1(13,26)=(-((1-params(4))*y(33)/y(21)));
  g1(13,33)=(-(y(26)*(1-params(4))/y(21)));
  g1(14,25)=(y(53)-(steady_state(21)))*y(53)*(-(y(47)*y(55)*params(1)*params(20)/y(38)))/(y(25)*y(25));
  g1(14,47)=(y(53)-(steady_state(21)))*y(53)*y(55)*params(1)*params(20)/y(38)/y(25);
  g1(14,30)=1-params(14);
  g1(14,32)=params(14)*y(44);
  g1(14,35)=(-(params(20)*y(35)+params(20)*(y(35)-(steady_state(21)))));
  g1(14,53)=T166+T164*(y(53)-(steady_state(21)));
  g1(14,38)=(y(53)-(steady_state(21)))*y(53)*y(47)*(-(y(55)*params(1)*params(20)))/(y(38)*y(38))/y(25);
  g1(14,55)=(y(53)-(steady_state(21)))*y(53)*y(47)*params(1)*params(20)/y(38)/y(25);
  g1(14,44)=y(32)*params(14);
  g1(15,26)=(y(54)-(steady_state(22)))*y(54)*(-(y(48)*y(55)*params(1)*params(21)/y(38)))/(y(26)*y(26));
  g1(15,48)=(y(54)-(steady_state(22)))*y(54)*y(55)*params(1)*params(21)/y(38)/y(26);
  g1(15,31)=1-params(15);
  g1(15,33)=y(44)*params(15);
  g1(15,36)=(-(params(21)*y(36)+params(21)*(y(36)-(steady_state(22)))));
  g1(15,54)=T191+T189*(y(54)-(steady_state(22)));
  g1(15,38)=(y(54)-(steady_state(22)))*y(54)*y(48)*(-(y(55)*params(1)*params(21)))/(y(38)*y(38))/y(26);
  g1(15,55)=(y(54)-(steady_state(22)))*y(54)*y(48)*params(1)*params(21)/y(38)/y(26);
  g1(15,44)=y(33)*params(15);
  g1(16,17)=(-1);
  g1(16,25)=params(9)-T202;
  g1(16,29)=(-1);
  g1(16,35)=(-(y(25)*params(20)/2*2*(y(35)-(steady_state(21)))));
  g1(17,18)=(-1);
  g1(17,26)=1-params(9)-T211;
  g1(17,36)=(-(y(26)*params(21)/2*2*(y(36)-(steady_state(22)))));
  g1(18,24)=1;
  g1(18,25)=(-(y(30)*params(9)));
  g1(18,26)=(-(y(31)*(1-params(9))));
  g1(18,30)=(-(y(25)*params(9)));
  g1(18,31)=(-(y(26)*(1-params(9))));
  g1(19,16)=(-T229);
  g1(19,17)=1;
  g1(19,30)=(-(y(16)*y(45)*(1-params(7))*getPowerDeriv(y(30),(-params(11)),1)));
  g1(19,45)=(-(y(16)*(1-params(7))*T228));
  g1(20,16)=(-T235);
  g1(20,18)=1;
  g1(20,31)=(-(y(16)*params(7)*y(46)*getPowerDeriv(y(31),(-params(11)),1)));
  g1(20,46)=(-(y(16)*params(7)*T234));
  g1(21,5)=(-y(30))/(y(5)*y(5));
  g1(21,30)=1/y(5);
  g1(21,34)=(-((-y(35))/(y(34)*y(34))));
  g1(21,35)=(-(1/y(34)));
  g1(22,6)=(-y(31))/(y(6)*y(6));
  g1(22,31)=1/y(6);
  g1(22,34)=(-((-y(36))/(y(34)*y(34))));
  g1(22,36)=(-(1/y(34)));
  g1(23,30)=(-((1-params(7))*getPowerDeriv(y(30),1-params(11),1)));
  g1(23,31)=(-(params(7)*getPowerDeriv(y(31),1-params(11),1)));
  g1(24,15)=1;
  g1(24,52)=(-((-y(37))/(y(52)*y(52))));
  g1(24,37)=(-(1/y(52)));
  g1(25,24)=(-(y(43)*T260*T266*1/(steady_state(10))*getPowerDeriv(y(24)/(steady_state(10)),params(18),1)*T393));
  g1(25,34)=(-(y(43)*T260*T393*T270*(steady_state(23))*1/(steady_state(20))*getPowerDeriv(y(34)/(steady_state(20)),params(19),1)));
  g1(25,7)=(-(y(43)*T273*getPowerDeriv(y(7),params(17),1)));
  g1(25,37)=1;
  g1(25,43)=(-(T260*T273));
  g1(26,8)=(-(params(22)*1/y(8)));
  g1(26,40)=1/y(40);
  g1(26,58)=(-1);
  g1(27,9)=(-(params(23)*1/y(9)));
  g1(27,41)=1/y(41);
  g1(27,59)=(-1);
  g1(28,10)=(-(params(24)*1/y(10)));
  g1(28,42)=1/y(42);
  g1(28,60)=(-1);
  g1(29,11)=(-(params(25)*1/y(11)));
  g1(29,43)=1/y(43);
  g1(29,61)=(-1);
  g1(30,12)=(-(params(26)*1/y(12)));
  g1(30,44)=1/y(44);
  g1(30,62)=(-1);
  g1(31,13)=(-(params(27)*1/y(13)));
  g1(31,45)=1/y(45);
  g1(31,63)=(-1);
  g1(32,14)=(-(params(28)*1/y(14)));
  g1(32,46)=1/y(46);
  g1(32,64)=(-1);

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],32,4096);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],32,262144);
end
end
end
end
