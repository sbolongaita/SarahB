#' Formatted round numbers
#'
#' @param x Numeric
#' @param digits Number of digits to round to
#'
#' @return Character
#' @export
#'
#' @examples
#' x <- sample(seq(0, 10000), 10)
#' makeRound(x)
makeRound <- function(x, digits = 0){
  y <- format(round(x, digits = digits), trim = TRUE, nsmall = digits, big.mark = ",")
  return(y)
}
