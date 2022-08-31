#' World Bank classifications for FY 2021-2022
#'
#' A dataset containing World Bank country names, codes, regions, income groups, and lending categories.
#'
#' @format A data frame with 217 rows and 7 variables:
#' \describe{
#'   \item{iso3}{ISO 3-character code}
#'   \item{country}{Country name per World Bank formatting}
#'   \item{region}{World Bank region}
#'   \item{region.abbreviation}{World Bank region abbreviation}
#'   \item{year}{Year of data}
#'   \item{income.group}{World Bank income group}
#'   \item{lending.category}{World Bank lending category}
#' }
#' @source \url{https://datatopics.worldbank.org/world-development-indicators/the-world-by-income-and-region.html}
"wb.classifications"
