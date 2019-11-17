---
output:
  html_document:
    keep_md: yes
    code_folding: show
    code_download: TRUE
    toc: true
    toc_depth: 3
    toc_collapsed: true
    toc_float: true
    number_sections: true
---



# Preambule

Ce packages a pour but de rapidement créer un tableau interactif pour les rendus html généré grâce à R. Ce package est à comprendre comme étant un moyen plus rapide d'utiliser le package DT.

Pour plus d'informations concernant le package DT veuillez vous rendre ici (https://rstudio.github.io/DT/) et ici (https://datatables.net/).

# Fonction Tableau_Interractif

Voici l'utilisation de la fonction TABLEAU_INTERRACTIF sans aucun argument


```r
# devtools::install_github("TimBeuch/Datatable_R")
pacman::p_load(datatable,
               dplyr)

data = mtcars

data %>% 
  TABLEAU_INTERACTIF()
```

## Donner un titre

Il y a deux arguments pour donner un titre à son tableau "title" et "number". Number permet d'indiquer le numéro du tableau. De plus cet argument peut-être vide si vous souhaitez juste avoir "tableau :".


```r
data %>% 
  TABLEAU_INTERACTIF(title = "tire quelconque")
```


```r
data %>% 
  TABLEAU_INTERACTIF(title = "tire quelconque",
                     number = 1)
```

## Couleur du titre

Plusieurs façon d'indiquer la couleur qu'on veut associer à son titre :


```r
data %>% 
  TABLEAU_INTERACTIF(title = "tire quelconque",
                     number = 1,
                     color =  "hsl(11, 80%, 60%)")
```


```r
data %>% 
  TABLEAU_INTERACTIF(title = "tire quelconque",
                     number = 1,
                     color = "#FF5733")
```


```r
data %>% 
  TABLEAU_INTERACTIF(title = "tire quelconque",
                     number = 1,
                     color = "rgb(255, 87, 51)")
```


```r
data %>% 
  TABLEAU_INTERACTIF(title = "tire quelconque",
                     number = 1,
                     color = "red")
```

## Changer les noms de colonne

Plusieurs façons d'indiquer les nouveau nom de colonnes pour son tableau.


```r
data %>% 
  TABLEAU_INTERACTIF(title = "tire quelconque",
                     number = 1,
                     newname = c("newname"= 3))
```


```r
data %>% 
  TABLEAU_INTERACTIF(title = "tire quelconque",
                     number = 1,
                     newname = c("newname"= "mpg"))
```


```r
data %>% 
  TABLEAU_INTERACTIF(title = "tire quelconque",
                     number = 1,
                     newname = c("newname"= 1:3))
```


```r
data %>% 
  TABLEAU_INTERACTIF(title = "tire quelconque",
                     number = 1,
                     newname = c("bbieyv", ' nb vj', 'ampmc,n', 'pmln','essai', 'voiture', 'yu', 'ae', 'be', 'api', 'erop'))
```

## Note de bas de tableau


```r
data %>% 
  TABLEAU_INTERACTIF(title = "tire quelconque",
                     number = 1,
                     newname = c("newname"= "mpg"),
                     Lecture = "blabla",
                     Champs = "bla",
                     Source = "blablabla")
```


```r
champ = "blabla"
source = "blablabla"

data %>% 
  TABLEAU_INTERACTIF(title = "tire quelconque",
                     number = 1,
                     newname = c("newname"= "mpg"),
                     Lecture = "blabla",
                     Champs = champ,
                     Source = source)
```
