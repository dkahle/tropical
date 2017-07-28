.onAttach <- function(...) {

	# set global option for min-plus / max-plus
	set_plus_min(message = FALSE)
  packageStartupMessage("Using min-plus algebra.")

	# return
	invisible(TRUE)
}




.onDetach <- function(...) {
  options(tropical = NULL)
}
# restart R
# library(tropical)
# getOption("tropical")
# detach("package:tropical")
# getOption("tropical")





# set_tropical_option both sets options for tropical in the list tropical in options
# and initialized the list when tropical is attached to the search path
# (search())
set_tropical_option <- function(...) {

  # if there is no tropical option (package is being initialized)
  # create the list with the arguments and return
  if ("tropical" %notin% names(options())) {
    options(tropical = list(...))
    return(invisible())
  }

  # otherwise, go through arguments sequentially and add/update
  # them in the list tropical in options
  tropical <- getOption("tropical")
  arg_list <- lapply(as.list(match.call())[-1], eval, envir = parent.frame())
  for (k in seq_along(arg_list)) {
    if (names(arg_list)[k] %in% names(tropical)) {
      tropical[names(arg_list)[k]] <- arg_list[k]
    } else {
      tropical <- c(tropical, arg_list[k])
    }
  }

  # set new tropical
  options(tropical = tropical)

  # return
  invisible()
}
# (l <- list(a = 1, b = 2, c = 3))
# l[d] <- 5
# l





`%notin%` <- function(x, A) {
  !(x %in% A)
}




