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
         season_number = 13,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired))) %>%
  select(era, season_number, serial_title, story_number, episode_number, episode_title, type, everything())

# Season 14 ----

s14 <- tables[[17]]

names(s14) <- c("story_number", "episode_number", "serial_title",
                "episode_title", "director", "writer", "first_aired",
                "production_code", "uk_viewers", "rating")

s14 <- s14 %>%
  mutate(era = "classic",
         season_number = 14,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired))) %>%
  select(era, season_number, serial_title, story_number, episode_number, episode_title, type, everything())

# Season 15 ----

s15 <- tables[[18]]

names(s15) <- c("story_number", "episode_number", "serial_title",
                "episode_title", "director", "writer", "first_aired",
                "production_code", "uk_viewers", "rating")

s15 <- s15 %>%
  mutate(era = "classic",
         season_number = 15,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired))) %>%
  select(era, season_number, serial_title, story_number, episode_number, episode_title, type, everything())

# Season 16 ----

s16 <- tables[[19]]

names(s16) <- c("story_number", "episode_number", "serial_title",
                "episode_title", "director", "writer", "first_aired",
                "production_code", "uk_viewers", "rating")

s16 <- s16 %>%
  mutate(era = "classic",
         season_number = 16,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired))) %>%
  select(era, season_number, serial_title, story_number, episode_number, episode_title, type, everything())

# Season 17 ----

s17 <- tables[[20]]

names(s17) <- c("story_number", "episode_number", "serial_title",
                "episode_title", "director", "writer", "first_aired",
                "production_code", "uk_viewers", "rating")

s17 <- s17 %>%
  mutate(era = "classic",
         season_number = 17,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired))) %>%
  select(era, season_number, serial_title, story_number, episode_number, episode_title, type, everything())

# Season 18 ----

s18 <- tables[[21]]

names(s18) <- c("story_number", "episode_number", "serial_title",
                "episode_title", "director", "writer", "first_aired",
                "production_code", "uk_viewers", "rating")

s18 <- s18 %>%
  mutate(era = "classic",
         season_number = 18,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired))) %>%
  select(era, season_number, serial_title, story_number, episode_number, episode_title, type, everything())

# Season 19 ----

s19 <- tables[[22]]

names(s19) <- c("story_number", "episode_number", "serial_title",
                "episode_title", "director", "writer", "first_aired",
                "production_code", "uk_viewers", "rating")

s19 <- s19 %>%
  mutate(era = "classic",
         season_number = 19,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired))) %>%
  select(era, season_number, serial_title, story_number, episode_number, episode_title, type, everything())

# Season 20 ----

s20 <- tables[[23]]

names(s20) <- c("story_number", "episode_number", "serial_title",
                "episode_title", "director", "writer", "first_aired",
                "production_code", "uk_viewers", "rating", "rem1", "rem2", "rem3")

s20 <- s20 %>%
  filter(story_number != "Special") %>%
  mutate(era = "classic",
         season_number = 20,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = c(rep("episode", 22), "special"),
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired))) %>%
  select(era, season_number, serial_title, story_number, episode_number, episode_title,
         type, director, writer, first_aired, production_code, uk_viewers, rating)

# Season 21 ----

s21a <- tables[[24]]

names(s21a) <- c("story_number", "episode_number", "serial_title",
                "episode_title", "director", "writer", "first_aired",
                "production_code", "uk_viewers", "rating")

s21a <- s21a %>%
  mutate(era = "classic",
         season_number = 21,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired))) %>%
  select(era, season_number, serial_title, story_number, episode_number, episode_title, type, everything())

s21b <- tables[[25]]

names(s21b) <- c("story_number", "episode_number", "serial_title",
                 "episode_title", "director", "writer", "first_aired",
                 "production_code", "uk_viewers", "rating")

s21b <- s21b %>%
  mutate(era = "classic",
         season_number = 21,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired))) %>%
  select(era, season_number, serial_title, story_number, episode_number, episode_title, type, everything())

s21 <- rbind(s21a, s21b)
rm(s21a, s21b)

# Season 22 ----

s22 <- tables[[26]]

names(s22) <- c("story_number", "episode_number", "serial_title",
                 "episode_title", "director", "writer", "first_aired",
                 "production_code", "uk_viewers", "rating")

s22 <- s22 %>%
  mutate(era = "classic",
         season_number = 22,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired))) %>%
  select(era, season_number, serial_title, story_number, episode_number, episode_title, type, everything())

# Season 23 ----

s23 <- tables[[27]]

names(s23) <- c("story_number", "episode_number", "serial_title",
                "episode_title", "director", "writer", "first_aired",
                "production_code", "uk_viewers", "rating")

s23 <- s23 %>%
  mutate(era = "classic",
         season_number = 23,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired))) %>%
  select(era, season_number, serial_title, story_number, episode_number, episode_title, type, everything())

# Season 24 ----

s24 <- tables[[28]]

names(s24) <- c("story_number", "episode_number", "serial_title",
                "episode_title", "director", "writer", "first_aired",
                "production_code", "uk_viewers", "rating")

s24 <- s24 %>%
  mutate(era = "classic",
         season_number = 24,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired))) %>%
  select(era, season_number, serial_title, story_number, episode_number, episode_title, type, everything())

# Season 25 ----

s25 <- tables[[29]]

names(s25) <- c("story_number", "episode_number", "serial_title",
                "episode_title", "director", "writer", "first_aired",
                "production_code", "uk_viewers", "rating")

s25 <- s25 %>%
  mutate(era = "classic",
         season_number = 25,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired))) %>%
  select(era, season_number, serial_title, story_number, episode_number, episode_title, type, everything())

# Season 26 ----

s26 <- tables[[30]]

names(s26) <- c("story_number", "episode_number", "serial_title",
                "episode_title", "director", "writer", "first_aired",
                "production_code", "uk_viewers", "rating")

s26 <- s26 %>%
  mutate(era = "classic",
         season_number = 26,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired))) %>%
  select(era, season_number, serial_title, story_number, episode_number, episode_title, type, everything())

# Television movie ----

tvm <- tables[[31]]

names(tvm) <- c("story_number", "episode_title", "director", "writer", "first_aired",
                "production_code", "uk_viewers", "rating")

tvm <- tvm %>%
  mutate(era = "classic",
         season_number = NA,
         serial_title = NA,
         episode_number = NA,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "movie",
         first_aired = as.Date("1996-05-27")) %>%
  select(era, season_number, serial_title, story_number, episode_number, episode_title, type, everything())

# Join all tables ----

episodes <- rbind(s01, s02, s03, s04, s05, s06, s07, s08, s09, s10, s11, s12,
                  s13, s14, s15, s16, s17, s18, s19, s20, s21, s22, s23, s24,
                  s25, s26, tvm)

rm(s01, s02, s03, s04, s05, s06, s07, s08, s09, s10, s11, s12,
   s13, s14, s15, s16, s17, s18, s19, s20, s21, s22, s23, s24,
   s25, s26, tvm, tables, webpage, url)


%>%
  dplyr::mutate(episode_number = ifelse(type == "special", NA, episode_number)) %>%
  dplyr::mutate(episode_number = as.numeric(episode_number),
                uk_viewers = as.numeric(uk_viewers),
                rating = as.numeric(rating))

rm(s01, s02, s03, s04, sp01, s05, s06, s07, sp02, s08, s09,
   s10, s11, s12, tables, webpage, url)
