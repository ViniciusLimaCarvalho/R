library(tidytext) #manipulação de texto
library(dplyr)    #manipulação de dados
library(ggplot2)
library(tidyr)    #organizar um conjunto bagunçado
library(stopwords)#palavras "irrelevantes"
library(rvest)

url <- "https://www.bbc.com/portuguese/articles/c3dv8yy3d8jo"

html <- read_html(url)
texto <- html |>
  html_elements("p.bbc-hhl7in") |>
  html_text2() |>
  paste0(collapse = " ")

conjunto <- data.frame(texto)
conjunto

conjunto |>
  unnest_tokens(output = word, input = texto) |>
  count(word, sort = TRUE) |>
  top_n(10)

stopwords_br <- data.frame(word = stopwords("pt"))

conjunto |>
  unnest_tokens(output = word, input = texto)|>
  anti_join(stopwords_br)|>
  count(word,sort = TRUE)|>
  top_n(10) |>
  mutate(word = reorder(word,n)) |>
  ggplot(mapping = aes(y = word, x = n))+
  geom_col(fill = "purple4")+
  theme_minimal()

library(janeaustenr)
livro <- prideprejudice

conjunto2 <- data.frame(livro)

stopwords_en <- data.frame(word = stopwords("en"))

conjunto2 |>
  unnest_tokens(output = word, input = livro) |>
  anti_join(stopwords_en)|>
  count(word, sort = TRUE)|>
  top_n(10)|>
  mutate(word = reorder(word,n))|>
  ggplot(mapping = aes(y = word, x = n))+
  geom_col(fill = "orangered2")+
  theme_minimal()

sentimentos <- get_sentiments("bing")
library(stringr)

capitulos <- str_detect(conjunto2$texto, "^Chapter \\d+")
capitulos <- cumsum(capitulos)

conjunto2 |>
  mutate(capitulo = capitulos) |>
  unnest_tokens(word,texto)|>
  inner_join(sentimentos)|>
  count(capitulo,sentiment) |>
  spread(sentiment, n, fill = 0) |>
  mutate(total = positive - negative) |>
  ggplot(mapping = aes(x = capitulo, y = total))+
  geom_col(fill = "brown4")+
  theme_minimal()

