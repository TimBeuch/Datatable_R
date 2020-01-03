#' Tableau interractif
#'
#' @param data La base de donnees
#' @param number Un chiffre ou une chaine de charactere
#' @param title Une chaine de charactere precisant le titre de notre tableau
#' @param newname Une chaine de charactere precisant le titre des colonnes (plusieurs formats possible : c("NEWNAME" = 3) ; c("Newname" = 1:3) ; c("test" = "mpg") ; c("bbieyv", ' nb vj', 'ampmc,n', 'pmln','essai', 'voiture', 'yu', 'ae', 'be', 'api', 'erop'))
#' @param Lecture Une chaine de charactere precisant comment lire le tableau
#' @param Champs Une chaine de charactere precisant le champs du tableau
#' @param Source Une chaine de charactere precisant les sources du tableau
#' @param color Une chaine de charactere precisant la couleur qu'on veut donner a notre titre (plusieurs formats possible : pour HEX -> "#FF5733" ; pour RGB - > "rgb(255, 87, 51)" ; pour HSL -> "hsl(11, 80, 60)" ; pour couleur present dans la palette de couleur par defaut -> "red" )
#' @import magrittr htmltools htmlwidgets dplyr DT
#'
#' @return un htmlwidgets sous forme de tableau
#' @export
#'
#' @examples TABLEAU_INTERACTIF(data = mtcars)

TABLEAU_INTERACTIF <- function(data,
                               number = NULL,
                               title = NULL,
                               newname = NULL,
                               Reduc = "FALSE",
                               Stat = NULL,
                               Note = NULL,
                               Lecture = NULL,
                               Champs = NULL,
                               Source = NULL,
                               color = "#ad1c72",
                               ...){

# Nom des colonnes
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
    stop("Il y a pas assez de nouveaux noms de colonne, essayez d'associer les nouveaux noms de colonne sous cette forme 'NEWNAME' = 'OLDNAME'.")
  }

# Filter
  if(nrow(data)<=10){
    filt_pos = 'none'
    } else {
    filt_pos = 'top'
    }

#DOM
  if(nrow(data)<=10){
    dom = 't<"stat"><"note"><"source"><"champs"><"lecture">Bipr'
    } else {
    dom = 'lft<"stat"><"note"><"source"><"champs"><"lecture">Bipr'
    }

  Stat = glue::glue(paste0(" ",
                           Stat))
  Note = glue::glue(paste0(" ",
                           Note))
  Lecture = glue::glue(paste0(" ",
                              Lecture))
  Champs = glue::glue(paste0(" ",
                             Champs))
  Source = glue::glue(paste0(" ",
                             Source))


  Stat =  ESCAPED(Stat)
  Lecture =  ESCAPED(Lecture)
  Champs =  ESCAPED(Champs)
  Source =  ESCAPED(Source)
  Note =  ESCAPED(Note)

# Création du tableau
  tableau = DT::datatable(data,
                          caption = TABLEAU_TITRE(data = data,
                                                  title = title,
                                                  number = number,
                                                  color = color),
                          options = TABLEAU_OPTION(data = data,
                                                   dom = dom,
                                                   Reduc = Reduc,
                                                   Stat = Stat,
                                                   Note = Note,
                                                   Lecture = Lecture,
                                                   Champs = Champs,
                                                   Source = Source),
                          extensions = TABLEAU_EXTENSION(),
                          class = c('display'),
                          autoHideNavigation = TRUE,
                          rownames = FALSE,
                          escape = TRUE,
                          colnames = names(data),
                          filter = list(position = filt_pos,
                                        clear = FALSE))

  return(tableau)
}
