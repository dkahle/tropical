#' Tropical arithmetic
#'
#' Tropical arithmetic
#'
#' @param x,y a numeric data structure (vector/matrix/array)
#' @param message issue messages to user? (default: TRUE)
#' @return .
#' @name tarithmetic
#' @examples
#'
#' get_plus_type()
#'
#' 1 %+% 5
#' 1:3 %+% 3:1
#'
#' set_plus_max()
#' get_plus_type()
#'
#' 1 %+% 5
#' 1:3 %+% 3:1
#'
#' set_plus_min()
#' get_plus_type()
#'



#' @rdname tarithmetic
#' @export
`%+%` <- function(x, y) {

  if (get_plus_type() == "min") {
    pmin(x, y)
  } else {
    pmax(x, y)
  }

}



#' @rdname tarithmetic
#' @export
`%.%` <- function(x, y) {
  if(is.vector(x) && is.vector(y)) return(x + y)


}



#' @rdname tarithmetic
#' @export
set_plus_min <- function(message = TRUE) {
  if(message) message("Using min-plus algebra.")
  set_tropical_option(plus = "min")
}



#' @rdname tarithmetic
#' @export
set_plus_max <- function(message = TRUE) {
  if(message) message("Using max-plus algebra.")
  set_tropical_option(plus = "max")
}



#' @rdname tarithmetic
#' @export
get_plus_type <- function() getOption("tropical")$plus













