if (!require("pacman")) install.packages("pacman")
pacman::p_load(rvest, stringr, tm, SnowballC, wordcloud, RColorBrewer)
set.seed(1234)
time1 <- Sys.time()
value.range <- c(1:700000)

article.index_0 <- sample(value.range, size=700000, replace=FALSE)
article.index <- article.index_0 [c(1:1000)]
our.database <- NULL 
blesk.wbpg <- NULL

for (i in 1:length(article.index)) {
  url <- paste("https://www.blesk.cz/clanek/", article.index[i], sep = "")
  # všechny proměnné je potřeba vynulovat, aby se nám nepřepisoval dřívější články, 
  # v případě, že článek nenajdeme
  new.database.entry <- NULL
  title <- NULL
  text <- NULL
  data <- NULL
  page.content <- NULL
  
  try ({blesk.wbpg <- read_html(url)
    page.content <- blesk.wbpg %>% 
           html_node("body") %>% html_children()
    title <- paste(page.content %>% html_elements("h1") %>% html_text2(), collapse = " ")
    text <- paste(page.content %>% html_elements("p") %>% html_text2(), collapse = " ")
    
    # datum a čas se objevují ve dvou formátech, což je třeba vyzkoušet:
    date <- page.content %>% html_elements("div.dateTime") %>% html_text2()
    if (length(date) == 0) {
    date <- page.content %>% html_nodes("div.datetime-start") %>% html_text2()}
    
    # také jméno autora se objevuje min. ve dvou formátech (a ne ve všech článcích)
    author <- page.content %>% html_elements("div.author-container") %>% html_text2()
    if (length(author) == 0) {
    author <- page.content %>% html_elements("div.author-name-container") %>% html_text2()}
    
    # je potřeba explicitně kódovat stringové proměnné s nulovou délkou jako missingy
    title <- ifelse (length(title) == 0, NA, title)
    text <- ifelse (length(text) == 0, NA, text)
    date <- ifelse (length(date) == 0, NA, date)
    author <- ifelse (length(author) == 0, NA, author)
    
    new.database.entry <- data.frame(article.num = article.index[i], title = title, text = text, date = date, author = author)  
  
    if (is.null(our.database)) {
      our.database <- new.database.entry
    } else {our.database <- rbind(our.database, new.database.entry)}
    
  })
  print(paste ("Downloaded", i, "out of", length(article.index)))
  # tato funkce vrací zbytek z dělení:
  if ((i %% 50) == 0) {Sys.sleep(30)}  # after each 50 articles wait 30 seconds 
}
time2 <- Sys.time()
time1-time2 # downloading 1,000 articles takes about 16.3 min.

# table(is.na(our.database$text))/10000  # 94.47% have some text (in a sample of N = 10,000)

setwd("/home/honza/Google Drive/CUK/uceni/friday fun with r/data")
saveRDS(our.database, "article_database_10000.RDS")


