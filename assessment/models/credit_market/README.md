# Corporate loans / credit market

Starting files: `credit_market_model.pdf` and `credit_RBC.mod`.

The baseline nonlinear model contains patient households, impatient entrepreneurs, capital adjustment costs and a borrowing constraint linked to collateral and the wage bill. First verify positivity of steady-state consumption, loans and multipliers, then check residuals and determinacy.

Possible observables are output/investment growth, a real lending rate and corporate credit. The empirical block must document the construction of a real rate and the stock/flow treatment of credit. Estimate only parameters informed by these observables, plus shock persistence and variance where justified.

The unused `rho_r` assignment and undeclared steady-state symbols `pi` and `r`
have been removed, and the determinacy check is active. The numerical gate remains
mandatory: do not suppress an indeterminacy result or present this model as solved
without preserving the Dynare log.

Run `python3 download_data.py` to preserve raw output and investment responses,
then run `run_all` from MATLAB after adding Dynare to the path. A credit-stock
series and lending-rate construction must be added and documented before estimation.
