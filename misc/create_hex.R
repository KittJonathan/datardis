# Create hex sticker
# http://gradientdescending.com/how-to-generate-a-hex-sticker-with-openai-and-cropcircles/
# 2023-08-30

# Load packages ----

library(openai)
library(cropcircles)
library(magick)
library(tidyverse)
library(ggpath)


image_read(x$data$url)
image_write(x$data$url, "misc/datardis.png")

img_cropped <- cropcircles::hex_crop(
  images = x$data$url,
  border_colour = "#003b6f",
  border_size = 24,
  to = "misc/datardis_hex.png"
)
