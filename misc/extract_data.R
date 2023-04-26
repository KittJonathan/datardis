# Datardis
# Extract data from wiki tables
# Last updated 2023-04-26

# Load packages ----

library(rvest)
library(tidyverse)

# Helper functions ----

# Get tables

get_tables <- function(url) {
  url |>
    # read html
    rvest::read_html(url) |>
    # extract html nodes
    rvest::html_nodes("table.wikitable") |>
    # extract tables in list
    rvest::html_table(na.strings = c(NA, "", "TBA", "TBD"))
}

# Test: S1 data ----

tables <- get_tables("https://en.wikipedia.org/wiki/List_of_Doctor_Who_episodes_(2005-present)")

(s4 <- tables[[6]] |>
    dplyr::select(1:9) |>
    janitor::clean_names()
)

str_detect()

# set url
url <- "https://en.wikipedia.org/wiki/List_of_Doctor_Who_episodes_(2005-present)"

# use CSS selectors to scrape the table and convert to data frames
tables <- rvest::html_nodes(webpage, "table.wikitable") %>%
  rvest::html_table(header = TRUE, na.strings = c(NA, ""), convert = TRUE)

rm(url, webpage)
