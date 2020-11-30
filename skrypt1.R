#komentarze po znaku #
#wykonanie danego polecenia > ctrl + enter

1+1
2^8
log10(1000) #funkcja: nazwa_funkcji(argument1. argument2, ...)
pi
cos(60) # w radianach
cos(60*pi/180) #zamiana na stopnie

x = 3 #przypisanie wartości do obiektu x i y:
y = 2.4916
x
x+y
round(y, 2)
round(x+y)

nazwa1 = "Wydział leśny"
nazwa


#TYPY OBIEKTÓW
class(nazwa1)
class(x)

w1 = c(4, 8, 10)
w2 = c(1:10)
w1
w2

class(wektor)

macierz = matrix(1:9, nrow = 3, ncol = 3)
macierz
class(macierz)

#wczytywanie bazy danych, najczęściej w formacie .csv - funkcja read.csv lub read.csv2

dane = read.csv("D:/09_Dydaktyka/kurs_R/DL_dane_cw1.csv", sep = ";", dec = ",")
dane = read.csv2("D:/09_Dydaktyka/kurs_R/DL_dane_cw1.csv")

str(dane)
summary(dane)
unique(dane$Nadle.nictwo)

#wycięcie fragmentu bazy
dane$Nachylenie 
dane[,4]
dane[7,19]
dane[7,]
dane[,c(3:4, 9:13)]

#proste wykresy rozrzutu - funkcja plot()
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
is.na(dane$TPI200)
min(dane$TPI200, na.rm = TRUE)
sd(dane$TPI200, na.rm = TRUE)
mean(dane$TPI200, na.rm = TRUE)


#wyciecie fragmentu bazy - przypisanie do obiektu dane2
dane2 = dane[,c(3:4, 9:13, 22)]
pairs(dane2)

#macierz i wykresy korelacji
?cor #wywołanie pomocy dla danej funckji

cor(dane2)
cor(dane2, use = "complete.obs")
cor(dane2, method = "spearman")


#INSTALACJA PAKIETÓW 
#instalacja pakietu do wizualizacji korelacji
#install.packages("corrplot")
library(corrplot)

?corrplot

m.cor = cor(dane2, use = "complete.obs")
corrplot(m.cor, method = "color", type = "upper")
corrplot.mixed(m.cor, lower.col = "black", upper = "circle")

corrplot(kor, type = "upper", method = "color")


#regresja liniowa
?lm
reg_lin = lm(HL ~ Wiek, dane)

reg_lin 

scatter.smooth(dane$Wiek, dane$HL)

summary(reg_lin)

pred_HL = predict(reg_lin, dane)
plot(dane$HL, pred_HL)
plot(reg_lin)


#multiple linear regression
reg_wiel = lm(HL ~ Wiek + NPM, dane)
summary(reg_wiel)

reg_wiel = lm(SI ~ Wiek + HL, dane)
summary(reg_wiel)
scatter.smooth(dane$SI, dane$HL)


#regresja wielomianowa - SI a wysokość npm - porównanie z liniową
scatter.smooth(dane$NPM, dane$SI)
reg_poly = lm(dane$SI ~ poly(dane$NPM,2))
summary(reg_poly)

#porównanie z regresja liniową
reg_lin = lm(dane$SI ~ dane$NPM)
summary(reg_lin)

#inne rodzaje regresji - np. GAM; metody machine learning itp... 


#Pakiet GGPLOT2 - wizualizacja danych
library(ggplot2)

ggplot(dane, aes(NPM, SI))

ggplot(dane, aes(NPM, SI))+
  geom_point()

#to samo co powyżej:
ggplot(dane)+
  geom_point(aes(NPM, SI))
  

ggplot(dane, aes(NPM, SI))+
  geom_point(color = "steelblue", size = 5, alpha = 0.6)+ #mapping
  geom_smooth(se = 0, color = "black", size = 1.2)+
  xlim(500,1300)+
  ylim(15, 40)+
  labs(title = "Elevations vs Site Index", x = "Site Index", y = "Elevation")

ggplot(dane, aes(NPM, SI, color = Wystawa, size = Wiek)) + 
  geom_point(alpha = 0.6)+
  geom_hline(yintercept = 40, size = 1.2, alpha = 0.6)+
  #geom_smooth(size =2, se = 0)+
  xlim(500, 1400)+
  theme_bw()


#ggplot - dodawanie linii regresji 

reg1 = lm(dane$SI ~ poly(dane$NPM, 2))
coefficients(reg1)

ggplot(dane)+
  geom_point(aes(NPM, SI),
             color = "black")+
  geom_point(aes(NPM, predict(reg1, dane)),
            color = "blue", size = 1.4)
  #geom_smooth(aes(NPM, SI), se = 0)+
  #geom_abline(intercept = 51.650001, slope = -0.02083231 )



#inne typy wykresów

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


ggplot(dane, aes(Wiek, HL))+
  geom_point()+
  geom_smooth(se=0, method ="gam")+
  geom_vline(xintercept = 100, size = 1.5)

ggplot(dane, aes(y = HL, color = Seria))+
  geom_boxplot()+
  facet_grid(aes(rows = Seria))





# ZADANIE DO wykonania:
        #1 - utwórz dwa modele regresji - liniowy i wielomianowy wyjaśniające relację wysokość (jako zmienna objaśniana) - pierśnica (zmienna objasniająca)
        #2 - na wykresie przedstaw prawdziwe obserwacje (jako punkty), punktom ustaw kolor w zależności od 
        #3 - dodaj dwie linie regresji (nadająć im inne kolory) - np. z wykorzystaniem predict()
        #4 - nadaj punktom rozmiar zgodny z Wiekiem, oraz ustaw parametr alpha na 0.4
        #5 - ustaw etykietę osi x jako "pierśnica" i y = "wysokość", natomiast tytuł jako "Porównanie regresji liniowej i wielomaniowej")





