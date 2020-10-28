
test_that("e00_layers() works", {
  e00 <- system.file("e00/cis_20170911.e00", package = "arce00")
  expect_is(e00_layers(e00), "sf_layers")
})

test_that("e00_read_sf()", {
  e00 <- system.file("e00/cis_20170911.e00", package = "arce00")
  expect_is(e00_read_sf(e00), "sf")
})

test_that("e00_readOGR()", {
  e00 <- system.file("e00/cis_20170911.e00", package = "arce00")
  expect_is(e00_readOGR(e00, verbose = FALSE, layer = "LAB"), "SpatialPointsDataFrame")
})
