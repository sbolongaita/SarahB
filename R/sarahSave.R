#' Saves objects to the project's output data folder
#'
#' @param object Object to save
#' @param folder Folder to save to
#' @param type "rda" or "csv
#'
#' @return Notification of saved object
#' @export
sarahSave <- function(object, folder = "03-output_data", type = "rda"){

  for(i in seq_along(object)){

    filename <- as.character(object[i])

    if("rda" %in% type){
        filepath <- paste0(paste(folder, filename, sep = "/"), ".Rda")
        save(list = filename, file = filepath)
        cat(paste0("'", filepath, "' saved\n"))
    }

    if("csv" %in% type){
      filepath <- paste0(paste(folder, filename, sep = "/"), ".csv")
      write.csv(x = get(filename), file = filepath, row.names = FALSE, na = "")
      cat(paste0("'", filepath, "' saved\n"))
    }
  }

}
