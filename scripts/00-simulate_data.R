#### Preamble ####
# Purpose: Simulates the number of the letter A's are distributed in a book.
# Author: Aryaman Suri
# Date: 12 March 2024
# Contact: aryaman.suri@mail.utoronto.ca
# License: MIT
# Pre-requisites: R environment, `tidyverse` package
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)

#### Simulate data ####

# Ensure reproducibility of random data generation.
set.seed(123)

# Create a tibble with simulated data on the number of A's in the first 10 lines of each chapter of a book.
count_of_a_simulation <-
  tibble(
    chapter = c(rep(1, 10), rep(2, 10), rep(3, 10)),
    line = rep(1:10, 3),
    number_words_in_line = runif(min = 0, max = 15, n = 30) |> round(0),
    number_a = rpois(n = 30, lambda = 10)
  )

#### Save data ####
# Save the simulated dataset to a CSV file.
write.csv(count_of_a_simulation, "data/simulated_data/simulated_data.csv")
