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

names(s01) <- c("story_number", "episode_number", "title",
                 "director", "writer", "first_aired", "production_code",
                 "uk_viewers", "rating")

s01 <- s01 %>%
  mutate(era = "revived",
         season_number = 1,
         serial_title = NA,
         title = gsub('.*"(.*)".*', "\\1", title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired))) %>%
  select(era, season_number, serial_title, story_number, episode_number, title, type, everything())

# Season 02 ----

s02 <- tables[[4]]

names(s02) <- c("story_number", "episode_number", "title",
                "director", "writer", "first_aired", "production_code",
                "uk_viewers", "rating", "rem1", "rem2", "rem3", "rem4")

s02 <- s02 %>%
  select(story_number:rating) %>%
  filter(!story_number %in% c("Special", "Series")) %>%
  mutate(era = "revived",
         season_number = 2,
         serial_title = NA,
         title = gsub('.*"(.*)".*', "\\1", title),
         type = c("special", rep("episode", 13)),
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired))) %>%
  select(era, season_number, serial_title, story_number, episode_number, title, type, everything())

# Season 03 ----

s03 <- tables[[5]]

names(s03) <- c("story_number", "episode_number", "title",
                "director", "writer", "first_aired", "production_code",
                "uk_viewers", "rating", "rem1", "rem2", "rem3", "rem4")

s03 <- s03 %>%
  select(story_number:rating) %>%
  filter(!story_number %in% c("Special", "Series")) %>%
  mutate(era = "revived",
         season_number = 3,
         serial_title = NA,
         title = gsub('.*"(.*)".*', "\\1", title),
         type = c("special", rep("episode", 13)),
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired))) %>%
  select(era, season_number, serial_title, story_number, episode_number, title, type, everything())

# Season 04 ----

s04 <- tables[[6]]

names(s04) <- c("story_number", "episode_number", "title",
                "director", "writer", "first_aired", "production_code",
                "uk_viewers", "rating", "rem1", "rem2", "rem3", "rem4")

s04 <- s04 %>%
  select(story_number:rating) %>%
  filter(!story_number %in% c("Special", "Series")) %>%
  mutate(era = "revived",
         season_number = 4,
         serial_title = NA,
         title = gsub('.*"(.*)".*', "\\1", title),
         type = c("special", rep("episode", 13)),
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired))) %>%
  select(era, season_number, serial_title, story_number, episode_number, title, type, everything())

# Specials 01 ----

sp01 <- tables[[7]]

names(sp01) <- c("story_number", "episode_number", "title",
                "director", "writer", "first_aired", "production_code",
                "uk_viewers", "rating")

sp01 <- sp01 %>%
  select(story_number:rating) %>%
  mutate(era = "revived",
         season_number = NA,
         serial_title = NA,
         title = gsub('.*"(.*)".*', "\\1", title),
         type = "special",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired))) %>%
  select(era, season_number, serial_title, story_number, episode_number, title, type, everything())

# Season 05 ----

s05 <- tables[[8]]

names(s05) <- c("story_number", "episode_number", "title",
                "director", "writer", "first_aired", "production_code",
                "uk_viewers", "rating")

s05 <- s05 %>%
  select(story_number:rating) %>%
  mutate(era = "revived",
         season_number = 5,
         serial_title = NA,
         title = gsub('.*"(.*)".*', "\\1", title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired))) %>%
  select(era, season_number, serial_title, story_number, episode_number, title, type, everything())

# Season 06 ----

s06 <- tables[[9]]

names(s06) <- c("story_number", "episode_number", "title",
                "director", "writer", "first_aired", "production_code",
                "uk_viewers", "rating", "rem1", "rem2", "rem3", "rem4")

s06 <- s06 %>%
  select(story_number:rating) %>%
  filter(!story_number %in% c("Special", "Part 1", "Part 2")) %>%
  mutate(era = "revived",
         season_number = 6,
         serial_title = NA,
         title = gsub('.*"(.*)".*', "\\1", title),
         type = c("special", rep("episode", 13)),
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired))) %>%
  select(era, season_number, serial_title, story_number, episode_number, title, type, everything())

# Season 07 ----

s07 <- tables[[10]]

names(s07) <- c("story_number", "episode_number", "title",
                "director", "writer", "first_aired",
                "uk_viewers", "rating", "rem1", "rem2", "rem3", "rem4", "rem5")

s07 <- s07 %>%
  select(story_number:rating) %>%
  filter(!story_number %in% c("Special (2011)", "Part 1", "Special (2012)", "Part 2")) %>%
  mutate(era = "revived",
         season_number = 7,
         serial_title = NA,
         title = gsub('.*"(.*)".*', "\\1", title),
         type = c("special", rep("episode", 5), "special", rep("episode", 8)),
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         production_code = NA) %>%
  select(era, season_number, serial_title, story_number, episode_number, title, type,
         director, writer, first_aired, production_code, uk_viewers, rating)

# Specials 02 ----

sp02 <- tables[[11]]

names(sp02) <- c("story_number", "episode_number", "title",
                 "director", "writer", "first_aired",
                 "uk_viewers", "rating")

sp02 <- sp02 %>%
  select(story_number:rating) %>%
  mutate(era = "revived",
         season_number = NA,
         serial_title = NA,
         title = gsub('.*"(.*)".*', "\\1", title),
         type = "special",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         production_code = NA) %>%
  select(era, season_number, serial_title, story_number, episode_number, title, type,
         director, writer, first_aired, production_code, uk_viewers, rating)

# Season 08 ----

s08 <- tables[[12]]

names(s08) <- c("story_number", "episode_number", "title",
                 "director", "writer", "first_aired",
                 "uk_viewers", "rating")

s08 <- s08 %>%
  select(story_number:rating) %>%
  mutate(era = "revived",
         season_number = 8,
         serial_title = NA,
         title = gsub('.*"(.*)".*', "\\1", title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         production_code = NA) %>%
  select(era, season_number, serial_title, story_number, episode_number, title, type,
         director, writer, first_aired, production_code, uk_viewers, rating)

# Season 09 ----

s09 <- tables[[13]]

names(s09) <- c("story_number", "episode_number", "title",
                "director", "writer", "first_aired",
                "uk_viewers", "rating", "rem1", "rem2", "rem3", "rem4", "rem5")

s09 <- s09 %>%
  select(story_number:rating) %>%
  filter(!story_number %in% c("Special (2014)", "Series", "Special (2015)")) %>%
  mutate(era = "revived",
         season_number = 9,
         serial_title = NA,
         title = gsub('.*"(.*)".*', "\\1", title),
         type = c("special", rep("episode", 12), "special"),
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         production_code = NA) %>%
  select(era, season_number, serial_title, story_number, episode_number, title, type,
         director, writer, first_aired, production_code, uk_viewers, rating)

# Season 10 ----

s10 <- tables[[14]]

names(s10) <- c("story_number", "episode_number", "title",
                "director", "writer", "first_aired",
                "uk_viewers", "rating", "rem1", "rem2", "rem3", "rem4", "rem5")

s10 <- s10 %>%
  select(story_number:rating) %>%
  filter(!story_number %in% c("Special (2016)", "Series", "Special (2017)")) %>%
  mutate(era = "revived",
         season_number = 10,
         serial_title = NA,
         title = gsub('.*"(.*)".*', "\\1", title),
         type = c("special", rep("episode", 12), "special"),
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         production_code = NA) %>%
  select(era, season_number, serial_title, story_number, episode_number, title, type,
         director, writer, first_aired, production_code, uk_viewers, rating)

# Season 11 ----

s11 <- tables[[15]]

names(s11) <- c("story_number", "episode_number", "title",
                "director", "writer", "first_aired",
                "uk_viewers", "rating", "rem1", "rem2", "rem3", "rem4", "rem5")

s11 <- s11 %>%
  select(story_number:rating) %>%
  filter(!story_number %in% c("Special")) %>%
  mutate(era = "revived",
         season_number = 11,
         serial_title = NA,
         title = gsub('.*"(.*)".*', "\\1", title),
         type = c(rep("episode", 10), "special"),
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         production_code = NA) %>%
  select(era, season_number, serial_title, story_number, episode_number, title, type,
         director, writer, first_aired, production_code, uk_viewers, rating)

# Season 12 ----

s12 <- tables[[16]]

names(s12) <- c("story_number", "episode_number", "title",
                "director", "writer", "first_aired",
                "uk_viewers", "rating", "rem1", "rem2", "rem3", "rem4", "rem5")

s12 <- s12 %>%
  select(story_number:rating) %>%
  filter(!story_number %in% c("Special")) %>%
  mutate(era = "revived",
         season_number = 12,
         serial_title = NA,
         title = gsub('.*"(.*)".*', "\\1", title),
         type = c(rep("episode", 10), "special"),
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         production_code = NA) %>%
  select(era, season_number, serial_title, story_number, episode_number, title, type,
         director, writer, first_aired, production_code, uk_viewers, rating)

# Join all tables ----

episodes <- rbind(s01, s02, s03, s04, sp01, s05, s06, s07, sp02, s08, s09,
                  s10, s11, s12) %>%
  dplyr::mutate(episode_number = ifelse(type == "special", NA, episode_number)) %>%
  dplyr::mutate(episode_number = as.numeric(episode_number),
                uk_viewers = as.numeric(uk_viewers),
                rating = as.numeric(rating))

rm(s01, s02, s03, s04, sp01, s05, s06, s07, sp02, s08, s09,
   s10, s11, s12, tables, webpage, url)
