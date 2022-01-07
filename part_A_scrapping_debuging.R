if (!require("pacman")) install.packages("pacman")
pacman::p_load(rvest, stringr, tm, SnowballC, wordcloud, RColorBrewer)
set.seed(1234)

value.range <- c(1:700000)

article.index_0 <- sample(value.range, size=700000, replace=FALSE)

article.index <- article.index_0 [c(1:3000)]

len.article.index <- length(article.index)
blesk.url <- "https://www.blesk.cz/clanek/126055"


    blesk.wbpg <- read_html(blesk.url) # obsah hlavní stránky
page.content <- blesk.wbpg %>% 
       html_node("body") %>% html_children()



substantial.content <- page.content[[13]] %>% html_text()
      
      #  čištění textu
      substantial.content <- str_replace_all(substantial.content, "\\t", "")
      substantial.content <- str_replace_all(substantial.content, "\\n", "") 
      substantial.content <- gsub("\\\\", "", substantial.content) 
      substantial.content <- str_replace_all(substantial.content, "\"", "")  
      substantial.content <- str_replace_all(substantial.content, "/", "")  
      substantial.content <- str_replace_all(substantial.content, "\'", "")
      substantial.content <- gsub("  ", " ", substantial.content)
      
      # uložení obsahu a data
      text <- str_match(substantial.content, "Sdílej:\\s*(.*?)\\s*Autor:") [2]
      date <- str_match(substantial.content, "published:\\s*(.*?)\\s*,premium") [2]
      
      







 