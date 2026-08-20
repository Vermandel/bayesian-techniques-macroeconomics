# Mortgage market

Starting files: `mortgage_market_model.pdf` and `mortgage_RBC.mod`.

The baseline model distinguishes patient and impatient households, housing stocks, collateralized borrowing and an LTV shock. Reproduce steady-state residuals, determinacy and IRFs before adding observables.

Possible observables are output/consumption growth, a real house-price measure, mortgage credit and a real interest rate. State units carefully: credit stocks, rates and house-price indices require different transformations. Estimate a restrained set such as LTV persistence/volatility, housing preference and selected shock processes.

The aggregate resource constraint is expressed in steady-state levels times log
deviations. The collateral timing follows the handout exactly:
`R_t b_t = m_t E_t(q_{t+1}) H_t^I`, hence `r+b=e_m+q(+1)+h_I` in the
linear model. The unused `kappa` declaration has been removed.

Run `python3 download_data.py` to preserve raw output and housing-market
responses, then run `run_all` from MATLAB after adding Dynare to the path.
The supplied housing indicator is not a house-price series; replace or augment
it and document the economic meaning of the chosen observable.
