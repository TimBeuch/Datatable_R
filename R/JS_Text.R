#' Title
#'
#' @param data La base de donnees
#' @param Stat Une chaine de caracteres
#' @param Note Une chaine de caracteres
#' @param Lecture Une chaine de caracteres
#' @param Source Une chaine de caracteres
#' @param Champs Une chaine de caracteres
#' @param ... Parametre autre
#'
#' @return
#'
#' @examples

JS_TEXT <- function(data,
                    Stat = Stat,
                    Note = Note,
                    Lecture = Lecture,
                    Source = Source,
                    Champs = Champs,
                    ...){

  # Stat = "Il y a {nrow(iris)} lignes"
  # Lecture = "{data[1,1]}"
  # Champs = "l'école"
  # Source = NULL
  # Note = NULL

t = "function(settings, json) {"
y = "}"
css1 = ".css({'text-align': 'left', 'margin-top': '5px', 'font-size' : '0.8em', 'font-style': 'italic'});"
css2 = ".css({'text-align': 'left', 'margin-bottom': '5px', 'font-size' : '0.8em', 'font-style': 'italic'});"
css3 = ".css({'text-align': 'left', 'font-size' : '0.8em', 'font-style': 'italic'});"

  Java = glue::glue("{t}")

  if (!Stat == " "){
    #Java = glue::glue("{Java} $('div.stat').html('Statistiques :{Stat}.'){css1}")
    Java = paste0(Java,
                  "$('div.stat').html('Statistiques :",
                  Stat,
                  ".')",
                  css1)
  } else {}
  if (!Note == " "){
    #Java = glue::glue("{Java} $('div.note').html('Note :{Note}.'){css1}")
    Java = paste0(Java,
                  "$('div.note').html('Note :",
                  Note,
                  ".')",
                  css1)
  } else {}
  if (!Lecture == " "){
    #Java = glue::glue("{Java} $('div.lecture').html('Lecture :{Lecture}.'){css2}")
    Java = paste0(Java,
                  "$('div.lecture').html('Lecture :",
                  Lecture,
                  ".')",
                  css2)
  } else {}
  if (!Source == " "){
    #Java = glue::glue("{Java} $('div.source').html('Source :{Source}.'){css1}")
    Java = paste0(Java,
                  "$('div.source').html('Source :",
                  Source,
                  ".')",
                  css1)
  } else {}
  if (!Champs == " "){
    #Java = glue::glue("{Java} $('div.champs').html('Champs :{Champs}.'){css3}")
    Java = paste0(Java,
                  "$('div.champs').html('Champs :",
                  Stat,
                  ".')",
                  css3)
  } else {}

#♥ava = glue::glue("{Java}{y}")

Java = paste0(Java,
              "}")

JavaScript = htmlwidgets::JS(Java)

return(JavaScript)

}
