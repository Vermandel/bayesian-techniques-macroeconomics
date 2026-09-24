# Session 4 — Bayesian estimation

Instructor: Gauthier Vermandel
Course: Bayesian Techniques in Macroeconomics (2026–2027)

Run the pedagogical MATLAB examples with `invertRBC.m` and `bayesianRBC.m`.
Both default to 20,000 Metropolis–Hastings draws. A shorter smoke test can be
requested by setting `BTM_MCMC_DRAWS` before running the script.

For the Dynare estimations:

```matlab
run('mydb.m')
dynare RBC_estim.mod
dynare fullRBC.mod
```

The data step requires internet access; subsequent estimation uses the local
`mydata.mat` file.
