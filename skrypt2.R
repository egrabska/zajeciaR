offers = read.csv("c:/04_R/zajeciaR/offers3.csv", sep = ";")


#sprawdzamy co to za dane - funkcja str() pokazuje nam strukture obiektu
#factor - zmienna kategorialna (nominalna); jakie? unikalne 
str(offers)

#subset tylko to co potrzebujemy, bez nazwy i strony itp.
oferty_sub = offers[c(2:6, 8)]
#str(mieszk2)
#zmiany nazwy kolumn - colnames lub names

#names(mieszk2)
#colnames(mieszk2) - nazwa kolumn jako wektor
names(oferty_sub)
#names(mieszk2) = c("Dzielnica", "Pokoje", "Cena", "Metraz", "Cena_za_m")
str(oferty_sub)
head(oferty_sub)
tail(oferty_sub)
unique(oferty_sub$dzielnica)
summary(oferty_sub)
#is.data.frame(mieszk2)

#czyszczenie danych z niepotrzebnych zanków, przerw itp. 
#wszystkie zbędne litery w kolumnach 2:5 - funkcje gsub i substr
?gsub
?substr

oferty_sub$cena_za_metr = gsub(" /", "", oferty_sub$cena_za_metr)
oferty_sub$cena_za_metr = gsub(" ", "", oferty_sub$cena_za_metr)
oferty_sub$pokoje = substr(oferty_sub$pokoje, 1,1)
oferty_sub$dzielnica = gsub(": ", "", oferty_sub$dzielnica)
oferty_sub$metraz = gsub(",", ".", oferty_sub$metraz)

#zamiana typów kolumn na liczbowe - wykorzystanie lapply
#zamiana zmienej data na typ daty 

str(oferty_sub)

oferty_sub$cena = as.numeric(as.character(oferty_sub$cena))
oferty_sub[c(2,4,5)] = lapply(oferty_sub[c(2,4,5)], as.numeric)
oferty_sub$data = as.Date(oferty_sub$data, "%Y-%m-%d")

#wartości NA
sum(is.na(oferty_sub))
oferty_sub = na.omit(oferty_sub)

#dane przygotowane do analizy!!
mean(oferty_sub$cena_za_metr)
max(oferty_sub$cena_za_metr)
min(oferty_sub$cena_za_metr)

#często w danych mamy outliersy, błędy itp. 
boxplot(oferty_sub$cena_za_metr)
boxplot(oferty_sub$cena)

oferty_sub = oferty_sub[oferty_sub$cena_za_metr > 2000 & oferty_sub$cena_za_metr < 30000,]

boxplot(oferty_sub$cena_za_metr)
boxplot(oferty_sub$cena)

hist(oferty_sub$cena_za_metr)

#duplikaty
oferty_sub = unique(oferty_sub)



#----------wykorzystanie pakiet dplyr
library(dplyr)
glimpse(oferty_sub)
ile = count(oferty_sub, dzielnica)
ile$n
dzielnice = ile[ile$n > 20,]

#filtrowanie danych 

filter(dane_20, dane_20$pokoje == 4)
filter(dane_20, pokoje == 4 & metraz < 100)
czteropokojowe = filter(dane_20, pokoje == 4)
dane_20 = filter(oferty_sub, dzielnica %in% dzielnice$dzielnica & dzielnica != "małopolskie")
x = filter(dane_20, dzielnica %in% c("Krowodrza", "Olsza", "Łobzów"))

#arrange 
arrange(x,desc(metraz))
#select - wybranie po nazwach kolumn
nowy_df = select(dane_20, cena, metraz, dzielnica)

#mutate - utworzenie nowej zmiennej na podstawie innych zmiennych
nowy_df = mutate(nowy_df, cena_za_m = cena/metraz)



#group_by i summarise
summarise(oferty_sub, mean(cena_za_metr))


groups = group_by(oferty_sub, dzielnica) #wygląda tak samo

oferty_sub$miesiac = miesiac
srednie_miesiac = summarise(group_by(oferty_sub, miesiac), sr_cena_za_m = mean(cena_za_metr))

plot(srednie_miesiac, type = "l")


sr_krk = summarise(oferty_sub, sr_cena_za_m = mean(cena_za_metr))
srednie_dzielnice = summarise(group_by(oferty_sub, dzielnica), sr_cena_za_m = mean(cena_za_metr))

