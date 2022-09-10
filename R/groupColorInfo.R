usethis::use_package("dplyr")
usethis::use_package("stringr")
#' Extract `groupColor` parameters from data frame
#'
#' This is a helper function that allows for easy extraction of the `n` and `names` parameters for the `groupColor` function from a data frame.
#'
#' @param df Data frame
#' @param group Grouping variable for color family (e.g., reds)
#' @param subgroup Subgroup variable for shades (e.g., burgundy, cherry, scarlett)
#'
#' @return List of two with the number of unique color shades needed by group and the subgroup labels for each shade
#' @importFrom dplyr %>%
#' @export
#'
#' @examples
#' group = c("Red things", "Red things", "Yellow things", "Green things", "Green things")
#' subgroup = c("roses", "apples", "oranges", "plants", "zucchini")
#' data = c(5, 31, 19, 93, 29)
#' df <- data.frame(group, subgroup, data)
#' groupColorInfo(df = df, group = "group", subgroup = "subgroup")
groupColorInfo <- function(df, group, subgroup){
  out <- df %>%
    dplyr::select(!!as.name(group), !!as.name(subgroup)) %>% unique() %>%
    dplyr::arrange(!!as.name(group), !!as.name(subgroup)) %>%
    dplyr::group_by(dplyr::across(c(!!as.name(group)))) %>%
    dplyr::summarize(n = dplyr::n(),
                     names = paste(!!as.name(subgroup), collapse = "; "))
  n <- out$n
  names <- unlist(stringr::str_split(paste(out$names, collapse = "; "), "; "))
  return <- list(n = n, names = names)
  return(return)
}

