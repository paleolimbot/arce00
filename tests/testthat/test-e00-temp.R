
test_that("e00_temp_coverage() works", {
  expect_identical(basename(e00_temp_coverage()), "arce00_cov")
  cov <- e00_temp_coverage()
  dir.create(cov)
  expect_true(dir.exists(cov))
  e00_remove_temp_coverage(cov)
  expect_false(dir.exists(cov))
  expect_false(dir.exists(dirname(cov)))
})

test_that("e00_temp_coverage() does not remove other files", {
  tmpdir <- tempfile()
  expect_error(e00_remove_temp_coverage(tmpdir), "must be a path created")
})
