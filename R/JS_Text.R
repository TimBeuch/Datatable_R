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


  Java = paste0("function(settings, json) {")

  if (!rlang::is_empty(Stat) == TRUE){
    Java = sprintf("%s $('div.stat').html('Statistiques : %s.').css({'text-align': 'left', 'margin-top': '5px', 'font-size' : '0.8em', 'font-style': 'italic'});",
                   Java,
                   Stat)
  } else {}
  if (!rlang::is_empty(Note) == TRUE){
    Java = sprintf("%s $('div.note').html('Note : %s.').css({'text-align': 'left', 'margin-top': '5px', 'font-size' : '0.8em', 'font-style': 'italic'});",
                   Java,
                   Note)
  } else {}
  if (!rlang::is_empty(Lecture) == TRUE){
    Java = sprintf("%s $('div.lecture').html('Lecture : %s.').css({'text-align': 'left', 'margin-bottom': '5px', 'font-size' : '0.8em', 'font-style': 'italic'});",
                   Java,
                   Lecture)
  } else {}
  if (!rlang::is_empty(Source) == TRUE){
    Java = sprintf("%s $('div.source').html('Source : %s.').css({'text-align': 'left', 'margin-top': '5px', 'font-size' : '0.8em', 'font-style': 'italic'});",
                   Java,
                   Source)
  } else {}
  if (!rlang::is_empty(Champs) == TRUE){
    Java = sprintf("%s $('div.champs').html('Champs : %s.').css({'text-align': 'left', 'font-size' : '0.8em', 'font-style': 'italic'});",
                   Java,
                   Champs)

  } else {}

Java = paste0(Java,
              "}")

JavaScript = htmlwidgets::JS(Java)

return(JavaScript)

}
