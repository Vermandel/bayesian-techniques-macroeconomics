# Mortgage market

Starting files: `mortgage_market_model.pdf` and `mortgage_RBC.mod`.

The baseline model distinguishes patient and impatient households, housing stocks, collateralized borrowing and an LTV shock. Reproduce steady-state residuals, determinacy and IRFs before adding observables.

Possible observables are output/consumption growth, a real house-price measure, mortgage credit and a real interest rate. State units carefully: credit stocks, rates and house-price indices require different transformations. Estimate a restrained set such as LTV persistence/volatility, housing preference and selected shock processes.

Known review points: the aggregate resource constraint mixes a log-deviation output variable with unscaled consumption and housing terms; the borrowing constraint timing (`q(+1)+h_I`) must be reconciled with the theoretical collateral constraint; declared parameter `kappa` is unused. Resolve these before estimation.
