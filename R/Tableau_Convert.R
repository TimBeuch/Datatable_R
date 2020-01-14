#' Convertion caractere en numeric
#'
#' @param i iteration
#' @param names chaine de caractere
#' @param n longueur
#' @param invert invertion
#'
#' @return une convertion de character en numeric ou l'inverse
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
