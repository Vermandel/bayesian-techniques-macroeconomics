# Scientific and code review — 2026 candidate

## Corrections integrated in the 2026 copy

- Session 1 now uses one quarterly convention: periods of 6--32 quarters are business-cycle fluctuations and components longer than 32 quarters are trend. The historical sources remain unchanged.
- Unemployment now implements the Nash condition with both firm and worker surpluses; the omission of `v_H` is not the baseline.
- Open economy now uses `Wss_F` in `chi_F`, is declared linear, and removes price/rate AR(1) innovations that had no structural equation in the reduced real model.
- Mortgage now weights aggregate log deviations by steady-state levels; its `q(+1)+h_I` timing is retained because it matches the handout's `R_t b_t=m_t E_t(q_{t+1})H_t^I`; unused `kappa` is removed.
- Credit market no longer assigns undeclared `pi` and `r` or unused `rho_r`; `check;` is active.
- Use one timing convention throughout: capital chosen at `t` and productive at `t+1`, or capital inherited at `t-1` and productive at `t`. Handouts and `.mod` files must map exactly.
- Each estimation example needs an explicit table mapping raw series → transformation → Dynare observable → measurement equation.
- Distinguish structural shock standard deviations from measurement-error standard deviations and check stochastic singularity.
- Priors must state support and parameterization; posterior reporting must include acceptance, trace/mixing, convergence evidence and sensitivity.

## Remaining numerical gate

- MATLAB, Octave, `dynare`, and `dynare_m` are absent from PATH in the permitted environment. The four corrected models therefore remain `BLOCKED_DEPENDENCY`, not execution-validated.

> Continuation note (2026-08-20): this dependency statement records the first
> restricted probe and is superseded by checkpoint 10. MATLAB R2025a was later
> launched through its absolute Windows path and Dynare 7.0 executed all four
> models successfully; see `execution-status.md` and the durable external logs.
- The read restriction prevented searching Windows installation directories outside the historical course folder and prevented live DBnomics endpoint checks.
- Historical Bayesian RBC example uses only one observable (`dy`) and estimates only `rho_a` and `stderr eta_a`; this is pedagogically useful but insufficient as a template for the richer assessment models.

## Status language

The four toy models are corrected student baselines, not execution-proven estimation projects. A future numerical gate must run each `run_all.m` with a pinned Dynare/MATLAB pair and preserve logs before publication claims are upgraded.
