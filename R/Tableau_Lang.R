#' Title
#'
#' @param data
#' @param ...
#'
#' @return
#'
#' @examples

TABLEAU_LANG <- function(data,
                         ...){

  langue = list(lengthMenu = "Afficher les _MENU_ premières lignes.",
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

  return(langue)
}
