# Create hex sticker
# http://gradientdescending.com/how-to-generate-a-hex-sticker-with-openai-and-cropcircles/
# 2023-08-30

# Load packages ----

library(openai)
library(cropcircles)
library(magick)
library(tidyverse)
library(ggpath)


x <- openai::create_image("a dumpster fire in the style of salvador dali with some melted clocks")
create_image("An astronaut riding a horse in a photorealistic style")

usethis::edit_r_environ(scope = "project")
OPENAI_API_KEY <- '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'

x <- openai::create_image(prompt = "small tardis in a universe of numbers",
                     openai_api_key = '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')



image_read(x$data$url)
image_write(x$data$url, "misc/datardis.png")

img_cropped <- cropcircles::hex_crop(
  images = x$data$url,
  border_colour = "#003b6f",
  border_size = 24,
  to = "misc/datardis_hex.png"
)
