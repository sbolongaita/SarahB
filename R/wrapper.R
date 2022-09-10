#' Wrap long character strings
#'
#' Strings are formatted by inserting line breaks at word boundaries, such that all lines are less than the user's maximum desired width.

#' @param x A character vector
#' @param width A positive integer giving the maximum width for wrapping lines
#'
#' @return A character vector
#' @export
#'
#' @examples
#' x <- c("This is a super super super super duper long string",
#' "This is also a super super super super duper long string")
#' wrapper(x, width = 20)
wrapper <- function(x, width) {
  out <- character()
  for(i in seq_along(x)){
    out[i] <- paste(strwrap(x[i], width = width), collapse = "\n")
  }
  return(out)
}
