# Extract data for Torchwood

# Packages ----

library(tidyverse)


# Extract tables from url ----

# set url
url <- "https://en.wikipedia.org/wiki/List_of_Torchwood_episodes"

# read the HTML code from the website
webpage <- rvest::read_html(url)

# use CSS selectors to scrape the table and convert to data frames
tables <- rvest::html_nodes(webpage, "table.wikitable") %>%
  rvest::html_table(header = TRUE, na.strings = c(NA, ""), convert = TRUE)

rm(url, webpage)

# Season 01 ----

s01 <- tables[[2]]

names(s01) <- c("story_number", "episode_number", "episode_title",
                 "director", "writer", "first_aired", "production_code",
                 "uk_viewers")

s01_episodes <- s01 %>%
  select(story_number:episode_title, first_aired:uk_viewers) %>%
  mutate(season_number = 1,
         serial_title = NA,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         production_code = as.character(production_code),
         duration = c(50, 48, 48, 50, 50, 50, 50, 53, 49, 50, 50, 50, 50)) %>%
  select(season_number, serial_title, story_number, episode_number,
         episode_title, everything())


s01_directors <- s01 %>%
  select(story_number,director)

s01_writers <- s01 %>%
  select(story_number, writer) %>%
  separate(writer, c("writer1", "writer2"), " & ") %>%
  pivot_longer(!story_number, names_to = "writer_name", values_drop_na = TRUE) %>%
  select(story_number, writer = value)

rm(s01, url, webpage)

# Season 02 ----

s02 <- tables[[3]]

names(s02) <- c("story_number", "episode_number", "episode_title",
                "director", "writer", "first_aired", "production_code",
                "uk_viewers")

s02_episodes <- s02 %>%
  select(story_number:episode_title, first_aired:uk_viewers) %>%
  mutate(season_number = 2,
         serial_title = NA,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         production_code = as.character(production_code),
         duration = c(50, 50, 50, 50, 50, 50, 50, 50, 50, 45, 50, 50, 50)) %>%
  select(season_number, serial_title, story_number, episode_number,
         episode_title, everything())


s02_directors <- s02 %>%
  select(story_number,director)

s02_writers <- s02 %>%
  select(story_number,writer)

torchwood_episodes <- rbind(s01_episodes, s02_episodes)
torchwood_directors <- rbind(s01_directors, s02_directors)
torchwood_writers <- rbind(s01_writers, s02_writers)

rm(s01_directors, s01_episodes, s01_writers,
   s02, s02_directors, s02_episodes, s02_writers)

# Season 03 ----

s03 <- tables[[4]]

names(s03) <- c("story_number", "episode_number", "episode_title",
                "director", "writer", "first_aired", "production_code",
                "uk_viewers")

s03_episodes <- s03 %>%
  select(story_number:episode_title, first_aired:uk_viewers) %>%
  mutate(season_number = 3,
         serial_title = "Children of Earth",
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         production_code = as.character(production_code),
         duration = c(60, 60, 60, 60, 60)) %>%
  select(season_number, serial_title, story_number, episode_number,
         episode_title, everything())


s03_directors <- s03 %>%
  select(story_number,director)

s03_writers <- s03 %>%
  select(story_number, writer) %>%
  separate(writer, c("writer1", "writer2"), " & ") %>%
  pivot_longer(!story_number, names_to = "writer_name", values_drop_na = TRUE) %>%
  select(story_number, writer = value)

torchwood_episodes <- rbind(torchwood_episodes, s03_episodes)
torchwood_directors <- rbind(torchwood_directors, s03_directors)
torchwood_writers <- rbind(torchwood_writers, s03_writers)

rm(s03_directors, s03_episodes, s03_writers, s03)

# Season 04 ----

s04 <- tables[[5]]

names(s04) <- c("story_number", "episode_number", "episode_title",
                "director", "writer", "first_aired", "production_code",
                "uk_viewers")

s04_episodes <- s04 %>%
  select(story_number:episode_title, first_aired:uk_viewers) %>%
  mutate(season_number = 4,
         serial_title = "Miracle Day",
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         production_code = as.character(production_code),
         duration = c(50, 50, 50, 50, 55, 50, 55, 55, 55, 55)) %>%
  select(season_number, serial_title, story_number, episode_number,
         episode_title, everything()) %>%
  separate(uk_viewers, c("uk", "us"), " / ") %>%
  mutate(uk_air_date = first_aired + 6) %>%
  select(-first_aired) %>%
  select(season_number:episode_title, first_aired = uk_air_date, production_code, uk_viewers = uk, duration)


s04_directors <- s04 %>%
  select(story_number,director)

s04_writers <- s04 %>%
  select(story_number, writer) %>%
  separate(writer, c("writer1", "writer2"), " & ") %>%
  pivot_longer(!story_number, names_to = "writer_name", values_drop_na = TRUE) %>%
  select(story_number, writer = value)

torchwood_episodes <- rbind(torchwood_episodes, s04_episodes)
torchwood_directors <- rbind(torchwood_directors, s04_directors)
torchwood_writers <- rbind(torchwood_writers, s04_writers)

rm(s04_directors, s04_episodes, s04_writers, s04)
rm(tables)

# Set variable types ----

torchwood_episodes <- torchwood_episodes %>%
  mutate(uk_viewers = as.numeric(uk_viewers))
