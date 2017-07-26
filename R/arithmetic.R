#' Tropical arithmetic
#'
#' Tropical arithmetic
#'
#' @param x x
#' @param y y
#' @return .
#' @export
#' @examples
#'
#' m2("13^1000")
#'
#'
print.m2 <- function(x, ...){

  ## argument checking and basic variable setting
  stopifnot(is.m2(x))

  ## print
  sapply(as.list(x), print)
}
