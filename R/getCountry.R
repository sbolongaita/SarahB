library(countrycode)
#' Standardized country names from English country names or ISO 3-character codes
#'
#' This function expands the `countryname` and `countrycode` function from the [countrycode](https://cran.r-project.org/web/packages/countrycode/countrycode.pdf) package. It further modifies the ISO English short name to more common representations to country names (e.g., "Congo (the Democratic Republic of the)" becomes "Democratic Republic of the Congo").
#'
#' @param x A character vector of ISO 3-character codes
#' @param shortest A logical indicating whether the shortest possible name should be returned (e.g., US = United States)
#'
#' @return A vector of country names corresponding to the input ISO 3-character codes
#' @export
#'
#' @examples
#' x <- c("CHN", "COD", "KOR", "USA", "XKX")
#' getCountry(x)
#' getCountry(x, shortest = TRUE)
#'
#' x <- c("China", "Dem. Rep. of Congo", "Korea", "United States of America", "Kosovo")
#' getCountry(x, iso3 = FALSE)
#' getCountry(x, iso3 = FALSE, shortest = TRUE)
getCountry <- function(x, iso3 = TRUE, shortest = FALSE){
  if(!iso3){
    a <- countryname(x, destination = "iso3c", warn = FALSE)
    a <- ifelse(!grepl("[A-Z]{3}", a), NA, a)
    b <- countryname(x, destination = "wb", warn = FALSE)
    b <- ifelse(!grepl("[A-Z]{3}", b), NA, b)
    c <- ifelse(is.na(a), b, a)
  }else{
    c <- x
  }
  if(!shortest){
    d <- countrycode(c, origin = "iso3c", destination = "country.name.en", warn = FALSE, nomatch = NA,
                     custom_match = c("COG" = "Congo",
                                      "COD" = "Democratic Republic of Congo",
                                      "HKG" = "Hong Kong",
                                      "LAO" = "Lao PDR",
                                      "MAC" = "Macao"))
    e <- countrycode(c, origin = "wb", destination = "country.name.en", warn = FALSE, nomatch = NA,
                     custom_match = c("COG" = "Congo",
                                      "COD" = "Democratic Republic of Congo",
                                      "HKG" = "Hong Kong",
                                      "LAO" = "Lao PDR",
                                      "MAC" = "Macao"))
    f <- ifelse(is.na(d), e, d)
    z <- gsub("\\s*\\([^\\)]+\\)", "", gsub(" and ", " & ", f))
  }else{
    d <- countrycode(c, origin = "iso3c", destination = "country.name.en", warn = FALSE, nomatch = NA,
                     custom_match = c("ARE" = "UAE",
                                      "CAF" = "CAR",
                                      "COD" = "DRC",
                                      "COG" = "Congo",
                                      "HKG" = "Hong Kong",
                                      "GBR" = "UK",
                                      "MAC" = "Macao",
                                      "LAO" = "Lao PDR",
                                      "USA" = "US"))
    e <- countrycode(c, origin = "wb", destination = "country.name.en", warn = FALSE, nomatch = NA,
                     custom_match = c("ARE" = "UAE",
                                      "CAF" = "CAR",
                                      "COD" = "DRC",
                                      "COG" = "Congo",
                                      "HKG" = "Hong Kong",
                                      "GBR" = "UK",
                                      "MAC" = "Macao",
                                      "LAO" = "Lao PDR",
                                      "USA" = "US"))
    f <- ifelse(is.na(d), e, d)
    g <- gsub("\\s*\\([^\\)]+\\)", "", gsub(" and ", " & ", f))
    z <- gsub("North ", "N. ", gsub("South ", "S. ", gsub("East ", "E. ", gsub("West ", "W. ", gsub(" Island", " Isl.", gsub(" Islands", " Isl.", g))))))
  }
  if(any(is.na(z))){
    warn <- x[is.na(z)]
    warning(paste("Some values were not matched:", paste(warn, collapse = ", ")))
  }
  return(z)
}
