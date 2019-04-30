setwd("/Users/suizhengyi/Desktop/C133/workout03/binomial")
trial <- 10
prob <- 0.5
prob1 <- -0.2
prob2 <- 1.5

source("R/binomial.R")

context("Test the aux_mean")

# expect_between <- function(value, lower, upper){
#   if(value >= lower & value <= upper)
#     return(TRUE)
#   else
#     return(FALSE)
# }


test_that("aux_mean", {
  expect_equal(aux_mean(trial, prob), trial*prob)
  expect_lte(aux_mean(trial, prob1), 0)
  expect_gte(aux_mean(trial, prob2), trial)
})

# library(testthat)
# test_file("tests/testthat/test-aux_mean.R")
