library(ggplot2)
library(palmerpenguins)

data(penguins)
pinguins <- penguins
str(pinguins)
pinguins <- pinguins[,-c(2,7,8)]
n <- na.omit(pinguins)

n <- round(0.8*nrow(pinguins))
indices_treino <- sample(1:nrow(pinguins), size = n, replace = FALSE)

treino <- pinguins[indices_treino,]
teste <- pinguins[-indices_treino,]
