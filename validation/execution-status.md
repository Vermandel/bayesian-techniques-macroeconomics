# Numerical execution status

Final environment probe and execution from WSL:

```text
command -v matlab  -> not found
command -v dynare  -> not found
Windows MATLAB     -> C:\Program Files\MATLAB\R2025a\bin\matlab.exe
MATLAB version     -> 25.1.0.2973910 (R2025a) Update 1
Windows Dynare     -> C:\dynare\7.0\matlab\dynare.m
Dynare version     -> 7.0
```

The Linux PATH probe alone was insufficient. MATLAB was launched from WSL via
its declared absolute Windows path. Dynare generated package drivers on the
WSL-mounted worktree; because MATLAB could not refresh a generated package on
that mapped path automatically, the validation runner initialized
`dynare_config`, refreshed the MATLAB path, and invoked the generated driver.
This preserves the model code and executes the same residual, steady-state,
Blanchard--Kahn and simulation stages.

| Model | Entry point | Residuals | Order/rank | Simulation | Final status |
|---|---|---|---|---|---|
| Unemployment | `assessment/models/unemployment/run_all.m` | zero | verified | completed | `PASS` |
| Open economy | `assessment/models/open_economy/run_all.m` | zero | verified | completed | `PASS` |
| Mortgage | `assessment/models/mortgage/run_all.m` | zero | verified | completed | `PASS` |
| Credit market | `assessment/models/credit_market/run_all.m` | zero | verified | completed | `PASS` |

Real execution revealed two compatibility/model-count defects that static
checks had missed: Dynare 7 expects `resid(non_zero)` rather than `resid(1)`,
and the unemployment file contained a steady-state identity as a nineteenth
model equation for eighteen endogenous variables. The command was modernized
in all four files and the redundant identity removed before the successful
runs.

Durable logs, intermediate failures and the final direct-driver runs are kept
outside the repository in `../validation-matlab-dynare/`. Live DBnomics checks
returned HTTP 200 and observations for all 10 distinct series referenced by
the package; their evidence is in `../validation-wordpress/dbnomics-live.json`.
