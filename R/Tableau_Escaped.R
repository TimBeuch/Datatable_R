#' escaped string
#'
#' @param String une chaine de caractere
#' @param ... other
#'
#' @return
ESCAPED <- function(String,
                    ...){
  escaped =  stringr::str_replace_all(string = String,
                                      pattern = "\\'",
                                      replacement = "\\\\'")
  return(escaped)
}
