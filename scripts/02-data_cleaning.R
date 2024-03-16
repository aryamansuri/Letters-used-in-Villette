#### Preamble ####
# Purpose: Cleans the raw data from the raw_data.csv and filters out the relevant text of the book and also inclusdes a line basis count of the number of A's.
# Author: Aryaman Suri
# Date: 12 March 2024 
# Contact: aryaman.suri@mail.utoronto.ca
# License: MIT
# Pre-requisites: The 'tidyverse' package.
# Any other information needed? no.

#### Workspace setup ####
library(tidyverse) # Load the 'tidyverse' package.

#### Clean data ####
# Load the raw data from a CSV file.
raw_data <- read_csv(
  "data/raw_data/raw_data.csv",
  col_types = cols(
    gutenberg_id = col_integer(), # adding the id of the book to each row
    text = col_character()
  )
)


# Clean and prepare the data from the first 10 lines of each chapter for analysis.
cleaned_data <-
  raw_data |>
  filter(!is.na(text)) |> # Remove empty lines
  mutate(chapter = if_else(str_detect(text, "CHAPTER") == TRUE,
                           text,
                           NA_character_)) |> # Find start of chapter
  fill(chapter, .direction = "down") |> 
  mutate(chapter_line = row_number(), 
         .by = chapter) |> # Include a line number for each chapter
  filter(!is.na(chapter), 
         chapter_line %in% c(2:11)) |> 
  select(text, chapter) |>
  mutate( # Filter the chapter column to include only the number
    chapter = str_remove(chapter, "CHAPTER "), 
    chapter = str_remove(chapter, "—CONCLUSION"),
    chapter = str_replace_all(chapter, fixed("."), ""), # Remove the '.' after each roman numeral
    chapter = as.integer(as.roman(chapter))
  ) |> # Change chapters to integers
  mutate(count_a = str_count(text, "a|A"), # Counts the number of A's in each line
         word_count = str_count(text, "\\w+")
  ) 

#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv") # Save the filtered data to a new CSV file for analysis.
