# Course architecture: four sessions of four hours

## Session 1 — Modern business-cycle theory and data

**Prerequisites.** Undergraduate macroeconomics, logarithms, expectations, elementary time series and MATLAB basics.

**Learning objectives.** Distinguish trend, cycle and noise; explain shocks and propagation; assess filtering choices; translate a simple equilibrium into a linear rational-expectations system.

**Theory.** Business-cycle definitions; log transformations; linear trend, HP and band-pass filters; moments and comovement; expectations; local approximation around a steady state.

**Examples and activities.** Reproduce alternative GDP-cycle measures; compare endpoint behaviour; interpret volatility and correlations; solve the small `dyn_toy_model.mod` analytically and in Dynare.

**Four-hour sequence.** 0:00–0:40 motivation and measurement; 0:40–1:30 filters; 1:30–1:40 break; 1:40–2:25 facts and propagation; 2:25–3:10 linearization; 3:10–3:20 break; 3:20–4:00 MATLAB/Dynare manipulation and synthesis.

**Files.** `handouts/session1-modern-business-cycle-theory.pdf`; `code/session1/logGDP.m`, `BSmeasures.m`, `bpass.m`, `toy_model.m`, `dyn_toy_model.mod`.

**Expected outcome.** Students can justify a data transformation, identify the model's states/controls/shocks and reproduce a first simulation.

## Session 2 — A production economy

**Prerequisites.** Session 1; constrained optimization; Euler equations.

**Learning objectives.** Derive the production economy, compute its steady state, log-linearize it, assess determinacy and interpret moments and IRFs.

**Theory.** Household problem; resource constraint and capital accumulation; productivity process; steady state; first-order approximation; Blanchard–Kahn logic; simulation moments and IRFs.

**Examples and activities.** Derive the Euler equation and steady state; map equations to `RBC.mod`; compare hand solution, basic Dynare implementation and enriched model; perturb a structural parameter and explain the IRF change.

**Four-hour sequence.** 0:00–0:50 economic mechanism; 0:50–1:35 equilibrium derivation; 1:35–1:45 break; 1:45–2:30 steady state and linearization; 2:30–3:10 Dynare syntax and checks; 3:10–3:20 break; 3:20–4:00 IRF experiment and debrief.

**Files.** `handouts/session2-production-economy.pdf`; `code/session2/RBC.mod`, `basicRBC.mod`, `compareRBC.mod`, `compareRBC.m`.

**Expected outcome.** Students can explain every model equation, obtain the steady state and diagnose whether an IRF is economically plausible.

## Session 3 — From the model to the likelihood

**Prerequisites.** Sessions 1–2; Gaussian distributions; matrices; basic optimization.

**Learning objectives.** Build a state-space system, distinguish states from observables, implement Kalman recursions, construct the likelihood and discuss identification.

**Theory.** Transition and measurement equations; prediction and update; innovation covariance; log likelihood; initialization; missing observations; numerical optimization; local and weak identification; measurement errors and stochastic singularity.

**Examples and activities.** Walk through `KF.m` and `KalmanLLK.m`; match `varobs` to transformed data; estimate the RBC productivity process; compare filtered states with observed output growth; run identification thought experiments.

**Four-hour sequence.** 0:00–0:45 state-space mapping; 0:45–1:30 Kalman prediction/update; 1:30–1:40 break; 1:40–2:30 likelihood and optimization; 2:30–3:10 observables and data transformations; 3:10–3:20 break; 3:20–4:00 coding exercise and identification clinic.

**Files.** `handouts/session3-maximum-likelihood.pdf`; `code/session3/KF.m`, `KalmanLLK.m`, `MLE.m`, `RBC_by_hand.m`, `RBC_estim.mod`, `mydata.mat`.

**Expected outcome.** Students can write the measurement equation, explain each Kalman-filter object and recognize an underidentified or singular estimation design.

## Session 4 — Bayesian estimation of DSGE models

**Prerequisites.** Session 3; Bayes' rule; simulation basics.

**Learning objectives.** Translate economic information into priors, distinguish mode from posterior simulation, assess MCMC quality and communicate posterior economic results.

**Theory.** Prior families and support; posterior kernel; marginal likelihood concept; mode and Hessian; random-walk Metropolis–Hastings; burn-in, acceptance, mixing and convergence; posterior moments/IRFs; forecasts and shock decompositions.

**Examples and activities.** Read the `estimated_params` block; critique alternative priors; run a short diagnostic chain then a production chain; compare prior and posterior; connect posterior IRFs to mechanisms; scope the assessment project.

**Four-hour sequence.** 0:00–0:45 prior elicitation; 0:45–1:30 posterior mode; 1:30–1:40 break; 1:40–2:30 MCMC mechanics; 2:30–3:10 diagnostics and posterior objects; 3:10–3:20 break; 3:20–4:00 assessment design clinic.

**Files.** `handouts/session4-bayesian-estimation.pdf`; `code/session4/RBC_estim.mod`, `fullRBC.mod`, `bayesianRBC.m`, `mydata.mat`, `myobs.mat`.

**Expected outcome.** Students can defend priors, diagnose a chain, interpret posterior uncertainty and specify a reproducible estimation project.

## Pedagogical decision

The historical progression remains coherent only if Sessions 1–2 are explicitly treated as the model-and-data foundation for Bayesian inference, not as standalone RBC history. Sessions 3–4 therefore use the same production economy and observables, making the likelihood the bridge between structural theory and Bayesian estimation.
