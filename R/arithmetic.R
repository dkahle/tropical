#' Tropical arithmetic
#'
#' Tropical arithmetic
#'
#' @param x x
#' @param y y
#' @return .
#' @name tarithmetic
#' @examples
#'
#' m2("13^1000")
#'



#' @rdname tarithmetic
#' @export
`%+%` <- function(x, y) pmax(x, y)



#' @rdname tarithmetic
#' @export
`%.%` <- function(x, y) {
  if(is.vector(x) && is.vector(y)) return(x + y)


}


