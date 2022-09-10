usethis::use_package("plyr")
#' Format and round numbers
#'
#' This function rounds and formats numbers. It is helpful when producing values that will be included as labels in graphs or values in display tables.
#'
#' @param x A numeric vector
#' @param accuracy The number to round to (e.g., 0.05, 5)
#'
#' @return A character vector of formatted numbers
#' @export
#'
#' @examples
#' x <- runif(10, min = 0, max = 1000)
#' makeRound(x, accuracy = 0.01)
#' makeRound(x, accuracy = 10)
makeRound <- function(x, accuracy = 1){
  a <- plyr::round_any(x, accuracy = accuracy)
  if(accuracy < 1){
    nsmall = nchar(gsub("*\\..", "", format(accuracy, scientific = FALSE)))
  }else{
    nsmall = 0
  }
  z <- format(a, trim = TRUE, nsmall = nsmall, big.mark = ",")
  return(z)
}
