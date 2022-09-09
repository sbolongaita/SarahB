library("plyr")
library("dplyr")
#' Extract the limits for plotting continuous axes
#'
#' This function quickly extracts the floored minimum and the ceiling-ed maximum of a numeric vector and rounds those values to a user-defined accuracy (e.g., 0.05, 5). It is particularlly useful when setting the limits of continuous axes when plotting.
#'
#' @param x A numeric vector
#' @param accuracy The number to round to (e.g., 0.05, 5)
#' @param log A logical indicating if the range should be for a log scale (accuracy parameter is ignored if `TRUE`)
#'
#' @return A vector with length two; the first element is the floored minimum and the second element is the ceiling-ed maximum
#' @export
#'
#' @examples
#' x <- runif(10)
#' ggRange(x, accuracy = 0.05)
#' ggRange(x, accuracy = 0.05, log = TRUE)
#'
#' x <- runif(10, min = 0, max = 100)
#' ggRange(x, accuracy = 5)
#' ggRange(x, accuracy = 5, log = TRUE)
ggRange <- function(x, accuracy = 1, log = FALSE){
  if(!log){
    a <- min(x, na.rm = TRUE)
    b <- max(x, na.rm = TRUE)
    z <- c(plyr::round_any(a, accuracy, floor),
           plyr::round_any(b, accuracy, ceiling))
  }else{
    a <- min(x[x > 0], na.rm = TRUE)
    b <- max(x[x > 0], na.rm = TRUE)
    z <- c(10^floor(log10(a)), 10^ceiling(log10(b)))
  }
  return(z)
}
