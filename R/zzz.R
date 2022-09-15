usethis::use_package("grDevices")
.onLoad <- function() {
  if (Sys.info()[1] == "Darwin") {
    dir.create('~/.fonts')
    fonts <- list.files("inst/extdata/fonts/", full.names = TRUE)
    sapply(fonts, file.copy, "~/.fonts")
    system("fc-cache -f ~/.fonts")
  }
  if (Sys.info()[1] == "Linux") {
    dir.create('~/.fonts')
    fonts <- list.files("inst/extdata/fonts/", full.names = TRUE)
    sapply(fonts, file.copy, "~/.fonts")
    system('fc-cache -f ~/.fonts')
  }
  if (Sys.info()[1] == "Windows") {
    grDevices::windowsFonts()
    extrafont::font_import(paths = "inst/extdata/fonts/", prompt = FALSE)
    extrafont::loadfonts(device = "win")
    grDevices::windowsFonts()
  }
  print(extrafont::fonts())
}
