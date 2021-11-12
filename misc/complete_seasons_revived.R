# Extract data for complete seasons from revived era

# Packages ----

library(dplyr)
library(rvest)


# Extract tables from url ----

# set url
url <- "https://en.wikipedia.org/wiki/List_of_Doctor_Who_episodes_(2005-present)"

# read the HTML code from the website
webpage <- rvest::read_html(url)

# use CSS selectors to scrape the table and convert to data frames
tables <- rvest::html_nodes(webpage, "table.wikitable") %>%
  rvest::html_table(header = TRUE, na.strings = c(NA, ""), convert = TRUE)

# Season 01 ----

s01 <- tables[[3]]

names(s01) <- c("story_number", "episode_number", "episode_title",
                 "director", "writer", "first_aired", "production_code",
                 "uk_viewers", "rating")

s01_episodes <- s01 %>%
  select(story_number:episode_title, first_aired:rating) %>%
  mutate(era = "revived",
         season_number = 1,
         serial_title = NA,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         production_code = as.character(production_code),
         duration = c(45, 44, 44, 45, 42, 45, 44, 45, 45, 45, 45, 45, 45)) %>%
  select(era, season_number, serial_title, story_number, episode_number,
         episode_title, type, everything())


s01_directors <- s01 %>%
  select(story_number,director)

s01_writers <- s01 %>%
  select(story_number, writer)

rm(s01, url, webpage)

# Season 02 ----

s02 <- tables[[4]]

names(s02) <- c("story_number", "episode_number", "episode_title",
                "director", "writer", "first_aired", "production_code",
                "uk_viewers", "rating", "rm1", "rm2", "rm3", "rm4")

s02_episodes <- s02 %>%
  filter(!story_number %in% c("Special", "Series")) %>%
  select(story_number:episode_title, first_aired:rating) %>%
  mutate(era = "revived",
         season_number = 2,
         serial_title = NA,
         episode_number = c(NA, 1:13),
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = c("special", rep("episode", 13)),
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         production_code = as.character(production_code),
         duration = c(60, rep(45, 13))) %>%
  select(era, season_number, serial_title, story_number, episode_number,
         episode_title, type, everything())


s02_directors <- s02 %>%
  filter(!story_number %in% c("Special", "Series")) %>%
  select(story_number,director)

s02_writers <- s02 %>%
  filter(!story_number %in% c("Special", "Series")) %>%
  select(story_number, writer)

rm(s02)

episodes <- rbind(s01_episodes, s02_episodes)
directors <- rbind(s01_directors, s02_directors)
writers <- rbind(s01_writers, s02_writers)

rm(s01_directors, s01_episodes, s01_writers,
   s02_directors, s02_episodes, s02_writers)

# Season 03 ----

s03 <- tables[[5]]

names(s03) <- c("story_number", "episode_number", "episode_title",
                "director", "writer", "first_aired", "production_code",
                "uk_viewers", "rating", "rm1", "rm2", "rm3", "rm4")

s03_episodes <- s03 %>%
  filter(!story_number %in% c("Special", "Series")) %>%
  select(story_number:episode_title, first_aired:rating) %>%
  mutate(era = "revived",
         season_number = 3,
         serial_title = NA,
         episode_number = c(NA, 1:13),
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = c("special", rep("episode", 13)),
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         production_code = as.character(production_code),
         duration = c(60, rep(45, 12), 52)) %>%
  select(era, season_number, serial_title, story_number, episode_number,
         episode_title, type, everything())


s03_directors <- s03 %>%
  filter(!story_number %in% c("Special", "Series")) %>%
  select(story_number,director)

s03_writers <- s03 %>%
  filter(!story_number %in% c("Special", "Series")) %>%
  select(story_number, writer)

rm(s03)

episodes <- rbind(episodes, s03_episodes)
directors <- rbind(directors, s03_directors)
writers <- rbind(writers, s03_writers)

rm(s03_directors, s03_episodes, s03_writers)

