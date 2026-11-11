# Course package contents

The repository contains student-facing course material and starting code.

| Folder | Contents |
| --- | --- |
| `session1/` to `session4/` | Handout and compact slides only |
| `sessionN/codes/` | Individual MATLAB and Dynare files, required helpers and instructions |
| `assessment/models/` | Four model descriptions and their starting code |
| `docs/` | Course description, data protocol and DBnomics guide |
| `syllabus/` | Course syllabus |

Run code from its own `codes/` folder. Download all required helpers with the example. The DBnomics function has the same standard interface in every session.

Generated data, Dynare outputs, caches and estimation draws are recreated locally. They are not part of the download. LaTeX editing sources, instructor notes and assessment solutions are not public course files.

## Publication restrictions (11 November 2026)

Extended/progressive slides are INSTRUCTOR_ONLY, including renamed copies with identical content. Preserve them in the private master; exclude them and all archives from public exports. A build-output inventory or an older allowlist is not a publication authorization. Check the exact staged tree before every release; .gitignore alone does not protect already tracked files.

Session 1 website downloads use the explicit code_display_files list in publication-manifest.yml. Generic DBnomics examples and the shared helper belong to the DBnomics block, which links the separate canonical repository and guide. Their physical presence as dependencies is not permission to re-list them as Session 1 teaching resources. download_data.m remains an optional BTM-specific US-GDP example requiring call_dbnomics.m. Preserve existing course helpers and required datasets; do not delete them as part of link reclassification.
