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
<<<<<<< HEAD
corrplot(kor, method = "color", type = "upper")
corrplot.mixed(kor, lower.col = "black", upper = "color")
=======
corrplot(kor, type = "upper", method = "color")
>>>>>>> 67541691508e3825b0eed9347a9462224a4b6e7d

?corrplot

#regresja liniowa
reg_lin = lm(dane$HL ~ dane$Wiek)
reg_lin #równanie regresji - współczynniki
scatter.smooth(dane$Wiek, dane$HL)
summary(reg_lin)

AIC(reg_lin)



pred_HL = predict(reg_lin, dane)
plot(dane$HL, pred_HL)
plot(reg_lin)


#multiple linear regression - zestandaryzowac i znormalizowac!!?

sub_dane_sc = scale(sub_dane)

reg_wiel = lm(sub_dane$SI ~ sub_dane$Wiek + sub_dane$NPM + sub_dane$HL)
summary(reg_wiel)

#regresja nieliniowa - SI a wysokość npm
scatter.smooth(dane$NPM, dane$SI)
reg_nielin = lm(dane$SI ~ poly(dane$NPM,2))
summary(reg_nielin)




library(ggplot2)
ggplot(dane, aes(NPM, SI, color = Wystawa, size = Wiek)) + 
  geom_point(alpha = 0.6)+
  geom_hline(yintercept = 40, size = 1.8, alpha = 0.6)+
  theme_classic()

ggplot(dane, aes(Wiek, HL))+
  geom_point()+
  geom_smooth(se=0, method ="gam")+
  geom_vline(xintercept = 100, size = 1.5)

ggplot(dane, aes(y = HL, color = Seria))+
  geom_boxplot()+
  facet_grid(aes(rows = Seria))




