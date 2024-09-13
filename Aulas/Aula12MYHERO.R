library(rvest)
library(dplyr)
library(tidytext)
library(ggplot2)

url <- "https://www.letras.mus.br/foo-fighters/15179/"

html <- read_html(url)
html |>
  html_elements("h1")|>
  html_text2()

letra <- html |>
  html_elements("div.lyric") |>
  html_elements("p") |>
  html_text2() |>
  paste(collapse = " ")
letra

letra <- data.frame(letra)

letra |>
  unnest_tokens(output = word, input = letra) |>
  count(word, sort = TRUE) |>
  head(n = 10) |>
  ggplot(aes(y = word, x = n))+
  geom_col()+
  theme_minimal()
