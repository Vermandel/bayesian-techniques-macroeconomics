# Session 3 — Likelihood and the Kalman filter

Instructor: Gauthier Vermandel
Course: Bayesian Techniques in Macroeconomics (2026–2027)

Run MATLAB scripts individually to follow the handout progression: `LK.m`,
`MLE.m`, `RBC_by_hand.m`, `invertRBC.m`, and `kalmanRBC.m`. The helper
functions `KF.m` and `KalmanLLK.m` must remain in this directory.

For the Dynare estimation example:

```matlab
run('mydb.m')          % downloads and prepares mydata.mat
dynare RBC_estim.mod
```

The data step requires internet access. Subsequent estimation uses the local
`mydata.mat` file.

## Data and units

Requires Optimization Toolbox and Statistics and Machine Learning Toolbox. `mydb.m` saves the estimated log-linear GDP trend, log deviations `y`, and aligned dates in `mydata.mat`. Maximum likelihood uses 0 < rho_A < 0.999 and an explicit smoother variable list. The output-level plot reuses the estimated trend. Capital is an index assuming output-trend growth, not a recovered observed capital series. `LK.m` deliberately multiplies densities to illustrate numerical underflow. LK.m also prints sums of analytic Gaussian log densities to rank the same candidates reliably. MLE.m then optimizes a log likelihood.

The inversion and Kalman examples optimize log variance for numerical scaling. This enforces positive variance without unreliable stopping at very small parameter values.

## DBnomics interface

Use the included standard `call_dbnomics.m`, without a course-specific wrapper. Its outputs are a numeric matrix (datenum in column 1, series thereafter), a table, and numeric readable dates. The course scripts explicitly convert the matrix dates to `datetime` for plots and calendar operations. Do not interpret the third output as a `datetime`.

See the [DBnomics guide](../../docs/call_dbnomics-guide.pdf) for single and multiple series, country selection, date alignment and plotting. Data are downloaded on execution and are not bundled.

The Kalman example intentionally uses an uncertain first-state distribution with covariance I, fixed across candidate variances. The inversion conditions on a known initial state. These are different likelihood experiments, although their estimates can be close.
