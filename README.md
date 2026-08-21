# Bayesian Techniques in Macroeconomics — 2026--2027

Graduate course at Université Paris-Dauphine PSL, taught by Gauthier Vermandel.
Four sessions connect economic mechanisms to equilibrium conditions, state-space
representation, likelihood, prior information, posterior inference and
diagnostics. The course treats Dynare as an implementation of explicit model
objects, never as a black box.

Start with the [syllabus](syllabus/btm-syllabus-2026-2027.pdf). The public
repository contains the scientifically validated handouts, runnable starting
code, assessment models and concise oral decks.

## Schedule

| Date | Session |
| --- | --- |
| 5 November 2026, 08:30--11:45 | Modern Business Cycle Theory |
| 12 November 2026, 08:30--11:45 | A Production Economy |
| 19 November 2026, 08:30--11:45 | Maximum Likelihood Estimation |
| 26 November 2026, 08:30--11:45 | Bayesian Estimation of DSGE Models |

Detailed learning outcomes and teaching sequence are in
[docs/course-plan.md](docs/course-plan.md).

## Materials

| Session | Handout | Slides | Code |
| --- | --- | --- | --- |
| 1. Modern Business Cycle Theory | [PDF](handouts/session1-modern-business-cycle-theory.pdf) | [PDF](slides/session1-modern-business-cycle-theory.pdf) | [MATLAB/Dynare](code/session1/) |
| 2. A Production Economy | [PDF](handouts/session2-production-economy.pdf) | [PDF](slides/session2-production-economy.pdf) | [MATLAB/Dynare](code/session2/) |
| 3. Maximum Likelihood Estimation | [PDF](handouts/session3-maximum-likelihood.pdf) | [PDF](slides/session3-maximum-likelihood.pdf) | [MATLAB/Dynare](code/session3/) |
| 4. Bayesian Estimation of DSGE Models | [PDF](handouts/session4-bayesian-estimation.pdf) | [PDF](slides/session4-bayesian-dsge.pdf) | [MATLAB/Dynare](code/session4/) |

The slide sources and the course-local copy of the Sorbonne Beamer assets are
in `slides/`. Compile a deck with `latexmk -pdf <file>.tex` from that folder.

## Software and data

Use a current MATLAB release and a compatible Dynare version. From MATLAB,
move to an example directory and run `dynare filename.mod`. Begin with the
simulation examples in `code/session2`, then the likelihood example in
`code/session3`, and finally the Bayesian example in `code/session4`.
Generated Dynare files and estimation outputs are intentionally excluded from
version control.

Data provenance is part of the empirical model. For each series, document its
provider, dataset and identifier, retrieval date, sample, frequency, units,
seasonal adjustment, transformations and missing-value treatment. The
[DBnomics teaching repository](https://github.com/Vermandel/dbnomics-teaching)
and its [guide PDF](https://github.com/Vermandel/dbnomics-teaching/blob/main/guide/dbnomics-teaching.pdf)
are the canonical general reference. Assessment downloaders and course-specific
scripts remain in this repository; see [docs/data-and-reproducibility.md](docs/data-and-reproducibility.md).

## Assessment

Choose one model in `assessment/models`, add a transparent data pipeline and
an estimable measurement block, then submit reproducible code and a concise
report. The four starting points are unemployment, a two-country/open-economy
model, mortgage markets and corporate credit. They are student starting models,
not complete solutions. See [assessment/README.md](assessment/README.md).

**Submission deadline: 15 January 2027.**

## Public-repository policy

This is a pedagogical release rather than a workspace dump. It contains
student-facing handouts, slides, useful code, assessment statements and concise
documentation; it excludes logs, caches, validation captures, task state,
downloaded data, generated outputs, private material and solutions. See
[docs/public-file-audit.md](docs/public-file-audit.md).
