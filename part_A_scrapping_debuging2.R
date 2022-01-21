if (!require("pacman")) install.packages("pacman")
pacman::p_load(rvest, stringr, tm, SnowballC, wordcloud, RColorBrewer)
set.seed(1234)

ids <- c(295846, 126055, 382554, 461374, 249732, 199608, 148452, 279106, 501115, 425001, 216904, 311375, 383281, 330424, 
131974, 561288, 371491, 555216, 580011, 517485, 583299, 295672, 591575, 466736, 214903, 360662, 326608)

for (i in 1:length(ids)) {
  url <- paste("https://www.blesk.cz/clanek/", ids[i], sep = "")
  blesk.wbpg<- read_html(url)
  # blesk.wbpg<- read_html("https://www.blesk.cz/clanek/583299")
  # naším cílem je nechat běžet rutinu před nějaká rozumná čísla článku, 
  #blesk.wbpg <- read_html(blesk.url) # obsah hlavní stránky
  page.content <- blesk.wbpg %>% 
         html_node("body") %>% html_children()
  print (page.content %>% html_elements("h1") %>% html_text2())
  print (page.content %>% html_elements("p") %>% html_text2())
  print (page.content %>% html_elements("div.dateTime") %>% html_text2())
  cat("\n------------------------------------------------------------\n\n------------------------------------------------------------\n")
}