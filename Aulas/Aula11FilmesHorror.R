library(rvest)
library(dplyr)
library(stringr)
library(ggplot2)

url <- "https://www.timeout.com/film/best-horror-films"

html <- read_html(url)
html

nomes <- html|>
  html_elements("h3._h3_cuogz_1")|>
  html_text2()

posicao <- str_extract_all(string = nomes, pattern = "^\\d+" )
posicao <- unlist(posicao)
posicao
posicao <- as.numeric(posicao)

anos <- str_extract_all(string = nomes, pattern = "\\(\\d+\\)$")
anos <- unlist(anos)
anos <- str_extract_all(string = anos, pattern = "\\d+")
anos <- as.numeric(anos)
anos

titulos <- str_remove_all(nomes, "\\d+\\.\\s+")
titulos <- str_remove_all(titulos, "\\s+\\(\\d+\\)$")

filmes_horror <- data_frame(posicao,titulos,anos)

write.csv(filmes_horror,file = "filmes_horror.csv", row.names = FALSE)
