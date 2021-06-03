# Bureau d'étude de CHTI - année 2021

## Probleme 
Le Bureau d'Etudes CHTI avait pour but de créer un systeme de pistolets lasers. 
Nous avons procédés par étape : 
* La lecture et amplification d'un signal provenant d'une photodiode
* Le calcul de sa DFT en assembleur
* L'emmission d'un son à chaque réception si le signal est celui attendu (bon pistolet)
* L'affichage des scores.

## Fin du BE
Nous nous sommes arétés à l'étape d'émission du son avec le signal réel. En fonction de ce signal et donc de sa DFT, nous choisisons d'emmetre ou non le son.
Il nous restait à faire l'affichage des points.

## Commentaires 
Pour le calcul de la DFT, nous avons calculé dans un premier temps toute la partie réelle, puis toute la partie imaginaire. Nous avons ensuite sommés les deux. On pourrait optimiser en mettant le calcul dans une seule boucle et sommer au fur et à mesure.
