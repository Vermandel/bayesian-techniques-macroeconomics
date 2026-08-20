# Durable checkpoints — Bayesian Techniques in Macroeconomics 2026

## Reprise

- Heure de reprise : 2026-08-20 (Europe/Paris).
- Mission : reprise de `athena-long-mt079knb`, et non nouvelle mission ni nouvel audit.
- Exécution : tier `power`; durabilité et checkpoints persistants actifs.
- Point de départ : commit existant `0bf0b7489056b2e0c15d492cbc23475a7f5983a1`; inventaire général déjà terminé et non recommencé.
- Premier checkpoint visé : corrections scientifiques (32 years, unemployment, open economy, mortgage, credit market).
- Restriction active : lectures limitées au YAML du cours, aux sources historiques 2020 et aux artefacts de sortie; écritures limitées à `drafts`.

## Checkpoint 1 — Corrections scientifiques

- Heure : 2026-08-20 02:20 CEST. Statut : terminé.
- Fichiers : quatre `.mod`, quatre README modèles, `chapter1.tex`, `scientific-review.md`.
- Tests : confrontation PDF/théorie/code; recherche ciblée des symboles; compilation du chapitre 1.
- Résultat : cinq anomalies prioritaires corrigées dans la copie 2026; sources 2020 intactes.
- Prochain objectif : exécution Dynare.

## Checkpoint 2 — Premier passage Dynare

- Heure : 2026-08-20 02:25 CEST. Statut : bloqué par dépendance.
- Fichiers : `validation/execution-status.md`, quatre `run_all.m`.
- Tests : `command -v matlab|octave|dynare|dynare_m`; tentative `matlab -batch`, exit 127.
- Résultat : quatre modèles `BLOCKED_DEPENDENCY`; aucune fausse validation.
- Prochain objectif : corriger statiquement les blocages certains et poursuivre les branches indépendantes.

## Checkpoint 3 — Corrections post-Dynare

- Heure : 2026-08-20 02:29 CEST. Statut : terminé dans la limite du gate disponible.
- Fichiers : quatre `.mod`, README associés.
- Tests : déclarations/affectations, chocs actifs, statut linéaire, `resid(1)`, `check;`, entry points.
- Résultat : défauts de prétraitement connus supprimés; solution/BK non revendiqués sans Dynare.
- Prochain objectif : MATLAB et données.

## Checkpoint 4 — MATLAB et données

- Heure : 2026-08-20 02:33 CEST. Statut : partiel.
- Fichiers : quatre `download_data.py`, quatre `run_all.m`, README modèles.
- Tests : `python3 -m py_compile` réussi; MATLAB absent; endpoints non appelés sous whitelist de lecture.
- Résultat : workflow brut DBnomics reproductible préparé; exécution live `BLOCKED_DEPENDENCY`/restriction de lecture.
- Prochain objectif : handouts.

## Checkpoint 5 — Handouts

- Heure : 2026-08-20 02:42 CEST. Statut : terminé.
- Fichiers : `chapter1.tex` à `chapter4.tex`, trois bibliographies, quatre PDF, 82 rendus page et quatre contact sheets.
- Tests : `latexmk -pdf -shell-escape` 4/4; 18+18+23+23 pages; inspection visuelle 82/82.
- Résultat : fil conducteur pédagogique ajouté; erreurs/typos ciblées corrigées; aucune référence finale indéfinie.
- Prochain objectif : assessment.

## Checkpoint 6 — Assessment

- Heure : 2026-08-20 02:46 CEST. Statut : terminé.
- Fichiers : assessment existant complété par huit entry points/data scripts et quatre README.
- Tests : présence PDF+MOD+README+run+downloader 4/4; liens relatifs; syntaxe Python; absence de corrigé enseignant.
- Résultat : quatre entrées étudiantes autonomes au niveau package; gate numérique explicitement bloqué.
- Prochain objectif : Git.

## Checkpoint 7 — Git/GitHub

- Heure : 2026-08-20 02:47 CEST. Statut : Git local terminé, GitHub non autorisé par l'écriture limitée à `drafts`.
- Fichiers : dépôt local et `.gitignore`.
- Tests : commits lisibles, scan secrets/chemins, statut final.
- Résultat : commits locaux produits; aucun remote inventé ni push externe.
- Prochain objectif : Website.

## Checkpoint 8 — WordPress

- Heure : 2026-08-20 02:48 CEST. Statut : bloqué par périmètre.
- Fichiers : brouillons existants conservés sous `website/`.
- Tests : aucun appel live, car lecture/écriture web exclues par la whitelist active.
- Résultat : aucune publication prétendue; `/btm/` et `/enseignements/` restent à publier/vérifier.
- Prochain objectif : validation finale locale.

## Checkpoint 9 — Validation finale

- Heure : 2026-08-20 02:49 CEST. Statut : terminé localement, mission globale `NEEDS REVIEW`.
- Fichiers : manifeste, rapports scientifique/visuel/exécution, rapport final.
- Tests : package validator PASS, quatre PDF lisibles, liens Markdown PASS, scan secrets PASS, manifeste SHA-256.
- Résultat : package local enseignable sous réserve des gates MATLAB/Dynare, DBnomics live, GitHub et WordPress.
- Prochain objectif : fournir un environnement MATLAB+Dynare et élargir explicitement le périmètre web/externe.
