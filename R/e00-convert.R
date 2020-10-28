
#' Convert an e00 file to a binary coverage
#'
#' @param e00 Path to a .e00 file.
#' @param coverage An directory name whose name is less than 13 characters.
#'   long.
#' @param coverage_type One of "V7" or "PC".
#'
#' @return The value of `coverage`.
#' @export
#'
#' @examples
#' e00 <- system.file("e00/cis_20170911.e00", package = "arce00")
#' coverage <- e00_convert(e00)
#' sf::st_read(coverage, layer = "LAB")
#' unlink(coverage, recursive = TRUE)
#'
e00_convert <- function(e00, coverage = e00_temp_coverage(),
                        coverage_type = c("V7", "PC")) {
  coverage_type <- match.arg(coverage_type)

  .Call(
    arce00_c_convert,
    fs::path_abs(e00)[1],
    fs::path_abs(coverage)[1],
    match(coverage_type, c("V7", "PC"))
  )

  coverage
}
