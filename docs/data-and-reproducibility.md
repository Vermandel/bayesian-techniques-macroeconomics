# Data and reproducibility protocol

## Required data ledger

For every observable, record: economic concept; provider; DBnomics series identifier or original URL; vintage/retrieval date; raw frequency and units; seasonal adjustment; sample; transformation; model counterpart; measurement equation.

Typical transformations must be justified, not copied mechanically: log difference for growth rates, log deviation from a documented trend for stationary gaps, percentage-point scaling for rates, and per-capita normalization when required by the model. Never mix annualized and quarter-on-quarter rates silently.

## DBnomics

The robust workflow is provider/dataset/series identifiers plus a scripted HTTPS request to the DBnomics API, with the unmodified response stored as a raw snapshot. Validate HTTP status, series identity, frequency, units, observation count and date range. Cache raw data so a clean replication does not depend on a live service after retrieval.

The historical corpus does not expose a clearly identified `call_dbnomics.m`; therefore no claim is made that an old MATLAB helper was modernized. A new retrieval implementation must be tested against the selected assessment series once observables are chosen.

## Folder contract for assessment work

```text
data/raw/          immutable provider responses
data/processed/    deterministic transformations
src/download_data  retrieval entry point
src/build_data     transformation entry point
run_all.m          model, estimation, tables and figures
output/            generated and disposable
```

The report must reconcile the number of model observables, structural shocks and measurement errors, and state how stochastic singularity is avoided.
