# Scientific and code review — 2026 candidate

## Cross-course corrections required

- The historical Session 1 text says frequencies shorter than 32 **years** are trend; standard quarterly business-cycle conventions concern periods of roughly 6–32 **quarters**, and components longer than the upper cutoff are trend. This is a substantive correction for the next source revision.
- Use one timing convention throughout: capital chosen at `t` and productive at `t+1`, or capital inherited at `t-1` and productive at `t`. Handouts and `.mod` files must map exactly.
- Each estimation example needs an explicit table mapping raw series → transformation → Dynare observable → measurement equation.
- Distinguish structural shock standard deviations from measurement-error standard deviations and check stochastic singularity.
- Priors must state support and parameterization; posterior reporting must include acceptance, trace/mixing, convergence evidence and sensitivity.

## Static findings in supplied models

- Unemployment: an unresolved alternative wage equation; confirm whether household surplus `v_H` belongs in bargaining.
- Open economy: likely typo `chi_F = LBss_F*Wss_H/...`; inactive price/rate shock states; nonlinear-model declaration around apparently linearized equations.
- Mortgage: scaling inconsistency in aggregate resources; collateral timing requires reconciliation; unused `kappa`.
- Credit market: undeclared `rho_r`, `pi` and `r`; disabled `check`; no estimation block. It cannot be presented as execution-validated.
- Historical Bayesian RBC example uses only one observable (`dy`) and estimates only `rho_a` and `stderr eta_a`; this is pedagogically useful but insufficient as a template for the richer assessment models.

## Status language

The four toy models are **starting points reviewed statically**, not clean, execution-proven estimation projects. Their README files expose the model-specific work instead of hiding it. A future numerical gate must run `dynare` with a pinned Dynare/MATLAB pair and preserve logs before publication claims are upgraded.
