#' Title
#'
#' @param String une chaine de caractere
#' @param ...
#'
#' @return
#'
#' @examples
ESCAPED <- function(String,
                    ...){
  escaped =  stringr::str_replace(string = String,
                                  pattern = "\\'",
                                  replacement = "\\\\'")
  return(escaped)
}
