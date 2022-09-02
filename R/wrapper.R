#' Wrap character strings to format paragraphs
#'
#' Each character string in the input is first split into paragraphs (or lines containing whitespace only). The paragraphs are then formatted by breaking lines at word boundaries. The target columns for wrapping lines and the indentation of the first and all subsequent lines of a paragraph can be controlled independently.

#' @param x Vector
#' @param ...
#'
#' @return Character vector
#' @export
#'
#' @examples
#' x <- c("This is a super super super super duper long string", "This is also a super super super super duper long string")
#' wrapper(x, 20)
wrapper <- function(x, ...) {
  out <- character()
  for(i in seq_along(x)){
    out[i] <- paste(strwrap(x[i], ...), collapse = "\n")
  }
  return(out)
}
