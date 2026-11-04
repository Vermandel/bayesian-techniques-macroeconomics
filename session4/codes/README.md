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

The data step requires internet access. Subsequent estimation uses the local
`mydata.mat` file.

## Data and units

Requires Optimization Toolbox and Statistics and Machine Learning Toolbox. The two pedagogical MATLAB files currently implement the same variance example. The Gaussian prior is restricted to positive variance. MH proposals outside that support are rejected, not clipped. `Q` is a variance, including its reported posterior mean. Defaults remain 20,000 draws.

`mydb.m` deflates current-price GDP, consumption and investment using the GDP deflator, then divides by a normalized labour-force measure. This is per labour-force participant, not per total population. Hours are manufacturing weekly hours. All saved observables share the same dates.

`y` is a log deviation, matching `RBC_estim.mod`, whose innovation is `e_a/100`. Growth rates and inflation are percentage-point log changes. `fullRBC.mod` therefore uses `dy=100*(y-y(-1))`. Its technology innovation stays in log units and its shock prior is scaled accordingly. Both Dynare files retain `mh_replic=20000` and two explicitly requested MH blocks with proposal scale 1.7. In `fullRBC.mod`, only technology has a nonzero innovation variance.

The full model follows the adjustment-cost and external-habit derivations in the handout. Capital accumulation scales the investment-efficiency shock by depreciation. The investment FOC uses the same adjustment-cost coefficient on current and expected investment growth. Check convergence using the saved chains and diagnostics, not successful execution or acceptance alone.

## DBnomics interface

Use the included standard `call_dbnomics.m`, without a course-specific wrapper. Its outputs are a numeric matrix (datenum in column 1, series thereafter), a table, and numeric readable dates. The course scripts explicitly convert the matrix dates to `datetime` for plots and calendar operations. Do not interpret the third output as a `datetime`.

See the [DBnomics guide](../../docs/call_dbnomics-guide.pdf) for single and multiple series, country selection, date alignment and plotting. Data are downloaded on execution and are not bundled.

After aligning all seven series, mydb.m checks consecutive calendar quarters before any difference. An internal gap or duplicate quarter stops execution explicitly, without interpolation. fullRBC.mod defines steady-state coefficients as model-local expressions, so changes in alpha, beta, delta or gy update them during solution and estimation. Hours remain normalized to one third, with the preference weight implied by this normalization.
