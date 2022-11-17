
<!-- README.md is generated from README.Rmd. Please edit that file -->

# cathystat545

<!-- badges: start -->
<!-- badges: end -->

The goal of cathystat545 is to calculate the frequency of each level in
a factor-type column of a data frame and report the most frequently
occurring level.

## Installation

You can install the development version of cathystat545 from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("stat545ubc-2022/assignment-b1-and-b2-cathy-y")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(cathystat545)
#> Loading required package: dplyr
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union

sample_df <- data.frame("cake" = c("red velvet", "red velvet", "vanilla", "chocolate", "red velvet", "red velvet"),
                        "client" = c("client 1", "client 1", "client 2", "client 2", "client 3", "client 3"),
                        "cost" = c(12, 12, 14.50, 10.25, 12, 12))
sample_df$cake <- as.factor(sample_df$cake)

most_frequent(sample_df, "cake")
#> [1] "red velvet"
```
