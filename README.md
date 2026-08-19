# Bayesian Techniques in Macroeconomics

Course material for the 2026 edition of *Bayesian Techniques in Macroeconomics*.

This repository is being cleaned into a public, student-facing package with:

- four 4-hour sessions;
- lecture notes in LaTeX and PDF;
- MATLAB and Dynare examples;
- DBnomics data helpers;
- toy assessment models and instructions.

## Course Structure

1. Modern Business Cycle Theory
2. A Production Economy
3. Maximum Likelihood Estimation
4. Bayesian Estimation of DSGE Models

## Software

- MATLAB
- Dynare
- A LaTeX distribution with `latexmk` or BibTeX support

## How To Build

The historical source tree is organized by chapter.

- On Windows, the provided `COMPILE_TEX.bat` files can be used in the chapter folders.
- On Unix-like systems, compile each chapter with `latexmk -pdf chapterN.tex` from the corresponding folder.

## Data And DBnomics

Several examples load macroeconomic time series from DBnomics.

- `chap3/codes/mydb.m`
- `chap4/codes/mydb.m`
- `chap1/codes/call_dbnomics.m`
- `chap3/codes/call_dbnomics.m`
- `chap4/codes/call_dbnomics.m`

The current work updates these helpers to use the modern DBnomics endpoint and keeps the data pipeline documented in the course notes. The shared implementation lives in `btm_call_dbnomics.m` at the repository root.

When running the MATLAB examples, launch them from the repository root or make sure the repository root is on the MATLAB path.

## Assessment

The course assessment is built around a choice of one toy model and a reproducible Bayesian estimation exercise.

Target model families:

- unemployment
- open economy
- mortgage market
- credit market

See `assessment/README.md` and the per-model README files for the student-facing instructions.

## Repository Layout

- `chap1/` - business cycle theory
- `chap2/` - production economy and solution methods
- `chap3/` - maximum likelihood and Kalman filtering
- `chap4/` - Bayesian DSGE estimation
- `Exercises/` - handouts and exercises
- `dbmodels/` - toy models and model code

## Notes

This working tree still contains historical artifacts while the public student package is being prepared.
Private notes, generated logs, and temporary compilation outputs should not be committed.
