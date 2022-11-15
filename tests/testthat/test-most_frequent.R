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