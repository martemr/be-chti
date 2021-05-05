# be-chti


## StepSon
### Partie 1.
### Partie 2.
### Partie 3: 
On affiche le signal, centré entre 0 et 719. 

### Partie 4:
#### Etape 4.2 : Observation de la PWM en simulation LTSpice
On remarque dans la simulation LTSpice que le PWM est à l'état haut quand le compteur est inférieur à compvalue.
Le PWM va donc avoir beaucoup d'etats hauts quand le signal est de haute amplitude, et proportionellement beaucoup de bas quand l'amplitude est faible. Le filtre permet de reconstituer le signal à partir du PWM.

#### Etape 4.3 : Ajout de la PWM dans le programme
On fixe la période à 720ms, soit 1.39mHz de fréquence
Après vérification en simulation (portb) on a bien la PWM correcte.

#### Etape 4.4 : Test du programme sur cible réelle 
On va construire un filtre, de fréquence de coupure de 4kHz. Or fc=1/2pi*R*C donc on choisira R=1200 Ohms, C=33 nF.
On a aussi ajouté une étape qui verifie que l'on est à la fin du son (AdresseSon + LongueurSon) et si oui quitte le programme.


#### Etape 4.5 : Finalisation du module GestionSon.s

**A faire :** *partie 4.5, vérifier le bon fonctionnement*