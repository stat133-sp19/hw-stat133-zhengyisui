setwd("/Users/suizhengyi/Desktop/C133/workout03/binomial")
trials <- 10
success <- 3
success1 <- c(3,5)
success2 <- 12
prob <- 0.3

source("R/binomial.R")

context("Test the bin_probability")


test_that("bin_probability", {
  expect_equal(bin_probability(success, trials, prob), dbinom(success, trials, prob))
  expect_length(bin_probability(success1, trials, prob), length(success1))
  expect_error(bin_probability(success2, trials, prob))
})

# library(testthat)
# test_file("tests/testthat/test-bin_probability.R")
