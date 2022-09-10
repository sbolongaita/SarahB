usethis::use_package("plyr")
#' Format currency values
#'
#' This function formats currency values. It is helpful when producing values that will be included as labels in graphs or values in display tables.
#'
#' @param x A numeric vector representing currency
#' @param currency The currency character(s) to include (use "" if no currency character should be included)
#' @param cents A logical indicating if the values should include cents
#'
#' @return A character vector of formatted numerics
#' @export
#'
#' @examples
#' x <- runif(10, min = 0, max = 1000)
#' makeMoney(x, currency = "$", cents = TRUE)
#' makeMoney(x, currency = "USD ", cents = FALSE)
#' makeMoney(x, currency = "", cents = FALSE)
makeMoney <- function(x, currency = "$", cents = FALSE){
  if(!cents){
    a <- plyr::round_any(x, accuracy = 1)
    nsmall = 0
  }else{
    a <- plyr::round_any(x, accuracy = 0.01)
    nsmall = 2
  }
  z <- paste0(currency, format(a, trim = TRUE, nsmall = nsmall, big.mark = ","))
  return(z)
}
