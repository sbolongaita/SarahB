usethis::use_package("ggplot2")
usethis::use_package("ggpubr")
usethis::use_package("extrafont")
#' Save ggplot(s) as a PDF
#'
#' @param x A ggplot object or a list of ggplot objects
#' @param name A character string indicating the filename
#' @param folder A character string indicating the folder where the PDF should be saved
#' @param width Width of each panel; default = 10
#' @param height Height of each panel; default = 10
#' @param multipage A logical indicating if `x` is a list of plots to be saved as a multi-page PDF
#'
#' @export
#'
#' @examples
#' data <- data.frame(x = stats::runif(100, min = 0, max = 100),
#' y = stats::runif(100, min = 0, max = 100),
#' z = sample(c("A", "B", "C"), 100, replace = TRUE))
#' figure <- ggplot2::ggplot(data = data) +
#' ggplot2::geom_point(ggplot2::aes(x = .data$x, y = .data$y, color = .data$z)) +
#' ggplot2::scale_x_continuous("X variable") +
#' ggplot2::scale_y_continuous("Y variable") +
#' ggplot2::labs(title = "Title", subtitle = "Subtitle") +
#' ggthemes::scale_color_colorblind("Z variable")
#' \dontrun{saveGGplot(figure, name = "figure.pdf")}
#' figures <- list("figure 1" = figure,
#' "figure 2" = figure)
#' \dontrun{saveGGplot(figures, name = "figures.pdf", multipage = TRUE)}
saveGGplot <- function(x, name, folder = NULL, width = 6, height = 4, multipage = FALSE){

  if(is.null(folder)){
    folder <- getwd()
  }
  filename <- ifelse(!grepl("\\.pdf$", name), paste0(name, ".pdf"), name)
  path <- paste(folder, filename, sep = "/")

  if(multipage){
    multi <- ggpubr::ggarrange(plotlist = x, nrow = 1, ncol = 1)
    suppressMessages(ggpubr::ggexport(multi, filename = path, width = width, height = height))
  }else{
    suppressMessages(ggpubr::ggexport(x, filename = path, width = width, height = height))
  }

  extrafont::embed_fonts(file = path)
  cat(paste0("'", path, "' saved\n"))

}
