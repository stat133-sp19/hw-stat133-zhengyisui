setwd("/Users/suizhengyi/Desktop/C133/workout03/binomial")
trial <- 10
prob <- 0.5


source("R/binomial.R")

context("Test the aux_variance")


test_that("aux_variance", {
  expect_equal(aux_variance(trial, prob), trial*prob*(1-prob))
  expect_gte(aux_variance(trial, prob), 0)
  expect_lte(aux_variance(trial, prob), trial)
})

# library(testthat)
# test_file("tests/testthat/test-aux_variance.R")
