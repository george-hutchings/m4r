# Statistical Tests for the Number of Clusters in Data

Code and results accompanying my M4R (Mathematics fourth-year research) dissertation.

## Overview

Clustering is a central tool in exploratory data analysis, but a fundamental
question is how many clusters are genuinely present in the data, as opposed to
apparent structure arising from sampling variation. This project studies and
compares statistical tests that attempt to answer that question.

The report traces the development of two families of methods and then compares
them in a simulation study and on a real dataset:

- **SigClust** ([Liu et al., 2008](https://doi.org/10.1198/016214508000000454))
  and its hierarchical extension **SHC**
  ([Kimes et al., 2017](https://doi.org/10.1111/biom.12647)), which
  recursively test whether a cluster should be split.
- **RIFT** ([Chakravarti et al., 2019](https://arxiv.org/abs/1910.02566)),
  along with a small modification to their *L2* variant proposed in the report,
  which performs competitively with the other methods in the simulations.

The methods are applied to a breast-cancer gene-expression dataset as a final
case study.

## Repository layout

| Path | Contents |
| --- | --- |
| `simulations code/` | R implementation of the methods (`sequential_function.R`) and the simulation drivers (`simulations_MAIN.R`, `simulations_MAIN_rand_uniform.R`). `code for knitting.R` runs the drivers across parameter grids and saves the output. |
| `simulations code/based on chakravarti code/` | RIFT implementation adapted from the reference code released with Chakravarti et al. (2019). |
| `simulation results/` | Raw outputs and plots produced by the simulation study, including PDFs of the cluster-count distributions under each scenario. |
| `code for plots (not simulation study)/` | Standalone scripts that reproduce the Gaussian-mixture and importance-sampling illustrations used in the report. |
| `real data/` | Script and dataset for the breast-cancer gene-expression case study. |

## Methods compared

The simulation study evaluates eight estimators of the number of clusters *k*:

- Mean and median RIFT statistics (original and modified *L2* variants).
- AIC and BIC applied to Gaussian-mixture models.
- The hierarchical top-down RIFT procedure (`RIFT.hc`).
- SigClust with hierarchical extension (`shc`).

Each is run over combinations of dimension, inter-cluster separation, cluster
weights (even / uneven), and component distribution (Gaussian / t with 3 d.f.).

## Running the code

The code is written in R and uses the
[`pacman`](https://cran.r-project.org/package=pacman) package to install and
load dependencies on first run. Key packages include `Rfast`, `mvnfast`,
`mclust`, `foreach` and `doParallel`, along with
[`sigclust2`](https://github.com/pkimes/sigclust2) from GitHub. Simulations
are parallelised over roughly half of the available CPU cores.

A typical workflow is:

1. Open the scripts in RStudio (the code uses `rstudioapi` to set its working
   directory to the script's location).
2. Run `simulations code/code for knitting.R` to reproduce the simulation
   study. Individual scenarios can also be run directly from
   `simulations_MAIN.R` after setting `k`, `uneven`, `distribution` and
   `iterations`.
3. Run `real data/Real Data.R` to reproduce the gene-expression case study.
4. Scripts in `code for plots (not simulation study)/` reproduce the
   illustrative figures in the report.

## References

- Chakravarti, P., Balakrishnan, S. and Wasserman, L. (2019). *Gaussian
  Mixture Clustering Using Relative Tests of Fit*. arXiv:1910.02566.
- Kimes, P. K., Liu, Y., Neil Hayes, D. and Marron, J. S. (2017).
  *Statistical significance for hierarchical clustering*. Biometrics, 73(3),
  811-821.
- Liu, Y., Hayes, D. N., Nobel, A. and Marron, J. S. (2008). *Statistical
  significance of clustering for high-dimension, low-sample size data*.
  Journal of the American Statistical Association, 103(483), 1281-1293.
