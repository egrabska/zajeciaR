#komentarze po znaku #


#wykonanie danego polecenia > ctrl + enter
1+1
2^8
log10(1000)
cos(60) # w radianach!
x = 3 #przypisanie wartości do obiektu x i y:
y = 2.4916
x+y
nazwa = "Wydział leśny"
nazwa #wywołanie obiektu
round(y, 2)


#TYPY OBIEKTÓW
class()
wektor = c(4, 8, 10)
class(wektor)

#funkcje
#wczytywanie gotowej bazy danych, najczęściej w formacie .csv

dane = read.csv("E:/dydaktyka/kurs_R/DL_dane_cw1.csv", sep = ";", dec = ",")
str(dane)
dane$Nachylenie
dane[,4]
dane[7,19]
summary(dane)
unique(dane$Nadle.nictwo)

#proste wykresy - scatterploty
plot(dane$Wiek, dane$HL)
plot(dane$NPM, dane$SI)
plot(dane$HL, dane$Dg)

scatter.smooth(dane$HL, dane$Dg)
boxplot(dane$HL)
plot(density(dane$HL))
hist(dane$HL)

#brak wartości - NA (Not Available)
mean(dane$Wiek)
min(dane$TPI200)
sd(dane$TPI200, na.rm = TRUE)

mean(dane$TPI200, na.rm = TRUE)

str(dane)
#subset bazy danych
sub_dane = dane[,c(3:4, 9:13)]
cor(sub_dane, use = "complete.obs")
cor(sub_dane, method = "spearman")

#iSTOTNOŚC KORELACJI?
cor.test(dane$Wiek, dane$HL)
?cor.test

#wykresy korelacji
library(corrplot)
kor = cor(sub_dane, use = "complete.obs")
pairs(sub_dane)
corrplot(kor)


#regresja liniowa
reg_lin = lm(dane$HL ~ dane$Wiek)
reg_lin #równanie regresji
scatter.smooth(dane$Wiek, dane$HL)
summary(reg_lin)
?scatter.smooth
pred_HL = predict(reg_lin, dane)
plot(dane$HL, pred_HL)
plot(reg_lin)


#multiple linear regression
reg_wiel = lm(dane$SI ~ dane$Wiek + dane$NPM)

#regresja nieliniowa
reg_nielin = lm(dane$SI ~ poly(dane$NPM,4))
summary(reg_nielin)




library(ggplot2)
ggplot(dane, aes(dane$NPM, dane$SI)) + geom_point()+ geom_smooth(se=0)





