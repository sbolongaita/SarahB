usethis::use_package("extrafont")
usethis::use_package("ggplot2")
usethis::use_package("ggthemes")
usethis::use_package("remotes")
usethis::use_package("rlang")
usethis::use_package("stats")
usethis::use_package("remotes")
#' Set the ggplot theme using a SarahB theme
#'
#' Most SarahB package themes require Google fonts. If the theme requires a Google font, the Google font name will be the SarahB ggplot theme name (i.e., the 'Barlow' theme requires the 'Barlow' Google font). Google fonts are freely available from (https://fonts.google.com/).
#'
#' Available themes
#' - Barlow: Requires the Barlow Google font (https://fonts.google.com/specimen/Barlow)
#'
#' @param theme A string indicating the name of the SarahB theme
#' @param example A logical indicating if an example ggplot using the theme should be shown
#'
#' @export
#' @importFrom rlang .data
#'
#' @examples
#' setSarahTheme("Barlow")
setSarahTheme <- function(theme, example = TRUE){

  if(utils::packageVersion("Rttf2pt1") != "1.3.8"){
    utils::remove.packages("Rttf2pt1")
    remotes::install_version("Rttf2pt1", version = "1.3.8")
  }

  theme <- tolower(theme)

  # Loading themes
  data("barlow", package = "SarahB", envir = environment())
  ggplot2::theme_set(get(theme, envir = environment()))

  if(example){
    data <- data.frame(x = stats::runif(100, min = 0, max = 100),
                       y = stats::runif(100, min = 0, max = 100),
                       z = sample(c("A", "B", "C"), 100, replace = TRUE))
    ggplot2::ggplot(data = data) +
      ggplot2::geom_point(ggplot2::aes(x = .data$x, y = .data$y, color = .data$z)) +
      ggplot2::scale_x_continuous("X variable") +
      ggplot2::scale_y_continuous("Y variable") +
      ggplot2::labs(title = "Title", subtitle = "Subtitle") +
      ggthemes::scale_color_colorblind("Z variable")
  }

}
