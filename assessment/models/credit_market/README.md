# Corporate loans / credit market

Starting files: `credit_market_model.pdf` and `credit_RBC.mod`.

The baseline nonlinear model contains patient households, impatient entrepreneurs, capital adjustment costs and a borrowing constraint linked to collateral and the wage bill. First verify positivity of steady-state consumption, loans and multipliers, then check residuals and determinacy.

Possible observables are output/investment growth, a real lending rate and corporate credit. The empirical block must document the construction of a real rate and the stock/flow treatment of credit. Estimate only parameters informed by these observables, plus shock persistence and variance where justified.

Known review points: `rho_r` is assigned but neither declared nor used; `pi` and `r` are assigned in `steady_state_model` but are not declared endogenous variables or parameters; `check` is commented out. These are blocking syntax/validation defects for a modern Dynare run and must be corrected before claiming the model solves.
