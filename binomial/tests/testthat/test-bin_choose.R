setwd("/Users/suizhengyi/Desktop/C133/workout03/binomial")
n <- 10
k <- 2
k1 <- 12
k2 <- -2

source("R/binomial.R")

context("Test the bin_choose")


test_that("bin_choose", {
  expect_equal(bin_choose(n, k), choose(n, k))
  expect_error(bin_choose(n, k1))
  expect_error(bin_choose(n, k2))
})

# library(testthat)
# test_file("tests/testthat/test-bin_choose.R")
