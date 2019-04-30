setwd("/Users/suizhengyi/Desktop/C133/workout03/binomial")
trial <- 10
prob <- 0.5

source("R/binomial.R")

context("Test the aux_skewness")


test_that("aux_skewness", {
  expect_equal(aux_skewness(trial, prob), (1-2*prob)/sqrt(trial*prob*(1-prob)))
  expect_lte(aux_skewness(trial, prob), (1-2*prob)/sqrt(trial*prob*(1-prob)))
  expect_gte(aux_skewness(trial, prob), (1-2*prob)/sqrt(trial*prob*(1-prob)))
})

# library(testthat)
# test_file("tests/testthat/test-aux_skewness.R")
