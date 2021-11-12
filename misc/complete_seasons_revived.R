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

# Season 06 ----

s06 <- tables[[9]]

names(s06) <- c("story_number", "episode_number", "episode_title",
                "director", "writer", "first_aired", "production_code",
                "uk_viewers", "rating", "rm1", "rm2", "rm3", "rm4")

s06_episodes <- s06 %>%
  filter(!story_number %in% c("Special", "Series", "Part 1", "Part 2")) %>%
  select(story_number:episode_title, first_aired:rating) %>%
  mutate(era = "revived",
         season_number = 6,
         serial_title = NA,
         episode_number = c(NA, 1:13),
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = c("special", rep("episode", 13)),
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         production_code = as.character(production_code),
         duration = c(60, rep(45, 6), 50, 50, 45, 45, 50, 45, 45)) %>%
  select(era, season_number, serial_title, story_number, episode_number,
         episode_title, type, everything())


s06_directors <- s06 %>%
  filter(!story_number %in% c("Special", "Series")) %>%
  select(story_number,director)

s06_writers <- s06 %>%
  filter(!story_number %in% c("Special", "Series")) %>%
  select(story_number, writer)

rm(s06)

episodes <- rbind(episodes, s06_episodes)
directors <- rbind(directors, s06_directors)
writers <- rbind(writers, s06_writers)

rm(s06_directors, s06_episodes, s06_writers)

# Season 07 ----

s07 <- tables[[10]]

names(s07) <- c("story_number", "episode_number", "episode_title",
                "director", "writer", "first_aired",
                "uk_viewers", "rating", "rm1", "rm2", "rm3", "rm4", "rm5")

s07_episodes <- s07 %>%
  filter(!story_number %in% c("Special (2011)", "Special (2012)", "Series", "Part 1", "Part 2")) %>%
  select(story_number:episode_title, first_aired:rating) %>%
  mutate(era = "revived",
         season_number = 7,
         serial_title = NA,
         episode_number = c(NA, 1:5, NA, 6:13),
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = c("special", rep("episode", 5), "special", rep("episode", 8)),
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         production_code = NA,
         duration = c(60, 50, 45, 45, 41, 45, 60, 45, 44, rep(45, 6))) %>%
  select(era, season_number, serial_title, story_number, episode_number,
         episode_title, type, everything())


s07_directors <- s07 %>%
  filter(!story_number %in% c("Special (2011)", "Special (2012)", "Series", "Part 1", "Part 2")) %>%
  select(story_number,director)

s07_writers <- s07 %>%
  filter(!story_number %in% c("Special (2011)", "Special (2012)", "Series", "Part 1", "Part 2")) %>%
  select(story_number, writer)

rm(s07)

episodes <- rbind(episodes, s07_episodes)
directors <- rbind(directors, s07_directors)
writers <- rbind(writers, s07_writers)

rm(s07_directors, s07_episodes, s07_writers)

# Specials ----

sp02 <- tables[[11]]

names(sp02) <- c("story_number", "episode_number", "episode_title",
                "director", "writer", "first_aired",
                "uk_viewers", "rating")

sp02_episodes <- sp02 %>%
  select(story_number:episode_title, first_aired:rating) %>%
  mutate(era = "revived",
         season_number = NA,
         serial_title = NA,
         episode_number = 1:2,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = rep("special", 2),
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         production_code = NA,
         duration = c(77, 60)) %>%
  select(era, season_number, serial_title, story_number, episode_number,
         episode_title, type, everything())


sp02_directors <- sp02 %>%
  select(story_number,director)

sp02_writers <- sp02 %>%
  select(story_number, writer)

rm(sp02)

episodes <- rbind(episodes, sp02_episodes)
directors <- rbind(directors, sp02_directors)
writers <- rbind(writers, sp02_writers)

rm(sp02_directors, sp02_episodes, sp02_writers)

# Season 08 ----

s08 <- tables[[12]]

names(s08) <- c("story_number", "episode_number", "episode_title",
                "director", "writer", "first_aired",
                "uk_viewers", "rating")

s08_episodes <- s08 %>%
  select(story_number:episode_title, first_aired:rating) %>%
  mutate(era = "revived",
         season_number = 8,
         serial_title = NA,
         episode_number = 1:12,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         production_code = NA,
         duration = c(76, 45, 46, 48, 45, 45, 45, 47, 43, 45, 46, 57)) %>%
  select(era, season_number, serial_title, story_number, episode_number,
         episode_title, type, everything())


s08_directors <- s08 %>%
  select(story_number,director)

s08_writers <- s08 %>%
  select(story_number, writer) %>%
  separate(writer, c("writer1", "writer2"), " & ") %>%
  pivot_longer(!story_number, names_to = "writer_name", values_drop_na = TRUE) %>%
  select(story_number, writer = value)

rm(s08)

episodes <- rbind(episodes, s08_episodes)
directors <- rbind(directors, s08_directors)
writers <- rbind(writers, s08_writers)

rm(s08_directors, s08_episodes, s08_writers)
