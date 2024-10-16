library(ggplot2)

grilo <- read.table(file = "grilo.txt", sep = ",", header = TRUE)
str(grilo)

ggplot(data = grilo, mapping = aes(x = frequencia))+
  geom_histogram(color = "black", fill = "lightblue", bins = 10)+
  theme_minimal()

ggplot(data = grilo, mapping = aes(y = frequencia, x = temperatura))+
  geom_point()+
  theme_minimal()+
  geom_smooth(method = "lm")

cor(grilo)

modelo_linear <- lm(formula = frequencia ~ temperatura, data = grilo)

summary(grilo$temperatura)

w <- data.frame(temperatura = c(21, 23.6, 30.9))

predict (modelo_linear, newdata = w)


library(palmerpenguins)
dados <- penguins

dados <- na.omit(dados)

summary(dados)

cor(dados[,-c(1,2,7,8)])

ggplot(data = dados, mapping = aes(x = body_mass_g, y = flipper_length_mm))+
  geom_point(aes(color = species))+
  geom_smooth(method = "lm")+
  theme_minimal()

library(dplyr)

dados |>
  filter(species == "Chinstrap") |>
  select(flipper_length_mm, body_mass_g) |>
  cor()

modelo2 <- lm(formula = flipper_length_mm ~ body_mass_g + bill_length_mm, data = dados)
modelo2
summary(modelo2)
