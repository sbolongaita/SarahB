usethis::use_package("methods")
#' Print a notification of a script's conclusion in the console
#'
#' This function is an extension of the `notify` function.
#'
#' @param prefix A string of text to print before the script name; default is "Done:"
#' @param scriptName A character string of length 1; if not supplied function will search for `scriptName` object in the global environment
#'
#' @return Printed notification text
#' @export
#'
#' @examples
#' scriptName <- "environment_script.R"
#' notifyScript()
#' notifyScript(scriptName = "specified_script.R")
notifyScript <- function(prefix = "Done:", scriptName = NULL){
  if(methods::hasArg(scriptName)){
    cat(paste(prefix, paste0(scriptName, "\n")))
  }else{
    if(exists("scriptName", envir = globalenv())){
      scriptName <- get("scriptName", envir = globalenv())
      if(typeof(scriptName) != "character" | length(scriptName) != 1){
        stop("'scriptName' must be a character vector of length 1")
      }
      cat(paste(prefix, paste0(scriptName, "\n")))
    }else{
      stop("'scriptName' not provided and 'scriptName' is not a stored object in the global environment")
    }
  }
}
