function [residual, g1, g2, g3] = unemployment_RBC_static(y, x, params)
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

residual = zeros( 18, 1);

%
% Model equations
%

T13 = y(2)^(-params(4));
T48 = y(7)^params(3);
T49 = y(14)*T48;
T51 = y(3)^(1-params(3));
T82 = 1+y(8)*(y(8)*3/y(8)-4)/y(8);
T120 = params(11)/(1+params(8))*y(11)^(1+params(8));
lhs =y(9);
rhs =y(16)*T13;
residual(1)= lhs-rhs;
lhs =y(9)*params(1)/y(9)*y(1);
rhs =1;
residual(2)= lhs-rhs;
lhs =y(12);
rhs =y(5)-params(10)-params(7)/y(9)+y(12)*params(1)*(1-params(6));
residual(3)= lhs-rhs;
lhs =y(3);
rhs =(1-params(6))*y(3)+y(11)*y(4);
residual(4)= lhs-rhs;
lhs =y(4);
rhs =1-y(3);
residual(5)= lhs-rhs;
lhs =y(6);
rhs =T49*T51;
residual(6)= lhs-rhs;
lhs =y(8)*y(18);
rhs =y(7)-y(7)*(1-params(2));
residual(7)= lhs-rhs;
lhs =(1-params(2))*y(10)+y(6)*params(3)*params(27)/y(7);
rhs =y(1)*y(10);
residual(8)= lhs-rhs;
lhs =y(18)*y(10);
rhs =1+params(15)/2*y(18)*y(10)*T82;
residual(9)= lhs-rhs;
lhs =y(13);
rhs =y(6)*(1-params(3))*params(27)/y(3)-y(5)+y(13)*y(9)*params(1)/y(9)*(1-params(6));
residual(10)= lhs-rhs;
lhs =params(11)*y(11)^params(8);
rhs =y(13);
residual(11)= lhs-rhs;
lhs =y(12)*(1-y(17)*params(12));
rhs =y(13)*y(17)*params(12);
residual(12)= lhs-rhs;
lhs =y(6);
rhs =y(2)+y(8)+params(9)*(y(6))*y(15)+y(4)*T120;
residual(13)= lhs-rhs;
lhs =log(y(14));
rhs =log(y(14))*params(20)+x(1);
residual(14)= lhs-rhs;
lhs =log(y(15));
rhs =log(y(15))*params(21)+x(2);
residual(15)= lhs-rhs;
lhs =log(y(16));
rhs =log(y(16))*params(22)+x(3);
residual(16)= lhs-rhs;
lhs =log(y(18));
rhs =log(y(18))*params(24)+x(5);
residual(17)= lhs-rhs;
lhs =log(y(17));
rhs =log(y(17))*params(23)+x(4);
residual(18)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(18, 18);

  %
  % Jacobian matrix
  %

  g1(1,2)=(-(y(16)*getPowerDeriv(y(2),(-params(4)),1)));
  g1(1,9)=1;
  g1(1,16)=(-T13);
  g1(2,1)=y(9)*params(1)/y(9);
  g1(3,5)=(-1);
  g1(3,9)=(-params(7))/(y(9)*y(9));
  g1(3,12)=1-params(1)*(1-params(6));
  g1(4,3)=1-(1-params(6));
  g1(4,4)=(-y(11));
  g1(4,11)=(-y(4));
  g1(5,3)=1;
  g1(5,4)=1;
  g1(6,3)=(-(T49*getPowerDeriv(y(3),1-params(3),1)));
  g1(6,6)=1;
  g1(6,7)=(-(T51*y(14)*getPowerDeriv(y(7),params(3),1)));
  g1(6,14)=(-(T48*T51));
  g1(7,7)=(-(1-(1-params(2))));
  g1(7,8)=y(18);
  g1(7,18)=y(8);
  g1(8,1)=(-y(10));
  g1(8,6)=params(3)*params(27)/y(7);
  g1(8,7)=(-(y(6)*params(3)*params(27)))/(y(7)*y(7));
  g1(8,10)=1-params(2)-y(1);
  g1(9,10)=y(18)-T82*y(18)*params(15)/2;
  g1(9,18)=y(10)-T82*params(15)/2*y(10);
  g1(10,3)=(-((-(y(6)*(1-params(3))*params(27)))/(y(3)*y(3))));
  g1(10,5)=1;
  g1(10,6)=(-((1-params(3))*params(27)/y(3)));
  g1(10,13)=1-y(9)*params(1)/y(9)*(1-params(6));
  g1(11,11)=params(11)*getPowerDeriv(y(11),params(8),1);
  g1(11,13)=(-1);
  g1(12,12)=1-y(17)*params(12);
  g1(12,13)=(-(y(17)*params(12)));
  g1(12,17)=y(12)*(-params(12))-y(13)*params(12);
  g1(13,2)=(-1);
  g1(13,4)=(-T120);
  g1(13,6)=1-params(9)*y(15);
  g1(13,8)=(-1);
  g1(13,11)=(-(y(4)*params(11)/(1+params(8))*getPowerDeriv(y(11),1+params(8),1)));
  g1(13,15)=(-(params(9)*(y(6))));
  g1(14,14)=1/y(14)-params(20)*1/y(14);
  g1(15,15)=1/y(15)-params(21)*1/y(15);
  g1(16,16)=1/y(16)-params(22)*1/y(16);
  g1(17,18)=1/y(18)-params(24)*1/y(18);
  g1(18,17)=1/y(17)-params(23)*1/y(17);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],18,324);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],18,5832);
end
end
end
end
