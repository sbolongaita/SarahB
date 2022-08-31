#' Range for continuous axes
#'
#'
#' @param x A numeric vector.
#' @param accuracy The number number to round to (e.g., '5', '0.1').
#' @param log A logical indicating if the range should be for a log scale. Accuracy parameter is ignored if TRUE.
#'
#' @return A vector with length two. The first element is the floored minimum and the second element is the ceiling-ed maximum.
#' @export
#'
#' @examples
#' x <- runif(10)
#' ggRange(x, accuracy = 0.01)
#' ggRange(x, accuracy = 0.01, log = TRUE)
ggRange <- function(x, accuracy = 1, log = FALSE){
  stopifnot(is.vector(x), is.numeric(x))
  if(!log){
    min <- min(x, na.rm = TRUE)
    max <- max(x, na.rm = TRUE)
    y <- c(plyr::round_any(min, accuracy, floor),
           plyr::round_any(max, accuracy, ceiling))
  } else{
    min <- min(x[x > 0], na.rm = TRUE)
    max <- max(x[x > 0], na.rm = TRUE)
    y <- c(10^floor(log10(min)), 10^ceiling(log10(max)))
  }
  return(y)
}
