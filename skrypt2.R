offers = read.csv("D:/09_Dydaktyka/kurs_R/offers3.csv", sep = ";")


#sprawdzamy co to za dane - funkcja str() pokazuje nam strukture obiektu
#factor - zmienna kategorialna (nominalna); jakie? unikalne 
str(offers)
#class(mieszk)
#subset tylko to co potrzebujemy, bez nazwy, strony, daty itp.
oferty_sub = offers[2:6]
#str(mieszk2)
#zmiany nazwy kolumn - colnames lub names

#names(mieszk2)
#colnames(mieszk2) - nazwa kolumn jako wektor
names(oferty_sub)
names(mieszk2) = c("Dzielnica", "Pokoje", "Cena", "Metraz", "Cena_za_m")
head(oferty_sub)
tail(oferty_sub)
unique(oferty_sub$dzielnica)
summary(oferty_sub)
#is.data.frame(mieszk2)

#czyszczenie danych z niepotrzebnych zanków, przerw itp. 
#wszystkie zbędne litery w kolumnach 2:5 - funkcje gsub i substr


oferty_sub$cena_za_metr = gsub(" /", "", oferty_sub$cena_za_metr)
oferty_sub$cena_za_metr = gsub(" ", "", oferty_sub$cena_za_metr)
oferty_sub$pokoje = substr(oferty_sub$pokoje, 1,1)
oferty_sub$dzielnica = gsub(": ", "", oferty_sub$dzielnica)
oferty_sub$metraz = gsub(",", ".", oferty_sub$metraz)

str(oferty_sub)
oferty_sub$cena = as.numeric(as.character(oferty_sub$cena))


#zamiana typów kolumn na liczbowe - wykorzystanie lapply
oferty_sub[c(2,4,5)] = lapply(oferty_sub[c(2,4,5)], as.numeric)

#wartości NA
sum(is.na(oferty_sub))
oferty_sub = na.omit(oferty_sub)

#dane przygotowane do analizy!!
mean(oferty_sub$cena_za_metr)











