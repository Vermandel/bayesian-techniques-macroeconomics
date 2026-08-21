# Public file audit

This audit applies an educational allowlist to the release branch. It is a
release inventory, not a record of local working files, which may contain
ignored build products.

| Classification | Release rule | Included examples |
| --- | --- | --- |
| `PUBLIC_NECESSARY` | Student-facing essential material | `README.md`, `syllabus/`, `chap*/chapter*.tex` and PDFs, `assessment/` |
| `PUBLIC_USEFUL` | Runnable or explanatory support | MATLAB `.m`, Dynare `.mod`, bibliography files, cited figures, `slides/` and its template copy |
| `INTERNAL_VALIDATION` | Never publish | `validation/`, worker logs, task state, checkpoints, internal reports |
| `GENERATED` | Recreate locally; ignored | Dynare `+` packages, `Output/`, `graphs/`, `metropolis/`, `prior/`, `checksum`, `.mat`, `.dat` |
| `PRIVATE` | Never publish | solutions, credentials, local paths, user-specific notes and templates |
| `OBSOLETE` | Removed from release | historical compilation scripts, duplicate historical deck, `dbmodels/` archive and superseded root syllabus |

## Release inventory by path

Every tracked path falls under one of the following rules:

| Path pattern | Classification | Reason |
| --- | --- | --- |
| Root `README.md`, `.gitignore`, `publication-manifest.yml` | `PUBLIC_NECESSARY` | Entry point, hygiene policy and site handoff. |
| `syllabus/*` | `PUBLIC_NECESSARY` | Canonical course specification, source and PDF. |
| `chap[1-4]/chapter*`, `chap[1-4]/dataref.bib`, `chap[1-4]/tikz/*`, `chap[1-4]/imgs/*` | `PUBLIC_NECESSARY` | Handouts and their required sources/figures. |
| `chap[1-4]/codes/*.m`, `chap[1-4]/codes/*.mod`, small explanatory figures | `PUBLIC_USEFUL` | Student-runnable examples, not generated output. |
| `assessment/*` | `PUBLIC_NECESSARY` | Four student-facing model choices and instructions; no solutions. |
| `Exercises/*` | `PUBLIC_USEFUL` | Optional exercise statements and their sources. |
| `data/download_data.m`, `btm_call_dbnomics.m`, `data/README.md` | `PUBLIC_NECESSARY` | Reproducible data retrieval without committing downloads. |
| `slides/*.tex`, `slides/*.pdf`, `slides/template/assets/*`, `slides/README.md` | `PUBLIC_NECESSARY` | Oral decks and the course-local, unmodified reference assets needed to build them. |
| `mystyle.tex`, `lectures_info.tex`, `logo-upd.png`, `126340_UR1_UEBtransparent.png` | `PUBLIC_USEFUL` | Existing handout build dependencies. |
| `*.log`, LaTeX auxiliaries, Dynare `+*/`, `Output/`, `graphs/`, `metropolis/`, `prior/`, `checksum`, `*.mat`, `*.dat` | `GENERATED` | Recreated from source; excluded by `.gitignore`. |
| `validation/`, task state, reports, checkpoints, private notes/templates and solutions | `INTERNAL_VALIDATION` or `PRIVATE` | Never released. |

The sole pre-release commit and the current release inventory were scanned for
common credential signatures and sensitive filenames. No credential or
private-key match was found. This release removes ordinary generated files from
the current tree only; it does **not** rewrite history merely to purge logs or
reproducible output.
