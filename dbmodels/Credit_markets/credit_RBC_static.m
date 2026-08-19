function [residual, g1, g2, g3] = credit_RBC_static(y, x, params)
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

residual = zeros( 19, 1);

%
% Model equations
%

T16 = (y(4)-y(4)*params(12))^(-params(5));
T37 = y(8)^params(4);
T38 = y(15)*T37;
T40 = y(5)^(1-params(4));
T70 = (y(3)-params(12)*y(3))^(-params(5));
T97 = 1+y(9)*(y(9)*3/y(9)-4)/y(9);
lhs =y(13);
rhs =y(17)*T16;
residual(1)= lhs-rhs;
lhs =y(13)*params(2)/y(13)*y(1);
rhs =1;
residual(2)= lhs-rhs;
lhs =y(13)*y(6);
rhs =params(7)*y(5)^params(6);
residual(3)= lhs-rhs;
lhs =y(7);
rhs =T38*T40;
residual(4)= lhs-rhs;
lhs =y(10);
rhs =y(8)*y(18)*params(10)*y(14)/y(1)-y(5)*y(6)*params(9);
residual(5)= lhs-rhs;
lhs =y(9)*y(19);
rhs =y(8)-y(8)*(1-params(3));
residual(6)= lhs-rhs;
lhs =y(11);
rhs =y(17)*T70;
residual(7)= lhs-rhs;
lhs =y(11)*(y(14)*(1-params(3))+y(7)*params(4)/y(8))*params(1)/y(11)+params(10)*y(18)*y(14)*y(12)/y(1);
rhs =y(14);
residual(8)= lhs-rhs;
lhs =y(14)*y(19);
rhs =1+params(11)/2*y(14)*y(19)*T97;
residual(9)= lhs-rhs;
lhs =y(6);
rhs =y(7)*(1-params(4))/(y(5)*(1+params(9)*y(12)));
residual(10)= lhs-rhs;
lhs =1-y(12);
rhs =y(1)*y(11)*params(1)/y(11);
residual(11)= lhs-rhs;
lhs =y(9)+y(3)+y(6)*y(5)+y(1)*y(10);
rhs =y(7)+y(10);
residual(12)= lhs-rhs;
lhs =y(7);
rhs =y(9)+y(2)+params(8)*(y(7))*y(16);
residual(13)= lhs-rhs;
lhs =y(2);
rhs =y(4)+y(3);
residual(14)= lhs-rhs;
lhs =log(y(15));
rhs =log(y(15))*params(13)+x(1);
residual(15)= lhs-rhs;
lhs =log(y(16));
rhs =log(y(16))*params(14)+x(2);
residual(16)= lhs-rhs;
lhs =log(y(17));
rhs =log(y(17))*params(15)+x(3);
residual(17)= lhs-rhs;
lhs =log(y(19));
rhs =log(y(19))*params(17)+x(5);
residual(18)= lhs-rhs;
lhs =log(y(18));
rhs =log(y(18))*params(16)+x(4);
residual(19)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(19, 19);

  %
  % Jacobian matrix
  %

  g1(1,4)=(-(y(17)*(1-params(12))*getPowerDeriv(y(4)-y(4)*params(12),(-params(5)),1)));
  g1(1,13)=1;
  g1(1,17)=(-T16);
  g1(2,1)=y(13)*params(2)/y(13);
  g1(3,5)=(-(params(7)*getPowerDeriv(y(5),params(6),1)));
  g1(3,6)=y(13);
  g1(3,13)=y(6);
  g1(4,5)=(-(T38*getPowerDeriv(y(5),1-params(4),1)));
  g1(4,7)=1;
  g1(4,8)=(-(T40*y(15)*getPowerDeriv(y(8),params(4),1)));
  g1(4,15)=(-(T37*T40));
  g1(5,1)=(-((-(y(8)*y(18)*params(10)*y(14)))/(y(1)*y(1))));
  g1(5,5)=y(6)*params(9);
  g1(5,6)=y(5)*params(9);
  g1(5,8)=(-(y(18)*params(10)*y(14)/y(1)));
  g1(5,10)=1;
  g1(5,14)=(-(y(8)*y(18)*params(10)/y(1)));
  g1(5,18)=(-(y(8)*params(10)*y(14)/y(1)));
  g1(6,8)=(-(1-(1-params(3))));
  g1(6,9)=y(19);
  g1(6,19)=y(9);
  g1(7,3)=(-(y(17)*(1-params(12))*getPowerDeriv(y(3)-params(12)*y(3),(-params(5)),1)));
  g1(7,11)=1;
  g1(7,17)=(-T70);
  g1(8,1)=(-(params(10)*y(18)*y(14)*y(12)))/(y(1)*y(1));
  g1(8,7)=y(11)*params(1)*params(4)/y(8)/y(11);
  g1(8,8)=y(11)*params(1)*(-(y(7)*params(4)))/(y(8)*y(8))/y(11);
  g1(8,12)=params(10)*y(18)*y(14)/y(1);
  g1(8,14)=y(11)*(1-params(3))*params(1)/y(11)+params(10)*y(18)*y(12)/y(1)-1;
  g1(8,18)=params(10)*y(14)*y(12)/y(1);
  g1(9,14)=y(19)-T97*y(19)*params(11)/2;
  g1(9,19)=y(14)-T97*y(14)*params(11)/2;
  g1(10,5)=(-((-(y(7)*(1-params(4))*(1+params(9)*y(12))))/(y(5)*(1+params(9)*y(12))*y(5)*(1+params(9)*y(12)))));
  g1(10,6)=1;
  g1(10,7)=(-((1-params(4))/(y(5)*(1+params(9)*y(12)))));
  g1(10,12)=(-((-(y(7)*(1-params(4))*y(5)*params(9)))/(y(5)*(1+params(9)*y(12))*y(5)*(1+params(9)*y(12)))));
  g1(11,1)=(-(y(11)*params(1)/y(11)));
  g1(11,12)=(-1);
  g1(12,1)=y(10);
  g1(12,3)=1;
  g1(12,5)=y(6);
  g1(12,6)=y(5);
  g1(12,7)=(-1);
  g1(12,9)=1;
  g1(12,10)=y(1)-1;
  g1(13,2)=(-1);
  g1(13,7)=1-params(8)*y(16);
  g1(13,9)=(-1);
  g1(13,16)=(-(params(8)*(y(7))));
  g1(14,2)=1;
  g1(14,3)=(-1);
  g1(14,4)=(-1);
  g1(15,15)=1/y(15)-params(13)*1/y(15);
  g1(16,16)=1/y(16)-params(14)*1/y(16);
  g1(17,17)=1/y(17)-params(15)*1/y(17);
  g1(18,19)=1/y(19)-params(17)*1/y(19);
  g1(19,18)=1/y(18)-params(16)*1/y(18);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],19,361);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],19,6859);
end
end
end
end
