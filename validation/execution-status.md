# Numerical execution status

Environment probe from the repository root:

```text
command -v matlab  -> not found
command -v octave  -> not found
command -v dynare  -> not found
command -v dynare_m -> not found
matlab -batch "disp(version); ..." -> exit 127, matlab: command not found
```

| Model | Entry point | Required command | Final status |
|---|---|---|---|
| Unemployment | `assessment/models/unemployment/run_all.m` | `matlab -batch "run_all"` from its folder | `BLOCKED_DEPENDENCY` |
| Open economy | `assessment/models/open_economy/run_all.m` | `matlab -batch "run_all"` from its folder | `BLOCKED_DEPENDENCY` |
| Mortgage | `assessment/models/mortgage/run_all.m` | `matlab -batch "run_all"` from its folder | `BLOCKED_DEPENDENCY` |
| Credit market | `assessment/models/credit_market/run_all.m` | `matlab -batch "run_all"` from its folder | `BLOCKED_DEPENDENCY` |

No model is labelled verified or executed. The current read restriction also
forbids inspection of Windows/Linux installation directories outside the two
authorized source locations. Each entry point asserts that Dynare is on the
MATLAB path and then preserves Dynare's normal residual, steady-state,
Blanchard--Kahn and simulation output.

The four DBnomics downloaders pass Python syntax compilation. Live endpoint,
frequency, dates, missing values and transformation checks are not claimed:
network reads fall outside the active read whitelist.
