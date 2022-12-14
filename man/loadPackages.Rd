% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/loadPackages.R
\name{loadPackages}
\alias{loadPackages}
\title{Install and load packages}
\usage{
loadPackages(packages)
}
\arguments{
\item{packages}{A character vector of the names of packages to be loaded}
}
\value{
A named logical indicating if packages were successfully loaded
}
\description{
This function checks if desired packages are already installed, installs them if not, and then loads them into the global environment.
}
\examples{
packages = c("countrycode", "ggplot2", "plyr")
loadPackages(packages)
}
