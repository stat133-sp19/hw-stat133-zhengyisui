setwd("/Users/suizhengyi/Desktop/C133/workout03/binomial")
trial <- 10
prob <- 0.5

source("R/binomial.R")

context("Test the aux_kurtosis")


test_that("aux_kurtosis", {
  expect_equal(aux_kurtosis(trial, prob), (1-6*prob*(1-prob))/(trial*prob*(1-prob)))
  expect_lte(aux_kurtosis(trial, prob), (1-6*prob*(1-prob))/(trial*prob*(1-prob)))
  expect_gte(aux_kurtosis(trial, prob), (1-6*prob*(1-prob))/(trial*prob*(1-prob)))
})

# library(testthat)
# test_file("tests/testthat/test-aux_kurtosis.R")
