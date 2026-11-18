// Course: Bayesian Techniques in Macroeconomics (2026-2027)
// Instructor: Gauthier Vermandel
// Institution: Universite Paris-Dauphine PSL
//
%%% 
%%% New Classical Growth Model
%%% gauthier@vermandel.fr
%%% DSGE course @dauphine
%%% 

var k a c;
parameters  alpha beta delta rho_A Css Kss;
varexo e_a;

% Calibration
alpha		= 0.40;				% capital share in production 
beta    	= 0.99;				% discount factor
delta    	= 0.025;			% depreciation rate
rho_A		= 0.85;				% shock autocorrelation

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
end;

% shock calibration
shocks;
	var e_a;  stderr .007;
end;

% Check the zero-deviation steady state and local determinacy.
resid;
steady;
check;

% perform stochastic simulations
stoch_simul(order=1,irf=30,nograph) c k a;

% model in dynare reads as
% y(t) = P*x(t-1) + Q*e(t)
% y : all variables
% k : state variables
Pdynare = oo_.dr.ghx;
Qdynare = oo_.dr.ghu;


%%% Compare RBCs with Dynare
%% extract parameters
k1 = Kss^(alpha-1);
k2 = Kss^(alpha-1)*alpha+(1-delta);
k3 = Css/Kss;
c1 = beta*alpha*Kss^(alpha-1);
c2 = beta*alpha*Kss^(alpha-1)*(alpha-1);
%% Get closed-form solution of the form:
% x(t) = P*x(t-1) + Q*e(t)
% 1) Compute matrix P:
% find roots of the equation - roots([A*x^2 B*x C])
Pcs = roots([-k3 (-1+k3*c2+k2) -k2*c2]);
% pick the stable one
stable = abs(imag(Pcs)) < 1e-10 & abs(k2-k3*real(Pcs)) < 1;
assert(nnz(stable)==1, 'Expected exactly one stable capital-transition root.');
Pc = real(Pcs(stable));
Pk = k2 - k3*Pc;
% 2) Compute matrix Q:
Qc = ((Pc-c2)*k1-c1*rho_A)/((Pc-c2)*k3+1-rho_A);
Qk = k1-k3*Qc;

% build model's matrices
% x = [ k, a, c]'
P = [ 	Pk,	Qk*rho_A,	0;
		0,	rho_A,		0;
		Pc,	Qc*rho_A,	0];
Q = [ Qk;	1;	Qc];

%% Simulate an IRF
x_ = zeros(M_.endo_nbr,options_.irf+1);
e_ = zeros(M_.exo_nbr,options_.irf+1);
% initial x(0) = 0 : model is at steady state
% shock in t=2;
e_(:,2) = chol(M_.Sigma_e);
for t = 2:(options_.irf+1)
	x_(:,t) = P*x_(:,t-1)+Q*e_(t);
end

% Plot both solutions in percentage deviations from the steady state.
% The zero on the horizontal axis is the date of the productivity shock.
horizon = 0:options_.irf-1;
figure('Color','w','Units','centimeters','Position',[2 2 25 9]);
subplot(1,3,1);
	plot(horizon,100*x_(1,2:end),'Color',[0 0.32 0.55],'LineWidth',1.8);
	hold on;
	plot(horizon,100*oo_.irfs.k_e_a,'o','Color',[0.78 0.32 0.12], ...
		'MarkerSize',4,'MarkerIndices',1:3:options_.irf,'LineWidth',1);
	yline(0,':','Color',[0.6 0.6 0.6]);
	title('Capital');
	ylabel('Deviation from steady state (%)');
	xlabel('Periods after the shock');
	grid on;
	box off;
	set(gca,'FontName','Arial','FontSize',10,'GridAlpha',0.12);
	xlim([0 options_.irf-1]);
subplot(1,3,2);
	plot(horizon,100*x_(2,2:end),'Color',[0 0.32 0.55],'LineWidth',1.8);
	hold on;
	plot(horizon,100*oo_.irfs.a_e_a,'o','Color',[0.78 0.32 0.12], ...
		'MarkerSize',4,'MarkerIndices',1:3:options_.irf,'LineWidth',1);
	yline(0,':','Color',[0.6 0.6 0.6]);
	title('Productivity');
	xlabel('Periods after the shock');
	grid on;
	box off;
	set(gca,'FontName','Arial','FontSize',10,'GridAlpha',0.12);
	xlim([0 options_.irf-1]);
subplot(1,3,3);
	plot(horizon,100*x_(3,2:end),'Color',[0 0.32 0.55],'LineWidth',1.8);
	hold on;
	plot(horizon,100*oo_.irfs.c_e_a,'o','Color',[0.78 0.32 0.12], ...
		'MarkerSize',4,'MarkerIndices',1:3:options_.irf,'LineWidth',1);
	yline(0,':','Color',[0.6 0.6 0.6]);
	title('Consumption');
	xlabel('Periods after the shock');
	grid on;
	box off;
	set(gca,'FontName','Arial','FontSize',10,'GridAlpha',0.12);
	xlim([0 options_.irf-1]);
	legend('Analytical solution','Dynare','Orientation','horizontal', ...
		'Position',[0.33 0.01 0.4 0.055],'Box','off');

% Reserve a shared bottom strip for the legend, outside all three panels.
axes_list = findall(gcf,'Type','axes');
for panel = 1:numel(axes_list)
	position = axes_list(panel).Position;
	position(2) = position(2)+0.10;
	position(4) = position(4)-0.10;
	axes_list(panel).Position = position;
end

% Export the actual comparison used in the handout.
exportgraphics(gcf,'compareRBC_figure.pdf','ContentType','vector');
exportgraphics(gcf,'compareRBC_figure.png','Resolution',180);

% Record numerical agreement, in log-deviation units.
irf_error = max(abs(x_(:,2:end)- ...
	[oo_.irfs.k_e_a; oo_.irfs.a_e_a; oo_.irfs.c_e_a]),[],'all');
disp(['Maximum analytical/Dynare IRF discrepancy: ' num2str(irf_error,16)]);
assert(irf_error < 1e-10,'Analytical and Dynare solutions disagree.');
save('compareRBC_validation.mat','irf_error','x_','P','Q','horizon');
