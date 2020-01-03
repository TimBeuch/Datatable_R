#' Title
#'
#' @param dom la chaine de caractère correspondant au dom
#' @param ...
#'
#' @return
#'
#' @examples

TABLEAU_OPTION <- function(data = data,
                           dom = dom,
                           Reduc = Reduc,
                           Stat = Stat,
                           Note = Note,
                           Lecture = Lecture,
                           Source = Source,
                           Champs = Champs,
                           ...){

if(Reduc == "TRUE"){
  render = htmlwidgets::JS(
    "function(data, type, row, meta) {",
    "return type === 'display' && data.length > 10 ?",
    "'<span title=\"' + data + '\">' + data.substr(0, 10) + '...</span>' : data;",
    "}")
}else{
  render = NULL
}

  option = list(searchHighlight = TRUE,
                select = TRUE,
                dom = dom,
                search = list( regex = TRUE,
                               caseInsensitive = TRUE),
                columnDefs = list( list ( className = "dt-center",
                                          targets = "_all",
                                          render = render)),
                buttons = list( list ( extend = 'copy',
                                       text = '<u>C</u>opier',
                                       key = list(key = 'c',
                                                  altKey = TRUE)),
                                list ( extend = 'csv',
                                       text = '.CS<u>V</u>',
                                       key = list(key = 'v',
                                                  altKey = TRUE)),
                                list ( extend = 'excel',
                                       text = '.<u>X</u>LSX',
                                       key = list(key = 'x',
                                                  altKey = TRUE)),
                                list ( extend = 'pdf',
                                       text = '.<u>P</u>DF',
                                       orientation = 'landscape',
                                       key = list(key = 'p',
                                                  altKey = TRUE)),
                                list ( extend = 'print',
                                       text = '<u>I</u>mprimer',
                                       messageBottom = paste(Stat,
                                                             Note,
                                                             Lecture,
                                                             Source,
                                                             Champs,
                                                             sep = "\n"),
                                       key = list(key = 'i',
                                                  altKey = TRUE))),
                pageLength = 10,
                language = TABLEAU_LANG(),
                initComplete = JS_TEXT(Stat = Stat,
                                       Note = Note,
                                       Lecture = Lecture,
                                       Source = Source,
                                       Champs = Champs)
  )

  return(option)

}
