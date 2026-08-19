# Assessment

This folder contains the public, student-facing material for the 2026 assessment of *Bayesian Techniques in Macroeconomics*.

The goal is to let a student pick one model, understand the statement, run the baseline Dynare file, and complete a reproducible Bayesian estimation exercise.

## Structure

- `models/unemployment/`
- `models/open_economy/`
- `models/mortgage/`
- `models/credit_market/`

Each subfolder contains:

- `statement.pdf` for the student handout;
- `model.mod` for the Dynare template.

No private correction is stored here.

## Expected Workflow

1. Read the statement and identify the observables.
2. Inspect the Dynare model and its calibration.
3. Run the model in Dynare.
4. Replace the template assumptions with the assigned estimation setup.
5. Document the results and diagnostics in a short report.

## Public Rules

- Keep teacher-only corrections out of the public tree.
- Keep the model, instructions, and naming consistent across the four subprojects.
- Prefer reproducible inputs and clear README files over hidden conventions.
