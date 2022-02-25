# Friday Fun With R
25.2.2022
We have migrated the project here: https://osf.io/d6ufh/wiki/home/?view_only=4327977f78794b0a876318ffa16f73ad

4.2. 2022--------------------------------------
Co jsme zjistili: 
1. podařilo se odladit scrapovací skript (part_A_scrapping_v3.R). Přes noc jsem stáhnul 10,000 článků, je tam jen asi 5% missingů. Zkuste prozkoumat skript a zkuste si stáhnout nějaké menší množství (1,000) ať ten server moc netrápíme a nezakáží nám přístup. 
2. Prošli jsme první kapitoli naší knihy (https://www.tidytextmining.com/index.html). Kniha je pěkně udělaná. Některé věci budeme muset adaptovat na češtinu (slovenštinu). Bylo by dobré k tomu psát nějaké poznámky a pak to zveřejnit jako doplněk k té knize.
3. Také jsme trochu hovořili o nějakých nápadech na analýzu a článek. Momentální plán je, že zkusíme projít knihu kapitolu po kapitole a jednu hodinu si projdeme příklady, které jsou v knize a další týden to zkusíme aplikovat na naše články v češtině. Aź tu knihu projdeme celou, tak budeme mít další nápady.
4. Otázka je, jesti naši práci nepřesunout na OSF.
5. K tidy data mi přijde dobrá tahle kniha:
      R for data science: https://r4ds.had.co.nz/tidy-data.html
      

Úkoly na příště (což bude až 25.2., teď budu out of office):
1. Projděte scrappovací skript, ujistěte se, že všemu rozumíte a kdyžtak napište otázky.
2. Zkuste stáhnout data (nějaká mála, třeba N = 1,000) a aplikovat na ně analýzy z kapitoly 1.
3. Zkuste projít a vyzkoušet kapitolu 2. Pokud budete mít energii a čas, tak zkuste i aplikovat na naše data.

28.1. 2022--------------------------------------
Co jsme zjistili:
1. Problémy ve scrapování Blesku se nepodařilo zcela vyřešit.
2. Seznam knih a dalších zdrojů o různých tématech a problémech najdete ve Velké knize: https://www.bigbookofr.com/index.html
Textová analýza: 
Budeme používat tuto knihu: https://www.tidytextmining.com/index.html
můžete ji také nají na Amazonu.
Jiné knihy a tutoriály, které se zabývají analýzou textu jsou:
https://m-clark.github.io/text-analysis-with-R/
https://www.amazon.com/Text-Analysis-Literature-Quantitative-Humanities/dp/3030396428
https://towardsdatascience.com/a-light-introduction-to-text-analysis-in-r-ea291a9865a8

Úkoly na příště: 
1. Odladit scrapovací script.
2. Přečíst první kapitolu knihy https://www.tidytextmining.com/index.html
+ včetně analýz, které jsou v 1. kapitole.

21.1.2022--------------------------------------
Co jsme zjistili: 
1. Struktura článků se hodně mění. Problémem jsou nežádoucí texty (odkazy na honé článkyú, které jsou umístěné v textech.
2. Užitečné je pro nás vyhledávat cílové části textů na základě jejich atributů (např. úroveň titulku, h1 pro hlavní titulek). Více zde: https://cran.r-project.org/web/packages/rvest/vignettes/rvest.html

Úkoly na přístě: 
1. Prozkoumat nový scrappovací skript: part_A_scrapping_debuging2.R
2. Zkusit intergovat přástup ze skriptu part_A_scrapping_debuging2.R do původního skriptu part_A_scrapping_v2.R (na ř. 9 nastavit menší rozsah: article.index <- article.index_0 [c(1:200)] )
3. Daří se stahovat více článků, než původně? Jsou v textech nějaké nadbytečné části, které tam nepatří?


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
