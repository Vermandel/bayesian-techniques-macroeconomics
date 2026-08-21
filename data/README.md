# Reproducible data

The public repository contains no downloaded macroeconomic dataset. From the
repository root, run `data/download_data.m` in MATLAB after adding the root to
the path. It downloads a small DBnomics demonstration series and saves the
result locally as `data/btm_demo_data.mat` (ignored by Git).

For a different series, call `btm_call_dbnomics('provider/dataset/series')`.
Record the provider, dataset, series identifier, frequency, transformations and
retrieval date in the analysis that uses it. The separate DBnomics teaching
repository is the canonical general guide; this repository only holds
course-specific code.
