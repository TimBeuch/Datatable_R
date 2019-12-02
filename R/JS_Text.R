#' Title
#'
#' @param data
#' @param Lecture
#' @param Source
#' @param Champs
#' @param ...
#'
#' @return
#'
#' @examples

JS_TEXT <- function(data,
                    Lecture = Lecture,
                    Source = Source,
                    Champs = Champs,
                    ...){

  Java = paste(
    "function(settings, json) {",
    sep = "")

  if (!is.null(Lecture) == TRUE){
    Java = paste(
      Java,
      "$('div.lecture').html('Lecture :",
      Lecture,
      ".').css({'text-align': 'left', 'margin-top': '5px', 'font-size' : '0.8em', 'font-style': 'italic'});",
      sep = "")
  } else {}
  if (!is.null(Source) == TRUE){
    Java = paste(
      Java,
      "$('div.source').html('Source :",
      Source,
      ".').css({'text-align': 'left', 'font-size' : '0.8em', 'font-style': 'italic'});",
      sep = "")
  } else {}
  if (!is.null(Champs) == TRUE){
    Java = paste(
      Java,
      "$('div.champs').html('Champs :",
      Champs,
      ".').css({'text-align': 'left', 'margin-bottom': '5px', 'font-size' : '0.8em', 'font-style': 'italic'});",
      sep = "")
  } else {}

  Java = paste(Java,
               "}",
               sep = "")

  JavaScript = htmlwidgets::JS(Java)

  return(JavaScript)

}
