#' Title
#'
#' @param data La base de donnees
#' @param ... Parametre autre
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
                infoFiltered = "(filtre réalisé sur les _MAX_ éléments)",
                infoPostfix = "",
                infoEmpty = "C'est vide ! Il n'y a aucun élément qui correspond à votre recherche.",
                loadingRecords = "Chargement en cours...",
                zeroRecords =   "C'est vide ! Il n'y a aucun élément qui correspond à votre recherche. Essayez avec un autre orthographe peut-être !",
                emptyTable = "Aucune donnée disponible dans le tableau",
                decimal = " ",
                thousands = " ",
                paginate = list( previous = "Précédent",
                                 `next` = "Suivant",
                                 last = "Dernier",
                                 first = "Premier"),
                aria = list( sortAscending = ": activer pour trier la colonne par ordre croissant",
                             sortDescending = ": activer pour trier la colonne par ordre décroissant"))

  return(langue)
}
