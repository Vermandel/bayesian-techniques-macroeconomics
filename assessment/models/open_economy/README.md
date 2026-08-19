# Open economy / two-country model

Starting files: `two_countries.pdf` and `soe_RBC.mod`.

The baseline model contains home/foreign households and production, trade flows, net foreign assets, the real exchange rate and country-specific shocks. Start by documenting country size and trade-share conventions. Verify market clearing and the sign of net foreign assets and the real exchange rate.

An empirical version may use home and foreign output growth, the real exchange rate and a trade quantity. Explicitly map national sources, currencies, price deflators and seasonal adjustment. Keep the observable set smaller than the effective number of innovations unless justified measurement errors are added.

Known review points: `chi_F` is calibrated with `Wss_H` rather than `Wss_F`; several declared shock states (`e_p_*`, `e_r_*`) do not enter the corresponding structural equations; the model uses `model;` although equations appear log-linear. Resolve these against the theory PDF before estimation.
