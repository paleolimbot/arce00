
test_that("e00_temp_coverage() works", {
  expect_identical(nchar(basename(e00_temp_coverage())), 13L)
  cov <- e00_temp_coverage()
  dir.create(cov)
  expect_true(dir.exists(cov))
  unlink(cov, recursive = TRUE)
})
