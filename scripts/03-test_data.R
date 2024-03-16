#### Preamble ####
# Purpose: Tests the consistency of simulated data that counts the number of A's in each line.
# Author: Aryaman Suri
# Date: 12 March 2024 
# Contact: aryaman.suri@mail.utoronto.ca
# License: MIT
# Pre-requisites: The 'tidyverse', 'testthat'.
# Any other information needed? no.
#### Workspace setup ####
library(tidyverse) # Loads the 'tidyverse' package.
library(testthat) # Loads the 'testthat' package.

#### Test data ####
# Read in the simulated data.
analysis_data <- read_csv("data/analysis_data/analysis_data.csv")

# Test to ensure the data frame exists.
test_that("Data frame is created", {
  expect_true(exists("analysis_data"))
})

# Test that data frame contains the specific columns expected.
test_that("Data frame has correct columns", {
  expect_true(all(c("text", "chapter", "count_a", "word_count") %in% names(analysis_data)))
})

# Check the class of variables in the data frame is what we expect.
test_that("Check class", {
  expect_type(analysis_data$text, "character")
  expect_type(analysis_data$chapter, "integer")
  expect_type(analysis_data$count_a, "integer")
  expect_type(analysis_data$word_count, "integer")
})

# Check that the data frame has the exact number of rows expected 10 lines * 42 chapters = 420.
test_that("Check number of observations is correct", {
  expect_equal(nrow(analysis_data), 420)
})

# Ensure every row in the data is has no missing values.
test_that("Check complete", {
  expect_true(all(complete.cases(analysis_data)))
})
