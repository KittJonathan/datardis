
<!-- README.md is generated from README.Rmd. Please edit that file -->

# datardis

<!-- badges: start -->
<!-- badges: end -->

The goal of datardis is to provide datasets from the Doctor Who TV
series.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("KittJonathan/datardis")
```

## Example

Find maximum number of UK viewers:

``` r
## Load packages
library(datardis)

## Load dataset
max(episodes$uk_viewers)
#> [1] 13.31
```
