setwd("/Users/suizhengyi/Desktop/C133/workout03/binomial")
library(testthat)
trials <- 10
prob <- 0.3
cum <- bin_cumulative(trials, prob)

source("R/binomial.R")

context("Test the bin_cumulative")


test_that("bin_cumulative", {
  expect_s3_class(cum, "data.frame")
  expect_s3_class(cum, "bincum")
  expect_equal(cum$cumulative, pbinom(0:trials, trials, prob))
})

# library(testthat)
# test_file("tests/testthat/test-bin_cumulative.R")

