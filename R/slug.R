#' Converts string text to slug
#'
#' @param x Character
#' @param allow.numbers TRUE/FALSE
#'
#' @return Slugged text
#' @export
#'
#' @examples
#' x <- "slug this 123"
#' slug(x)
slug <- function(x, allow.numbers = TRUE){
  y <- tolower(x)
  if(allow.numbers){
    y <- gsub("[^a-z0-9\\d\\s]", " ", y)
  }else{
    y <- gsub("[^a-z\\d\\s]", " ", y)
  }
  y <- gsub("and", "", y)
  y <- trimws(str_squish(y))
  y <- gsub(" ", "-", y)
  return(y)
}
