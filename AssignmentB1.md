Assignment B1
================
Cathy Yan
2022-10-31

## Tasks 1 and 2

``` r
#' Identify the most frequently occurring item
#' 
#' This function calculates the frequency of occurrence of each factor level within a column of a data frame and returns the level that occurs most frequently.
#' 
#' @param df a dataframe with at least one column that's a factor; named after the common abbreviation for dataframe
#' @param factor the name of the column that is the factor to be counted; named for its data type
#' 
#' @return returns the name of the most frequently occurring factor level. If there is a tie, it returns both (or more) of the factor levels. 

most_frequent <- function(df, factor){
  stopifnot(is.factor(df[,factor]))
  
  tallied <- df %>%
    group_by_at(all_of(factor)) %>%
    summarize(count = n()) %>%
    filter(count == max(count)) %>%
    select(factor) %>%
    pull() %>%
    as.character()
  
  output <- tallied
  return(output)
}
```

## Task 3

Using the `fish_encounters` dataset, I can output the most prolific
stations:

``` r
fish_encounters <- as.data.frame(fish_encounters)
fish_encounters$station <- as.factor(fish_encounters$station)

most_frequent_station <- most_frequent(fish_encounters, "station")
```

    ## Note: Using an external vector in selections is ambiguous.
    ## ℹ Use `all_of(factor)` instead of `factor` to silence this message.
    ## ℹ See <https://tidyselect.r-lib.org/reference/faq-external-vector.html>.
    ## This message is displayed once per session.

``` r
print(levels(fish_encounters$station)) # all stations
```

    ##  [1] "Release" "I80_1"   "Lisbon"  "Rstr"    "Base_TD" "BCE"     "BCW"    
    ##  [8] "BCE2"    "BCW2"    "MAE"     "MAW"

``` r
print(most_frequent_station) # most prolific stations
```

    ## [1] "Release" "I80_1"

Using the `iris` dataset, where all three species occur at the same
frequency:

``` r
most_frequent_iris <- most_frequent(iris, "Species")
print(most_frequent_iris)
```

    ## [1] "setosa"     "versicolor" "virginica"

Using the `mtcars` dataset, I can demonstrate that the function does not
work if the data type is not a factor:

``` r
most_frequent_disp <- most_frequent(mtcars, "disp")
```

    ## Error in most_frequent(mtcars, "disp"): is.factor(df[, factor]) is not TRUE

## Task 4

I will create a small dataset to test how my function performs when:

1.  There is one item that occurs most frequently
2.  All items occur in equal frequencies
3.  The column is not a factor

``` r
sample_df <- data.frame("cake" = c("red velvet", "red velvet", "vanilla", "chocolate", "red velvet", "red velvet"),
                        "client" = c("client 1", "client 1", "client 2", "client 2", "client 3", "client 3"),
                        "cost" = c(12, 12, 14.50, 10.25, 12, 12))
sample_df$cake <- as.factor(sample_df$cake)
sample_df$client <- as.factor(sample_df$client)

tests <- test_that("Testing frequency function", {
  expect_equal(most_frequent(sample_df, "cake"), "red velvet")
  expect_equal(most_frequent(sample_df, "client"), c("client 1", "client 2", "client 3"))
  expect_error(most_frequent(sample_df, "cost"), "is.factor(df[, factor]) is not TRUE", fixed = T)
})
```

    ## Test passed 🎊
