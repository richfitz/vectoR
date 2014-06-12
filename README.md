vectoR
======

[![Build Status](https://travis-ci.org/richfitz/vectoR.png?branch=master)](https://travis-ci.org/richfitz/vectoR)

Some simple utilities for working with vector images.

This package is deliberately extremely simple.  It might be easiest (especially given the package is not on CRAN and may never go on CRAN) to directly include the single source file `R/vector.R` in your project.  If you do that, you probably will want to comment the `##' @export` roxygen tags and/or rename the functions to avoid conflicts.

## Why is this package needed?

The `grImport` package can draw vector images on R plots!  This is fantastic!  But doing so is a pain:

1. Convert the your SVG figure to EPS by opening in Inkscape or Illustrator and save as an eps
2. Convert the EPS to XML by running through ghostscriptrepresentation
3. Read the XML into R with `readPicture`

Plus, some of these steps are relatively time consuming, given that the results are deterministic.

The function `vector_read` is a high-level wrapper to this function.  It still requires Inkscape and ghostscript to be installed, but it will try to do the conversions with as few steps as possible.  So if the XML file is already there it will read that, if not it looks for the EPS to generate the XML from and if that's not there does the full SVG to EPS to XML conversion.  It saves output with predictable names so that future uses are faster.
