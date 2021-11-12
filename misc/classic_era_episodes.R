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

# Season 05 ----

s05 <- tables[[8]]

names(s05) <- c("story_number", "episode_number", "serial_title",
                 "episode_title", "director", "writer", "first_aired",
                 "production_code", "uk_viewers", "rating")

s05 <- s05 %>%
  mutate(era = "classic",
         season_number = 5,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired))) %>%
  select(era, season_number, serial_title, story_number, episode_number, episode_title, type, everything())

# Season 06 ----

s06 <- tables[[9]]

names(s06) <- c("story_number", "episode_number", "serial_title",
                "episode_title", "director", "writer", "first_aired",
                "production_code", "uk_viewers", "rating")

s06 <- s06 %>%
  mutate(era = "classic",
         season_number = 6,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired))) %>%
  select(era, season_number, serial_title, story_number, episode_number, episode_title, type, everything())



# Season 07 ----

s07 <- tables[[10]]

names(s07) <- c("story_number", "episode_number", "serial_title",
                "episode_title", "director", "writer", "first_aired",
                "production_code", "uk_viewers", "rating")

s07 <- s07 %>%
  mutate(era = "classic",
         season_number = 7,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired))) %>%
  select(era, season_number, serial_title, story_number, episode_number, episode_title, type, everything())

# Season 08 ----

s08 <- tables[[11]]

names(s08) <- c("story_number", "episode_number", "serial_title",
                "episode_title", "director", "writer", "first_aired",
                "production_code", "uk_viewers", "rating")

s08 <- s08 %>%
  mutate(era = "classic",
         season_number = 8,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired))) %>%
  select(era, season_number, serial_title, story_number, episode_number, episode_title, type, everything())

# Season 09 ----

s09 <- tables[[12]]

names(s09) <- c("story_number", "episode_number", "serial_title",
                "episode_title", "director", "writer", "first_aired",
                "production_code", "uk_viewers", "rating")

s09 <- s09 %>%
  mutate(era = "classic",
         season_number = 9,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired))) %>%
  select(era, season_number, serial_title, story_number, episode_number, episode_title, type, everything())



# Season 10 ----

s10 <- tables[[13]]

names(s10) <- c("story_number", "episode_number", "serial_title",
                "episode_title", "director", "writer", "first_aired",
                "production_code", "uk_viewers", "rating")

s10 <- s10 %>%
  mutate(era = "classic",
         season_number = 10,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired))) %>%
  select(era, season_number, serial_title, story_number, episode_number, episode_title, type, everything())

# Season 11 ----

s11 <- tables[[14]]

names(s11) <- c("story_number", "episode_number", "serial_title",
                "episode_title", "director", "writer", "first_aired",
                "production_code", "uk_viewers", "rating")

s11 <- s11 %>%
  mutate(era = "classic",
         season_number = 11,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired))) %>%
  select(era, season_number, serial_title, story_number, episode_number, episode_title, type, everything())

# Season 12 ----

s12 <- tables[[15]]

names(s12) <- c("story_number", "episode_number", "serial_title",
                "episode_title", "director", "writer", "first_aired",
                "production_code", "uk_viewers", "rating")

s12 <- s12 %>%
  mutate(era = "classic",
         season_number = 12,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired))) %>%
  select(era, season_number, serial_title, story_number, episode_number, episode_title, type, everything())

# Season 13 ----

s13 <- tables[[16]]

names(s13) <- c("story_number", "episode_number", "serial_title",
                "episode_title", "director", "writer", "first_aired",
                "production_code", "uk_viewers", "rating")

s13 <- s13 %>%
  mutate(era = "classic",
         season_number = 1,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired))) %>%
  select(era, season_number, serial_title, story_number, episode_number, episode_title, type, everything())

# Join all tables ----

episodes <- rbind(s01, s02, s03, s04, sp01, s05, s06, s07, sp02, s08, s09,
                  s10, s11, s12) %>%
  dplyr::mutate(episode_number = ifelse(type == "special", NA, episode_number)) %>%
  dplyr::mutate(episode_number = as.numeric(episode_number),
                uk_viewers = as.numeric(uk_viewers),
                rating = as.numeric(rating))

rm(s01, s02, s03, s04, sp01, s05, s06, s07, sp02, s08, s09,
   s10, s11, s12, tables, webpage, url)
