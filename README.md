[logo]: https://github.com/AntoineCharbonnier/School-gobelins/blob/master/public/logo/Logo_hep.png "HEP!"
[ablalouna]: https://github.com/AntoineCharbonnier/School-gobelins/blob/master/public/assets/profile_images/Abla_Louna.png "One student named Abla Louna!"

# Projet Hep! : 

![alt text][logo]

## Projet d'école à Gobelins

L'application s'utilise en classe de CM1 et au début d’une notion. 
Le professeur fait son cours (rendu interactif grâce à la tablette) et adresse une suite d'exercices aux élèves de sa classe. 
Le professeur suit en temps réel l'avancée de la classe et son niveau de compréhension, 
la vitesse d'apprentissage de chacun et peut cibler les élèves en réelle difficulté (l’élève peut débloquer un indice en actionnant un « HELP »).



Se connecter à la fois avec un élève tel que Abla Louna : 

![alt text][ablalouna]

```
   email: 'AblaLouna@gmail.com'
   password: 'AblaLouna'
```

Et avec le professeur, dans un autre naviagteur, pour voir en temps réel les intéractions de l'enfant : 

```
   email: 'PhilippeNeveu@gmail.com'
   password: 'PhilippeNeveu'
```



### TO DO : 

1. Fix bug signal help : ne pas avoir a valider sa réponse pour actualiser l'affichage du Help chez le professeur
2. Animation intro
3. Dots de connections sur la tablette du professeur dans l'espace classe
4. Actualiser le temps du professeur pas en additionnant le temps des eleves
5. ~~Pouvoir rouvrir la fenetre de visualisation de l'enfant sur la partie Espace classe~~
6. Couleur pour le triage des eleves une fois les exercices terminer
7. Fix bug formation de groupes


### RUN : 

```curl https://install.meteor.com/ | sh```
```npm install ```
```meteor```

#### RESET : 

cf [server.coffee](https://github.com/AntoineCharbonnier/School-gobelins/blob/master/server/server.coffee)
