if (!require("pacman")) install.packages("pacman")
pacman::p_load(rvest, stringr) # toto je velmi šikovný způsob instalace knihoven
# nejříve kontroluje, jestli je knihovna dostupná a pokud není, tak instaluje a 
# potom načte do paměti

blesk.wbpg<- read_html("https://www.blesk.cz/") # stáhneme obsah hlavní stránky

page.content <- blesk.wbpg %>% 
 html_node("body") %>% html_children() # tady je důležitý piping; 
# je to serie funkcí, které jsou na sebe navázané v krocích jak jdou po době
# z obsahu vybereme body html stránky a následně vybereme podřazené nody

page.content # podíváme se na obsah nodů; zdá se, že obsah, který nás zajímá 
# je v nodu 9

substantial.content <- page.content[[9]] %>% html_text() # bereme text z nodu 9
substantial.content # podíváme se na obsah

perexes.raw <- str_extract_all(substantial.content, "(?<=\\t).+(?=\\n)") 
# vybíráme texty, které jsou mezi \t a \n
perexes.raw # podíváme se na obsah

perexes.raw <- unlist(perexes.raw) # z listu uděláme vektor (o tom budeme mluvit)

# z textů vyhodíme formátovací značky \t a \n; proč používáme \\ místo je \?
perexes.clean <- NA
for (i in 1:length(perexes.raw)) {
  perexes.clean[i] <- str_replace_all(perexes.raw[i], "\\t", "")
  perexes.clean[i] <- str_replace_all(perexes.clean[i], "\\n", "")}  

perexes.clean <- perexes.clean [perexes.clean != ""] # vyhodíme prázdné

perexes.len <- nchar(perexes.clean) # délka textů
hist(perexes.len) 
# tady se pěkně ukazuje, že jsou tam krátké titulky a dlouhé perexy

perexes.clean[perexes.len < 30] # ověříme, že ty krátké jsou jen titulky

perexes.substantial <- perexes.clean[perexes.len > 30] # bereme jen ty dlouhé

perexes.substantial <- tolower(perexes.substantial) # všechny převedeme na malá písmena

perexes.substantial




 