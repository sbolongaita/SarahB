usethis::use_package("extrafont")
.onLoad <- function(libname, pkgname) {

  if (Sys.info()[1] == "Darwin") {
    fonts <- list.files("inst/extdata/fonts", full.names = TRUE)
    for(font in fonts){
      file.copy(font, "~/Library/Fonts")
    }
    patterns <- unique(gsub("-.*", "", gsub("inst/extdata/fonts/", "", fonts)))
    for(pattern in patterns){
      suppressMessages(extrafont::font_import(pattern = pattern, prompt = FALSE))
    }
    extrafont::loadfonts(device = "pdf", quiet = TRUE)
  }

  # if (Sys.info()[1] == "Linux") {
  #   dir.create('~/.fonts')
  #   fonts <- list.files("inst/extdata/fonts/", full.names = TRUE)
  #   sapply(fonts, file.copy, "~/.fonts")
  #   system('fc-cache -f ~/.fonts')
  # }
  # if (Sys.info()[1] == "Windows") {
  #   grDevices::windowsFonts()
  #   extrafont::font_import(paths = "inst/extdata/fonts/", prompt = FALSE)
  #   extrafont::loadfonts(device = "win")
  #   grDevices::windowsFonts()
  # }

}
