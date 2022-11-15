#' Identify the most frequently occurring item
#' 
#' This function calculates the frequency of occurrence of each factor level within a column of a data frame and returns the level that occurs most frequently.
#' 
#' @param df a dataframe with at least one column that's a factor; named after the common abbreviation for dataframe
#' @param factor the name of the column that is the factor to be counted; named for its data type
#' 
#' @return returns the name of the most frequently occurring factor level. If there is a tie, it returns both (or more) of the factor levels.
#' 
#' @import dplyr magrittr
#' 
#' @examples 
#' sample_df <- data.frame("cake" = c("red velvet", "red velvet", "vanilla", 
#'                                    "chocolate", "red velvet", "red velvet"),
#' "client" = c("client 1", "client 1", "client 2", "client 2", "client 3", "client 3"),
#' "cost" = c(12, 12, 14.50, 10.25, 12, 12))
#' sample_df$client <- as.factor(sample_df$client)
#' sample_df$cake <- as.factor(sample_df$cake)
#' most_frequent(sample_df, "client")
#' most_frequent(sample_df, "cake")
#' 
#' @export

most_frequent <- function(df, factor){
  stopifnot(is.factor(df[,factor]))
  
  tallied <- df %>%
    dplyr::group_by_at(dplyr::all_of(factor)) %>%
    dplyr::summarize(count = dplyr::n()) %>%
    dplyr::filter(count == max(count)) %>%
    dplyr::select(factor) %>%
    dplyr::pull() %>%
    as.character()
  
  output <- tallied
  return(output)
}