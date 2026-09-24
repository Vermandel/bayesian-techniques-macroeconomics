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

The data step requires internet access; subsequent estimation uses the local
`mydata.mat` file.
