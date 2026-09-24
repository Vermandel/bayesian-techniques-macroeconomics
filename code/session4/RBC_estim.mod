// Course: Bayesian Techniques in Macroeconomics (2026-2027)
// Instructor: Gauthier Vermandel
// Institution: Universite Paris-Dauphine PSL
//
var y c k a;
varexo e_a;
parameters rho_A beta delta alpha;

rho_A 	= 0.95;
beta 	= .99;
delta	=0.025;
alpha	=.4;

% steady states

% Model
model(linear);
	#Kss			= ((1/beta-(1-delta))/alpha)^(1/(alpha-1));
	#Css			= Kss^alpha - delta*Kss;
	[name='Budget constraint']
	k = Kss^(alpha-1)*a + (Kss^(alpha-1)*alpha + (1-delta))*k(-1) - Css/Kss*c;
	[name='Euler equation']
	c = c(+1) - beta*alpha*Kss^(alpha-1)*(a(+1) + (alpha-1)*k);
	[name='Productivity shock']
	a = rho_A*a(-1)	+	e_a/100;
	[name='Production']
	y = a + alpha*k(-1);
end;


estimated_params;
    stderr   e_a,	.7,	0,	inf,	inv_gamma_pdf,	.1,	2;
			rho_A,	.8,		0,	1,		beta_pdf,		.5,	.2;
end;

varobs y;


estimation(
	datafile=mydata,		% data file
	first_obs=1,			% sample starting date to compute likelihood
	mh_replic=20000,		% number of mcmc draws 
	mh_jscale=0.2,			% scale covariance in gaussian noise of candidate parameters
	prefilter=1,			% discard the sample mean
	bayesian_irf			% trigger the computation of bayesian irfs
	) y c k a;

/*
% uncomment to reload result
estimation(datafile=mydata,first_obs=1,mh_replic=0,mh_jscale=0.5,prefilter=1,load_mh_file,mode_file=RBC_estim_mode,mode_compute=0) y c k;
*/

