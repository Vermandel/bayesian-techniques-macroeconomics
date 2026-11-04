# Session 2 — The RBC model in Dynare

Instructor: Gauthier Vermandel
Course: Bayesian Techniques in Macroeconomics (2026–2027)

Run Dynare from this directory:

```matlab
dynare RBC.mod
dynare basicRBC.mod
dynare compareRBC.mod
```

`basicRBC.mod` and `compareRBC.mod` explicitly use first-order approximation with 30-period IRFs, after residual, steady-state and determinacy checks. `compareRBC.mod` compares the closed-form and Dynare policy rules directly. Do not use the
historical generated `compareRBC.m`; Dynare recreates its own generated files.

## Interpretation

`RBC.mod` is a reduced-form linear teaching system. Its parameter beta is not the household discount factor and its value 1.05 must not be read as one. `basicRBC.mod` is the calibrated production economy with discount factor 0.99. `compareRBC.mod` compares its closed-form policy rule with Dynare, not alternative calibrations.
