# Friday Fun With R
14.1.2022--------------------------------------
Co jsme zjistili:
1. Většina článků s chybějícím textem, ale i článků s chybějícím datem v naší databázi ve skutečnosti existuje.
2. Regular expressions, které využívá package stringr jsou popsány zde: https://stringr.tidyverse.org/articles/regular-expressions.html a také poznámka zde: https://stackoverflow.com/questions/39086400/extracting-a-string-between-other-two-strings-in-r

Úkoly na příště: 
1. Ověřit kde jsou texty, nadpisy a perexy u článků, které nám chybí v databázi. Každý zkusí ověřit 10 chybějících článků  a zapíše do Google tabulky (viz email).

7.1.2022--------------------------------------
Úkoly na přístě.
1. Chceme stahovat články, které mají text v jiném nodu, než náš původní výběr. Podívejte se na script part_A_scrapping_debuging.R. Článek s číslem 126055 v původním výběru nebyl. Tento skript ho dokáže stáhnout, ale zatím z něco nezíská text. Problém bude v nastavení oddělovačů.
2. Pokud se vám povedlo vyřešit 1, zkuste se podívat, jestli tímto způsobem získáme i další chybějící články, např. články s následujícími čísly: 
199608
148452
425001
216904
131974   
3. Pokud se vám podaří vyřešit 2, bylo by dobré se ještě podívat, jestli články, u nichž nám v naší databázi chybí datum, skutečně neexistují (tj. jejich čísla jsou neobsazená), anebo jestli jenom špatně stahujeme jejich datum.

12.11. --------------------------------------- 
Detekce kořene slova ve skriptu: part_B_analysis_v2.R
Úkoly: 
1. Prostudujte skript a připravte si event. otázky.
2. Zkuste přetransformovat info o datu v databázi do fotmátu, který R používá pro datum (viz. postix).

11.10. --------------------------------------- 
Máme fugující scrappingový script (part_A_scrapping_v1.R), který náhodně vybírá a stahuje články do databáze.
Úkoly: 
1. projděte scrapingový script; máte nějaké otázky, něco, čemu nerozumíte?
2. vytvořit funkci, která bude počítat četnost pro kořen slova "klim" v textu.

13.8-17.9 --------------------------------------- 
JU je na dovolené; příští setkání 17.9.
Momentálně náš skipt (#4) umí počítat četnost slov v textu článku (bez stopwords).
Úkoly:
1. Zkuste spočítat frekvenci slova "klima" v textu;
2. Zkuste spořítat frekvenci kořene slova "klim".

Týden 5 (od 30.7.) ---------------------------------------
Úkol: Podívejte se na Scrappovací script č. 3; zkuste vyhodit z textu česká stop words (viz seznam českých stopwords, na který je odkaz v textu).


Týden 1 (od 14.6.) ---------------------------------------
Úkol 1: Zkuste si spustit skript 1 a projít si ho po krocích. Zkuste porozumět tomu, co se tam odehrává. Příště si jednotlivé kroky vysvětlíme. Pokud něčemu nerozumíte, je dobré zkusit Google: "... and in R" nebo "... and Cran in R". Poídvejte se také, jaké objekty vytváříme a jaký je jejich obsah (pravý horní box).

Jinak, první část scrappingu jedeme podle tohoto tutoriálu: https://towardsdatascience.com/tidy-web-scraping-in-r-tutorial-and-resources-ac9f72b4fe47
