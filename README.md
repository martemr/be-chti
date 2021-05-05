# be-chti


## **Step Son**
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

La lecture du son marche, il n'y a pas d'erreur. On a aussi ajouté le GestionSon.h.



## **Step DFT**
### Partie 1

<<<<<<< HEAD
#### Etape 1.1 : Petit rappel

Les valeurs des fréquences correspondantes aux pistolets sont :
* k1 = 85 kHz
* k2 = 90 kHz
* k3 = 95 kHz
* k4 = 100 kHz
* k5 = 115 kHz
* k6 = 120 kHz

2. 
0x02C1 → 0d705    -> 0000.172119140625
0xFE01 -> (complement à 2 = 0d0510) -> -0000.12451171875



### Partie 2


**A faire :** *partie XX, ...*
=======
**A faire :** *partie XX, ...*
>>>>>>> 9c47f5b2375b29e520a62d58ae4019a493a52e7f
