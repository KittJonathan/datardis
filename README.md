
<!-- README.md is generated from README.Rmd. Please edit that file -->

# datardis

<!-- badges: start -->
<!-- badges: end -->

The goal of datardis is to provide datasets from the Doctor Who and
Torchwood TV series.

Six datasets are available :  
**drwho_episodes** : list of all episodes from the Doctor Who revived
era (2005-present)  
**drwho_directors** : list of Doctor Who directors  
**drwho_writers** : list of Doctor Who writers **torchwood_episodes** :
list of all episodes from the Torchwood series (2006-2011)  
**torchwood_directors** : list of Torchwood directors  
**torchwood_writers** : list of Torchwood writers

## Installation

You can download and install the package from CRAN:

``` r
install.packages("datardis")
```

You can install the development version from
[GitHub](https://github.com/) with:

``` r
devtools::install_github("KittJonathan/datardis")
```

## Examples

``` r
## Load packages
library(datardis)
library(tidyverse)

## Find maximum number of UK viewers for Doctor Who (in millions)
max(drwho_episodes$uk_viewers, na.rm = TRUE)
#> [1] 13.31

## Find who wrote the most episodes for Doctor Who
drwho_writers %>%
     count(writer) %>%
     arrange(desc(n)) %>%
     head(5)
#> # A tibble: 5 × 2
#>   writer               n
#>   <chr>            <int>
#> 1 Steven Moffat       45
#> 2 Russell T Davies    31
#> 3 Chris Chibnall      29
#> 4 Mark Gatiss          9
#> 5 Toby Whithouse       7

## Find who directed the most episodes for Doctor Who
drwho_directors %>%
     count(director) %>%
     arrange(desc(n)) %>%
     head(5)
#> # A tibble: 5 × 2
#>   director               n
#>   <chr>              <int>
#> 1 Graeme Harper         12
#> 2 Euros Lyn             11
#> 3 Douglas Mackinnon      8
#> 4 Jamie Magnus Stone     8
#> 5 James Strong           7
```
