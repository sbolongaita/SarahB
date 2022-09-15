#' Tidy environment
#'
#' @param x A vector indicating the names of objects to tidy (remove); `NULL` will remove all objects that aren't in the base environment (`base.env`), if defined
#' @param base.env The base environment
#'
#' @export
#'
#' @examples
#' tidy()
tidy <- function(x = NULL, base.env = NULL){

  Env <- ls(envir = globalenv())

  if(!is.null(base.env)){
    keep <- get(base.env, envir = globalenv())
  }else{
    keep <- ""
  }

  if(!is.null(x)){
    for(i in 1:length(x)){
      obj <- Env[grepl(paste0("^", x[i]), Env)]
      if(i == 1){
        remove <- obj
      }else{
        remove <- append(remove, obj)
      }
    }
  }else{
    remove <- Env[!(Env %in% keep)]
  }

  rm(list = remove, envir = globalenv())

}
