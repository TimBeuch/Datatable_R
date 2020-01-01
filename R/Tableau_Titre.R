#' Title
#'
#' @param data La base de donnees
#' @param number Une chaine de caractere ou un chiffre qui viendra se mettre devant le titre sous forme : "Tableau .... : "
#' @param title Une chaine de caractere qui sera le titre
#' @param color Chaine de caractere qui peut etre soit au format HSL, HEX, RGB, ou une chaine de caractere qui correspond a la palette de couleur de base de R.
#' @param ... Parametre autre
#'
#' @return
#'
#' @examples

TABLEAU_TITRE <- function(data = data,
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
