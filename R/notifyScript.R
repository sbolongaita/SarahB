#' Print a notification of a script's conclusion in the console
#'
#' @param prefix "Done:"
#' @param scriptName Searches for "scriptName" in global environment, otherwise must be supplied
#'
#' @return Printed notification text
#' @export
#'
#' @examples
#' scriptName <- "script.R"
#' notifyScript()
notifyScript <- function(prefix = "Done:", scriptName = NULL){
  if(is.null(scriptName) & exists("scriptName", envir = globalenv())){
    scriptName <- get("scriptName", envir = globalenv())
  }
  cat(paste(prefix, paste0(scriptName, "\n")))
}
