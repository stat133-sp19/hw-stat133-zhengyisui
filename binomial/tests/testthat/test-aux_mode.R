setwd("/Users/suizhengyi/Desktop/C133/workout03/binomial")
trial <- 10
prob <- 0.5

source("R/binomial.R")

context("Test the aux_mode")

test_that("aux_mode", {
  expect_equal(aux_mode(trial, prob), floor(trial*prob + prob))
  expect_gte(aux_mode(trial, prob), 0)
  expect_lte(aux_mode(trial, prob), trial)
})

# library(testthat)
# test_file("tests/testthat/test-aux_mode.R")
