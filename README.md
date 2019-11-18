
# Preambule

Ce package a pour but de rapidement créer un tableau interactif pour les rendus html généré grâce à R. Ce package est à comprendre comme étant un moyen plus rapide d'utiliser le package DT.

Pour plus d'informations concernant le package DT veuillez vous rendre ici (https://rstudio.github.io/DT/) et ici (https://datatables.net/).

# Motivation

Le package DT est très intéréssant mais compliqué à utilisé car je trouve la documentation très parcelaire (de mon point de vue), de ce fait j'ai réalisé des fonctions qui permet de simplifier son utilisation.

# Fonction Tableau_Interractif

Vous pouvez utiliser la fonction TABLEAU_INTERACTIF sans argument, ce qui vous donnera un rendu par défaut d'un tableau pour html. Ce rendu par défaut intègre les différents bouttons présent dans le DT package. 


```r
# devtools::install_github("TimBeuch/Datatable_R")
pacman::p_load(datatable,
               dplyr)

data = mtcars

data %>% 
  TABLEAU_INTERACTIF()
```

## Donner un titre

Il y a deux arguments pour donner un titre à son tableau "title" et "number". 

Number permet d'indiquer un numéro pour le tableau, mais peut aussi être vide. Number permet d'indiquer automiquement : "Tableau [number] :"

Title permet d'indiquer le titre pour le tableau.

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

Il y a plusieurs façon d'indiquer la couleur qu'on veut associer à un titre.

La couleur du titre peut-être mis au format HSL :


```r
data %>% 
  TABLEAU_INTERACTIF(title = "tire quelconque",
                     number = 1,
                     color =  "hsl(11, 80%, 60%)")
```

La couleur du titre peut-être mis au format HEX :

```r
data %>% 
  TABLEAU_INTERACTIF(title = "tire quelconque",
                     number = 1,
                     color = "#FF5733")
```

La couleur du titre peut-être mis au format RGB :

```r
data %>% 
  TABLEAU_INTERACTIF(title = "tire quelconque",
                     number = 1,
                     color = "rgb(255, 87, 51)")
```

La couleur du titre peut-être mis au format caractere si la chaine de caractere correspond aux couleurs prédéfinis dans la paltte de couleur de base de R :

```r
data %>% 
  TABLEAU_INTERACTIF(title = "tire quelconque",
                     number = 1,
                     color = "red")
```

## Changer les noms de colonne

Il y a plusieurs façons d'indiquer les nouveau nom de colonnes pour son tableau.

On peut choisir de cibler quelle colonne doit changer de nom en indiquant son numero d'emplacement. 

```r
data %>% 
  TABLEAU_INTERACTIF(title = "tire quelconque",
                     number = 1,
                     newname = c("newname"= 3))
```

On peut choisir de cibler quelle colonne doit changer de nom en indiquant nom actuelle. 

```r
data %>% 
  TABLEAU_INTERACTIF(title = "tire quelconque",
                     number = 1,
                     newname = c("newname"= "mpg"))
```

On peut aussi associer des nouveaux noms de colonnes à un ensemble de noms de colonne.

```r
data %>% 
  TABLEAU_INTERACTIF(title = "tire quelconque",
                     number = 1,
                     newname = c("newname"= 1:3))
```

On peut tout aussi indiquer une chaine de caractere qui viendra remplacer les noms de colonnes du tableau.

```r
data %>% 
  TABLEAU_INTERACTIF(title = "tire quelconque",
                     number = 1,
                     newname = c("bbieyv", ' nb vj', 'ampmc,n', 'pmln','essai', 'voiture', 'yu', 'ae', 'be', 'api', 'erop'))
```

## Note de bas de tableau

On peut associer les sources, champs et lecture du tableau via ces arguments.

```r
data %>% 
  TABLEAU_INTERACTIF(title = "tire quelconque",
                     number = 1,
                     newname = c("newname"= "mpg"),
                     Lecture = "blabla",
                     Champs = "bla",
                     Source = "blablabla")
```

Ne pas hesiter a mettre ces arguments dans l'environnement globale de R.

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
