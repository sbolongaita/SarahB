#' Install and load packages
#'
#' Checks if packages are installed, installs them if not, and loads them into the global environemtn
#'
#' @param pkg A vector of packages to be loaded
#'
#' @return Named logical indicating if packages were successfully loaded
#' @export
#'
#' @examples
#' pkg = c("countrycode", "ggplot2")
#' loadPackages(pkg)
loadPackages <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg))
    install.packages(new.pkg,
                     dependencies = TRUE,
                     repos = c("http://rstudio.org/_packages",
                               "http://cran.rstudio.com"))
  sapply(pkg, require, character.only = TRUE)
}
