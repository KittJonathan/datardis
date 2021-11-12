# Extract data for complete seasons from classic era

# Packages ----

library(dplyr)
library(rvest)


# Extract tables from url ----

# set url
url <- "https://en.wikipedia.org/wiki/List_of_Doctor_Who_episodes_(1963-1989)"

# read the HTML code from the website
webpage <- rvest::read_html(url)

# use CSS selectors to scrape the table and convert to data frames
tables <- rvest::html_nodes(webpage, "table.wikitable") %>%
  rvest::html_table(header = TRUE, na.strings = c(NA, ""), convert = TRUE)

# Season 01 ----

s01 <- tables[[3]]

names(s01) <- c("story_number", "episode_number", "serial_title",
                "episode_title", "director", "writer", "first_aired",
                "production_code", "uk_viewers", "rating")

s01 <- s01 %>%
  mutate(era = "classic",
         season_number = 1,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired))) %>%
  select(era, season_number, serial_title, story_number, episode_number, episode_title, type, everything())


# Season 02 ----

s02 <- tables[[4]]

names(s02) <- c("story_number", "episode_number", "serial_title",
                "episode_title", "director", "writer", "first_aired",
                "production_code", "uk_viewers", "rating")

s02 <- s02 %>%
  mutate(era = "classic",
         season_number = 2,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired))) %>%
  select(era, season_number, serial_title, story_number, episode_number, episode_title, type, everything())

# Season 03 ----

s03 <- tables[[5]]

names(s03) <- c("story_number", "episode_number", "serial_title",
                "episode_title", "director", "writer", "first_aired",
                "production_code", "uk_viewers", "rating")

s03 <- s03 %>%
  mutate(era = "classic",
         season_number = 3,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired))) %>%
  select(era, season_number, serial_title, story_number, episode_number, episode_title, type, everything())

# Season 04 ----

s04a <- tables[[6]]

names(s04a) <- c("story_number", "episode_number", "serial_title",
                "episode_title", "director", "writer", "first_aired",
                "production_code", "uk_viewers", "rating")

s04a <- s04a %>%
  mutate(era = "classic",
         season_number = 4,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired))) %>%
  select(era, season_number, serial_title, story_number, episode_number, episode_title, type, everything())

s04b <- tables[[7]]

names(s04b) <- c("story_number", "episode_number", "serial_title",
                 "episode_title", "director", "writer", "first_aired",
                 "production_code", "uk_viewers", "rating")

s04b <- s04b %>%
  mutate(era = "classic",
         season_number = 4,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired))) %>%
  select(era, season_number, serial_title, story_number, episode_number, episode_title, type, everything())

s04 <- rbind(s04a, s04b)
rm(s04a, s04b)

# Join all tables ----

episodes <- rbind(s01, s02, s03, s04, sp01, s05, s06, s07, sp02, s08, s09,
                  s10, s11, s12) %>%
  dplyr::mutate(episode_number = ifelse(type == "special", NA, episode_number)) %>%
  dplyr::mutate(episode_number = as.numeric(episode_number),
                uk_viewers = as.numeric(uk_viewers),
                rating = as.numeric(rating))

rm(s01, s02, s03, s04, sp01, s05, s06, s07, sp02, s08, s09,
   s10, s11, s12, tables, webpage, url)
