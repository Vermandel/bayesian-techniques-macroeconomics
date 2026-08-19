function [residual, g1, g2, g3] = modele_version5_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations.
%                                          Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g3        [M_.endo_nbr by (M_.endo_nbr)^3] double   Third derivatives matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 32, 1);

%
% Model equations
%

T41 = y(8)^params(11);
T42 = y(31)*T41;
T44 = y(5)^(1-params(11));
T57 = 1+y(9)*(y(9)*3/y(9)-4)/y(9);
T124 = params(13)/2*(y(12)-(y(12)))^2;
lhs =params(2)*y(1)/y(12);
rhs =1;
residual(1)= lhs-rhs;
lhs =y(16);
rhs =y(4)^(-params(3));
residual(2)= lhs-rhs;
lhs =y(16)*y(6);
rhs =params(5)*y(5)^params(4);
residual(3)= lhs-rhs;
lhs =y(8);
rhs =y(9)+y(8)*(1-params(9));
residual(4)= lhs-rhs;
lhs =y(7);
rhs =T42*T44;
residual(5)= lhs-rhs;
lhs =y(14);
rhs =1+y(14)*params(10)/2*T57;
residual(6)= lhs-rhs;
lhs =y(14)*y(1)/y(12);
rhs =y(14)*y(15)*params(8)+(1-y(15))*(y(7)*params(11)*y(11)/y(8)+(1-params(9))*y(14));
residual(7)= lhs-rhs;
lhs =y(13);
rhs =y(3)^(-params(3));
residual(8)= lhs-rhs;
lhs =y(6);
rhs =y(7)*(1-params(11))*y(11)/y(5)/(1+y(15)*params(7));
residual(9)= lhs-rhs;
lhs =1;
rhs =y(15)+y(1)*params(1)*y(13)/y(13)/y(12);
residual(10)= lhs-rhs;
lhs =y(10);
rhs =y(8)*y(14)*y(12)*params(8)/y(1)-y(5)*y(6)*params(7);
residual(11)= lhs-rhs;
lhs =y(10)+y(7)*y(11)+y(7)*(1-y(11));
rhs =y(9)+y(3)+y(6)*y(5)+y(1)*y(10)/y(12)+T124;
residual(12)= lhs-rhs;
lhs =y(7);
rhs =T124+y(9)+y(2)+params(6)*(y(7))*y(32);
residual(13)= lhs-rhs;
lhs =y(2);
rhs =y(4)+y(3);
residual(14)= lhs-rhs;
residual(15) = 1-params(12)+y(11)*params(12)-y(12)*params(13)*(y(12)-(y(12)))+y(7)*y(12)*(y(12)-(y(12)))*params(1)*y(13)/y(13)*params(13)/y(7);
lhs =y(1)-(y(1));
rhs =(y(1)-(y(1)))*params(16)+(y(12)-(y(12)))*(1-params(16))*params(15)+x(3);
residual(16)= lhs-rhs;
lhs =log(y(31));
rhs =log(y(31))*params(17)+x(1);
residual(17)= lhs-rhs;
lhs =log(y(32));
rhs =log(y(32))*params(19)+x(2);
residual(18)= lhs-rhs;
lhs =y(22);
rhs =log(y(7)/(y(7)));
residual(19)= lhs-rhs;
lhs =y(18);
rhs =log(y(3)/(y(3)));
residual(20)= lhs-rhs;
lhs =y(19);
rhs =log(y(4)/(y(4)));
residual(21)= lhs-rhs;
lhs =y(23);
rhs =log(y(8)/(y(8)));
residual(22)= lhs-rhs;
lhs =y(24);
rhs =log(y(9)/(y(9)));
residual(23)= lhs-rhs;
lhs =y(20);
rhs =log(y(5)/(y(5)));
residual(24)= lhs-rhs;
lhs =y(21);
rhs =log(y(6)/(y(6)));
residual(25)= lhs-rhs;
lhs =y(17);
rhs =log(y(1)/(y(1)));
residual(26)= lhs-rhs;
lhs =y(25);
rhs =log(y(10)/(y(10)));
residual(27)= lhs-rhs;
lhs =y(26);
rhs =log(y(11)/(y(11)));
residual(28)= lhs-rhs;
lhs =y(27);
rhs =log(y(12)/(y(12)));
residual(29)= lhs-rhs;
lhs =y(30);
rhs =log(y(15)/(y(15)));
residual(30)= lhs-rhs;
lhs =y(28);
rhs =log(y(13)/(y(13)));
residual(31)= lhs-rhs;
lhs =y(29);
rhs =log(y(14)/(y(14)));
residual(32)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(32, 32);

  %
  % Jacobian matrix
  %

  g1(1,1)=params(2)/y(12);
  g1(1,12)=(-(params(2)*y(1)))/(y(12)*y(12));
  g1(2,4)=(-(getPowerDeriv(y(4),(-params(3)),1)));
  g1(2,16)=1;
  g1(3,5)=(-(params(5)*getPowerDeriv(y(5),params(4),1)));
  g1(3,6)=y(16);
  g1(3,16)=y(6);
  g1(4,8)=1-(1-params(9));
  g1(4,9)=(-1);
  g1(5,5)=(-(T42*getPowerDeriv(y(5),1-params(11),1)));
  g1(5,7)=1;
  g1(5,8)=(-(T44*y(31)*getPowerDeriv(y(8),params(11),1)));
  g1(5,31)=(-(T41*T44));
  g1(6,14)=1-params(10)/2*T57;
  g1(7,1)=y(14)*1/y(12);
  g1(7,7)=(-((1-y(15))*params(11)*y(11)/y(8)));
  g1(7,8)=(-((1-y(15))*(-(y(7)*params(11)*y(11)))/(y(8)*y(8))));
  g1(7,11)=(-((1-y(15))*y(7)*params(11)/y(8)));
  g1(7,12)=y(14)*(-y(1))/(y(12)*y(12));
  g1(7,14)=y(1)/y(12)-(y(15)*params(8)+(1-params(9))*(1-y(15)));
  g1(7,15)=(-(y(14)*params(8)-(y(7)*params(11)*y(11)/y(8)+(1-params(9))*y(14))));
  g1(8,3)=(-(getPowerDeriv(y(3),(-params(3)),1)));
  g1(8,13)=1;
  g1(9,5)=(-((-(y(7)*(1-params(11))*y(11)))/(y(5)*y(5))/(1+y(15)*params(7))));
  g1(9,6)=1;
  g1(9,7)=(-((1-params(11))*y(11)/y(5)/(1+y(15)*params(7))));
  g1(9,11)=(-(y(7)*(1-params(11))/y(5)/(1+y(15)*params(7))));
  g1(9,15)=(-((-(y(7)*(1-params(11))*y(11)/y(5)*params(7)))/((1+y(15)*params(7))*(1+y(15)*params(7)))));
  g1(10,1)=(-(params(1)*y(13)/y(13)/y(12)));
  g1(10,12)=(-((-(y(1)*params(1)*y(13)/y(13)))/(y(12)*y(12))));
  g1(10,15)=(-1);
  g1(11,1)=(-((-(y(8)*y(14)*y(12)*params(8)))/(y(1)*y(1))));
  g1(11,5)=y(6)*params(7);
  g1(11,6)=y(5)*params(7);
  g1(11,8)=(-(y(14)*y(12)*params(8)/y(1)));
  g1(11,10)=1;
  g1(11,12)=(-(y(8)*y(14)*params(8)/y(1)));
  g1(11,14)=(-(y(8)*y(12)*params(8)/y(1)));
  g1(12,1)=(-(y(10)/y(12)));
  g1(12,3)=(-1);
  g1(12,5)=(-y(6));
  g1(12,6)=(-y(5));
  g1(12,7)=y(11)+1-y(11);
  g1(12,9)=(-1);
  g1(12,10)=1-y(1)/y(12);
  g1(12,12)=(-((-(y(1)*y(10)))/(y(12)*y(12))));
  g1(13,2)=(-1);
  g1(13,7)=1-params(6)*y(32);
  g1(13,9)=(-1);
  g1(13,32)=(-(params(6)*(y(7))));
  g1(14,2)=1;
  g1(14,3)=(-1);
  g1(14,4)=(-1);
  g1(15,11)=params(12);
  g1(15,12)=(-(params(13)*(y(12)-(y(12)))))+y(7)*(y(12)-(y(12)))*params(1)*y(13)/y(13)*params(13)/y(7);
  g1(17,31)=1/y(31)-params(17)*1/y(31);
  g1(18,32)=1/y(32)-params(19)*1/y(32);
  g1(19,7)=(-(((y(7))-y(7))/((y(7))*(y(7)))/(y(7)/(y(7)))));
  g1(19,22)=1;
  g1(20,3)=(-(((y(3))-y(3))/((y(3))*(y(3)))/(y(3)/(y(3)))));
  g1(20,18)=1;
  g1(21,4)=(-(((y(4))-y(4))/((y(4))*(y(4)))/(y(4)/(y(4)))));
  g1(21,19)=1;
  g1(22,8)=(-(((y(8))-y(8))/((y(8))*(y(8)))/(y(8)/(y(8)))));
  g1(22,23)=1;
  g1(23,9)=(-(((y(9))-y(9))/((y(9))*(y(9)))/(y(9)/(y(9)))));
  g1(23,24)=1;
  g1(24,5)=(-(((y(5))-y(5))/((y(5))*(y(5)))/(y(5)/(y(5)))));
  g1(24,20)=1;
  g1(25,6)=(-(((y(6))-y(6))/((y(6))*(y(6)))/(y(6)/(y(6)))));
  g1(25,21)=1;
  g1(26,1)=(-(((y(1))-y(1))/((y(1))*(y(1)))/(y(1)/(y(1)))));
  g1(26,17)=1;
  g1(27,10)=(-(((y(10))-y(10))/((y(10))*(y(10)))/(y(10)/(y(10)))));
  g1(27,25)=1;
  g1(28,11)=(-(((y(11))-y(11))/((y(11))*(y(11)))/(y(11)/(y(11)))));
  g1(28,26)=1;
  g1(29,12)=(-(((y(12))-y(12))/((y(12))*(y(12)))/(y(12)/(y(12)))));
  g1(29,27)=1;
  g1(30,15)=(-(((y(15))-y(15))/((y(15))*(y(15)))/(y(15)/(y(15)))));
  g1(30,30)=1;
  g1(31,13)=(-(((y(13))-y(13))/((y(13))*(y(13)))/(y(13)/(y(13)))));
  g1(31,28)=1;
  g1(32,14)=(-(((y(14))-y(14))/((y(14))*(y(14)))/(y(14)/(y(14)))));
  g1(32,29)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],32,1024);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],32,32768);
end
end
end
end
