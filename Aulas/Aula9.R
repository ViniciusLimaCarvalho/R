library(ggplot2)
library(class)
library(rpart)
library(rpart.plot)
library(randomForest)

cancer <- read.table(file = "cancer.csv", header = TRUE, sep = ",")
str(cancer)
cancer$diagnosis <- as.factor(cancer$diagnosis)

cancer <- na.omit(cancer)
n <- round(0.8 * nrow(cancer))

set.seed(1731)
indices_treino <- sample(1:nrow(cancer), n, FALSE)

treino <- cancer[indices_treino,]
teste <- cancer[-indices_treino,]

arvore <- rpart(formula = diagnosis ~., data = treino, method = "class")
previsao.arvore <- predict(arvore, newdata = teste, type = "class")
mean(previsao.arvore == teste$diagnosis)

floresta <- randomForest(formula = diagnosis ~ ., data = treino, ntree = 200)
floresta

previsao_floresta <- predict(floresta, newdata = teste, type = "class")
mean(previsao_floresta == teste$diagnosis)
