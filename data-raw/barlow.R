usethis::use_package("ggplot2")
usethis::use_package("scales")

barlow <- ggplot2::theme(
  # Base settings
  rect = ggplot2::element_rect(fill = NA, color = NA),
  text = ggplot2::element_text(family = "Barlow", face = "plain", size = 11),
  # Plot settings
  plot.background = ggplot2::element_rect(fill = NA, color = NA),
  plot.margin = ggplot2::margin(10, 10, 10, 10),
  plot.title = ggplot2::element_text(face = "bold", size = 18,  hjust = 0, vjust = 0, margin = ggplot2::margin(0, 0, 10, 15)),
  plot.subtitle = ggplot2::element_text(size = 14, hjust = 0, vjust = 0, margin = ggplot2::margin(5, 0, 10, 0)),
  plot.caption = ggplot2::element_text(size = 11, margin = ggplot2::margin(10, 0, 0, 0), hjust = 0),
  # Panel settings
  panel.background = ggplot2::element_rect(fill = "white", color = NA),
  panel.grid.major = ggplot2::element_line(color = scales::alpha("black", 0.2), size = 0.2),
  panel.grid.minor.y = ggplot2::element_line(color = scales::alpha("black", 0.2), size = 0.2),
  panel.spacing = ggplot2::unit(10, units = "pt"),
  # Axis settings
  axis.title.x = ggplot2::element_text(size = 12, margin = ggplot2::margin(10, 0, 0, 0)),
  axis.title.y = ggplot2::element_text(size = 12, margin = ggplot2::margin(0, 10, 0, 0), angle = 90),
  axis.text = ggplot2::element_text(),
  axis.line = ggplot2::element_line(color = scales::alpha("black", 0.8), size = 0.2),
  axis.ticks = ggplot2::element_line(color = scales::alpha("black", 0.2), size = 0.2),
  # Legend settings
  legend.title = ggplot2::element_text(size = 12),
  legend.text = ggplot2::element_text(size = 12),
  legend.text.align = 0,
  legend.margin = ggplot2::margin(5, 5, 5, 5),
  legend.background = ggplot2::element_rect(),
  legend.key = ggplot2::element_blank(),
  legend.key.size = ggplot2::unit(20, "pt"),
  # Strip text settings (facet plots)
  strip.background = ggplot2::element_rect(fill = scales::alpha("black", 0.1)),
  strip.placement = "outside",
  strip.text = ggplot2::element_text(size = 12, hjust = 0.5, vjust = 0, margin = ggplot2::margin(5, 5, 5, 5))
)

usethis::use_data(barlow, overwrite = TRUE)
