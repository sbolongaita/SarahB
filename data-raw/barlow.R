barlow <- theme(
  # Base settings
  rect = element_rect(fill = NA, color = NA),
  text = element_text(family = "Barlow", face = "plain", size = 11),
  # Plot settings
  plot.background = element_rect(fill = NA, color = NA),
  plot.margin = margin(10, 10, 10, 10),
  plot.title = element_text(face = "bold", size = 18,  hjust = 0, vjust = 0, margin = margin(0, 0, 10, 15)),
  plot.subtitle = element_text(size = 14, hjust = 0, vjust = 0, margin = margin(5, 0, 10, 0)),
  plot.caption = element_text(size = 11, margin = margin(10, 0, 0, 0), hjust = 0),
  # Panel settings
  panel.background = element_rect(fill = "white", color = NA),
  panel.grid.major = element_line(color = alpha("black", 0.2), size = 0.2),
  panel.grid.minor.y = element_line(color = alpha("black", 0.2), size = 0.2),
  panel.spacing = unit(10, units = "pt"),
  # Axis settings
  axis.title.x = element_text(size = 12, margin = margin(10, 0, 0, 0)),
  axis.title.y = element_text(size = 12, margin = margin(0, 10, 0, 0), angle = 90),
  axis.text = element_text(),
  axis.line = element_line(color = alpha("black", 0.8), size = 0.2),
  axis.ticks = element_line(color = alpha("black", 0.2), size = 0.2),
  # Legend settings
  legend.title = element_text(size = 12),
  legend.text = element_text(size = 12),
  legend.text.align = 0,
  legend.margin = margin(5, 5, 5, 5),
  legend.background = element_rect(),
  legend.key = element_blank(),
  legend.key.size = unit(20, "pt"),
  # Strip text settings (facet plots)
  strip.background = element_rect(fill = alpha("black", 0.1)),
  strip.placement = "outside",
  strip.text = element_text(size = 12, hjust = 0.5, vjust = 0, margin = margin(5, 5, 5, 5))
)

usethis::use_data(barlow, overwrite = TRUE)
