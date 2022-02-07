rm(list = ls())   # clear variables
graphics.off()    # close figures
cat("\014")       # clear console

library(xlsx)
library(latex2exp)

# ===================== Règle de Sturges sur le nombre de classes ====================

n <- 1:100
r1 <- 1 + (log2(n))
r2 <- (sqrt(n))
r3 <- 1 + 10*log10(n)/3
plot(n, r1, type = "l", xlab = TeX("$n$"), ylab = "Nombre de classes")
lines(n, r2, col = "red")
lines(n, r3, col = "blue")
legend("topright", legend = c(TeX("$1+10\\mathrm{log}_{10}(n)/3$"), TeX("$\\sqrt{n}$")), col = c("black","red"), lty=1)


# ==================================== Exercice 1 ===================================

# Q1 et Q2)
table <- read.xlsx("./dataTP3.xlsx", sheetIndex = 1, startRow = 2, header = FALSE)
# réorganiser les données car elles sont issues de la même variable pour la même population (1 seule colonne)
data <- unlist(table, use.names = FALSE) # transforme la liste en vecteur de numeric, sans prise en compte des noms des lignes et des colonnes
# data est aini un vecteur contenant les 80 observations de la variable "taille des conducteurs"
# Le caractère (ou la variable) étudié est quantitatif discret.

# Q3) dépouiller les données
histgrm <- hist(data, breaks = seq(from = 150, to = 190, by = 5), freq = FALSE, xlab = "Taille en cm",
                ylab = "fréquence", main = "Histogramme (en fréquence)") # affiche la figure
# récupérer les champs de l'objets histgrm pour les questions suivantes
xi <- histgrm$breaks # classes de l'histogramme
ni <- histgrm$counts # nbre d'occurrences par classe
pi <- histgrm$density # estimation de la probabilité d'occurence
fi <- ni/sum(ni) # fréquence d'occurrence des classes : pi = fi / 5
w <- 5 # largeur des classes

# Q4) Fonction de répartition
# Solution 1 : pas terrible
plot(ecdf(data))
boxplot(data, horizontal = T, add = T)  # avec le boxplot
# Solution 2 : utiliser les fréquences ou la densité dans l'objet histogramme
Fi <- cumsum(fi)
plot(xi[1:length(xi)-1], Fi, xlab = TeX("$x$ (taille en cm)"), ylab = TeX("$F_X(x)$ fonction de repartition"), type = "l")
# ou avec un barplot
barplot(Fi, width = w, names.arg = as.character(xi[1:length(xi)-1]), ylab = TeX("$F_X(x)$"), xlab = TeX("$x$ (taille en cm)"), main = "Fonction de repartition empirique")

# Q5) Médiane, intervalle interquartile
summa <- summary(data)
# autres solutions
med <- 165 + 5*(50-27.5)/(51.25-27.5) # calcul à la main à partir de l'histogramme
Med <- median(data) # fonction toute faite

# Q6) Calcul de l'intervalle interdécile et on enlève les 10% de valeurs les plus extrèmes
quant <- quantile(data, probs = seq(0, 1, 0.05))
quant # l'intervalle est donc [159, 181]
# Estimation avec différentes méthodes (la fonction quantile peut être appelée avec
# un argument spécifiant l'un des 9 algorithmes possibles qui sont implémentés dans la library
# stats pour estimer les quantiles)
Q <- matrix(NA, nrow = 9, ncol = 3)
colnames(Q) <- c("méthode", "Q5", "Q95")
for (i in 1:9) {
  quant <- quantile(data, probs = seq(0, 1, 0.05), type = i)
  Q[i,1] <- i
  Q[i,2] <- quant[2]
  Q[i,3] <- quant[length(quant)-1]
}
# autre méthode : interpolation linéaire sur la fonction de repartition empirique en fonction des classes
q5 <- 150 + 5*(5-2.5)/(8.75-2.50)
q95 <- 180 + 5*(95-92.5)/(97.5-92.5) # On trouve un intervalle de [152, 182.5]
# autre méthode : ecdf de R
FX <- ecdf(data)
FX(159)
FX(181)

# ==================================== Exercice 3 ===================================

table <- read.xlsx("./dataTP3.xlsx", sheetIndex = 3, header = TRUE) #
# On étudie un caractère qualitatif (discret) : la profession des personnes
# L'échantillon est tiré d'une population de personnes de 4 professions
N <- 184863 # lu dans la table

# diagramme camembert : pie chart
percent <- round(10000*table[1:4,2]/N)/100
lbs <- paste(as.character(t(percent)),rep("%",4))
pie(table[1:4,2], labels = lbs, col = rainbow(length(lbs)))
legend("topright", legend = table[1:4,1], fill = rainbow(length(lbs)))