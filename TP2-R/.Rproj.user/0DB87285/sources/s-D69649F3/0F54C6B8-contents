# Question 1
"Q1 > La population statistique observée est un ensemble de conducteurs de camion"
"Q1 > Pour obtenir la taille de l'échantillon (si c'est un vecteur) : `length(echantillon)`"

# Question 2
"Q2 > Le caractère statistique observé est la taille."

# Question 3
E <- sort(c(151,163,165,168,170,173,175,179,152,163,165,168,171,173,175,179,157,164,166,169,172,174,176,180,159,164,166,169,172,174,176,180,160,164,167,169,172,174,177,181,160,164,167,169,172,174,177,181,160,164,167,169,173,174,177,181,161,164,168,169,173,175,178,181,161,165,168,170,173,175,178,186,162,165,168,170,173,175,179,187))
hist(E)

# Question 4
plot(E); lines(smooth.spline(E))

# Question 5
summary(E)
median(E)
q1 <- quantile(E, 0.25)
q3 <- quantile(E, 0.75)
q3 - q1

# Question 6
q05 <- quantile(E, 0.05)
q95 <- quantile(E, 0.95)
E[which(E >= q05 & E <= q95)]
