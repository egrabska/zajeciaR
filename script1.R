#comments drafted by a '#' symbol
#to run the command-line > ctrl + enter

1+1
2^8
log10(1000) #function: function_name(argument1, argument2, ...)

pi
cos(60) # in radians!
cos(60*pi/180) #changing to degrees


#assignment with = or <-
x = 3 
y = 2.4916

#printing
x
x+y

round(y, 2)
round(x+y)

name = "University of Agrculture"
name


#Basic data types:
class(name) #character
class(x) #numeric 
z = 3L
class(z) #integer
#TRUE or FALSE - logical


#Vectors - collection of elements
v1 = c(4, 8, 10)
v2 = c(1:3)
v3 = vector() #empty vector
v4 = vector("numeric")
v5 = c("cat", "dog", "parrot")

v5 == "cat"

v1 + v2

class(v5)


#Matrices

m1 = matrix(1:9, nrow = 3, ncol = 3)
m1

m2 = matrix(c("cat","dog", "parrot", "cow", "elephant", "bee", "owl", "giraffe", "mouse"), nrow = 3, ncol = 3)
m2
 
class(m1)
class(m2)

typeof(m1)
typeof(m2)

?read.csv

#but often, we just read database, ususally in csv format

tab = read.csv("D:/09_Dydaktyka/kurs_R/DL_dane_cw1.csv", sep = ";", dec = ",") #excel "provides" csv data seperated with semicolon not commas, 
#so in read.csv I have to specify that, plus - in polish language the character used for decimal points is comma while in R it's a dot 
#so I also have to specify that dec = "," 
#But it of course depends on the format of data that you use! 
#the same as above is when using function read.csv2:
tab = read.csv2("D:/09_Dydaktyka/kurs_R/DL_dane_cw1.csv")

#what class object is tab?
class(tab) #a data frame

#let's check it
str(tab)
summary(tab)
unique(tab$...)

#subsetting a dataframe
tab$Nachylenie 
tab[,4]
tab[7,19]
tab[7,]
tab[,c(3:4, 9:13)]

#simple scatterplots using plot()
plot(tab$Wiek, tab$HL)
plot(tab$NPM, tab$SI)
plot(tab$HL, tab$Dg)

#other plot types
scatter.smooth(tab$HL, tab$Dg)
boxplot(tab$HL)
plot(density(tab$HL))
hist(tab$HL)

#missing values - NA (Not Available)
mean(tab$Wiek)
min(tab$TPI200)
is.na(tab$TPI200)
min(tab$TPI200, na.rm = TRUE)
sd(tab$TPI200, na.rm = TRUE)
mean(tab$TPI200, na.rm = TRUE)


#subsetting dataframe and assigning it to a new object
tab2 = tab[,c(3:4, 9:13, 22)]
pairs(tab2)

#correlation coeeficients and matrices
?cor #to check help for some function use ? 

cor(tab2)
cor(tab2, use = "complete.obs")
cor(tab2, method = "spearman")


#packages installaltion and loading

#install.packages("corrplot")
library(corrplot)

?corrplot

m.cor = cor(tab2, use = "complete.obs")
corrplot(m.cor, method = "color", type = "upper")
corrplot.mixed(m.cor, lower.col = "black", upper = "circle")

corrplot(kor, type = "upper", method = "color")



#linear regression - lm()
?lm

reg_lin = lm(HL ~ Wiek, tab)

reg_lin 

scatter.smooth(tab$Wiek, tab$HL)

summary(reg_lin)

pred_HL = predict(reg_lin, tab)
plot(tab$HL, pred_HL)
plot(reg_lin)


#multiple linear regression
reg_wiel = lm(HL ~ Wiek + NPM, tab)
summary(reg_wiel)

reg_wiel = lm(SI ~ Wiek + HL, tab)
summary(reg_wiel)
scatter.smooth(tab$SI, tab$HL)

#polynomial regression - SI as a function of elevation
scatter.smooth(tab$NPM, tab$SI)
reg_poly = lm(tab$SI ~ poly(tab$NPM,2))
summary(reg_poly)

#comparison with linear regression  
reg_lin = lm(tab$SI ~ dane$NPM)
summary(reg_lin)

#ithere are many other methods for regressions such as GAM or metody machine learning itp... 


#GGPLOT2 package - for visualization
library(ggplot2)

ggplot(tab, aes(NPM, SI))

ggplot(tab, aes(NPM, SI))+
  geom_point()

#the same as above:
ggplot(tab)+
  geom_point(aes(NPM, SI))
  

ggplot(tab, aes(NPM, SI))+
  geom_point(color = "steelblue", size = 5, alpha = 0.6)+ #mapping
  geom_smooth(se = 0, color = "black", size = 1.2)+
  xlim(500,1300)+
  ylim(15, 40)+
  labs(title = "Elevations vs Site Index", x = "Site Index", y = "Elevation")

ggplot(tab, aes(NPM, SI, color = Wystawa, size = Wiek)) + 
  geom_point(alpha = 0.6)+
  geom_hline(yintercept = 40, size = 1.2, alpha = 0.6)+
  #geom_smooth(size =2, se = 0)+
  xlim(500, 1400)+
  theme_bw()


#ggplot - adding regression line

reg1 = lm(tab$SI ~ dane$NPM)
coefficients(reg1)

ggplot(tab)+
  geom_point(aes(NPM, SI),
             color = "black")+
  geom_point(aes(NPM, predict(reg1, tab)),
            color = "blue", size = 1.4)
  #geom_smooth(aes(NPM, SI), se = 0)+
  #geom_abline(intercept = 51.650001, slope = -0.02083231 )



#other types of plots in ggplot2:

ggplot(tab, aes(x = HL))+
  geom_histogram()

ggplot(tab, aes(x = Wiek, fill = Nadle.nictwo))+
  geom_density(alpha= 0.5)+
  geom_vline(aes(xintercept = mean(Wiek)), linetype = "dashed", size = 1)+
  theme(legend.position = "bottom")


ggplot(tab, aes(x = Wiek))+
  geom_density(alpha= 0.5)+
  geom_vline(aes(xintercept = mean(Wiek)), linetype = "dashed", size = 1)+
  theme(legend.position = "bottom")+
  facet_grid(.~Nadle.nictwo)


ggplot(tab, aes(Wiek, HL))+
  geom_point()+
  geom_smooth(se=0, method ="gam")+
  geom_vline(xintercept = 100, size = 1.5)

ggplot(tab, aes(y = HL, color = Seria))+
  geom_boxplot()+
  facet_grid(aes(rows = Seria))




##3
# ZADANIE DO wykonania:
        #1 - utwórz dwa modele regresji - liniowy i wielomianowy wyjaśniające relację wysokość (jako zmienna objaśniana) - pierśnica (zmienna objasniająca)
        #2 - na wykresie przedstaw prawdziwe obserwacje (jako punkty), punktom ustaw kolor w zależności od 
        #3 - dodaj dwie linie regresji (nadająć im inne kolory) - np. z wykorzystaniem predict()
        #4 - nadaj punktom rozmiar zgodny z Wiekiem, oraz ustaw parametr alpha na 0.4
        #5 - ustaw etykietę osi x jako "pierśnica" i y = "wysokość", natomiast tytuł jako "Porównanie regresji liniowej i wielomaniowej")





