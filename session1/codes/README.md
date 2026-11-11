# Session 1 — Time series and uncertainty

Instructor: Gauthier Vermandel
Course: Bayesian Techniques in Macroeconomics (2026–2027)

Run MATLAB from this codes directory. The required helpers are included here.

1. `logGDP.m` downloads US real GDP from DBnomics and studies log growth.
2. `BSmeasures.m` compares cycle-extraction methods on the same series.
3. `toy_model.m` simulates a Gaussian toy model.
4. `toy_model_bootstrap.m` illustrates conditional Monte Carlo with fresh Gaussian draws, not a residual bootstrap.
5. `dynare dyn_toy_model.mod` runs the Dynare example.

The first two scripts require internet access for the DBnomics request.

## Runtime and outputs

Requires Econometrics Toolbox for HP filtering and Dynare 7.0 for the nonlinear example. The real-GDP series returned 308 quarterly observations from 1947-Q1 to 2023-Q4 on 2026-10-15. This is an archived OECD/QNA vintage, not current-quarter data. The Gaussian toy endowment has a nonzero probability of becoming negative. It is only a local numerical illustration. Both MATLAB toy scripts stop on non-positive or non-finite current endowment, and the Monte Carlo script also checks every future draw before taking reciprocals. They do not clip, truncate or redraw shocks. The Gaussian inverse-consumption expectation is not an ordinary finite expectation, even when the finite sample is positive.

## Deliberately different examples

- `toy_model.m` keeps 10,000 periods, additive Gaussian endowment and a certainty-equivalent log-utility rate. The handout exercise instead asks for 400 periods.
- `toy_model_bootstrap.m` keeps 100 simulated periods and 100 conditional draws reused across dates. Its historical name does not describe a bootstrap.
- `dyn_toy_model.mod` keeps positive lognormal endowment, CRRA curvature 10, innovation standard deviation 0.1 and approximation order 2. It is not the additive log-utility benchmark. Its exact gross-rate formula is `beta^(-1)*y^(sigma*(rho-1))*exp(-sigma^2*sigy^2/2)`, whereas Dynare computes a local perturbation.
- `BSmeasures.m` labels the band-pass complement separately from the linear and HP trends, because the complement contains both low- and high-frequency movements.

No horizon, shock distribution, calibration or utility curvature is silently harmonized across these teaching variants.

## DBnomics interface

Use the included standard `call_dbnomics.m`, without a course-specific wrapper. Its outputs are a numeric matrix (datenum in column 1, series thereafter), a table, and numeric readable dates. The course scripts explicitly convert the matrix dates to `datetime` for plots and calendar operations. Do not interpret the third output as a `datetime`.

See the [DBnomics guide](https://raw.githubusercontent.com/Vermandel/dbnomics-teaching/main/guide/call_dbnomics-guide.pdf) for single and multiple series, country selection, date alignment and plotting. Data are downloaded on execution and are not bundled.

The optional `download_data.m` saves the raw demonstration table and date vectors in `btm_demo_data.mat` in this folder. The four `example_*.m` files reproduce the guide’s requests and plot.
