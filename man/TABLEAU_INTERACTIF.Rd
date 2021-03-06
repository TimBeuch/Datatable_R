% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/datatable.R
\name{TABLEAU_INTERACTIF}
\alias{TABLEAU_INTERACTIF}
\title{Tableau interractif}
\usage{
TABLEAU_INTERACTIF(
  data,
  number = NULL,
  title = NULL,
  newname = NULL,
  Reduction = "FALSE",
  Stat = NULL,
  Note = NULL,
  Lecture = NULL,
  Champs = NULL,
  Source = NULL,
  color = "#ad1c72",
  ...
)
}
\arguments{
\item{data}{La base de donnees}

\item{number}{Un chiffre ou une chaine de charactere}

\item{title}{Une chaine de charactere precisant le titre de notre tableau}

\item{newname}{Une chaine de charactere precisant le titre des colonnes (plusieurs formats possible : c("NEWNAME" = 3) ; c("Newname" = 1:3) ; c("test" = "mpg") ; c("bbieyv", ' nb vj', 'ampmc,n', 'pmln','essai', 'voiture', 'yu', 'ae', 'be', 'api', 'erop'))}

\item{Lecture}{Une chaine de charactere precisant comment lire le tableau}

\item{Champs}{Une chaine de charactere precisant le champs du tableau}

\item{Source}{Une chaine de charactere precisant les sources du tableau}

\item{color}{Une chaine de charactere precisant la couleur qu'on veut donner a notre titre (plusieurs formats possible : pour HEX -> "#FF5733" ; pour RGB - > "rgb(255, 87, 51)" ; pour HSL -> "hsl(11, 80, 60)" ; pour couleur present dans la palette de couleur par defaut -> "red" )}
}
\value{
un htmlwidgets sous forme de tableau
}
\description{
Tableau interractif
}
\examples{
TABLEAU_INTERACTIF(data = mtcars)
}
