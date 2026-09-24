# Course architecture: four three-hour sessions, each with a 15-minute break

## Session 1 — Modern business-cycle theory and data

**Prerequisites.** Undergraduate macroeconomics, logarithms, expectations, elementary time series and MATLAB basics.

**Learning objectives.** Distinguish trend, cycle and noise; explain shocks and propagation; assess filtering choices; translate a simple equilibrium into a linear rational-expectations system.

**Theory.** Business-cycle definitions; log transformations; linear trend, HP and band-pass filters; moments and comovement; expectations; local approximation around a steady state.

**Examples and activities.** Reproduce alternative GDP-cycle measures; compare endpoint behaviour; interpret volatility and correlations; solve the small `dyn_toy_model.mod` analytically and in Dynare.

**Session sequence.** 0:00–0:35 motivation and measurement; 0:35–1:20 filters; 1:20–1:30 facts and propagation; 1:30–1:45 break; 1:45–2:25 expectations and propagation; 2:25–2:55 linearization; 2:55–3:15 MATLAB/Dynare manipulation and synthesis.

**Files.** `handouts/session1-modern-business-cycle-theory.pdf`; `code/session1/logGDP.m`, `BSmeasures.m`, `bpass.m`, `toy_model.m`, `dyn_toy_model.mod`.

**Expected outcome.** Students can justify a data transformation, identify the model's states/controls/shocks and reproduce a first simulation.

## Session 2 — A production economy

**Prerequisites.** Session 1; constrained optimization; Euler equations.

**Learning objectives.** Derive the production economy, compute its steady state, log-linearize it, assess determinacy and interpret moments and IRFs.

**Theory.** Household problem; resource constraint and capital accumulation; productivity process; steady state; first-order approximation; Blanchard–Kahn logic; simulation moments and IRFs.

**Examples and activities.** Derive the Euler equation and steady state; map equations to `RBC.mod`; compare hand solution, basic Dynare implementation and enriched model; perturb a structural parameter and explain the IRF change.

**Session sequence.** 0:00–0:40 economic mechanism; 0:40–1:25 equilibrium derivation; 1:25–1:30 synthesis; 1:30–1:45 break; 1:45–2:25 steady state and linearization; 2:25–2:55 Dynare syntax and checks; 2:55–3:15 IRF experiment and debrief.

**Files.** `handouts/session2-production-economy.pdf`; `code/session2/RBC.mod`, `basicRBC.mod`, `compareRBC.mod`.

**Expected outcome.** Students can explain every model equation, obtain the steady state and diagnose whether an IRF is economically plausible.

## Session 3 — From the model to the likelihood

**Prerequisites.** Sessions 1–2; Gaussian distributions; matrices; basic optimization.

**Learning objectives.** Build a state-space system, distinguish states from observables, implement Kalman recursions, construct the likelihood and discuss identification.

**Theory.** Transition and measurement equations; prediction and update; innovation covariance; log likelihood; initialization; missing observations; numerical optimization; local and weak identification; measurement errors and stochastic singularity.

**Examples and activities.** Walk through `KF.m` and `KalmanLLK.m`; match `varobs` to transformed data; estimate the RBC productivity process; compare filtered states with observed output growth; run identification thought experiments.

**Session sequence.** 0:00–0:40 state-space mapping; 0:40–1:25 Kalman prediction/update; 1:25–1:30 synthesis; 1:30–1:45 break; 1:45–2:25 likelihood and optimization; 2:25–2:55 observables and data transformations; 2:55–3:15 coding exercise and identification clinic.

**Files.** `handouts/session3-maximum-likelihood.pdf`; `code/session3/KF.m`, `KalmanLLK.m`, `MLE.m`, `RBC_by_hand.m`, `RBC_estim.mod`, `mydb.m` (which generates the local `mydata.mat`).

**Expected outcome.** Students can write the measurement equation, explain each Kalman-filter object and recognize an underidentified or singular estimation design.

## Session 4 — Bayesian estimation of DSGE models

**Prerequisites.** Session 3; Bayes' rule; simulation basics.

**Learning objectives.** Translate economic information into priors, distinguish mode from posterior simulation, assess MCMC quality and communicate posterior economic results.

**Theory.** Prior families and support; posterior kernel; marginal likelihood concept; mode and Hessian; random-walk Metropolis–Hastings; burn-in, acceptance, mixing and convergence; posterior moments/IRFs; forecasts and shock decompositions.

**Examples and activities.** Read the `estimated_params` block; critique alternative priors; run a short diagnostic chain then a production chain; compare prior and posterior; connect posterior IRFs to mechanisms; scope the assessment project.

**Session sequence.** 0:00–0:40 prior elicitation; 0:40–1:25 posterior mode; 1:25–1:30 synthesis; 1:30–1:45 break; 1:45–2:25 MCMC mechanics; 2:25–2:55 diagnostics and posterior objects; 2:55–3:15 assessment design clinic.

**Files.** `handouts/session4-bayesian-estimation.pdf`; `code/session4/RBC_estim.mod`, `fullRBC.mod`, `bayesianRBC.m`, `mydb.m` (which generates the local `mydata.mat`).

**Expected outcome.** Students can defend priors, diagnose a chain, interpret posterior uncertainty and specify a reproducible estimation project.

## Pedagogical decision

The historical progression remains coherent only if Sessions 1–2 are explicitly treated as the model-and-data foundation for Bayesian inference, not as standalone RBC history. Sessions 3–4 therefore use the same production economy and observables, making the likelihood the bridge between structural theory and Bayesian estimation.
