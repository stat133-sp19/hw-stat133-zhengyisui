setwd("/Users/suizhengyi/Desktop/C133/workout03/binomial")
trial <- 10
trial1 <- -2
trial2 <- c(5, 10)

source("R/binomial.R")

context("Test the validation of trials")

test_that("trials", {
  expect_true(check_trials(trial))
  expect_error(check_trials(trial1), "invalid trials value")
  expect_error(check_trials(trial2), "trials must be of length 1")
})

# library(testthat)
# test_file("tests/testthat/test-check_trials.R")
