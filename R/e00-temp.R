
#' Create a temporary coverage directory
#'
#' Binary coverages such as those created by [e00_convert()]
#' must be empty directories with names of 13 characters or fewer.
#' This function generates a suitable temporary directory fitting
#' these constraints.
#'
#' @param path A path to a previously created temporary coverage.
#'
#' @return The path to a suitable temporary coverage.
#' @export
#'
#' @examples
#' e00_temp_coverage()
#'
e00_temp_coverage <- function() {
  # We need a container because creating the coverage also
  # adds an 'info' directory alongside the coverage directory.
  container <- tempfile(tmpdir = e00_temp_dir)
  dir.create(container)
  # This coverage name is also a column name when reading with
  # GDAL, so keep the same so that multiple reads can be
  # rbinded.
  file.path(container, "arce00_cov")
}

#' @rdname e00_temp_coverage
#' @export
e00_remove_temp_coverage <- function(path) {
  path_is_temp_cov <- identical(
    fs::path_abs(dirname(dirname(path))),
    fs::path_abs(e00_temp_dir)
  )

  if (!path_is_temp_cov) {
    stop(
      sprintf("`path` must be a path created by e00_temp_coverage()"),
      call. = FALSE
    )
  }

  unlink(dirname(path), recursive = TRUE)
}
