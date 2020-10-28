
e00_temp_dir <- NULL

.onLoad <- function(...) {
  e00_temp_dir <<- tempfile()
  dir.create(e00_temp_dir)
}

.onUnload <- function(...) {
  unlink(e00_temp_dir, recursive = TRUE)
}
