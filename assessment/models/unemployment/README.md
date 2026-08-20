# Involuntary unemployment

Starting files: `unemployment.pdf` and `unemployment_RBC.mod`.

The baseline model combines capital accumulation with employment separations, hiring intensity, hiring costs, wage bargaining and five structural shocks. Before estimation, reproduce `resid`, `check` and baseline IRFs. Then choose a parsimonious observable set such as output growth, unemployment and a real wage or investment measure; define the measurement equations and add measurement error when needed to avoid stochastic singularity.

Candidate estimated objects include shock persistence/standard deviations and a small subset of labour-market parameters (`delta_N`, bargaining weight `eta`, hiring-cost curvature `phi`). Priors must respect support. Do not estimate all calibrated parameters simultaneously.

The canonical wage equation is the log-linearization of the handout's Nash condition
`eps_m*eta*V_P=(1-eps_m*eta)*V_H`; it therefore retains both firm and worker
surpluses. Treat variants that omit `v_H` only as misspecification exercises.

Run `python3 download_data.py` to preserve the raw DBnomics responses, then run
`run_all` from MATLAB after adding Dynare to the path. Record retrieval date,
sample transformations and any missing observations before estimation.
