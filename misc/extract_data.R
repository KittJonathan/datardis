# Extract data for complete seasons from classic and revived eras

# Packages ----

library(tidyverse)


# Extract tables from urls ----

# set urls
classic_url <- "https://en.wikipedia.org/wiki/List_of_Doctor_Who_episodes_(1963-1989)"
revived_url <- "https://en.wikipedia.org/wiki/List_of_Doctor_Who_episodes_(2005-present)"

# read the HTML code from the websites
classic_webpage <- rvest::read_html(classic_url)
revived_webpage <- rvest::read_html(revived_url)

# use CSS selectors to scrape the table and convert to data frames
classic_tables <- rvest::html_nodes(classic_webpage, "table.wikitable") %>%
  rvest::html_table(header = TRUE, na.strings = c(NA, ""), convert = TRUE)

revived_tables <- rvest::html_nodes(revived_webpage, "table.wikitable") %>%
  rvest::html_table(header = TRUE, na.strings = c(NA, ""), convert = TRUE)

rm(classic_webpage, revived_webpage, classic_url, revived_url)

# Classic era - season 01 ----

classic_s01 <- classic_tables[[3]]

names(classic_s01) <- c("story_number", "episode_number", "serial_title", "episode_title",
                        "director", "writer", "first_aired", "production_code",
                        "uk_viewers", "rating")

classic_s01 <- classic_s01 %>%
  mutate(era = "classic",
         season_number = 1,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         production_code = as.character(production_code),
         duration = 25) %>%
  group_by(story_number) %>%
  mutate(episode_number = row_number()) %>%
  ungroup() %>%
  mutate(missing_episode = c(rep(0, 13), rep(1, 7), rep(0, 19), rep(1, 2), 0)) %>%
  select(era, season_number, serial_title, story_number, episode_number,
         episode_title, missing_episode, type, director, writer, first_aired,
         production_code, uk_viewers, rating, duration)

classic_s01_episodes <- classic_s01 %>%
  select(era:type, first_aired:duration)

classic_s01_directors <- classic_s01 %>%
  select(era:season_number, story_number, episode_number, director)

classic_s01_writers <- classic_s01 %>%
  select(era:season_number, story_number, episode_number, writer) %>%
  mutate(writer = str_replace(writer, "\\s*\\([^\\)]+\\)", "")) %>%
  separate(writer, c("writer1", "writer2"), " and ") %>%
  pivot_longer(!(era:episode_number), names_to = "writer_name", values_drop_na = TRUE) %>%
  select(era:episode_number, writer = value)

rm(classic_s01)

# Classic era - season 02 ----

classic_s02 <- classic_tables[[4]]

names(classic_s02) <- c("story_number", "episode_number", "serial_title", "episode_title",
                        "director", "writer", "first_aired", "production_code",
                        "uk_viewers", "rating")

classic_s02 <- classic_s02 %>%
  mutate(era = "classic",
         season_number = 2,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         production_code = as.character(production_code),
         duration = 25) %>%
  group_by(story_number) %>%
  mutate(episode_number = row_number()) %>%
  ungroup() %>%
  mutate(missing_episode = c(rep(0, 22), 1, 0, 1, rep(0, 14))) %>%
  select(era, season_number, serial_title, story_number, episode_number,
         episode_title, missing_episode, type, director, writer, first_aired,
         production_code, uk_viewers, rating, duration)

classic_s02_episodes <- classic_s02 %>%
  select(era:type, first_aired:duration)

classic_s02_directors <- classic_s02 %>%
  select(era:season_number, story_number, episode_number, director) %>%
  mutate(director = str_replace(director, "\\s*\\([^\\)]+\\)", "")) %>%
  separate(director, c("director1", "director2"), " and ") %>%
  pivot_longer(!(era:episode_number), names_to = "director_name", values_drop_na = TRUE) %>%
  select(era:episode_number, director = value)

classic_s02_writers <- classic_s02 %>%
  select(era:season_number, story_number, episode_number, writer) %>%
  mutate(writer = str_replace(writer, "\\s*\\([^\\)]+\\)", "")) %>%
  separate(writer, c("writer1", "writer2"), " and ") %>%
  pivot_longer(!(era:episode_number), names_to = "writer_name", values_drop_na = TRUE) %>%
  select(era:episode_number, writer = value)

rm(classic_s02)

# Classic era - season 03 ----

classic_s03 <- classic_tables[[5]]

names(classic_s03) <- c("story_number", "episode_number", "serial_title", "episode_title",
                        "director", "writer", "first_aired", "production_code",
                        "uk_viewers", "rating")

classic_s03 <- classic_s03 %>%
  mutate(era = "classic",
         season_number = 3,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         production_code = as.character(production_code),
         duration = 25) %>%
  group_by(story_number) %>%
  mutate(episode_number = row_number()) %>%
  ungroup() %>%
  mutate(missing_episode = c(1, 1, 0, rep(1, 7), 0, 1, 1, 0, rep(1, 4),
                             0, rep(1, 6), rep(0, 4), rep(1, 3), rep(0, 5),
                             rep(1, 4), rep(0, 4))) %>%
  select(era, season_number, serial_title, story_number, episode_number,
         episode_title, missing_episode, type, director, writer, first_aired,
         production_code, uk_viewers, rating, duration) %>%
  mutate(serial_title = case_when(story_number == 19 & episode_number == 1 ~ "Mission to the Unknown",
                                  TRUE ~ serial_title))

classic_s03_episodes <- classic_s03 %>%
  select(era:type, first_aired:duration)

classic_s03_directors <- classic_s03 %>%
  select(era:season_number, story_number, episode_number, director) %>%
  mutate(director = str_replace(director, "\\s*\\([^\\)]+\\)", "")) %>%
  separate(director, c("director1", "director2"), " and ") %>%
  pivot_longer(!(era:episode_number), names_to = "director_name", values_drop_na = TRUE) %>%
  select(era:episode_number, director = value)

classic_s03_writers <- classic_s03 %>%
  select(era:season_number, story_number, episode_number, writer) %>%
  mutate(writer = str_replace(writer, "\\s*\\([^\\)]+\\)", "")) %>%
  separate(writer, c("writer1", "writer2"), " and ") %>%
  pivot_longer(!(era:episode_number), names_to = "writer_name", values_drop_na = TRUE) %>%
  select(era:episode_number, writer = value)

rm(classic_s03)

# Classic era - season 04 ----

classic_s04a <- classic_tables[[6]]

names(classic_s04a) <- c("story_number", "episode_number", "serial_title", "episode_title",
                        "director", "writer", "first_aired", "production_code",
                        "uk_viewers", "rating")

classic_s04a <- classic_s04a %>%
  mutate(era = "classic",
         season_number = 4,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         production_code = as.character(production_code),
         duration = 25) %>%
  group_by(story_number) %>%
  mutate(episode_number = row_number()) %>%
  ungroup() %>%
  mutate(missing_episode = c(rep(1, 4), rep(0, 3), 1)) %>%
  select(era, season_number, serial_title, story_number, episode_number,
         episode_title, missing_episode, type, director, writer, first_aired,
         production_code, uk_viewers, rating, duration)

classic_s04a_episodes <- classic_s04a %>%
  select(era:type, first_aired:duration)

classic_s04a_directors <- classic_s04a %>%
  select(era:season_number, story_number, episode_number, director) %>%
  mutate(director = str_replace(director, "\\s*\\([^\\)]+\\)", "")) %>%
  separate(director, c("director1", "director2"), " and ") %>%
  pivot_longer(!(era:episode_number), names_to = "director_name", values_drop_na = TRUE) %>%
  select(era:episode_number, director = value)

classic_s04a_writers <- classic_s04a %>%
  select(era:season_number, story_number, episode_number, writer) %>%
  mutate(writer = str_replace(writer, "\\s*\\([^\\)]+\\)", "")) %>%
  separate(writer, c("writer1", "writer2"), " and ") %>%
  pivot_longer(!(era:episode_number), names_to = "writer_name", values_drop_na = TRUE) %>%
  select(era:episode_number, writer = value)

rm(classic_s04a)



classic_s04b <- classic_tables[[7]]

names(classic_s04b) <- c("story_number", "episode_number", "serial_title", "episode_title",
                         "director", "writer", "first_aired", "production_code",
                         "uk_viewers", "rating")

classic_s04b <- classic_s04b %>%
  mutate(era = "classic",
         season_number = 4,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         production_code = as.character(production_code),
         duration = 25) %>%
  group_by(story_number) %>%
  mutate(episode_number = row_number()) %>%
  ungroup() %>%
  mutate(missing_episode = c(rep(1, 11), rep(0, 2), rep(1, 2), 0, 1, 0,
                             rep(1, 4), 0, 1, 0, rep(1, 4), 0, rep(1, 5))) %>%
  select(era, season_number, serial_title, story_number, episode_number,
         episode_title, missing_episode, type, director, writer, first_aired,
         production_code, uk_viewers, rating, duration)

classic_s04b_episodes <- classic_s04b %>%
  select(era:type, first_aired:duration)

classic_s04b_directors <- classic_s04b %>%
  select(era:season_number, story_number, episode_number, director) %>%
  mutate(director = str_replace(director, "\\s*\\([^\\)]+\\)", "")) %>%
  separate(director, c("director1", "director2"), " and ") %>%
  pivot_longer(!(era:episode_number), names_to = "director_name", values_drop_na = TRUE) %>%
  select(era:episode_number, director = value)

classic_s04b_writers <- classic_s04b %>%
  select(era:season_number, story_number, episode_number, writer) %>%
  mutate(writer = str_replace(writer, "\\s*\\([^\\)]+\\)", "")) %>%
  separate(writer, c("writer1", "writer2"), " and ") %>%
  pivot_longer(!(era:episode_number), names_to = "writer_name", values_drop_na = TRUE) %>%
  select(era:episode_number, writer = value)

rm(classic_s04b)

classic_s04_episodes <- rbind(classic_s04a_episodes, classic_s04b_episodes)
classic_s04_directors <- rbind(classic_s04a_directors, classic_s04b_directors)
classic_s04_writers <- rbind(classic_s04a_writers, classic_s04b_writers)

rm(classic_s04a_directors, classic_s04a_episodes, classic_s04a_writers,
   classic_s04b_directors, classic_s04b_episodes, classic_s04b_writers)

# Classic era - season 05 ----

classic_s05 <- classic_tables[[8]]

names(classic_s05) <- c("story_number", "episode_number", "serial_title", "episode_title",
                        "director", "writer", "first_aired", "production_code",
                        "uk_viewers", "rating")

classic_s05 <- classic_s05 %>%
  mutate(era = "classic",
         season_number = 5,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         production_code = as.character(production_code),
         duration = 25) %>%
  group_by(story_number) %>%
  mutate(episode_number = row_number()) %>%
  ungroup() %>%
  mutate(missing_episode = c(rep(0, 4), 1, 0, rep(1, 4),
                             0, rep(1, 2), rep(0, 11), 1, rep(0, 3), rep(1, 8),
                             0, rep(1, 2), 1)) %>%
  select(era, season_number, serial_title, story_number, episode_number,
         episode_title, missing_episode, type, director, writer, first_aired,
         production_code, uk_viewers, rating, duration) %>%
  mutate(writer = case_when(serial_title == "The Wheel in Space" ~ "David Whitaker and Kit Pedler",
                            TRUE ~ writer))

classic_s05_episodes <- classic_s05 %>%
  select(era:type, first_aired:duration)

classic_s05_directors <- classic_s05 %>%
  select(era:season_number, story_number, episode_number, director) %>%
  mutate(director = str_replace(director, "\\s*\\([^\\)]+\\)", "")) %>%
  separate(director, c("director1", "director2"), " and ") %>%
  pivot_longer(!(era:episode_number), names_to = "director_name", values_drop_na = TRUE) %>%
  select(era:episode_number, director = value)

classic_s05_writers <- classic_s05 %>%
  select(era:season_number, story_number, episode_number, writer) %>%
  mutate(writer = str_replace(writer, "\\s*\\([^\\)]+\\)", "")) %>%
  separate(writer, c("writer1", "writer2"), " and ") %>%
  pivot_longer(!(era:episode_number), names_to = "writer_name", values_drop_na = TRUE) %>%
  select(era:episode_number, writer = value)

rm(classic_s05)

# Classic era - season 06 ----

classic_s06 <- classic_tables[[9]]

names(classic_s06) <- c("story_number", "episode_number", "serial_title", "episode_title",
                        "director", "writer", "first_aired", "production_code",
                        "uk_viewers", "rating")

classic_s06 <- classic_s06 %>%
  mutate(era = "classic",
         season_number = 6,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         production_code = as.character(production_code),
         duration = c(rep(25, 5), rep(20, 5), rep(25, 34))) %>%
  group_by(story_number) %>%
  mutate(episode_number = row_number()) %>%
  ungroup() %>%
  mutate(missing_episode = c(rep(0, 10), 1, 0, 0, 1, rep(0, 14),
                             1, 0, rep(1, 4), rep(0, 10))) %>%
  select(era, season_number, serial_title, story_number, episode_number,
         episode_title, missing_episode, type, director, writer, first_aired,
         production_code, uk_viewers, rating, duration) %>%
  mutate(episode_title = case_when(story_number == 44 & episode_number == 3 ~ "Episode 3",
                                   story_number == 46 & episode_number == 2 ~ "Episode Two",
                            TRUE ~ episode_title))

classic_s06_episodes <- classic_s06 %>%
  select(era:type, first_aired:duration)

classic_s06_directors <- classic_s06 %>%
  select(era:season_number, story_number, episode_number, director) %>%
  mutate(director = str_replace(director, "\\s*\\([^\\)]+\\)", "")) %>%
  separate(director, c("director1", "director2"), " and ") %>%
  pivot_longer(!(era:episode_number), names_to = "director_name", values_drop_na = TRUE) %>%
  select(era:episode_number, director = value)

classic_s06_writers <- classic_s06 %>%
  select(era:season_number, story_number, episode_number, writer) %>%
  mutate(writer = case_when(story_number == 44 ~ "Norman Ashby and Mervyn Haisman and Henry Lincoln",
                            story_number == 46 ~ "Derrick Sherwin and Kit Pedler",
                            TRUE ~ writer)) %>%
  mutate(writer = str_replace(writer, "\\s*\\([^\\)]+\\)", "")) %>%
  separate(writer, c("writer1", "writer2", "writer3"), " and ") %>%
  pivot_longer(!(era:episode_number), names_to = "writer_name", values_drop_na = TRUE) %>%
  select(era:episode_number, writer = value)

rm(classic_s06)

# Classic era - season 07 ----

classic_s07 <- classic_tables[[10]]

names(classic_s07) <- c("story_number", "episode_number", "serial_title", "episode_title",
                        "director", "writer", "first_aired", "production_code",
                        "uk_viewers", "rating")

classic_s07 <- classic_s07 %>%
  mutate(era = "classic",
         season_number = 7,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         production_code = as.character(production_code),
         duration = 25) %>%
  group_by(story_number) %>%
  mutate(episode_number = row_number()) %>%
  ungroup() %>%
  mutate(missing_episode = 0) %>%
  select(era, season_number, serial_title, story_number, episode_number,
         episode_title, missing_episode, type, director, writer, first_aired,
         production_code, uk_viewers, rating, duration)

classic_s07_episodes <- classic_s07 %>%
  select(era:type, first_aired:duration)

classic_s07_directors <- classic_s07 %>%
  select(era:season_number, story_number, episode_number, director) %>%
  mutate(director = str_replace(director, "\\s*\\([^\\)]+\\)", "")) %>%
  separate(director, c("director1", "director2"), " and ") %>%
  pivot_longer(!(era:episode_number), names_to = "director_name", values_drop_na = TRUE) %>%
  select(era:episode_number, director = value)

classic_s07_writers <- classic_s07 %>%
  select(era:season_number, story_number, episode_number, writer) %>%
  mutate(writer = case_when(story_number == 53 & episode_number != 1 ~ "David Whitaker and Malcolm Hulke and Terrance Dicks",
                            TRUE ~ writer)) %>%
  mutate(writer = str_replace(writer, "\\s*\\([^\\)]+\\)", "")) %>%
  separate(writer, c("writer1", "writer2", "writer3"), " and ") %>%
  pivot_longer(!(era:episode_number), names_to = "writer_name", values_drop_na = TRUE) %>%
  select(era:episode_number, writer = value)

rm(classic_s07)

# Classic era - season 08 ----

classic_s08 <- classic_tables[[11]]

names(classic_s08) <- c("story_number", "episode_number", "serial_title", "episode_title",
                        "director", "writer", "first_aired", "production_code",
                        "uk_viewers", "rating")

classic_s08 <- classic_s08 %>%
  mutate(era = "classic",
         season_number = 8,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         production_code = as.character(production_code),
         duration = 25) %>%
  group_by(story_number) %>%
  mutate(episode_number = row_number()) %>%
  ungroup() %>%
  mutate(missing_episode = 0) %>%
  select(era, season_number, serial_title, story_number, episode_number,
         episode_title, missing_episode, type, director, writer, first_aired,
         production_code, uk_viewers, rating, duration)

classic_s08_episodes <- classic_s08 %>%
  select(era:type, first_aired:duration)

classic_s08_directors <- classic_s08 %>%
  select(era:season_number, story_number, episode_number, director) %>%
  mutate(director = str_replace(director, "\\s*\\([^\\)]+\\)", "")) %>%
  separate(director, c("director1", "director2"), " and ") %>%
  pivot_longer(!(era:episode_number), names_to = "director_name", values_drop_na = TRUE) %>%
  select(era:episode_number, director = value)

classic_s08_writers <- classic_s08 %>%
  select(era:season_number, story_number, episode_number, writer) %>%
  mutate(writer = case_when(story_number == 59 ~ "Guy Leopold and Robert Sloman and Barry Letts",
                            TRUE ~ writer)) %>%
  mutate(writer = str_replace(writer, "\\s*\\([^\\)]+\\)", "")) %>%
  separate(writer, c("writer1", "writer2", "writer3"), " and ") %>%
  pivot_longer(!(era:episode_number), names_to = "writer_name", values_drop_na = TRUE) %>%
  select(era:episode_number, writer = value)

rm(classic_s08)

# Classic era - season 09 ----

classic_s09 <- classic_tables[[12]]

names(classic_s09) <- c("story_number", "episode_number", "serial_title", "episode_title",
                        "director", "writer", "first_aired", "production_code",
                        "uk_viewers", "rating")

classic_s09 <- classic_s09 %>%
  mutate(era = "classic",
         season_number = 9,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         production_code = as.character(production_code),
         duration = 25) %>%
  group_by(story_number) %>%
  mutate(episode_number = row_number()) %>%
  ungroup() %>%
  mutate(missing_episode = 0) %>%
  select(era, season_number, serial_title, story_number, episode_number,
         episode_title, missing_episode, type, director, writer, first_aired,
         production_code, uk_viewers, rating, duration)

classic_s09_episodes <- classic_s09 %>%
  select(era:type, first_aired:duration)

classic_s09_directors <- classic_s09 %>%
  select(era:season_number, story_number, episode_number, director) %>%
  mutate(director = str_replace(director, "\\s*\\([^\\)]+\\)", "")) %>%
  separate(director, c("director1", "director2"), " and ") %>%
  pivot_longer(!(era:episode_number), names_to = "director_name", values_drop_na = TRUE) %>%
  select(era:episode_number, director = value)

classic_s09_writers <- classic_s09 %>%
  select(era:season_number, story_number, episode_number, writer) %>%
  mutate(writer = str_replace(writer, "\\s*\\([^\\)]+\\)", "")) %>%
  separate(writer, c("writer1", "writer2"), " and ") %>%
  pivot_longer(!(era:episode_number), names_to = "writer_name", values_drop_na = TRUE) %>%
  select(era:episode_number, writer = value)

rm(classic_s09)

# Classic era - season 10 ----

classic_s10 <- classic_tables[[13]]

names(classic_s10) <- c("story_number", "episode_number", "serial_title", "episode_title",
                        "director", "writer", "first_aired", "production_code",
                        "uk_viewers", "rating")

classic_s10 <- classic_s10 %>%
  mutate(era = "classic",
         season_number = 10,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         production_code = as.character(production_code),
         duration = 25) %>%
  group_by(story_number) %>%
  mutate(episode_number = row_number()) %>%
  ungroup() %>%
  mutate(missing_episode = 0) %>%
  select(era, season_number, serial_title, story_number, episode_number,
         episode_title, missing_episode, type, director, writer, first_aired,
         production_code, uk_viewers, rating, duration)

classic_s10_episodes <- classic_s10 %>%
  select(era:type, first_aired:duration)

classic_s10_directors <- classic_s10 %>%
  select(era:season_number, story_number, episode_number, director) %>%
  mutate(director = str_replace(director, "\\s*\\([^\\)]+\\)", "")) %>%
  separate(director, c("director1", "director2"), " and ") %>%
  pivot_longer(!(era:episode_number), names_to = "director_name", values_drop_na = TRUE) %>%
  select(era:episode_number, director = value)

classic_s10_writers <- classic_s10 %>%
  select(era:season_number, story_number, episode_number, writer) %>%
  mutate(writer = str_replace(writer, "\\s*\\([^\\)]+\\)", "")) %>%
  separate(writer, c("writer1", "writer2"), " and ") %>%
  pivot_longer(!(era:episode_number), names_to = "writer_name", values_drop_na = TRUE) %>%
  select(era:episode_number, writer = value)

rm(classic_s10)

# Classic era - season 11 ----

classic_s11 <- classic_tables[[14]]

names(classic_s11) <- c("story_number", "episode_number", "serial_title", "episode_title",
                        "director", "writer", "first_aired", "production_code",
                        "uk_viewers", "rating")

classic_s11 <- classic_s11 %>%
  mutate(era = "classic",
         season_number = 11,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         production_code = as.character(production_code),
         duration = 25) %>%
  group_by(story_number) %>%
  mutate(episode_number = row_number()) %>%
  ungroup() %>%
  mutate(missing_episode = 0) %>%
  select(era, season_number, serial_title, story_number, episode_number,
         episode_title, missing_episode, type, director, writer, first_aired,
         production_code, uk_viewers, rating, duration)

classic_s11_episodes <- classic_s11 %>%
  select(era:type, first_aired:duration)

classic_s11_directors <- classic_s11 %>%
  select(era:season_number, story_number, episode_number, director) %>%
  mutate(director = str_replace(director, "\\s*\\([^\\)]+\\)", "")) %>%
  separate(director, c("director1", "director2"), " and ") %>%
  pivot_longer(!(era:episode_number), names_to = "director_name", values_drop_na = TRUE) %>%
  select(era:episode_number, director = value)

classic_s11_writers <- classic_s11 %>%
  select(era:season_number, story_number, episode_number, writer) %>%
  mutate(writer = str_replace(writer, "\\s*\\([^\\)]+\\)", "")) %>%
  separate(writer, c("writer1", "writer2"), " and ") %>%
  pivot_longer(!(era:episode_number), names_to = "writer_name", values_drop_na = TRUE) %>%
  select(era:episode_number, writer = value)

rm(classic_s11)

# Classic era - season 12 ----

classic_s12 <- classic_tables[[15]]

names(classic_s12) <- c("story_number", "episode_number", "serial_title", "episode_title",
                        "director", "writer", "first_aired", "production_code",
                        "uk_viewers", "rating")

classic_s12 <- classic_s12 %>%
  mutate(era = "classic",
         season_number = 12,
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         production_code = as.character(production_code),
         duration = 25) %>%
  group_by(story_number) %>%
  mutate(episode_number = row_number()) %>%
  ungroup() %>%
  mutate(missing_episode = 0) %>%
  select(era, season_number, serial_title, story_number, episode_number,
         episode_title, missing_episode, type, director, writer, first_aired,
         production_code, uk_viewers, rating, duration)

classic_s12_episodes <- classic_s12 %>%
  select(era:type, first_aired:duration)

classic_s12_directors <- classic_s12 %>%
  select(era:season_number, story_number, episode_number, director) %>%
  mutate(director = str_replace(director, "\\s*\\([^\\)]+\\)", "")) %>%
  separate(director, c("director1", "director2"), " and ") %>%
  pivot_longer(!(era:episode_number), names_to = "director_name", values_drop_na = TRUE) %>%
  select(era:episode_number, director = value)

classic_s12_writers <- classic_s12 %>%
  select(era:season_number, story_number, episode_number, writer) %>%
  mutate(writer = str_replace(writer, "\\s*\\([^\\)]+\\)", "")) %>%
  separate(writer, c("writer1", "writer2"), " and ") %>%
  pivot_longer(!(era:episode_number), names_to = "writer_name", values_drop_na = TRUE) %>%
  select(era:episode_number, writer = value)

rm(classic_s12)

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
         duration = c(72, 50, 50, rep(45, 8), 50, 45, 63)) %>%
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
  filter(!story_number %in% c("Special", "Series", "Part 1", "Part 2")) %>%
  select(story_number,director)

s06_writers <- s06 %>%
  filter(!story_number %in% c("Special", "Series", "Part 1", "Part 2")) %>%
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

# Season 09 ----

s09 <- tables[[13]]

names(s09) <- c("story_number", "episode_number", "episode_title",
                "director", "writer", "first_aired",
                "uk_viewers", "rating", "rm1", "rm2", "rm3", "rm4", "rm5")

s09_episodes <- s09 %>%
  filter(!story_number %in% c("Special (2014)", "Special (2015)", "Series")) %>%
  select(story_number:episode_title, first_aired:rating) %>%
  mutate(era = "revived",
         season_number = 9,
         serial_title = NA,
         episode_number = c(NA, 1:12, NA),
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = c("special", rep("episode", 12), "special"),
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         production_code = NA,
         duration = c(60, 46, 48, 43, 42, 46, 46, 46, 46, 45, 47, 54, 61, 56)) %>%
  select(era, season_number, serial_title, story_number, episode_number,
         episode_title, type, everything())


s09_directors <- s09 %>%
  filter(!story_number %in% c("Special (2014)", "Special (2015)", "Series")) %>%
  select(story_number,director)

s09_writers <- s09 %>%
  filter(!story_number %in% c("Special (2014)", "Special (2015)", "Series")) %>%
  select(story_number, writer) %>%
  separate(writer, c("writer1", "writer2"), " and ") %>%
  pivot_longer(!story_number, names_to = "writer_name", values_drop_na = TRUE) %>%
  select(story_number, writer = value)

rm(s09)

episodes <- rbind(episodes, s09_episodes)
directors <- rbind(directors, s09_directors)
writers <- rbind(writers, s09_writers)

rm(s09_directors, s09_episodes, s09_writers)

# Season 10 ----

s10 <- tables[[14]]

names(s10) <- c("story_number", "episode_number", "episode_title",
                "director", "writer", "first_aired",
                "uk_viewers", "rating", "rm1", "rm2", "rm3", "rm4", "rm5")

s10_episodes <- s10 %>%
  filter(!story_number %in% c("Special (2016)", "Special (2017)", "Series")) %>%
  select(story_number:episode_title, first_aired:rating) %>%
  mutate(era = "revived",
         season_number = 10,
         serial_title = NA,
         episode_number = c(NA, 1:12, NA),
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = c("special", rep("episode", 12), "special"),
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         production_code = NA,
         duration = c(60, 50, 46, 44, 44, 45, 49, 46, 45, 44, 42, 46, 60, 60)) %>%
  select(era, season_number, serial_title, story_number, episode_number,
         episode_title, type, everything())


s10_directors <- s10 %>%
  filter(!story_number %in% c("Special (2016)", "Special (2017)", "Series")) %>%
  select(story_number,director)

s10_writers <- s10 %>%
  filter(!story_number %in% c("Special (2016)", "Special (2017)", "Series")) %>%
  select(story_number, writer) %>%
  separate(writer, c("writer1", "writer2"), " and ") %>%
  pivot_longer(!story_number, names_to = "writer_name", values_drop_na = TRUE) %>%
  select(story_number, writer = value)

rm(s10)

episodes <- rbind(episodes, s10_episodes)
directors <- rbind(directors, s10_directors)
writers <- rbind(writers, s10_writers)

rm(s10_directors, s10_episodes, s10_writers)

# Season 11 ----

s11 <- tables[[15]]

names(s11) <- c("story_number", "episode_number", "episode_title",
                "director", "writer", "first_aired",
                "uk_viewers", "rating", "rm1", "rm2", "rm3", "rm4", "rm5")

s11_episodes <- s11 %>%
  filter(!story_number %in% c("Special", "Series")) %>%
  select(story_number:episode_title, first_aired:rating) %>%
  mutate(era = "revived",
         season_number = 11,
         serial_title = NA,
         episode_number = c(1:10, NA),
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = c(rep("episode", 10), "special"),
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         production_code = NA,
         duration = c(64, 49, 50, 49, 51, 50, 49, 47, 49, 50, 60)) %>%
  select(era, season_number, serial_title, story_number, episode_number,
         episode_title, type, everything())


s11_directors <- s11 %>%
  filter(!story_number %in% c("Special", "Series")) %>%
  select(story_number,director)

s11_writers <- s11 %>%
  filter(!story_number %in% c("Special", "Series")) %>%
  select(story_number, writer) %>%
  separate(writer, c("writer1", "writer2"), " and ") %>%
  pivot_longer(!story_number, names_to = "writer_name", values_drop_na = TRUE) %>%
  select(story_number, writer = value)

rm(s11)

episodes <- rbind(episodes, s11_episodes)
directors <- rbind(directors, s11_directors)
writers <- rbind(writers, s11_writers)

rm(s11_directors, s11_episodes, s11_writers)

# Season 12 ----

s12 <- tables[[16]]

names(s12) <- c("story_number", "episode_number", "episode_title",
                "director", "writer", "first_aired",
                "uk_viewers", "rating", "rm1", "rm2", "rm3", "rm4", "rm5")

s12_episodes <- s12 %>%
  filter(!story_number %in% c("Special", "Series")) %>%
  select(story_number:episode_title, first_aired:rating) %>%
  mutate(era = "revived",
         season_number = 12,
         serial_title = NA,
         episode_number = c(1:10, NA),
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = c(rep("episode", 10), "special"),
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         production_code = NA,
         duration = c(59, 60, 46, 50, 50, 49, 49, 49, 49, 65, 71)) %>%
  select(era, season_number, serial_title, story_number, episode_number,
         episode_title, type, everything())


s12_directors <- s12 %>%
  filter(!story_number %in% c("Special", "Series")) %>%
  select(story_number,director)

s12_writers <- s12 %>%
  filter(!story_number %in% c("Special", "Series")) %>%
  select(story_number, writer) %>%
  separate(writer, c("writer1", "writer2"), " and ") %>%
  pivot_longer(!story_number, names_to = "writer_name", values_drop_na = TRUE) %>%
  select(story_number, writer = value)

rm(s12)

episodes <- rbind(episodes, s12_episodes)
directors <- rbind(directors, s12_directors)
writers <- rbind(writers, s12_writers)

rm(s12_directors, s12_episodes, s12_writers)

# Season 13 ----

s13 <- tables[[17]]

names(s13) <- c("story_number", "episode_number", "episode_title",
                "director", "writer", "first_aired",
                "uk_viewers", "rating")

s13_episodes <- s13 %>%
  select(story_number:episode_title, first_aired:rating) %>%
  mutate(era = "revived",
         season_number = 13,
         serial_title = "Flux",
         episode_title = gsub('.*"(.*)".*', "\\1", episode_title),
         type = "episode",
         first_aired = as.Date(gsub(".*\\((.*)\\).*", "\\1", first_aired)),
         uk_viewers = case_when(uk_viewers == "TBD" ~ NA_character_,
                                TRUE ~ uk_viewers),
         rating = case_when(rating == "TBA" ~ NA_character_,
                            TRUE ~ rating),
         production_code = NA,
         duration = c(50, 59, 49, 56, 50, NA)) %>%
  mutate(episode_title = case_when(episode_title == "TBA" ~ NA_character_,
                                   TRUE ~ episode_title)) %>%
  select(era, season_number, serial_title, story_number, episode_number,
         episode_title, type, everything())


s13_directors <- s13 %>%
  select(story_number,director)

s13_writers <- s13 %>%
  select(story_number, writer) %>%
  separate(writer, c("writer1", "writer2"), " and ") %>%
  pivot_longer(!story_number, names_to = "writer_name", values_drop_na = TRUE) %>%
  select(story_number, writer = value)

rm(s13)

episodes <- rbind(episodes, s13_episodes)
directors <- rbind(directors, s13_directors)
writers <- rbind(writers, s13_writers)

rm(s13_directors, s13_episodes, s13_writers)

# Set variable types ----

episodes <- episodes %>%
  mutate(uk_viewers = as.numeric(uk_viewers),
         rating = as.numeric(rating))
