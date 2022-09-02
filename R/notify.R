#' Print a notification in the console
#'
#' @param x Text to notify
#'
#' @return Printed notification text
#' @export
#'
#' @examples
#' notify("Loop complete")
notify <- function(x){
  cat(paste0(paste(x, collapse = "\n"), "\n"))
}
