# Mortgage market

Starting files: `mortgage_market_model.pdf` and `mortgage_RBC.mod`.

The baseline model distinguishes patient and impatient households, housing stocks, collateralized borrowing and an LTV shock. Reproduce steady-state residuals, determinacy and IRFs before adding observables.

Possible observables are output/consumption growth, a real house-price measure, mortgage credit and a real interest rate. State units carefully: credit stocks, rates and house-price indices require different transformations. Estimate a restrained set such as LTV persistence/volatility, housing preference and selected shock processes.

The aggregate resource constraint is expressed in steady-state levels times log
deviations. The collateral timing follows the handout exactly:
`R_t b_t = m_t E_t(q_{t+1}) H_t^I`, hence `r+b=e_m+q(+1)+h_I` in the
linear model. The unused `kappa` declaration has been removed.

Run `python3 download_data.py` to preserve raw output and manufacturing-hours
responses, then run `run_all` from MATLAB after adding Dynare to the path.
The supplied HOHWMN02 series measures manufacturing weekly hours, not housing.
It is retained as an explicitly labelled legacy placeholder. Select and document
an actual housing or mortgage series before estimation.

The revised note and code retain the collateral multiplier, LTV shock and gross-rate denominator in the housing Euler equation. The borrowing Euler coefficient is -PHIss_I/(1-PHIss_I), and the private budget includes delta*Hss_I*q. With a fixed total housing stock, replacement is positive but constant. The note makes explicit the lump-sum rebate to patient households needed by this resource closure.
