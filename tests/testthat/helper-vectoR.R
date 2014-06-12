library(vectoR)
library(png)
library(testthat)

copy_from_pkg <- function(file, ...) {
  file.copy(pkg_file(file), ...)
}
pkg_file <- function(file) {
  system.file(file, package="vectoR")
}

## Something like this might actually go into the package.
vector_read_tmpdir <- function(filename, path=tempdir()) {
  file.copy(filename, path, overwrite=TRUE)
  vector_read(file.path(path, basename(filename)))
}
