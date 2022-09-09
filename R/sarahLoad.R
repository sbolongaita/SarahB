#' Loads R objects from the project's output data folder
#'
#' @param object Name of object to load
#' @param folder Output data folder
#'
#' @return Loads object into environment
#' @export
sarahLoad <- function(object, folder = "3 Output data"){

  all_files <- list.files(path = folder, pattern = ".Rda", full.names = TRUE, recursive = TRUE)

  object_files <- list()
  for(i in seq_along(object)){
    search <- paste0("/",object[i],".Rda")
    if(all(grepl(search, all_files) == FALSE)){
      warning(paste0("No files matching '", search, "' in the '", folder, "' folder"))
      next
    }else{
      object_files[[object[i]]] <- all_files[grepl(paste0("/",object[i],".Rda"), all_files)]
    }
  }

  for(j in names(object_files)){
    load(object_files[[j]], envir = globalenv()); cat(paste0(j, ": '", object_files[[j]], "' loaded\n"))
  }

}
