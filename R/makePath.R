usethis::use_package("stringr")
usethis::use_package("methods")
#' Make file path from folder and filename
#'
#' @param folder A string of text denoting the folder to save the file to
#' @param filename A string of text denoting the filename
#' @param extension An option string of text denoting the file extension if not included in the filename
#'
#' @return A file path
#' @export
#'
#' @examples
#' makePath(folder = "output-data", filename = "file.Rda")
#' makePath(folder = "output-data", filename = "file", extension = ".Rda")
makePath <- function(folder, filename, extension = NULL){
  guess <- stringr::str_extract(filename, pattern = "\\..*$")
  guess <- ifelse(nchar(guess) > 5, NA, guess)
  extensions <- c(".R", ".Rd", ".Rda", ".csv", ".xlsx", ".xls", ".dta")
  known <- any(sapply(extensions, grepl, filename, ignore.case = TRUE))
  if(is.na(guess)){
    if(!methods::hasArg(extension)){
      warning("No file extension detected in filename and 'extension' parameter is NULL")
    }
  }else{
    if(methods::hasArg(extension)){
      warning("File extension detected in filename and 'extension' parameter is not NULL")
    }else{
      if(!known){
        warning("Unfamiliar file extension detected in filename and 'extension' parameters is not NULL")
      }
    }
  }
  if(methods::hasArg(extension)){
    path <- paste(folder, paste0(filename, extension), sep = "/")
  }else{
    path <- paste(folder, filename, sep = "/")
  }
  path <- gsub("//", "/", path)
  return(path)
}
