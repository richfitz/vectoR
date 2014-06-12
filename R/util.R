## Assertions:
assert_scalar <- function(x, name=deparse(substitute(x))) {
  if (length(x) != 1) {
    stop(sprintf("%s must be a scalar", name), call.=FALSE)
  }
}
assert_file_exists <- function(x) {
  if (!file.exists(x)) {
    stop(sprintf("file %s does not exist", x))
  }
}
assert_picture <- function(x, name=deparse(substitute(x))) {
  assert_inherits(x, "Picture", name)
}
assert_inherits <- function(x, what, name=deparse(substitute(x))) {
  if (!inherits(x, what)) {
    stop(sprintf("%s must be a %s", name,
                 paste(what, collapse=" / ")), call.=FALSE)
  }
}

##' @importFrom tools file_path_sans_ext
replace_extension <- function(x, ext) {
  if (grepl("^[^.]", ext)) {
    ext <- paste0(".", ext)
  }
  paste0(file_path_sans_ext(x), ext)
}

system_which <- function(app) {
  assert_scalar(app)
  path <- suppressWarnings(system(paste("which", app), intern=TRUE))
  if (length(path) == 1) {
    path
  } else {
    NULL
  }
}
