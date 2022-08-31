library(countrycode)
#' Get country name from ISO 3-character code
#'
#' @param iso3 A vector of ISO 3-character codes
#' @param shortest A logical indicating whether the shortest possible name should be returned (i.e., US = United States)
#'
#' @return A vector of country names
#' @export
#'
#' @examples
#' iso3 <- c("CHN", "SOM", "USA")
#' getCountry(iso3)
#' getCountry(iso3, shortest = TRUE)
getCountry <- function(iso3, shortest = FALSE){
  if(!shortest){
    x <- countrycode(iso3, origin = "iso3c", destination = "iso.name.en", warn = TRUE, nomatch = NA,
                     custom_match = c("COD" = "Democratic Republic of the Congo",
                                      "FLK" = "Falkland Islands",
                                      "KOR" = "South Korea",
                                      "PRK" = "North Korea",
                                      "PSE" = "Palestine",
                                      "RUS" = "Russia",
                                      "STP" = "São Tomé and Príncipe",
                                      "SYR" = "Syria",
                                      "TZA" = "Tanzania",
                                      "VGB" = "British Virgin Islands",
                                      "VIR" = "United States Virgin Islands"))
    y <- gsub("\\s*\\([^\\)]+\\)", "", gsub(" and ", " & ", x))
  }else{
    x <- countrycode(iso3, origin = "iso3c", destination = "iso.name.en", warn = TRUE, nomatch = NA,
                     custom_match = c("ARE" = "UAE",
                                      "CAF" = "CAR",
                                      "COD" = "DRC",
                                      "FLK" = "Falkland Islands",
                                      "GBR" = "UK",
                                      "KOR" = "South Korea",
                                      "LAO" = "Lao PDR",
                                      "PRK" = "North Korea",
                                      "PSE" = "Palestine",
                                      "RUS" = "Russia",
                                      "STP" = "São Tomé & Príncipe",
                                      "SYR" = "Syria",
                                      "TZA" = "Tanzania",
                                      "UMI" = "US Minor Outlying Islands",
                                      "USA" = "US",
                                      "VGB" = "British Virgin Islands",
                                      "VIR" = "US Virgin Islands"))
    xx <- gsub("\\s*\\([^\\)]+\\)", "", gsub(" and ", " & ", x))
    y <- gsub("North ", "N. ", gsub("South ", "S. ", gsub("East ", "E. ", gsub("West ", "W. ", gsub(" Island", " Isl.", gsub(" Islands", " Isl.", xx))))))
  }
  return(y)
}
