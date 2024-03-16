#### Preamble ####
# Purpose: Models the relationship between the number of words and the number of A's used, using Poisson regression, implemented with the rstanarm package.
# Author: Aryaman Suri
# Date: 12 March 2024
# Contact: aryaman.suri@mail.utoronto.ca
# License: MIT
# Pre-requisites: 'tidyverse', 'rstanarm'.
# Any other information needed? no.

#### Workspace setup ####
library(tidyverse) # Loads the 'tidyverse' package.
library(rstanarm) # Loads the 'rstanarm' package.

#### Read data ####
# Reads the prepared analysis data from a CSV file.
analysis_data <- read_csv("data/analysis_data/analysis_data.csv")

### Model data ####

# Fits a Poisson regression model to the analysis data.
Villette_A_counts <-
  stan_glm(
    count_a ~ word_count, # Defines the model formula as the A count to word counts.
    data = analysis_data, # Specifies the dataset to use.
    family = poisson(link = "log"), # Use Poisson regression.
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE), 
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    seed = 123 # Sets a seed for reproducibility of the model fitting.
  )

#### Save model ####
# Saves the fitted model object for future use.
saveRDS(
  Villette_A_counts,
  file = "models/Villette_A_counts.rds"
)
