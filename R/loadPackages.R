usethis::use_package("utils")
#' Install and load packages
#'
#' This function checks if desired packages are already installed, installs them if not, and then loads them into the global environment.
#'
#' @param packages A character vector of the names of packages to be loaded
#'
#' @return A named logical indicating if packages were successfully loaded
#' @export
#'
#' @examples
#' packages = c("countrycode", "ggplot2", "plyr")
#' loadPackages(packages)
loadPackages <- function(packages){

  if(any(c("dplyr", "plyr") %in% packages)){
    a <- unique(c("plyr", packages[!(packages %in% c("dplyr", "plyr"))], "dplyr"))
  }else{
    a <- packages
  }

  b <- a[!(a %in% utils::installed.packages()[, "Package"])]
  if(length(b))
    utils::install.packages(b, dependencies = TRUE,
                            repos = c("http://rstudio.org/_packages", "http://cran.rstudio.com"))
  sapply(packages, require, character.only = TRUE)
}
