// Course: Bayesian Techniques in Macroeconomics (2026-2027)
// Instructor: Gauthier Vermandel
// Institution: Universite Paris-Dauphine PSL
//
var y c k a;
varexo e_a;
parameters rho_A beta delta alpha Kss Css;

rho_A 	= 0.95;
beta 	= .99;
delta	=0.025;
alpha	=.4;

% steady states
Kss			= ((1/beta-(1-delta))/alpha)^(1/(alpha-1));
Css			= Kss^alpha - delta*Kss;

% Model
model(linear);
	[name='Budget constraint']
	k = Kss^(alpha-1)*a + (Kss^(alpha-1)*alpha + (1-delta))*k(-1) - Css/Kss*c;
	[name='Euler equation']
	c = c(+1) - beta*alpha*Kss^(alpha-1)*(a(+1) + (alpha-1)*k);
	[name='Productivity shock']
	a = rho_A*a(-1)+e_a;
	[name='Production']
	y = a + alpha*k(-1);
end;


estimated_params;
    stderr   e_a,.007,,   inf;
    rho_A,.95,,;
end;

varobs y;

estimation(datafile=mydata);

load mydata;
figure
subplot(3,1,1);
plot(T,oo_.SmoothedVariables.y)
title('Output')
subplot(3,1,2);
plot(T,oo_.SmoothedVariables.k)
title('Capital')
subplot(3,1,3);
plot(T,oo_.SmoothedVariables.a)
title('Productivity')


% REVERSING
trend_index = (0:numel(T)-1)';
figure;
subplot(2,1,1);
plot(T,exp(.005*trend_index+oo_.SmoothedVariables.y))
title('Output')
subplot(2,1,2);
plot(T,exp(.005*trend_index+oo_.SmoothedVariables.k))
title('Capital')
