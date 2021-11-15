
<!-- README.md is generated from README.Rmd. Please edit that file -->

# datardis

<!-- badges: start -->
<!-- badges: end -->

The goal of datardis is to provide datasets from the Doctor Who TV
series. Three datasets are available :  
**episodes** : list of all episodes from the revived era
(2005-present)  
**directors** : list of directors  
**writers** : list of writers

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

## Find maximum number of UK viewers (in millions)
max(episodes$uk_viewers, na.rm = TRUE)
#> [1] 13.31

## Find who wrote the most episodes
writers %>%
     count(writer) %>%
     arrange(desc(n)) %>%
     head(5)
#> # A tibble: 5 x 2
#>   writer               n
#>   <chr>            <int>
#> 1 Steven Moffat       48
#> 2 Russell T Davies    31
#> 3 Chris Chibnall      26
#> 4 Mark Gatiss          9
#> 5 Toby Whithouse       7

## Find who directed the most episodes
directors %>%
     count(director) %>%
     arrange(desc(n)) %>%
     head(5)
#> # A tibble: 5 x 2
#>   director               n
#>   <chr>              <int>
#> 1 Graeme Harper         12
#> 2 Euros Lyn             11
#> 3 Douglas Mackinnon      8
#> 4 James Strong           7
#> 5 Jamie Magnus Stone     7
```
