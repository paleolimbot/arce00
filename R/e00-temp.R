
#' Create a temporary coverage directory
#'
#' Binary coverages such as those created by [e00_convert()]
#' must be empty directories with names of 13 characters or fewer.
#' This function generates a suitable temporary directory fitting
#' these constraints.
#'
#' @return The path to a suitable temporary coverage.
#' @export
#'
#' @examples
#' e00_temp_coverage()
#'
e00_temp_coverage <- function() {
  file.path(e00_temp_dir, random_chars(13))
}

random_chars <- function(n) {
  paste(sample(filename_friendly_chars, n, replace = TRUE), collapse = "")
}

filename_friendly_chars <- c(
  "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l",
  "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y",
  "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L",
  "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y",
  "Z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"
)
