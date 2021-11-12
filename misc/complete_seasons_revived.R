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


# Season 04 ----

s04 <- tables[[6]]

names(s04) <- c("story_number", "episode_number", "episode_title",
                "director", "writer", "first_aired", "production_code",
                "uk_viewers", "rating", "rm1", "rm2", "rm3", "rm4")

s04_episodes <- s04 %>%
  filter(!story_number %in% c("Special", "Series")) %>%
  select(story_number:episode_title, first_aired:rating) %>%
  mutate(era = "revived",
         season_number = 4,
         serial_title = NA,
         episode_number = c(NA, 1:13),
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = c("special", rep("episode", 13)),
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         production_code = as.character(production_code),
         duration = c(72, 50, 50, rep(45, 8), 50, 45, 63.5)) %>%
  select(era, season_number, serial_title, story_number, episode_number,
         episode_title, type, everything())


s04_directors <- s04 %>%
  filter(!story_number %in% c("Special", "Series")) %>%
  select(story_number,director)

s04_writers <- s04 %>%
  filter(!story_number %in% c("Special", "Series")) %>%
  select(story_number, writer)

rm(s04)

episodes <- rbind(episodes, s04_episodes)
directors <- rbind(directors, s04_directors)
writers <- rbind(writers, s04_writers)

rm(s04_directors, s04_episodes, s04_writers)

# Specials ----

sp01 <- tables[[7]]

names(sp01) <- c("story_number", "episode_number", "episode_title",
                "director", "writer", "first_aired", "production_code",
                "uk_viewers", "rating")

sp01_episodes <- sp01 %>%
  filter(!story_number %in% c("Special", "Series")) %>%
  select(story_number:episode_title, first_aired:rating) %>%
  mutate(era = "revived",
         season_number = NA,
         serial_title = NA,
         episode_number = 1:5,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = c("special"),
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         production_code = as.character(production_code),
         duration = c(rep(60, 4), 75)) %>%
  select(era, season_number, serial_title, story_number, episode_number,
         episode_title, type, everything())


sp01_directors <- sp01 %>%
  filter(!story_number %in% c("Special", "Series")) %>%
  select(story_number,director)

sp01_writers <- sp01 %>%
  filter(!story_number %in% c("Special", "Series")) %>%
  select(story_number, writer) %>%
  separate(writer, c("writer1", "writer2"), " & ") %>%
  pivot_longer(!story_number, names_to = "writer_name", values_drop_na = TRUE) %>%
  select(story_number, writer = value)

rm(sp01)

episodes <- rbind(episodes, sp01_episodes)
directors <- rbind(directors, sp01_directors)
writers <- rbind(writers, sp01_writers)

rm(sp01_directors, sp01_episodes, sp01_writers)

# Season 05 ----

s05 <- tables[[8]]

names(s05) <- c("story_number", "episode_number", "episode_title",
                "director", "writer", "first_aired", "production_code",
                "uk_viewers", "rating")

s05_episodes <- s05 %>%
  filter(!story_number %in% c("Special", "Series")) %>%
  select(story_number:episode_title, first_aired:rating) %>%
  mutate(era = "revived",
         season_number = 5,
         serial_title = NA,
         episode_number = 1:13,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         production_code = as.character(production_code),
         duration = c(65, rep(45, 4), 50, rep(45, 5), 50, 55)) %>%
  select(era, season_number, serial_title, story_number, episode_number,
         episode_title, type, everything())


s05_directors <- s05 %>%
  filter(!story_number %in% c("Special", "Series")) %>%
  select(story_number,director)

s05_writers <- s05 %>%
  filter(!story_number %in% c("Special", "Series")) %>%
  select(story_number, writer)

rm(s05)

episodes <- rbind(episodes, s05_episodes)
directors <- rbind(directors, s05_directors)
writers <- rbind(writers, s05_writers)

rm(s05_directors, s05_episodes, s05_writers)
