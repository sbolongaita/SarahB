#' Value exclusion
#'
#' `%notin%` is the opposite of the `%in%` operator. It returns a logical vector indicating if the left operand is not a match in the right operand.
#'
#' @param x A vector containing the values to check for exclusion
#' @param y A vector containing the values to be checked against
#'
#' @return A logical indicating if x was not found in y
#' @export
#'
#' @examples
#' x <- seq(1, 10, 1)
#' y <- seq(1, 10, 2)
#' x %notin% y
'%notin%' <- function(x, y){
  return(! x %in% y)
}
