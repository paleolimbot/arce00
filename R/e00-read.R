
#' Read e00 files
#'
#' These functions generate temporary binary coverages
#' under the hood and delete them afterward. The overhead
#' for this operation is small, but you can do this
#' conversion yourself using [e00_convert()].
#'
#' @inheritParams e00_convert
#' @param layer One of "ARC" (lines), "CNT" (centroids),
#'   "LAB" (label points), or "PAL" (polygons).
#' @param ... Passed to [sf::read_sf()], [rgdal::readOGR()],
#'   or [sf::st_layers()].
#'
#' @export
#'
#' @examples
#' e00 <- system.file("e00/cis_20170911.e00", package = "arce00")
#'
#' e00_layers(e00)
#' e00_read_sf(e00)
#' sp <- e00_readOGR(e00, layer = "LAB")
#' summary(sp)
#'
e00_read_sf <- function(e00, layer = "PAL", ...) {
  cov <- e00_temp_coverage()
  on.exit(unlink(cov, recursive = TRUE))
  e00_convert(e00, cov, coverage_type = "V7")
  sf::read_sf(cov, layer = layer, ...)
}

#' @rdname e00_read_sf
#' @export
e00_layers <- function(e00, ...) {
  cov <- e00_temp_coverage()
  on.exit(unlink(cov, recursive = TRUE))
  e00_convert(e00, cov, coverage_type = "V7")
  sf::st_layers(cov, ...)
}

#' @rdname e00_read_sf
#' @export
e00_readOGR <- function(e00, layer = "PAL", ...) {
  cov <- e00_temp_coverage()
  on.exit(unlink(cov, recursive = TRUE))
  e00_convert(e00, cov, coverage_type = "V7")
  rgdal::readOGR(cov, layer = layer, ...)
}
