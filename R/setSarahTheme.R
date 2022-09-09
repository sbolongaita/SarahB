library(ggplot2)
library(ggthemes)
library(remotes)
library(sysfonts)
library(extrafont)
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
#'
#' @examples
#' setSarahTheme("Barlow")
setSarahTheme <- function(theme, example = TRUE){

  if(packageVersion("Rttf2pt1") != "1.3.8"){
    remotes::install_version("Rttf2pt1", version = "1.3.8")
  }
  theme <- tolower(theme)
  theme_path <- paste0("data/", theme, ".Rda")
  load(theme_path)

  font <- get(theme)$text$family

  if(!font %in% extrafont::fonts()){
    sysfonts::font_add_google(font)
    suppressMessages(extrafont::font_import(prompt = FALSE, pattern = font))
    extrafont::loadfonts(device = "pdf", quiet = TRUE)
  }

  ggplot2::theme_set(get(theme))

  if(example){
    data <- data.frame(x = runif(100, min = 0, max = 100),
                       y = runif(100, min = 0, max = 100),
                       z = sample(c("A", "B", "C"), 100, replace = TRUE))
    ggplot2::ggplot(data = data) +
      ggplot2::geom_point(aes(x = x, y = y, color = z)) +
      ggplot2::scale_x_continuous("X variable") +
      ggplot2::scale_y_continuous("Y variable") +
      ggplot2::labs(title = "Title", subtitle = "Subtitle") +
      ggthemes::scale_color_colorblind("Z variable")
  }

}
