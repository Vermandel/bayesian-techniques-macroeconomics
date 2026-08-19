# Involuntary unemployment

Starting files: `unemployment.pdf` and `unemployment_RBC.mod`.

The baseline model combines capital accumulation with employment separations, hiring intensity, hiring costs, wage bargaining and five structural shocks. Before estimation, reproduce `resid`, `check` and baseline IRFs. Then choose a parsimonious observable set such as output growth, unemployment and a real wage or investment measure; define the measurement equations and add measurement error when needed to avoid stochastic singularity.

Candidate estimated objects include shock persistence/standard deviations and a small subset of labour-market parameters (`delta_N`, bargaining weight `eta`, hiring-cost curvature `phi`). Priors must respect support. Do not estimate all calibrated parameters simultaneously.

Known review point: the wage equation contains a commented alternative and the active equation omits `v_H`; justify the intended bargaining equation from the handout before treating the model as empirically final.
