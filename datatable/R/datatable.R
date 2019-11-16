#' Tableau interractif
#'
#' @param data La base de donnees
#' @param number Un chiffre ou une chaîne de charactere
#' @param title Une chaine de charactere precisant le titre de notre tableau
#' @param newname Une chaine de charactere precisant le titre des colonnes (format attendu : c("NEWNAME" = 3) ; c("Newname" = 1:3) ; c("test" = "mpg") ; c("bbieyv", ' nb vj', 'ampmc,n', 'pmln','essai', 'voiture', 'yu', 'ae', 'be', 'api', 'erop'))
#' @param Lecture Une chaine de charactere precisant comment lire le tableau
#' @param Champs Une chaine de charactere precisant quel est le champs du tableau
#' @param Source Une chaine de charactere precisant quelles sont les sources du tableau
#' @param color Une chaine de charactere precisant la couleur qu'on veut donner à notre titre (format attendu : pour HEX -> "#FF5733" ; pour RGB - > "rgb(255, 87, 51)" ; pour HSL -> "hsl(11, 80%, 60%)" ; pour couleur present dans la palette de couleur par defaut -> "red" )
#' @param ... Liste d'autre fonctions potentiellement compatible
#'
#' @return Un tableau pour les rendu html
#' @import magrittr
#' @importFrom htmltools tags htmlDependency
#' @importFrom DT datatable
#' @export
#'
#' @examples
TABLEAU_INTERACTIF <- function(data,
                               number = NULL,
                               title = NULL,
                               newname = NULL,
                               Lecture = NULL,
                               Champs = NULL,
                               Source = NULL,
                               color = "#ad1c72",
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

    titre = htmltools::tags$caption(style = toto,
                                    htmltools::em(style = tata,
                                                  title))
  } else if(!is.null(number) == TRUE &
            is.null(title) == TRUE){

    titre = htmltools::tags$caption(style = toto,
                                    paste("Tableau",
                                          number,
                                          sep = " "),
                                    htmltools::em(title))
  } else if (!is.null(number) == TRUE &
             !is.null(title) == TRUE) {

    titre = htmltools::tags$caption(style = toto,
                                    paste("Tableau",
                                          number,
                                          ":",
                                          sep = " "),
                                    htmltools::em(title))
  } else {titre = NULL}





  cn = base::colnames(data)

  if (is.null(newname) == TRUE) {
    names(data) = cn
  } else if (length(newname) > length(cn)){
    stop(paste(
      'Il y a trop de nouveaux noms de colonne, vous indiquez',
      length(newname),
      'nouveaux noms de colonnes alors que la base de donnees contient',
      length(cn),
      'colonnes.',
      sep = " "))
  } else if (length(newname) == length(cn) &
             class(newname) == "character"){
    names(data) = newname
  } else if (!is.null(names(newname))) {
    i = convertIdx(newname,
                   cn)
    cn[i] = names(newname)
    names(data) = cn
  }else if (length(newname) < length(cn) &
            !class(newname) == "numeric"){
    stop("Il y a pas assez de nouveaux noms de colonne, essayez d'associer les nouveaux noms de colonne sous cette forme NEWNAME = OLDNAME.")
  }



  langue = list(
    lengthMenu = "Afficher les _MENU_ premières lignes.",
    search = "Rechercher un élément particulier :",
    processing = "Traitement de la requête en cours...",
    info = "Le tableau contient _TOTAL_ cas. Ici, il est affiché les cas _START_ à _END_.",
    infoEmpty = "C'est vide ! Il n'y a aucun élément qui correspond à votre recherche.",
    loadingRecords = "Chargement en cours...",
    zeroRecords =   "C'est vide ! Il n'y a aucun élément qui correspond à votre recherche. Essayez avec un autre orthographe peut-être !",
    decimal = " ",
    thousands = " ",
    paginate = list( previous = "Précédent",
                     `next` = "Suivant"))




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

  JavaScript = JS(Java)





  option = list(
    searchHighlight = TRUE,
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
    language = langue,
    initComplete = JavaScript
  )




  extension = c( 'Buttons',
                 'Select' )



  tableau = DT::datatable(data,
                          caption = titre,
                          options = option,
                          extensions = extension,
                          class = c('display'),
                          autoHideNavigation = TRUE,
                          rownames = FALSE,
                          escape = FALSE,
                          colnames = newname,
                          filter = list(position = 'top',
                                        clear = FALSE)) %>%
    formatStyle(names(data),
                textAlign = 'center')

  return(tableau)
}

#' Converti charactere en numeric
#'
#' @param i
#' @param names
#' @param n
#' @param invert
#'
#' @return
#' @export
#'
#' @examples
convertIdx = function(i,
                      names,
                      n = length(names),
                      invert = FALSE) {

  if (!is.character(i)) return({
    if (invert) {
      if (is.numeric(i)) -i else if (is.logical(i)) !i else {
        stop("L'indice doit etre un character, numeric ou logical objet") }} else i})
  if (is.null(names)) stop('Les donnees doient avoir des noms de colonnes')
  o = setNames(seq_len(n),
               names)
  i = o[i]
  if (any(is.na(i)))
    stop("Certains noms de colonnes ne sont pas present dans les donnees")
  if (invert) o[-i] else i

}
