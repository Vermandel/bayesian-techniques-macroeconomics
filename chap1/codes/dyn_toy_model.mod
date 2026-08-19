var y r;
parameters beta rho sigy sigma;
varexo e;

rho 	= .85;
sigy 	= 0.1;
sigma	= 10;
beta 	= 0.99;

model;
y = y(-1)^rho * exp(e);
%y = 1-rho + rho*y(-1) + e;
r = 1/beta*(y/y(+1))^sigma;
end;

steady_state_model;
y = 1;
r = 1/beta;
end;

shocks;
var e; stderr sigy;
end; 

stoch_simul(order=2);
