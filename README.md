# Bayesian Techniques in Macroeconomics — 2026

Graduate course, Université Paris-Dauphine PSL · Gauthier Vermandel · 16 hours (four sessions).

The course builds one continuous chain: economic mechanism → equilibrium conditions → state-space representation → likelihood → prior information → posterior inference and diagnostics. Students should not treat Dynare as a black box: every command is linked to a model object and an econometric quantity.

## Schedule

Four Calendar events are confirmed between 5 and 26 November 2026. The source of truth records 08:30–11:45 for each current slot, whereas the official teaching volume is four hours per session. Exact end times must therefore be confirmed before publication; no extra time is assumed here.

## Sessions

1. **Modern business-cycle theory and data** — measurement, detrending, shocks, propagation, linearization and a first Dynare model.
2. **A production economy** — equilibrium, steady state, log-linearization, solution, moments and impulse responses.
3. **From the model to the likelihood** — observables, state-space form, Kalman filter, maximum likelihood and identification.
4. **Bayesian estimation of DSGE models** — priors, posterior mode, Metropolis–Hastings, diagnostics, posterior IRFs, forecasts and shock decomposition.

Detailed learning outcomes and the four-hour teaching sequence are in [docs/course-plan.md](docs/course-plan.md).

## Software

- MATLAB (a currently supported release).
- Dynare compatible with that MATLAB release. Add Dynare's `matlab` directory to the MATLAB path once per session.
- A PDF reader and a plain-text editor.

From MATLAB, move to an example directory and run `dynare filename.mod`. Start with the simulation examples in `code/session2`, then the likelihood example in `code/session3`, and finally the Bayesian example in `code/session4`. Generated Dynare files and estimation outputs are intentionally excluded from version control.

## Data

The historical examples include the data files needed for classroom demonstrations. For the assessment, students must document the provider, exact series identifiers, retrieval date, sample, frequency, units, seasonal adjustment, transformations and any missing-value treatment. The 2026 package does not claim that the historical DBnomics MATLAB client remains supported; use the documented DBnomics API or export and preserve a raw snapshot plus a retrieval script. See [docs/data-and-reproducibility.md](docs/data-and-reproducibility.md).

## Assessment

Choose one model in `assessment/models`, add a transparent data pipeline and an estimable measurement block, then submit reproducible code and a concise report. The four starting points are unemployment, a two-country/open-economy model, mortgage markets and corporate credit. These are student starting models, not complete solutions. See [assessment/README.md](assessment/README.md).

## Reproducibility

Run all work from the project root or the relevant model folder, keep relative paths, never overwrite raw data, and include a one-command entry point. A clean clone must rebuild every reported table and figure. Record MATLAB, Dynare and operating-system versions.

## Validation status

The packaged PDFs are preserved historical builds. Static source/code checks and
real numerical runs were completed on 20 August 2026 with MATLAB R2025a Update 1
and Dynare 7.0. All four assessment models have zero static residuals, satisfy
the Dynare order and rank conditions, and complete their simulation commands.
The live DBnomics identifiers were also checked with observations returned for
all referenced series. See `validation/` for the exact environment, commands
and durable evidence.
