% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/e00-read.R
\name{e00_read_sf}
\alias{e00_read_sf}
\alias{e00_layers}
\alias{e00_readOGR}
\title{Read e00 files}
\usage{
e00_read_sf(e00, layer = "PAL", ...)

e00_layers(e00, ...)

e00_readOGR(e00, layer = "PAL", ...)
}
\arguments{
\item{e00}{Path to a .e00 file.}

\item{layer}{One of "ARC" (lines), "CNT" (centroids),
"LAB" (label points), or "PAL" (polygons).}

\item{...}{Passed to \code{\link[sf:st_read]{sf::read_sf()}}, \code{\link[rgdal:readOGR]{rgdal::readOGR()}},
or \code{\link[sf:st_layers]{sf::st_layers()}}.}
}
\description{
These functions generate temporary binary coverages
under the hood and delete them afterward. The overhead
for this operation is small, but you can do this
conversion yourself using \code{\link[=e00_convert]{e00_convert()}}.
}
\examples{
e00 <- system.file("e00/cis_20170911.e00", package = "arce00")

e00_layers(e00)
e00_read_sf(e00)
sp <- e00_readOGR(e00, layer = "LAB")
summary(sp)

}
