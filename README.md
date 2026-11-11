# Bayesian Techniques in Macroeconomics — 2026–2027

Graduate course at Université Paris-Dauphine PSL, taught by Gauthier Vermandel.
Four sessions connect economic mechanisms to equilibrium conditions, state-space
representation, likelihood, prior information, posterior inference and
diagnostics. The course treats Dynare as an implementation of explicit model
objects, never as a black box.

Start with the [syllabus](syllabus/btm-syllabus-2026-2027.pdf). The public
repository contains the course handouts, runnable starting
code, assessment models and concise oral decks.

## Schedule

| Date | Session |
| --- | --- |
| 12 November 2026, 08:30--11:45 | Modern Business Cycle Theory |
| 19 November 2026, 08:30--11:45 | A Production Economy |
| 26 November 2026, 08:30--11:45 | Maximum Likelihood Estimation |
| 3 December 2026, 08:30--11:45 | Bayesian Estimation of DSGE Models |

Detailed learning outcomes and teaching sequence are in
[docs/course-plan.md](docs/course-plan.md). A fuller academic description of the
course's model-to-estimation pipeline is in
[docs/course-description.md](docs/course-description.md).

## Materials

| Session | Handout | Slides | Code |
| --- | --- | --- | --- |
| 1. Modern Business Cycle Theory | [PDF](session1/handout1.pdf) | [Compact](session1/slides1.pdf) · [Progressive](session1/slides1_extended.pdf) | [Browse](session1/codes/) |
| 2. A Production Economy | [PDF](session2/handout2.pdf) | [Compact](session2/slides2.pdf) · [Progressive](session2/slides2_extended.pdf) | [Browse](session2/codes/) |
| 3. Maximum Likelihood Estimation | [PDF](session3/handout3.pdf) | [Compact](session3/slides3.pdf) · [Progressive](session3/slides3_extended.pdf) | [Browse](session3/codes/) |
| 4. Bayesian Estimation of DSGE Models | [PDF](session4/handout4.pdf) | [Compact](session4/slides4.pdf) · [Progressive](session4/slides4_extended.pdf) | [Browse](session4/codes/) |

The public release contains the compiled handout and slide PDFs. LaTeX sources
and local theme assets are maintained in the private Dropbox master and are
intentionally excluded from GitHub.

Each deck covers 180 minutes of teaching, plus a 15-minute break. The compact PDF has one page per slide. The progressive PDF reveals the same content step by step.

## Software and data

The course targets MATLAB R2025a and Dynare 7.0. From MATLAB,
move to an example directory and run `dynare filename.mod`. Begin with the
simulation examples in `session2/codes`, then the likelihood example in
`session3/codes`, and finally the Bayesian example in `session4/codes`.
Generated Dynare files and estimation outputs are intentionally excluded from
version control.

Data provenance is part of the empirical model. For each series, document its
provider, dataset and identifier, retrieval date, sample, frequency, units,
seasonal adjustment, transformations and missing-value treatment. The
[DBnomics teaching repository](https://github.com/Vermandel/dbnomics-teaching)
and its [guide PDF](https://github.com/Vermandel/dbnomics-teaching/blob/main/guide/call_dbnomics-guide.pdf)
are the canonical general reference. A [local copy of the guide](docs/call_dbnomics-guide.pdf) is included for convenience, with runnable download and plot examples in `session1/codes/`. Assessment downloaders and course-specific
scripts remain in this repository. See [docs/data-and-reproducibility.md](docs/data-and-reproducibility.md).

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
documentation. It excludes logs, caches, validation captures, task state,
downloaded data, generated outputs, private material and solutions. See
[docs/public-file-audit.md](docs/public-file-audit.md).

## Folder layout

Each `sessionN/` contains `handoutN.pdf`, `slidesN.pdf` and `slidesN_extended.pdf` at its root, with individual MATLAB/Dynare files under `codes/`. Download the required files together, open that codes directory in MATLAB, and follow its README. LaTeX sources under `latex/` and shared build assets exist only in the private editable master.
