setwd("/Users/suizhengyi/Desktop/C133/workout03/binomial")
prob <- 0.6
prob1 <- 1.2
prob2 <- c(0.3, 0.5)

source("R/binomial.R")

context("Test the probability")

test_that("probability", {
  expect_true(check_prob(prob))
  expect_error(check_prob(prob1), "p has to be a number betwen 0 and 1")
  expect_error(check_prob(prob2), "p must be of length 1")
})

# library(testthat)
# test_file("tests/testthat/test-check_prob.R")
