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

dane = read.csv("D:/09_Dydaktyka/kurs_R/DL_dane_cw1.csv", sep = ";", dec = ",")
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


#wykresy korelacji
library(corrplot)
kor = cor(sub_dane, use = "complete.obs")
pairs(sub_dane)

corrplot(kor, method = "color", type = "upper")
corrplot.mixed(kor, lower.col = "black", upper = "color")

corrplot(kor, type = "upper", method = "color")

?corrplot

#regresja liniowa
reg_lin = lm(dane$HL ~ dane$Wiek)
reg_lin #równanie regresji - współczynniki
scatter.smooth(dane$Wiek, dane$HL)
summary(reg_lin)

pred_HL = predict(reg_lin, dane)
plot(dane$HL, pred_HL)
plot(reg_lin)


<<<<<<< HEAD
#multiple linear regression - zestandaryzowac i znormalizowac!!?

sub_dane_sc = scale(sub_dane)

reg_wiel = lm(sub_dane$SI ~ sub_dane$Wiek + sub_dane$NPM + sub_dane$HL)
=======
#multiple linear regression

sub_dane_sc = scale(sub_dane)

reg_wiel = lm(sub_dane$HL ~ sub_dane$Wiek + sub_dane$NPM)
>>>>>>> 605af89f5519006dc74ab16a9503177abcb8c5f1
summary(reg_wiel)

plot(dane$NPM, dane$SI)
#regresja nieliniowa - SI a wysokość npm - porównanie z liniową
scatter.smooth(dane$NPM, dane$SI)
reg_poly = lm(dane$SI ~ poly(dane$NPM,2))
summary(reg_poly)

<<<<<<< HEAD
tab$area = NA
tab$area = as.numeric(tab$area)
tab$area = tab$Count/100

tab = read.csv("c:/04_R/swir.csv", sep = ";", dec = ",")
str(tab)
tab$date3 = as.Date(tab$date3, "%d.%m.%Y")
plot(tab$date3, tab$Count)
ggplot(tab, aes(date3, area, fill = season))+
  geom_bar(stat = "identity", width = 8.0)

=======
#porównanie z regresja liniową
reg_lin = lm(dane$SI ~ dane$NPM)
summary(reg_lin)
>>>>>>> 605af89f5519006dc74ab16a9503177abcb8c5f1

#GGPLOT
ggplot(dane, aes(NPM, SI))

ggplot(dane, aes(NPM, SI))+
  geom_point(color = "steelblue", size = 5, alpha = 0.6)+ #mapping
  geom_smooth(se = FALSE, color = "black", size = 1.2)+#szare linie to confidence intervals
  xlim(500,1300)+
  ylim(15, 40)+
  labs(title = "Elevations vs Site Index", x = "Site Index", y = "Elevation")

ggplot(dane, aes(NPM, SI, color = Wystawa, size = Wiek)) + 
  geom_point(alpha = 0.6)+
  geom_hline(yintercept = 40, size = 1.2, alpha = 0.6)+
  #geom_smooth(size =2, se = 0)+
  xlim(500, 1400)+
  theme_classic()

<<<<<<< HEAD
=======
library(ggplot2)
ggplot(dane, aes(x = HL))+
  geom_histogram()

ggplot(dane, aes(x = Wiek, fill = Nadle.nictwo))+
  geom_density(alpha= 0.5)+
  geom_vline(aes(xintercept = mean(Wiek)), linetype = "dashed", size = 1)+
  theme(legend.position = "bottom")


ggplot(dane, aes(x = Wiek))+
  geom_density(alpha= 0.5)+
  geom_vline(aes(xintercept = mean(Wiek)), linetype = "dashed", size = 1)+
  theme(legend.position = "bottom")+
  facet_grid(.~Nadle.nictwo)

>>>>>>> 605af89f5519006dc74ab16a9503177abcb8c5f1
ggplot(dane, aes(Wiek, HL))+
  geom_point()+
  geom_smooth(se=0, method ="gam")+
  geom_vline(xintercept = 100, size = 1.5)

ggplot(dane, aes(y = HL, color = Seria))+
  geom_boxplot()+
  facet_grid(aes(rows = Seria))


#porównanie regresji - punkty- prawdziwe obserwacje i dwie linie regresji
reg_poly = lm(dane$SI ~ poly(dane$NPM,3))
reg_lin = lm(dane$SI ~ dane$NPM)

ggplot(dane)+
  geom_point(aes(NPM, SI),
             color = "black")+
  geom_line(aes(NPM, predict(reg_lin, dane)),
                color = "blue", size = 1.4)+
  geom_line(aes(NPM, predict(reg_poly, dane)),
            color = "darkgreen", size = 1.4)




