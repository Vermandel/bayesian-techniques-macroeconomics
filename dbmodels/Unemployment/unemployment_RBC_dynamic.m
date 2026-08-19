function [residual, g1, g2, g3] = unemployment_RBC_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(18, 1);
T13 = y(10)^(-params(4));
T19 = params(1)*y(29)/y(17);
T51 = y(2)^params(3);
T52 = y(22)*T51;
T54 = y(11)^(1-params(3));
T61 = params(15)/2;
T67 = 1-T61*(y(16)/y(3)-1)^2;
T95 = 1+y(16)*(y(16)*3/y(3)-4)/y(3);
T104 = 1-y(28)/y(16);
T105 = params(15)*y(30)*T19*y(33)*T104;
T106 = (y(28)/y(16))^2;
T143 = params(11)/(1+params(8))*y(19)^(1+params(8));
lhs =y(17);
rhs =y(24)*T13;
residual(1)= lhs-rhs;
lhs =T19*y(9);
rhs =1;
residual(2)= lhs-rhs;
lhs =y(20);
rhs =y(13)-params(10)-params(7)/y(17)+params(1)*(1-params(6))*y(31);
residual(3)= lhs-rhs;
lhs =y(11);
rhs =(1-params(6))*y(1)+y(19)*y(12);
residual(4)= lhs-rhs;
lhs =y(12);
rhs =1-y(11);
residual(5)= lhs-rhs;
lhs =y(14);
rhs =T52*T54;
residual(6)= lhs-rhs;
lhs =y(16)*y(26)*T67;
rhs =y(15)-y(2)*(1-params(2));
residual(7)= lhs-rhs;
lhs =(1-params(2))*y(30)+params(3)*params(27)*y(27)/y(15);
rhs =y(9)*y(18);
residual(8)= lhs-rhs;
lhs =y(26)*y(18);
rhs =1+T61*y(26)*y(18)*T95+T105*T106;
residual(9)= lhs-rhs;
lhs =y(21);
rhs =y(14)*(1-params(3))*params(27)/y(11)-y(13)+T19*(1-params(6))*y(32);
residual(10)= lhs-rhs;
lhs =params(11)*y(19)^params(8);
rhs =y(21);
residual(11)= lhs-rhs;
lhs =y(20)*(1-y(25)*params(12));
rhs =y(21)*y(25)*params(12);
residual(12)= lhs-rhs;
lhs =y(14);
rhs =y(10)+y(16)+params(9)*(steady_state(6))*y(23)+y(12)*T143;
residual(13)= lhs-rhs;
lhs =log(y(22));
rhs =params(20)*log(y(4))+x(it_, 1);
residual(14)= lhs-rhs;
lhs =log(y(23));
rhs =params(21)*log(y(5))+x(it_, 2);
residual(15)= lhs-rhs;
lhs =log(y(24));
rhs =params(22)*log(y(6))+x(it_, 3);
residual(16)= lhs-rhs;
lhs =log(y(26));
rhs =params(24)*log(y(8))+x(it_, 5);
residual(17)= lhs-rhs;
lhs =log(y(25));
rhs =params(23)*log(y(7))+x(it_, 4);
residual(18)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(18, 38);

  %
  % Jacobian matrix
  %

T262 = (-(params(1)*y(29)))/(y(17)*y(17));
  g1(1,10)=(-(y(24)*getPowerDeriv(y(10),(-params(4)),1)));
  g1(1,17)=1;
  g1(1,24)=(-T13);
  g1(2,9)=T19;
  g1(2,17)=y(9)*T262;
  g1(2,29)=y(9)*params(1)/y(17);
  g1(3,13)=(-1);
  g1(3,17)=(-params(7))/(y(17)*y(17));
  g1(3,20)=1;
  g1(3,31)=(-(params(1)*(1-params(6))));
  g1(4,1)=(-(1-params(6)));
  g1(4,11)=1;
  g1(4,12)=(-y(19));
  g1(4,19)=(-y(12));
  g1(5,11)=1;
  g1(5,12)=1;
  g1(6,11)=(-(T52*getPowerDeriv(y(11),1-params(3),1)));
  g1(6,14)=1;
  g1(6,2)=(-(T54*y(22)*getPowerDeriv(y(2),params(3),1)));
  g1(6,22)=(-(T51*T54));
  g1(7,2)=1-params(2);
  g1(7,15)=(-1);
  g1(7,3)=y(16)*y(26)*(-(T61*(-y(16))/(y(3)*y(3))*2*(y(16)/y(3)-1)));
  g1(7,16)=y(26)*T67+y(16)*y(26)*(-(T61*2*(y(16)/y(3)-1)*1/y(3)));
  g1(7,26)=y(16)*T67;
  g1(8,9)=(-y(18));
  g1(8,27)=params(3)*params(27)/y(15);
  g1(8,15)=(-(params(3)*params(27)*y(27)))/(y(15)*y(15));
  g1(8,18)=(-y(9));
  g1(8,30)=1-params(2);
  g1(9,3)=(-(T61*y(26)*y(18)*(y(3)*y(16)*(-(y(16)*3))/(y(3)*y(3))-y(16)*(y(16)*3/y(3)-4))/(y(3)*y(3))));
  g1(9,16)=(-(T61*y(26)*y(18)*(y(16)*3/y(3)-4+y(16)*3/y(3))/y(3)+T106*params(15)*y(30)*T19*y(33)*(-((-y(28))/(y(16)*y(16))))+T105*(-y(28))/(y(16)*y(16))*2*y(28)/y(16)));
  g1(9,28)=(-(T106*params(15)*y(30)*T19*y(33)*(-(1/y(16)))+T105*2*y(28)/y(16)*1/y(16)));
  g1(9,17)=(-(T106*T104*params(15)*y(30)*y(33)*T262));
  g1(9,29)=(-(T106*T104*params(15)*y(30)*y(33)*params(1)/y(17)));
  g1(9,18)=y(26)-T95*y(26)*T61;
  g1(9,30)=(-(T106*T104*params(15)*T19*y(33)));
  g1(9,26)=y(18)-T95*T61*y(18);
  g1(9,33)=(-(T106*T104*params(15)*T19*y(30)));
  g1(10,11)=(-((-(y(14)*(1-params(3))*params(27)))/(y(11)*y(11))));
  g1(10,13)=1;
  g1(10,14)=(-((1-params(3))*params(27)/y(11)));
  g1(10,17)=(-(y(32)*(1-params(6))*T262));
  g1(10,29)=(-(y(32)*(1-params(6))*params(1)/y(17)));
  g1(10,21)=1;
  g1(10,32)=(-(T19*(1-params(6))));
  g1(11,19)=params(11)*getPowerDeriv(y(19),params(8),1);
  g1(11,21)=(-1);
  g1(12,20)=1-y(25)*params(12);
  g1(12,21)=(-(y(25)*params(12)));
  g1(12,25)=y(20)*(-params(12))-y(21)*params(12);
  g1(13,10)=(-1);
  g1(13,12)=(-T143);
  g1(13,14)=1;
  g1(13,16)=(-1);
  g1(13,19)=(-(y(12)*params(11)/(1+params(8))*getPowerDeriv(y(19),1+params(8),1)));
  g1(13,23)=(-(params(9)*(steady_state(6))));
  g1(14,4)=(-(params(20)*1/y(4)));
  g1(14,22)=1/y(22);
  g1(14,34)=(-1);
  g1(15,5)=(-(params(21)*1/y(5)));
  g1(15,23)=1/y(23);
  g1(15,35)=(-1);
  g1(16,6)=(-(params(22)*1/y(6)));
  g1(16,24)=1/y(24);
  g1(16,36)=(-1);
  g1(17,8)=(-(params(24)*1/y(8)));
  g1(17,26)=1/y(26);
  g1(17,38)=(-1);
  g1(18,7)=(-(params(23)*1/y(7)));
  g1(18,25)=1/y(25);
  g1(18,37)=(-1);

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],18,1444);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],18,54872);
end
end
end
end
