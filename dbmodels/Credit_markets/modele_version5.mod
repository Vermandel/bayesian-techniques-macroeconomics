close all;
%----------------------------------------------------------------
% 0. Housekeeping (close all graphic windows)
%----------------------------------------------------------------

%----------------------------------------------------------------
% 1. Defining variables
%----------------------------------------------------------------

var r c ci ch h w y k i l mc pi phic q phil lambda;
var ln_r ln_ci ln_ch ln_h ln_w ln_y ln_k ln_i ln_l ln_mc ln_pi ln_phic ln_q ln_phil;

var    e_a   e_g   ;

varexo eta_a eta_g eta_r;

parameters betai betah sigmac sigmal chi g mh mk delta theta alpha epsilon psi piSS tlphi rho rho_a rho_r rho_g  ;
            
%Parametres exogenes RBC Cycles
betah 	= 0.993; 	%Discount Factor
betai   = 0.985;
delta 	= 0.025;		%Depreciation rate
alpha 	= 0.3;		%Capital share
g 		= .2;   	%Public spending in GDP
sigmac 	= 1;
sigmal 	= 1; 		%Elasticity of labor
mk      = 0.8;
mh      = 1;
theta		= 4;		% adjustment cost investment i/i(-1)
rho			= 0.8;		% monetary policy smoothing
tlphi		= 1.5;		% monetary policy stance inflation
psi	    = 80;		% rotemberg adjustment cost
epsilon = 10;		% substitution parameter, monopolistic competition


rho_a	= 0.95;
rho_g	= 0.95;
rho_r   = 0.95;

%%
model;
	%ecrire les 12 equations du modele

	[name='Euler']	
	lambda(+1)/lambda*betah*r/pi(+1) = 1; %sigmac ou -sigmac ? vérifier
	lambda=ch^(-sigmac); 

	[name='Labor Supply']
	lambda*w = chi*(h^sigmal);

	[name='Capital law of motion']
	k = i*(1 - (0.5*theta*(i/i(-1) - 1)^2)) + (1-delta)*k(-1);

	[name='Technology']
	y = e_a*(k(-1)^alpha)*(h^(1-alpha));

	[name='FOC i']
	%1= q* (1-(theta/2 * (3*(i/i(-1))^2+1-4*i/i(-1))))- betai*phic(+1)/phic*q(+1)*(theta*((i(+1)/i)^2-(i(+1)/i(+1))^3));
	q = 1 + q*(theta/2)*( 1 + ( 3*i/i(-1)-4 )*i/i(-1) ) - betai*phic(+1)/phic*(1-delta)*q(+1)*theta*(i(+1)/i-1)*(i(+1)/i)^2;
	
	[name='FOC k']
	r/pi(+1)*q = phil*mk*q(+1)+(1-phil)*(mc(+1)*alpha*y(+1)/k + q(+1)*(1-delta));

	[name='FOC ci']
	phic=ci^(-sigmac);

	[name='FOC h']
	w= ((1-alpha)*mc*y/h)/(phil*mh+1);

	[name='FOC l']
	1 = phil + betai*phic(+1)/phic*r/pi(+1);
%	(1-phil)*pi(+1)/r =  + betai*phic(+1)/phic;

	[name='Borrowing constraint']
	l=mk*pi(+1)*q(+1)*k/r - mh*w*h;

	[name='balance sheet']
	mc*y+(1-mc)*y+l = ci+i+w*h+l(-1)*r(-1)/pi+psi/2*(pi-steady_state(pi))^2;


	[name='Resources Constraint']
	y=c+i+g*steady_state(y)*e_g +psi/2*(pi-steady_state(pi))^2;
	
	[name='Aggregate Consumption']
	c=ci+ch;
		
	[name='Price rigities']  
	(1-epsilon)+epsilon*mc-psi*(pi-steady_state(pi))*pi+betai*phic(+1)/phic*psi*(pi(+1)-steady_state(pi))*pi(+1)*y(+1)/y =0;

	[name='Taylor rule']  
	r-steady_state(r) = rho*(r(-1)-steady_state(r)) + (1-rho)*tlphi*(pi-steady_state(pi)) + eta_r;

	[name='shocks']
	log(e_a) = rho_a*log(e_a(-1))+eta_a;
	log(e_g) = rho_g*log(e_g(-1))+eta_g;

[name='Linearized counterpart']
	ln_y = log(y/STEADY_STATE(y));
	ln_ci = log(ci/STEADY_STATE(ci));
    ln_ch = log(ch/STEADY_STATE(ch));
	ln_k = log(k/STEADY_STATE(k));
	ln_i = log(i/STEADY_STATE(i));
	ln_h = log(h/STEADY_STATE(h));
	ln_w = log(w/STEADY_STATE(w));
	ln_r = log(r/STEADY_STATE(r));
    ln_l = log(l/STEADY_STATE(l));
    ln_mc= log(mc/STEADY_STATE(mc));
    ln_pi = log(pi/STEADY_STATE(pi));
    ln_phil = log(phil/STEADY_STATE(phil));
    ln_phic = log(phic/STEADY_STATE(phic));
    ln_q = log(q/STEADY_STATE(q));
 
end;



%%

steady_state_model;
	pi = 1.005; 
	mc  = (epsilon-1)/epsilon;
	r = pi/betah;
	phil = 1-betai/betah;
	h=1/3;
	q=1;
	k = h*(((r/pi-phil*mk)/(1-phil)-(1-delta))/(mc*alpha))^(1/(alpha-1));
	i= delta*k;
	y= k^alpha * h^(1-alpha);
	w= ((1-alpha)*mc*y/h)/(1+(phil*mh));
	l=pi*mk*q*k/r-mh*w*h;
	ci= mc*y+(1-mc)*y+(1-r/pi)*l-i-w*h;
	phic=ci^(-sigmac);
	ch= (1-g)*y-ci-i;
	lambda=ch^(-sigmac);
	chi= w/(h^sigmal * ch^sigmac);
	c=ci+ch;


	ln_r =0;
	ln_ci =0;
	ln_ch =0;
	ln_h =0;
	ln_w =0;
	ln_y =0;
	ln_k =0;
	ln_i =0;
	ln_l =0;
	ln_mc =0;
	ln_pi =0;
	ln_phil=0;
	ln_q=0;
	ln_phic=0;
	e_a = 1;
	e_g = 1;

end; 

shocks;
	var eta_a;  stderr 0.01;
	var eta_g;  stderr 0.01;
	var eta_r;  stderr 0.01;
   
   
end;

resid(1);

steady;
check;

stoch_simul(irf=60,order=1)y c i pi q l ;


