setwd("/Users/suizhengyi/Desktop/C133/workout03/binomial")
trials <- 10
prob <- 0.3
dis <- bin_distribution(trials, prob)

source("R/binomial.R")

context("Test the bin_distribution")


test_that("bin_distribution", {
  expect_s3_class(dis, "data.frame")
  expect_s3_class(dis, "bindis")
  expect_equal(dis$probability, dbinom(0:trials, trials, prob))
})

# library(testthat)
# test_file("tests/testthat/test-bin_distribution.R")
