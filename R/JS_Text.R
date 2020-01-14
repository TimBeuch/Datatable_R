#' Caption for datatable
#'
#' @param data La base de donnees
#' @param Stat Une chaine de caracteres
#' @param Note Une chaine de caracteres
#' @param Lecture Une chaine de caracteres
#' @param Source Une chaine de caracteres
#' @param Champs Une chaine de caracteres
#' @param ... Parametre autre
#'
#' @return JS function
JS_TEXT <- function(data,
                    Stat = Stat,
                    Note = Note,
                    Lecture = Lecture,
                    Source = Source,
                    Champs = Champs,
                    ID = ID,
                    ...){

Java = "function(settings, json) {"
css1 = ".css({'text-align': 'left', 'margin-top': '5px', 'font-size' : '0.8em', 'font-style': 'italic'});"
css2 = ".css({'text-align': 'left', 'margin-bottom': '5px', 'font-size' : '0.8em', 'font-style': 'italic'});"
css3 = ".css({'text-align': 'left', 'font-size' : '0.8em', 'font-style': 'italic'});"

   if (!Stat == " "){
    Java = glue::glue("{Java} $('div.{ID[[1]]}').html('Statistiques :{Stat}.'){css1}")
  } else {}
  if (!Note == " "){
    Java = glue::glue("{Java} $('div.{ID[[2]]}').html('Note :{Note}.'){css1}")
  } else {}
   if (!Lecture == " "){
    Java = glue::glue("{Java} $('div.{ID[[3]]}').html('Lecture :{Lecture}.'){css2}")
  } else {}
if (!Source == " "){
    Java = glue::glue("{Java} $('div.{ID[[4]]}').html('Source :{Source}.'){css1}")
  } else {}
  if (!Champs == " "){
    Java = glue::glue("{Java} $('div.{ID[[5]]}').html('Champs :{Champs}.'){css3}")
  } else {}

Java = glue::glue("{Java}}")

JavaScript = htmlwidgets::JS(Java)

return(JavaScript)

}
