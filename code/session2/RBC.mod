var c k a;
varexo e;
parameters rho beta delta chi;

rho = 0.95;
beta = 1.05;
delta=0.025;
chi	= 0.005;

model(linear);
	- (1-delta)*c - k + a + k(-1) + (1-delta)*k(-1);
	- c + c(+1) - beta*rho*a + chi*c;
	- a + rho*a(-1) + e;
end;

shocks;
	var e; stderr .01;
end;

check;
stoch_simul(order=1);

ck = 1-delta;
Sk = (1-chi);
Sc = (1+ck-Sk)/ck;
Tk = (rho-(1-chi)-ck*rho*beta)/(rho-(1-chi)-ck*Sc);
Tc = (1-Tk)/ck;