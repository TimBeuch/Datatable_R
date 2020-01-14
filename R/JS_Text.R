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

JS_TEXT <- function(data,
                    Stat = Stat,
                    Note = Note,
                    Lecture = Lecture,
                    Source = Source,
                    Champs = Champs,
                    ID = ID,
                    ...){

Java = "function(settings, json) {"
# y = "}"
css1 = ".css({'text-align': 'left', 'margin-top': '5px', 'font-size' : '0.8em', 'font-style': 'italic'});"
css2 = ".css({'text-align': 'left', 'margin-bottom': '5px', 'font-size' : '0.8em', 'font-style': 'italic'});"
css3 = ".css({'text-align': 'left', 'font-size' : '0.8em', 'font-style': 'italic'});"

   if (!Stat == " "){
#if (rlang::is_empty(Stat) == FALSE){
    Java = glue::glue("{Java} $('div.{ID[[1]]}').html('Statistiques :{Stat}.'){css1}")
    # Java = paste0(Java,
    #               "$('div.stat').html('Statistiques :",
    #               Stat,
    #               ".')",
    #               css1)
  } else {}
  if (!Note == " "){
#if (rlang::is_empty(Note) == FALSE){
    Java = glue::glue("{Java} $('div.{ID[[2]]}').html('Note :{Note}.'){css1}")
    # Java = paste0(Java,
    #               "$('div.note').html('Note :",
    #               Note,
    #               ".')",
    #               css1)
  } else {}
   if (!Lecture == " "){
#if (rlang::is_empty(Lecture) == FALSE){
    Java = glue::glue("{Java} $('div.{ID[[3]]}').html('Lecture :{Lecture}.'){css2}")
    # Java = paste0(Java,
    #               "$('div.lecture').html('Lecture :",
    #               Lecture,
    #               ".')",
    #               css2)
  } else {}
if (!Source == " "){
  #if (rlang::is_empty(Source) == FALSE){
    Java = glue::glue("{Java} $('div.{ID[[4]]}').html('Source :{Source}.'){css1}")
    # Java = paste0(Java,
    #               "$('div.source').html('Source :",
    #               Source,
    #               ".')",
    #               css1)
  } else {}
  if (!Champs == " "){
 #if (rlang::is_empty(Champs) == FALSE){
    Java = glue::glue("{Java} $('div.{ID[[5]]}').html('Champs :{Champs}.'){css3}")
    # Java = paste0(Java,
    #               "$('div.champs').html('Champs :",
    #               Champs,
    #               ".')",
    #               css3)
  } else {}

Java = glue::glue("{Java}}")

# Java = paste0(Java,
#               "}")

JavaScript = htmlwidgets::JS(Java)

return(JavaScript)

}
