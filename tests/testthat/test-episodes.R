library(dplyr)

test_that("there are no NAs in story number", {

  expect_equal(all(!is.na(drwho_episodes$story_number)), TRUE)

})
