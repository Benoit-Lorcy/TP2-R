# ex2 TP3
library(prob)

vecteur1 <- c(1:10) ; vecteur2 <- c(2:11)


bourgeonnements = c(0,1,2,3,4,5,6,7,8,9,10)
contamines = c(482,133,46,24,6,5,2,1,0,1,1)
tableau <- data.frame("Nombre de bourgeonnements par feuille" = bourgeonnements, "Nombre de feuilles contaminées" = contamines) 

# Pour l’ensemble des questions suivantes, donner les commandes R permettant de
# répondre aux questions suivantes.

# 1. Quelle est la population statistique observée ? La taille de l’échantillon ?
print("La population statistique observée est le nombre de feuilles contaminées selon son nombre de bourgeonnements.\n")
cat("La taille de l’échantillon est de ",length(bourgeonnements),"\n")
# 2. Quel est le caractère statistique observé et sa nature ?
print("Le carctère spécifique observé est la contamination.\n")
print("Sa nature est qualitative.")
# 3. Représenter graphiquement les données ?
# colnames(tableau)
print(tableau)
plot(tableau)
# 4. Calculer la moyenne et l’écart-type empirique du nombre de bourgeonnements
#    par feuille.
moyenne = 0
i = 0
for (i in 1:length(bourgeonnements)){
  moyenne = moyenne + bourgeonnements[i] * contamines[i]
}
moyenne = moyenne / length(bourgeonnements)
print("moyenne :")
print(moyenne)