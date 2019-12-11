#komentarze po znaku #


#wykonanie danego polecenia > ctrl + enter
1+1
2^8
log10(1000)
cos(60) # w radianach!
x = 3 #przypisanie wartości do obiektu x i y:
y = 2.4
x+y
nazwa = "Wydział leśny"
nazwa #wywołanie obiektu

#TYPY OBIEKTÓW
class()
wektor = c(4, 8, 10)
class(wektor)

#funkcje
#wczytywanie gotowej bazy danych, najczęściej w formacie .csv

dane = read.csv("D:/09_Dydaktyka/kurs_R/DL_dane_cw1.csv", sep = ";", dec = ",")
str(dane)
dane$Nachylenie
dane[,4]
dane[7,19]
summary(dane)

#proste wykresy - scatterplot
plot(dane$Wiek, dane$HL)
plot(dane$Dg, dane$SI)

#brak wartości - NA (Not Available)
mean(dane$Wiek)
min(dane$TPI200)
sd(dane$TPI200, na.rm = TRUE)

mean(dane$TPI200, na.rm = TRUE)

hist(dane$Wiek)
hist()

cor(dane)

str(dane)
#subset bazy danych
sub_dane = dane[,c(3:4, 9:13)]
cor(sub_dane)
cor()



