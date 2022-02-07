library(ggplot2)
arr <- c(Médecins=106759, Pharmaciens=43924, Dentistes=25965, Sage_femmes=8215)
arr


# Question 1
print("Question 1 : le personnel soignant diplômé entre 1970 et 1984")
sum(arr)

print("Question 2 : \ncaractère statistique : nombre de diplomé par proffession \n nature : quantitatif continu")

df <- data.frame(
  group = c("Médecins", "Pharmaciens", "Dentistes","Sage_femmes"),
  value = c(106759, 43924, 25965,8215)
)

bp<- ggplot(df, aes(x="", y=value, fill=group))+geom_bar(width = 1, stat = "identity")
pie <- bp + coord_polar("y", start=0)
pie