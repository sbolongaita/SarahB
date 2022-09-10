usethis::use_package("stringr")
#' Converts a string of text to slug format text
#'
#' @param x A character string or vector
#' @param lower A logical indicating whether to make all characters lowercase
#' @param numbers A logical indicating whether to include numbers in slug
#' @param articles A logical indicating whether to include articles (a, an, the), coordinating conjunctions (and, but, for), or short prepositions (at, by, to, on, for)
#'
#' @return Slugged text
#' @export
#'
#' @examples
#' x <- "The slug at 123"
#' slug(x)
#' slug(x, lower = FALSE, numbers = FALSE, articles = TRUE)
slug <- function(x, lower = TRUE, numbers = TRUE, articles = FALSE){
  if(lower){
    a <- tolower(x)
  }else{
    a <- x
  }
  if(numbers){
    b <- gsub("[^A-Za-z0-9\\d\\s]", " ", a)
  }else{
    b <- gsub("[^A-Za-z\\d\\s]", " ", a)
  }
  c <- b
  if(!articles){
    terms <- c("a", "an", "and", "at", "but", "by", "for", "on", "the", "to")
    for(article in terms){
      c <- gsub(paste0(" ", article, " "), "  ", c)
    }
  }
  d <- trimws(stringr::str_squish(c))
  z <- gsub(" ", "-", d)
  return(z)
}
