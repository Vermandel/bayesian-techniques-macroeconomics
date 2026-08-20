# Open economy / two-country model

Starting files: `two_countries.pdf` and `soe_RBC.mod`.

The baseline model contains home/foreign households and production, trade flows, net foreign assets, the real exchange rate and country-specific shocks. Start by documenting country size and trade-share conventions. Verify market clearing and the sign of net foreign assets and the real exchange rate.

An empirical version may use home and foreign output growth, the real exchange rate and a trade quantity. Explicitly map national sources, currencies, price deflators and seasonal adjustment. Keep the observable set smaller than the effective number of innovations unless justified measurement errors are added.

The student baseline is explicitly linear. The foreign labour-disutility scale uses
the foreign steady-state wage. Price and monetary-policy shocks from the richer
theory note are not part of this reduced real model and have been removed instead
of leaving inactive innovations. Reintroducing them requires the corresponding
nominal equations, not only new AR(1) processes.

Run `python3 download_data.py` to preserve the raw home/foreign DBnomics
responses, then run `run_all` from MATLAB after adding Dynare to the path.
Country pairing and exchange-rate construction must be documented explicitly.
