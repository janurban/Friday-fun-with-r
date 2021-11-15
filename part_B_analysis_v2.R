if (!require("pacman")) install.packages("pacman")
pacman::p_load(rvest, stringr, tm, SnowballC, wordcloud, RColorBrewer)
set.seed(1234)

# Our database is here:
#https://github.com/janurban/Friday-fun-with-r/blob/main/database429.RDS
# You need to save it locally and then set the path to it, for instance:
setwd("/home/honza/Google Drive/CUK/uceni/friday fun with r")

# And then just load the data and start the analysis:
our.database <- readRDS("database429.RDS")

# text <- tolower(our.database$text[2])
# words <- strsplit(text, " ")[[1]]
# stem <- grepl("rak", words, fixed = TRUE) # do the words 
#contain the stem?
# words.with.stem <- words[stem] # what words contain the stem
time1 <- Sys.time()
our.database$freq.clim <- NA
for (i in 1: dim(our.database)[1]) {
# for (i in 1: length(our.database[,1]) {  
# for (i in 1: 428) {  
  
our.database$freq.clim[i] <- str_count(tolower(our.database$text[i]), c("klim" ))
}
time2 <- Sys.time()

time3 <- Sys.time()
our.database$freq.clim <- str_count(tolower(our.database$text), c("klim" ))
time4 <- Sys.time()

time2-time1
time4-time3

table(our.database$freq.clim, useNA = "ifany")

table(our.database$freq.clim)

cimate.articles <- our.database$text[our.database$freq.clim > 0 & is.na(our.database$freq.clim) ==F]




