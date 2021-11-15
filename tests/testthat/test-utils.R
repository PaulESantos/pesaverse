context("test-utils.R")

test_that("pesaverse packages returns character vector of package names", {
  out <- pesaverse_packages()
  expect_type(out, "character")
  expect_true("ggplot2" %in% out)
})
