setwd("/Users/suizhengyi/Desktop/C133/workout03/binomial")
trial <- 10
success <- 5
success1 <- -1
success2 <- 12


source("R/binomial.R")

context("Test the validation of success")

test_that("trials", {
  expect_true(check_success(success, trial))
  expect_error(check_success(success1, trial), "invalid success value")
  expect_error(check_success(success2, trial), "invalid success value")
})

# library(testthat)
# test_file("tests/testthat/test-check_success.R")
