# Course architecture: four three-hour sessions, each with a 15-minute break

## Session 1 — Modern business-cycle theory and data

**Prerequisites.** Undergraduate macroeconomics, logarithms, expectations, elementary time series and MATLAB basics.

**Learning objectives.** Distinguish trend, cycle and noise, explain shocks and propagation, assess filtering choices, translate a simple equilibrium into a linear rational-expectations system.

**Theory.** Business-cycle definitions, log transformations, linear trend, HP and band-pass filters, moments and comovement, expectations, local approximation around a steady state.

**Examples and activities.** Reproduce alternative GDP-cycle measures, compare endpoint behaviour, interpret volatility and correlations, solve the small `dyn_toy_model.mod` analytically and in Dynare.

**Session sequence.** 0:00–0:53 measurement, filters and MATLAB exercise. 0:53–1:30 endowment, preferences and Euler equation. 1:30–1:45 break. 1:45–2:23 equilibrium, expectations and simulation. 2:23–2:55 approximation, decision rules and IRFs. 2:55–3:15 comparison exercise, Dynare checkpoint and synthesis.

**Files.** `session1/handout1.pdf`, `session1/codes/logGDP.m`, `BSmeasures.m`, `bpass.m`, `toy_model.m`, `dyn_toy_model.mod`.

**Expected outcome.** Students can justify a data transformation, identify the model's states/controls/shocks and reproduce a first simulation.

## Session 2 — A production economy

**Prerequisites.** Session 1, constrained optimization, Euler equations.

**Learning objectives.** Derive the production economy, compute its steady state, log-linearize it, assess determinacy and interpret moments and IRFs.

**Theory.** Household problem, resource constraint and capital accumulation, productivity process, steady state, first-order approximation, Blanchard–Kahn logic, simulation moments and IRFs.

**Examples and activities.** Derive the Euler equation and steady state, map the household benchmark equations to `basicRBC.mod`, compare hand solution, basic Dynare implementation and enriched model, perturb a structural parameter and explain the IRF change.

**Session sequence.** 0:00–0:45 production economy, equilibrium and steady state. 0:45–1:30 linearization and solution coefficients. 1:30–1:45 break. 1:45–2:16 stable root, transition matrix and Dynare. 2:16–2:48 IRF exercise, moments and resource shares. 2:48–3:11 habits and government spending. 3:11–3:15 synthesis.

**Files.** `session2/handout2.pdf`, `session2/codes/RBC.mod`, `basicRBC.mod`, `compareRBC.mod`.

**Expected outcome.** Students can explain every model equation, obtain the steady state and diagnose whether an IRF is economically plausible.

## Session 3 — From the model to the likelihood

**Prerequisites.** Sessions 1–2, Gaussian distributions, matrices, basic optimization.

**Learning objectives.** Build a state-space system, distinguish states from observables, implement Kalman recursions, construct the likelihood and discuss identification.

**Theory.** Transition and measurement equations, prediction and update, innovation covariance, log likelihood, initialization, missing observations, numerical optimization, local and weak identification, measurement errors and stochastic singularity.

**Examples and activities.** Walk through `KF.m` and `KalmanLLK.m`, match `varobs` to transformed data, estimate the RBC productivity process, compare filtered states with observed output growth, run identification thought experiments.

**Session sequence.** 0:00–0:27 model and state-space mapping. 0:27–1:07 Kalman recursion and scalar exercise. 1:07–1:30 inversion and reconstruction. 1:30–1:45 break. 1:45–2:20 Gaussian likelihood, MLE and Jacobian. 2:20–3:00 data, Dynare and diagnostics. 3:00–3:15 identification, extensions and synthesis.

**Files.** `session3/handout3.pdf`, `session3/codes/KF.m`, `KalmanLLK.m`, `MLE.m`, `RBC_by_hand.m`, `RBC_estim.mod`, `mydb.m` (which generates the local `mydata.mat`).

**Expected outcome.** Students can write the measurement equation, explain each Kalman-filter object and recognize an underidentified or singular estimation design.

## Session 4 — Bayesian estimation of DSGE models

**Prerequisites.** Session 3, Bayes' rule, simulation basics.

**Learning objectives.** Translate economic information into priors, distinguish mode from posterior simulation, assess MCMC quality and communicate posterior economic results.

**Theory.** Prior families and support, posterior kernel, marginal likelihood concept, mode and Hessian, random-walk Metropolis–Hastings, burn-in, acceptance, mixing and convergence, posterior moments/IRFs, forecasts and shock decompositions.

**Examples and activities.** Read the `estimated_params` block, critique alternative priors, run a short diagnostic chain then a production chain, compare prior and posterior, connect posterior IRFs to mechanisms, scope the assessment project.

**Session sequence.** 0:00–0:36 Bayes, priors, mode and Hessian. 0:36–1:11 MH algorithm, exercise and diagnostics. 1:11–1:35 Dynare priors, chains and posterior objects. 1:35–1:50 break. 1:50–2:32 household conditions, adjustment costs and capital. 2:32–2:54 firms, aggregation, shocks and linearization. 2:54–3:15 measurement, investment exercise, habits and synthesis.

**Files.** `session4/handout4.pdf`, `session4/codes/RBC_estim.mod`, `fullRBC.mod`, `bayesianRBC.m`, `mydb.m` (which generates the local `mydata.mat`).

**Expected outcome.** Students can defend priors, diagnose a chain, interpret posterior uncertainty and specify a reproducible estimation project.

## Pedagogical decision

The historical progression remains coherent only if Sessions 1–2 are explicitly treated as the model-and-data foundation for Bayesian inference, not as standalone RBC history. Sessions 3–4 therefore use the same production economy and observables, making the likelihood the bridge between structural theory and Bayesian estimation.
