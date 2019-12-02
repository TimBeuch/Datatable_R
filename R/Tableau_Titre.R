#' Title
#'
#' @param data
#' @param number
#' @param title
#' @param color
#' @param ...
#'
#' @return
#'
#' @examples

TABLEAU_TITRE <- function(data,
                          number = NULL,
                          title = NULL,
                          color = color,
                          ...){

  toto = paste('caption-side: top;
               text-align: center;
               color:',
               color,
               ';font-size: 2em;
               text-decoration: underline;
               margin-top: 15px;
               margin-bottom: 15px;',
               sep = "")

  tata = paste('font-size: 1em;',
               sep = "")

  if (is.null(number) == TRUE &
      !is.null(title) == TRUE){

    title = htmltools::tags$caption(style = toto,
                                    htmltools::em(style = tata,
                                                  title))
  } else if (!is.null(number) == TRUE &
             is.null(title) == TRUE){

    title = htmltools::tags$caption(style = toto,
                                    paste("Tableau",
                                          number,
                                          sep = " "),
                                    htmltools::em(title))
  } else if (!is.null(number) == TRUE &
             !is.null(title) == TRUE){

    title = htmltools::tags$caption(style = toto,
                                    paste("Tableau",
                                          number,
                                          ":",
                                          sep = " "),
                                    htmltools::em(title))
  } else {title = NULL}

  return(title)

}
