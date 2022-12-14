usethis::use_package("utils")
#' Saves objects to the project's output data folder
#'
#' @param object Object to save
#' @param folder Folder to save the object to
#' @param type Character string of file type; ".rda" or ".csv
#'
#' @return Notification of saved object
#' @export
sarahSave <- function(object, folder = "3 Output data", type = ".rda"){

  for(i in seq_along(object)){

    filename <- as.character(object[i])

    if(".rda" %in% type){
        filepath <- paste0(paste(folder, filename, sep = "/"), ".Rda")
        save(list = filename, file = filepath)
        cat(paste0("'", filepath, "' saved\n"))
    }

    if(".csv" %in% type){
      filepath <- paste0(paste(folder, filename, sep = "/"), ".csv")
      utils::write.csv(x = get(filename), file = filepath, row.names = FALSE, na = "")
      cat(paste0("'", filepath, "' saved\n"))
    }
  }

}
