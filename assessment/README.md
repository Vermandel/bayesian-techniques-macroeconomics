# Assessment 2026 — Bayesian estimation project

## Objective

Choose one supplied structural model, turn it into a defensible empirical specification, estimate selected parameters with Bayesian methods, and explain what the posterior evidence says about the model's economic mechanisms.

## Deliverables

Submit one archive containing: a PDF report (maximum 12 pages excluding references/appendix); all authored `.m` and `.mod` files; retrieval/transformation scripts or a permitted immutable raw-data snapshot; `README.md`; `run_all.m`; and generated tables/figures. Do not submit Dynare-generated source files, machine-specific paths or licensed toolboxes unless explicitly required.

## Required work

1. Select one model and explain its mechanism and equilibrium equations.
2. Choose observables and document series, sample, transformations and measurement equations.
3. Verify the steady state, residuals, determinacy and baseline simulation.
4. Define estimated parameters and priors, with economic/statistical justification and valid support.
5. Report mode-finding information and MCMC settings.
6. Assess acceptance, trace/mixing and convergence; explain any remedial action.
7. Report prior/posterior comparisons, parameter uncertainty and economically relevant posterior IRFs. Add forecasts or shock decompositions only when meaningful for the specification.
8. Discuss identification, fit, limitations and sensitivity to at least one consequential modelling choice.

## Expected figures and tables

At minimum: a data/observable table; prior and posterior parameter table; prior–posterior density comparison; MCMC diagnostic figure; posterior IRFs with credible intervals; and one model-specific empirical result.

## Marking rubric (100 points)

- Economic model, derivation and mapping to code: 15
- Data choice, provenance, transformations and measurement equations: 15
- Technical validity (steady state, residuals, determinacy, estimation): 15
- Priors and identification argument: 15
- Posterior computation and MCMC diagnostics: 15
- Economic interpretation, uncertainty and robustness: 15
- Reproducibility, code quality and documentation: 10

A project that cannot be reproduced from its README and entry point cannot receive the full reproducibility marks. Fabricated tests or undocumented manual edits are serious defects.

## Starting models

The four folders contain a theory PDF and a baseline Dynare simulation model. They deliberately do **not** contain a completed estimation block or instructor solution. Each folder README identifies the empirical work students must add.
