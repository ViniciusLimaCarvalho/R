titanic <- read.table(file = "titanic.txt", sep = ",", header = TRUE)
titanic <- titanic[,-c(1,9:12)]

titanic$Survived <- as.factor(titanic$Survived)
titanic$Sex <- as.factor(titanic$Sex)
titanic$Pclass <- as.factor(titanic$Pclass)

summary(titanic)

ggplot(data = titanic, aes(x = Sex, fill = Survived))+
  geom_bar(color = "lightblue")+
  labs(title ="Jovens que morreram no triste incidente do Titanic", y = "Quantidade de Jovens", x = "Genero do jovem", fill = "Maculado?")+
  scale_fill_manual(values = c("1" = "#f58f1a", "0" = "black"),labels = c('0' = "MORTO!!☠️", "1" = "Enxertado️"))+
  facet_wrap(~Pclass)+
  scale_x_discrete(labels=c("female" = "mulher", "male" = "jovem"))+
  theme_minimal()
