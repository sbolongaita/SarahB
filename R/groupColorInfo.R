library(dplyr)
library(stringr)
#' Color shades needed by group
#'
#' For use with groupColorFunct
#'
#' @param df Data frame
#' @param group Grouping variable for color family (e.g., reds)
#' @param subgroup Subgroup variable for shades (e.g., burgundy, cherry, scarlett)
#'
#' @return List of two with the number of unique color shades needed by group with subgroup labels
#' @export
#'
#' @examples
#' cars <- cars %>% dplyr::mutate(across(everything(), ~plyr::round_any(., f = floor, accuracy = 10)))
#' groupColorInfo(cars, "speed", "dist")
groupColorInfo <- function(df, group, subgroup){
  out <- df %>%
    select(!!as.name(group), !!as.name(subgroup)) %>% unique() %>%
    arrange(!!as.name(group), !!as.name(subgroup)) %>%
    group_by(across(c(!!as.name(group)))) %>%
    dplyr::summarize(n = n(),
                     names = paste(!!as.name(subgroup), collapse = "; "))
  n <- out$n
  names <- unlist(stringr::str_split(paste(out$names, collapse = "; "), "; "))
  return <- list(shades = n, labels = names)
  return(return)
}
