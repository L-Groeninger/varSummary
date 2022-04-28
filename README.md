
<!-- README.md is generated from README.Rmd. Please edit that file -->

# varSummary

<!-- badges: start -->
<!-- badges: end -->

The goal of varSummary is to create a named variable summary for
dataframes

## Installation

You can install the development version of varSummary like so:

``` r
# install.packages("devtools")
devtools::install_github("L-Groeninger/varSummary")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(varSummary)
## basic example code
```

``` r
datafile <- system.file("penguins.RDS", package = "varSummary")
penguins <- readRDS(datafile)


tbl(penguins, starts_with("bill"))
#> $bill_length_mm
#> # A tibble: 165 x 5
#>    bill_length_mm     n percent valid_percent cum_percent
#>             <dbl> <int>   <dbl>         <dbl>       <dbl>
#>  1           41.1     7  0.0203        0.0205      0.0203
#>  2           45.2     6  0.0174        0.0175      0.0378
#>  3           37.8     5  0.0145        0.0146      0.0523
#>  4           39.6     5  0.0145        0.0146      0.0669
#>  5           45.5     5  0.0145        0.0146      0.0814
#>  6           46.2     5  0.0145        0.0146      0.0959
#>  7           46.5     5  0.0145        0.0146      0.110 
#>  8           50       5  0.0145        0.0146      0.125 
#>  9           50.5     5  0.0145        0.0146      0.140 
#> 10           36       4  0.0116        0.0117      0.151 
#> # ... with 155 more rows
#> 
#> $bill_depth_mm
#> # A tibble: 81 x 5
#>    bill_depth_mm     n percent valid_percent cum_percent
#>            <dbl> <int>   <dbl>         <dbl>       <dbl>
#>  1          17      12  0.0349        0.0351      0.0349
#>  2          15      10  0.0291        0.0292      0.0640
#>  3          17.9    10  0.0291        0.0292      0.0930
#>  4          18.5    10  0.0291        0.0292      0.122 
#>  5          18.6    10  0.0291        0.0292      0.151 
#>  6          17.3     9  0.0262        0.0263      0.177 
#>  7          17.8     9  0.0262        0.0263      0.203 
#>  8          18.1     9  0.0262        0.0263      0.230 
#>  9          18.9     9  0.0262        0.0263      0.256 
#> 10          19       9  0.0262        0.0263      0.282 
#> # ... with 71 more rows

tbl(penguins, ends_with("_mm"))
#> $bill_length_mm
#> # A tibble: 165 x 5
#>    bill_length_mm     n percent valid_percent cum_percent
#>             <dbl> <int>   <dbl>         <dbl>       <dbl>
#>  1           41.1     7  0.0203        0.0205      0.0203
#>  2           45.2     6  0.0174        0.0175      0.0378
#>  3           37.8     5  0.0145        0.0146      0.0523
#>  4           39.6     5  0.0145        0.0146      0.0669
#>  5           45.5     5  0.0145        0.0146      0.0814
#>  6           46.2     5  0.0145        0.0146      0.0959
#>  7           46.5     5  0.0145        0.0146      0.110 
#>  8           50       5  0.0145        0.0146      0.125 
#>  9           50.5     5  0.0145        0.0146      0.140 
#> 10           36       4  0.0116        0.0117      0.151 
#> # ... with 155 more rows
#> 
#> $bill_depth_mm
#> # A tibble: 81 x 5
#>    bill_depth_mm     n percent valid_percent cum_percent
#>            <dbl> <int>   <dbl>         <dbl>       <dbl>
#>  1          17      12  0.0349        0.0351      0.0349
#>  2          15      10  0.0291        0.0292      0.0640
#>  3          17.9    10  0.0291        0.0292      0.0930
#>  4          18.5    10  0.0291        0.0292      0.122 
#>  5          18.6    10  0.0291        0.0292      0.151 
#>  6          17.3     9  0.0262        0.0263      0.177 
#>  7          17.8     9  0.0262        0.0263      0.203 
#>  8          18.1     9  0.0262        0.0263      0.230 
#>  9          18.9     9  0.0262        0.0263      0.256 
#> 10          19       9  0.0262        0.0263      0.282 
#> # ... with 71 more rows
#> 
#> $flipper_length_mm
#> # A tibble: 56 x 5
#>    flipper_length_mm     n percent valid_percent cum_percent
#>                <int> <int>   <dbl>         <dbl>       <dbl>
#>  1               190    22  0.0640        0.0643      0.0640
#>  2               195    17  0.0494        0.0497      0.113 
#>  3               187    16  0.0465        0.0468      0.160 
#>  4               193    15  0.0436        0.0439      0.203 
#>  5               210    14  0.0407        0.0409      0.244 
#>  6               191    13  0.0378        0.0380      0.282 
#>  7               215    12  0.0349        0.0351      0.317 
#>  8               196    10  0.0291        0.0292      0.346 
#>  9               197    10  0.0291        0.0292      0.375 
#> 10               185     9  0.0262        0.0263      0.401 
#> # ... with 46 more rows

tbl(penguins, c(island, sex, species))
#> $island
#> # A tibble: 3 x 4
#>   island        n percent cum_percent
#>   <fct>     <int>   <dbl>       <dbl>
#> 1 Biscoe      168   0.488       0.488
#> 2 Dream       124   0.360       0.849
#> 3 Torgersen    52   0.151       1    
#> 
#> $sex
#> # A tibble: 3 x 5
#>   sex        n percent valid_percent cum_percent
#>   <fct>  <int>   <dbl>         <dbl>       <dbl>
#> 1 male     168  0.488          0.505       0.488
#> 2 female   165  0.480          0.495       0.968
#> 3 <NA>      11  0.0320        NA           1    
#> 
#> $species
#> # A tibble: 3 x 4
#>   species       n percent cum_percent
#>   <fct>     <int>   <dbl>       <dbl>
#> 1 Adelie      152   0.442       0.442
#> 2 Gentoo      124   0.360       0.802
#> 3 Chinstrap    68   0.198       1
```
