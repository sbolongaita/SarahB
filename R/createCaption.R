#' Create single caption from a list of captions
#'
#' @param x A list of captions
#'
#' @return A compiled caption string
#' @export
#'
#' @examples
#' captions <- list("A" = "* This is caption A",
#' "B" = "Note: This is caption B")
#' makeCaption(captions)
makeCaption <- function(x){
  return <- paste0("\n", paste(x, collapse = "\n"), "\n")
  return(return)
}
