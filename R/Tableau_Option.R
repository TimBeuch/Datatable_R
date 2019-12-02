#' Title
#'
#' @param data La base de donnees
#' @param ...
#'
#' @return
#'
#' @examples

TABLEAU_OPTION <- function(data,
                           Lecture = Lecture,
                           Source = Source,
                           Champs = Champs,
                           ...){

  option = list(searchHighlight = TRUE,
                select = TRUE,
                dom = 'lft<"lecture"><"source"><"champs">Bipr',
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
                                       messageBottom = paste(Lecture,
                                                             Source,
                                                             Champs,
                                                             sep = "\n"),
                                       key = list(key = 'i',
                                                  altKey = TRUE))),
                pageLength = 10,
                language = TABLEAU_LANG(),
                initComplete = JS_TEXT(Lecture = Lecture,
                                       Source = Source,
                                       Champs = Champs)
  )

  return(option)

}
