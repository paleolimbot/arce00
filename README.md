
<!-- README.md is generated from README.Rmd. Please edit that file -->

# arce00

<!-- badges: start -->

[![R build
status](https://github.com/paleolimbot/arce00/workflows/R-CMD-check/badge.svg)](https://github.com/paleolimbot/arce00/actions)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Codecov test
coverage](https://codecov.io/gh/paleolimbot/arce00/branch/master/graph/badge.svg)](https://codecov.io/gh/paleolimbot/arce00?branch=master)
<!-- badges: end -->

The goal of arce00 is to read e00 files or convert them to a form that
sf or sp can read. While these package *can* readn e00 files, the read
operation is too slow to be practical on some platforms. This package
ports the [AVCE library](http://avce00.maptools.org/avce00/avce00.html)
to R for efficient conversion to a binary coverage (for which sf/sp read
operations are efficient).

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("paleolimbot/arce00")
```

The arce00 package contains compiled code, so you will need to have
build tools (e.g., Rtools) installed.

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(arce00)

e00 <- system.file("e00/cis_20170911.e00", package = "arce00")
cov <- e00_temp_coverage()
coverage <- e00_convert(e00, cov)
sf::read_sf(coverage, layer = "LAB")
#> Simple feature collection with 87 features and 68 fields
#> geometry type:  POINT
#> dimension:      XY
#> bbox:           xmin: 349288.1 ymin: 1577259 xmax: 2581513 ymax: 3557555
#> projected CRS:  unnamed
#> # A tibble: 87 x 69
#>    ValueId PolyId    AREA PERIMETER BR2MZG16O5GX6. BR2MZG16O5GX6.ID A_LEGEND
#>      <int>  <int>   <dbl>     <dbl>          <int>            <int> <chr>   
#>  1       2      2 8.85e11 31235633.              2                2 Bergy w~
#>  2       3      3 1.48e 8    94500.              3                3 Land    
#>  3       4      4 2.24e11 14482767.              4                4 Land    
#>  4       5      5 1.27e 8    53164.              5                5 Land    
#>  5       6      6 1.44e 8    87332.              6                6 Land    
#>  6       7      7 1.10e 8    71738.              7                7 Land    
#>  7       8      8 1.32e 8   110787.              8                8 Land    
#>  8       9      9 8.32e 7    78102.              9                9 Land    
#>  9      10     10 8.66e10  2431778.             10               10 Ice free
#> 10      11     11 4.18e 7    26337.             11               11 Land    
#> # ... with 77 more rows, and 62 more variables: REGION <chr>, DATE_CARTE <chr>,
#> #   SOURCE <chr>, MOD <chr>, EGG_ID <int>, PNT_TYPE <int>, EGG_NAME <chr>,
#> #   EGG_SCALE <int>, EGG_ATTR <chr>, USER_ATTR <chr>, ROTATION <int>,
#> #   E_CT <chr>, E_CA <chr>, E_CB <chr>, E_CC <chr>, E_CD <chr>, E_SO <chr>,
#> #   E_SA <chr>, E_SB <chr>, E_SC <chr>, E_SD <chr>, E_SE <chr>, E_FA <chr>,
#> #   E_FB <chr>, E_FC <chr>, E_FD <chr>, E_FE <chr>, E_CS <chr>, R_CT <chr>,
#> #   R_CMY <chr>, R_CSY <chr>, R_CFY <chr>, R_CGW <chr>, R_CG <chr>, R_CN <chr>,
#> #   R_PMY <chr>, R_PSY <chr>, R_PFY <chr>, R_PGW <chr>, R_PG <chr>, R_PN <chr>,
#> #   R_CS <chr>, R_SMY <chr>, R_SSY <chr>, R_SFY <chr>, R_SGW <chr>, R_SG <chr>,
#> #   R_SN <chr>, N_CT <chr>, N_COI <chr>, N_CMY <chr>, N_CSY <chr>, N_CFY <chr>,
#> #   N_CFY_TK <chr>, N_CFY_M <chr>, N_CFY_TN <chr>, N_CYI <chr>, N_CGW <chr>,
#> #   N_CG <chr>, N_CN <chr>, N_CB <chr>, geometry <POINT [m]>
```
