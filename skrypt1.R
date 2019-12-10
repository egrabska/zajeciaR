#komentarze po znaku #


#wykonanie danego polecenia > ctrl + enter
1+1
2^8
log10(1000)
cos(60) # w radianach!
x = 3 #przypisanie wartości do obiektu x i y:
y = 2
x+y
nazwa = "Wydział leśny"
nazwa #wywołanie obiektu

#funkcje
#wczytywanie gotowej bazy danych, najczęściej w formacie .csv

dane = read.csv("D:/09_Dydaktyka/kurs_R/DL_dane_cw1.csv", sep = ";", dec = ",")
str(dane)
dane$Nachylenie
dane[,4]
summary(dane)

#proste wykresy - scatterplot
plot(dane$Wiek, dane$HL)
plot(dane$Dg, dane$SI)

#brak wartości - NA (Not Available)
mean(dane$Wiek)
mean(dane$TPI200, na.rm = TRUE)

hist(dane$Wiek)
?hist
