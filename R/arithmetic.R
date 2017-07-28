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
#' ## basic usage - trop. add.
#' ##############################
#'
#' get_plus_type()
#'
#' 1 %+% 5
#' 1:3 %+% 3:1
#' (m1 <- matrix(1:4, 2))
#' (m2 <- matrix(4:1, 2))
#' m1 %+% m2
#'
#' set_plus_max()
#' get_plus_type()
#'
#' 1 %+% 5
#' 1:3 %+% 3:1
#' m1 %+% m2
#'
#' set_plus_min()
#' get_plus_type()
#'
#'
#'
#' ## basic usage - trop. mult.
#' ##############################
#'
#' 1 %.% 5
#' 1:3 %.% 5:7
#' (m1 <- matrix(1:4, 2))
#' (m2 <- matrix(4:1, 2))
#' m1 %.% m2
#'
#'
#'
#' ## basic usage - trop. mat. mult.
#' ##############################
#'
#' 1:3 %..% 5:7
#' (m1 <- matrix(1:4, 2))
#' (m2 <- matrix(4:1, 2))
#' m1 %..% m2
#'
#' (m1 <- matrix(1:6, 2, 3))
#' (m2 <- matrix(6:1, 3, 2))
#' m1 %..% m2
#'
#' set_plus_max()
#' m1 %..% m2
#'
#'
#' ## basic usage - trop. exp.
#' ##############################
#' 5 %^% 3
#' (1:3) %^% (4:6)
#' # 5 %^% 0   # for unit test
#' # 5 %^% 2.5 # for unit test
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
`%.%` <- function(x, y) x + y



#' @rdname tarithmetic
#' @export
`%..%` <- function(x, y) {

  # define tropical inner product (vectors)
  if(is.vector(x) && is.vector(y)) {
    if(get_plus_type() == "min") {
      return( min(x %.% y) )
    } else {
      return( max(x %.% y) )
    }
  }

  # do matrix multiplication
  m <- nrow(x)
  n <- ncol(y)
  mat <- matrix(0L, nrow = m, ncol = n)
  for(i in 1:m) {
    for(j in 1:n) {
      mat[i,j] <- x[i,] %..% y[,j]
    }
  }

  # return
  mat
}




#' @rdname tarithmetic
#' @export
`%^%` <- function(x, y) {
  if(any(abs(y - round(y)) > 1e-10)) stop("tropical exponentiation demands natural number exponents.", call. = FALSE)
  if(!all(y > 0)) stop("tropical exponentiation demands natural number exponents", call. = FALSE)
  y*x
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













