#### Preamble ####
# Purpose: Downloads and saves the data from Project Gutenberg using gutenberg_download() from gutenbergr.
# Author:  Aryaman Suri
# Date: 12 March 2024 
# Contact: aryaman.suri@mail.utoronto.ca
# License: MIT
# Pre-requisites: The gutenbergr package
# Any other information needed? no.


#### Workspace setup ####
library(gutenbergr)# Load the 'gutenbergr' package
library(tidyverse)# Load the 'tidyverse' package.


#### Download data ####

# Downloads the text of Villette by Charlotte Bronte from the Project Gutenberg.
gutenberg_id_of_villette <- 9182

villette <-
  gutenberg_download(
    gutenberg_id = gutenberg_id_of_villette,
    mirror = "https://gutenberg.pglaf.org/"
  )

#### Save data ####
write_csv(villette, "data/raw_data/raw_data.csv") # Saves the raw dataset as a CSV file in the specified directory.
