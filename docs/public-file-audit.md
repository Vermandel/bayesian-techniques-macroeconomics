# Public file audit

This release uses an educational allowlist. A student repository is a
reproducible course package, not a working directory or a validation archive.

| Classification | Release rule | Included examples |
| --- | --- | --- |
| `PUBLIC_NECESSARY` | Essential student material | `README.md`, compiled syllabus and handouts, `assessment/`, `publication-manifest.yml` |
| `PUBLIC_USEFUL` | Runnable or explanatory support | `code/`, assessment downloaders, compiled slides and direct-download ZIP archives |
| `INTERNAL_VALIDATION` | Never publish | `validation/`, worker logs, task state, checkpoints and internal reports |
| `GENERATED` | Recreate locally; ignore | Dynare packages/output, LaTeX auxiliaries, `*.mat`, `*.dat`, downloaded data and caches |
| `PRIVATE` | Never publish | solutions, credentials, local paths, notes and personal templates |
| `OBSOLETE` | Remove from release | superseded copies, historical build scripts and duplicate technical output |

## Release inventory by path

| Path pattern | Classification | Reason |
| --- | --- | --- |
| Root `README.md`, `.gitignore`, `publication-manifest.yml`, `btm_call_dbnomics.m` | `PUBLIC_NECESSARY` | Entry points, handoff and reusable data helper. |
| `syllabus/*.pdf` | `PUBLIC_NECESSARY` | Canonical academic specification in student-facing form. |
| `handouts/*.pdf` | `PUBLIC_NECESSARY` | Scientifically validated student handouts. |
| `code/session*/` | `PUBLIC_USEFUL` | MATLAB/Dynare teaching examples, excluding reproducible data and outputs. |
| `assessment/*` | `PUBLIC_NECESSARY` | Four student-facing models, scripts and instructions; no solutions. |
| `data/*` and `docs/*.md` | `PUBLIC_NECESSARY` | Download instructions and course documentation. |
| `slides/*.pdf` | `PUBLIC_NECESSARY` | Compiled oral decks. |
| `downloads/*.zip` | `PUBLIC_USEFUL` | Direct-download code archives prepared from the audited session folders. |
| `*.tex`, `*.sty`, `*.bib`, private templates and editable slide/handout sources | `PRIVATE` | Retained only in the canonical Dropbox course tree. |
| `validation/`, `website/`, logs, captures, manifests/checkpoints and task state | `INTERNAL_VALIDATION` | Deliberately excluded from the public repository. |
| `*.mat`, `*.dat`, `*.csv`, `*.xlsx`, Dynare `Output/`, `graphs/`, `metropolis/`, `prior/`, `checksum` | `GENERATED` | Recreated from documented source or downloader. |

The inherited history and final release inventory were scanned for common
credential signatures and sensitive filenames. No credential or private-key
match was found. Ordinary logs and reproducible output are removed from the
current public tree; history is not rewritten merely to purge such artifacts.
