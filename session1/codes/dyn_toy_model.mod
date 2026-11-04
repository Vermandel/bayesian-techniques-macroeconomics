// Course: Bayesian Techniques in Macroeconomics (2026-2027)
// Instructor: Gauthier Vermandel
// Institution: Universite Paris-Dauphine PSL
//
// Positive lognormal endowment variant, not the additive-Gaussian log model.
// Keep curvature sigma=10, innovation SD sigy=0.1 and approximation order 2.
// The exact gross rate is beta^(-1)*y^(sigma*(rho-1))*exp(-sigma^2*sigy^2/2).
// Dynare reports a local second-order approximation, not that exact solution.
// The steady_state_model below is deterministic, not a stochastic mean.
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
// Dynare takes the conditional expectation of this Euler residual.
1 = beta*r*(y/y(+1))^sigma;
end;

steady_state_model;
y = 1;
r = 1/beta;
end;

shocks;
var e; stderr sigy;
end; 

// Evaluate diagnostics at the declared deterministic steady state.
steady;
resid;
check;
stoch_simul(order=2);
