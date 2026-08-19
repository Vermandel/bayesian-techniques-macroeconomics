function [residual, g1, g2, g3] = credit_RBC_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(19, 1);
T17 = (y(15)-params(12)*y(3))^(-params(5));
T39 = y(4)^params(4);
T40 = y(26)*T39;
T42 = y(16)^(1-params(4));
T63 = params(11)/2;
T69 = 1-T63*(y(20)/y(5)-1)^2;
T81 = (y(14)-params(12)*y(2))^(-params(5));
T111 = 1+y(20)*(y(20)*3/y(5)-4)/y(5);
T115 = params(1)*y(33)/y(22);
T119 = params(11)*y(35)*T115*y(36);
T122 = 1-y(32)/y(20);
T123 = T119*T122;
T124 = (y(32)/y(20))^2;
lhs =y(24);
rhs =y(28)*T17;
residual(1)= lhs-rhs;
lhs =params(2)*y(34)/y(24)*y(12);
rhs =1;
residual(2)= lhs-rhs;
lhs =y(24)*y(17);
rhs =params(7)*y(16)^params(6);
residual(3)= lhs-rhs;
lhs =y(18);
rhs =T40*T42;
residual(4)= lhs-rhs;
lhs =y(21);
rhs =y(29)*params(10)*y(35)*y(19)/y(12)-y(16)*y(17)*params(9);
residual(5)= lhs-rhs;
lhs =y(20)*y(30)*T69;
rhs =y(19)-y(4)*(1-params(3));
residual(6)= lhs-rhs;
lhs =y(22);
rhs =y(28)*T81;
residual(7)= lhs-rhs;
lhs =(y(35)*(1-params(3))+params(4)*y(31)/y(19))*params(1)*y(33)/y(22)+params(10)*y(29)*y(35)*y(23)/y(12);
rhs =y(25);
residual(8)= lhs-rhs;
lhs =y(30)*y(25);
rhs =1+T63*y(30)*y(25)*T111+T123*T124;
residual(9)= lhs-rhs;
lhs =y(17);
rhs =y(18)*(1-params(4))/(y(16)*(1+params(9)*y(23)));
residual(10)= lhs-rhs;
lhs =1-y(23);
rhs =y(12)*T115;
residual(11)= lhs-rhs;
lhs =y(20)+y(14)+y(17)*y(16)+y(1)*y(6);
rhs =y(18)+y(21);
residual(12)= lhs-rhs;
lhs =y(18);
rhs =y(20)+y(13)+params(8)*(steady_state(7))*y(27);
residual(13)= lhs-rhs;
lhs =y(13);
rhs =y(15)+y(14);
residual(14)= lhs-rhs;
lhs =log(y(26));
rhs =params(13)*log(y(7))+x(it_, 1);
residual(15)= lhs-rhs;
lhs =log(y(27));
rhs =params(14)*log(y(8))+x(it_, 2);
residual(16)= lhs-rhs;
lhs =log(y(28));
rhs =params(15)*log(y(9))+x(it_, 3);
residual(17)= lhs-rhs;
lhs =log(y(30));
rhs =params(17)*log(y(11))+x(it_, 5);
residual(18)= lhs-rhs;
lhs =log(y(29));
rhs =params(16)*log(y(10))+x(it_, 4);
residual(19)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(19, 41);

  %
  % Jacobian matrix
  %

T205 = getPowerDeriv(y(14)-params(12)*y(2),(-params(5)),1);
T211 = getPowerDeriv(y(15)-params(12)*y(3),(-params(5)),1);
  g1(1,3)=(-(y(28)*(-params(12))*T211));
  g1(1,15)=(-(y(28)*T211));
  g1(1,24)=1;
  g1(1,28)=(-T17);
  g1(2,12)=params(2)*y(34)/y(24);
  g1(2,24)=y(12)*(-(params(2)*y(34)))/(y(24)*y(24));
  g1(2,34)=y(12)*params(2)/y(24);
  g1(3,16)=(-(params(7)*getPowerDeriv(y(16),params(6),1)));
  g1(3,17)=y(24);
  g1(3,24)=y(17);
  g1(4,16)=(-(T40*getPowerDeriv(y(16),1-params(4),1)));
  g1(4,18)=1;
  g1(4,4)=(-(T42*y(26)*getPowerDeriv(y(4),params(4),1)));
  g1(4,26)=(-(T39*T42));
  g1(5,12)=(-((-(y(29)*params(10)*y(35)*y(19)))/(y(12)*y(12))));
  g1(5,16)=y(17)*params(9);
  g1(5,17)=y(16)*params(9);
  g1(5,19)=(-(y(29)*params(10)*y(35)/y(12)));
  g1(5,21)=1;
  g1(5,35)=(-(y(29)*params(10)*y(19)/y(12)));
  g1(5,29)=(-(y(19)*params(10)*y(35)/y(12)));
  g1(6,4)=1-params(3);
  g1(6,19)=(-1);
  g1(6,5)=y(20)*y(30)*(-(T63*(-y(20))/(y(5)*y(5))*2*(y(20)/y(5)-1)));
  g1(6,20)=y(30)*T69+y(20)*y(30)*(-(T63*2*(y(20)/y(5)-1)*1/y(5)));
  g1(6,30)=y(20)*T69;
  g1(7,2)=(-(y(28)*(-params(12))*T205));
  g1(7,14)=(-(y(28)*T205));
  g1(7,22)=1;
  g1(7,28)=(-T81);
  g1(8,12)=(-(params(10)*y(29)*y(35)*y(23)))/(y(12)*y(12));
  g1(8,31)=y(33)*params(1)*params(4)/y(19)/y(22);
  g1(8,19)=y(33)*params(1)*(-(params(4)*y(31)))/(y(19)*y(19))/y(22);
  g1(8,22)=(-((y(35)*(1-params(3))+params(4)*y(31)/y(19))*params(1)*y(33)))/(y(22)*y(22));
  g1(8,33)=(y(35)*(1-params(3))+params(4)*y(31)/y(19))*params(1)/y(22);
  g1(8,23)=params(10)*y(29)*y(35)/y(12);
  g1(8,25)=(-1);
  g1(8,35)=y(33)*(1-params(3))*params(1)/y(22)+params(10)*y(29)*y(23)/y(12);
  g1(8,29)=params(10)*y(35)*y(23)/y(12);
  g1(9,5)=(-(T63*y(30)*y(25)*(y(5)*y(20)*(-(y(20)*3))/(y(5)*y(5))-y(20)*(y(20)*3/y(5)-4))/(y(5)*y(5))));
  g1(9,20)=(-(T63*y(30)*y(25)*(y(20)*3/y(5)-4+y(20)*3/y(5))/y(5)+T124*T119*(-((-y(32))/(y(20)*y(20))))+T123*(-y(32))/(y(20)*y(20))*2*y(32)/y(20)));
  g1(9,32)=(-(T124*T119*(-(1/y(20)))+T123*2*y(32)/y(20)*1/y(20)));
  g1(9,22)=(-(T124*T122*params(11)*y(35)*y(36)*(-(params(1)*y(33)))/(y(22)*y(22))));
  g1(9,33)=(-(T124*T122*params(11)*y(35)*y(36)*params(1)/y(22)));
  g1(9,25)=y(30)-T111*y(30)*T63;
  g1(9,35)=(-(T124*T122*params(11)*T115*y(36)));
  g1(9,30)=y(25)-T111*T63*y(25);
  g1(9,36)=(-(T124*T122*params(11)*y(35)*T115));
  g1(10,16)=(-((-(y(18)*(1-params(4))*(1+params(9)*y(23))))/(y(16)*(1+params(9)*y(23))*y(16)*(1+params(9)*y(23)))));
  g1(10,17)=1;
  g1(10,18)=(-((1-params(4))/(y(16)*(1+params(9)*y(23)))));
  g1(10,23)=(-((-(y(18)*(1-params(4))*y(16)*params(9)))/(y(16)*(1+params(9)*y(23))*y(16)*(1+params(9)*y(23)))));
  g1(11,12)=(-T115);
  g1(11,22)=(-(y(12)*(-(params(1)*y(33)))/(y(22)*y(22))));
  g1(11,33)=(-(y(12)*params(1)/y(22)));
  g1(11,23)=(-1);
  g1(12,1)=y(6);
  g1(12,14)=1;
  g1(12,16)=y(17);
  g1(12,17)=y(16);
  g1(12,18)=(-1);
  g1(12,20)=1;
  g1(12,6)=y(1);
  g1(12,21)=(-1);
  g1(13,13)=(-1);
  g1(13,18)=1;
  g1(13,20)=(-1);
  g1(13,27)=(-(params(8)*(steady_state(7))));
  g1(14,13)=1;
  g1(14,14)=(-1);
  g1(14,15)=(-1);
  g1(15,7)=(-(params(13)*1/y(7)));
  g1(15,26)=1/y(26);
  g1(15,37)=(-1);
  g1(16,8)=(-(params(14)*1/y(8)));
  g1(16,27)=1/y(27);
  g1(16,38)=(-1);
  g1(17,9)=(-(params(15)*1/y(9)));
  g1(17,28)=1/y(28);
  g1(17,39)=(-1);
  g1(18,11)=(-(params(17)*1/y(11)));
  g1(18,30)=1/y(30);
  g1(18,41)=(-1);
  g1(19,10)=(-(params(16)*1/y(10)));
  g1(19,29)=1/y(29);
  g1(19,40)=(-1);

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],19,1681);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],19,68921);
end
end
end
end
