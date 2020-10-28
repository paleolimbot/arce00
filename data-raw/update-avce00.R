
library(tidyverse)

curl::curl_download(
  "http://avce00.maptools.org/dl/avce00-2.0.0.zip",
  "data-raw/avce00-src.zip"
)

unzip("data-raw/avce00-src.zip", exdir = "avce00-src")
