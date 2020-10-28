
test_that("e00_convert() works", {
  e00 <- system.file("e00/cis_20170911.e00", package = "arce00")
  cov <- e00_temp_coverage()
  coverage <- e00_convert(e00, cov)
  expect_true(dir.exists(coverage))
  expect_is(sf::read_sf(coverage, layer = "LAB", as_tibble = FALSE), "sf")
  unlink(coverage, recursive = TRUE)
})
