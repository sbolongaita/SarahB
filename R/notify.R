#' Print a notification in the console
#'
#' @param x A string of text for the notification message
#'
#' @return Printed notification text
#' @export
#'
#' @examples
#' notify("Loop complete")
notify <- function(x){
  cat(paste0(paste(x, collapse = "\n"), "\n"))
}
