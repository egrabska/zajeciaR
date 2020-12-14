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



#Vectors - collection of elements
v1 = c(4, 8, 10)
v2 = c(1:3)
v3 = vector() #empty vector
v4 = vector("numeric")
v5 = c("cat", "dog", "parrot")


#TRUE or FALSE - logical
v1 == 1
v1 == 8
v5 == "cat"
1 == 1
1 == 2
TRUE == TRUE

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



#often in R, we will read some objects, such as databases, they are ususally in .csv format

tab = read.csv("D:/11_Git/zajeciaR/DL_dane_cw1.csv", sep = ";", dec = ",") #excel "provides" csv data seperated with semicolon not commas, 
#so in read.csv I have to specify that, plus - in polish language the character used for decimal points is comma while in R it's a dot 
#so I also have to specify that dec = "," 
#But it of course depends on the format of data that you use! 
#the same as above is when using function read.csv2:
tab = read.csv2("D:/09_Dydaktyka/kurs_R/DL_dane_cw1.csv")

#what class object is tab?
class(tab) #a data frame

#let's check what's inside
str(tab)
summary(tab)


#subsetting a dataframe
tab$Slope
tab[,4]
tab[7,19]
tab[7,]
tab[,c(3:4, 9:13)]

unique(tab$District)

#simple scatterplots using plot()
plot(tab$Age, tab$HL)
plot(tab$Elevation, tab$SI)
plot(tab$HL, tab$Dg)

#other plot types
scatter.smooth(tab$HL, tab$Dg)
boxplot(tab$HL)
plot(density(tab$HL))
hist(tab$HL)

#missing values - NA (Not Available)
mean(tab$Age)
min(tab$TPI200)
is.na(tab$TPI200)
min(tab$TPI200, na.rm = TRUE)
sd(tab$TPI200, na.rm = TRUE)
mean(tab$TPI200, na.rm = TRUE)


#subsetting dataframe and assigning it to a new object
tab2 = tab[,c(3:4, 9:13, 18)]
pairs(tab2)


#correlation coeeficients and matrices
?cor #to check help for some function use ? 

cor(tab2)
cor(tab2, use = "complete.obs")
cor(tab2, method = "spearman")


#packages installaltion and loading - install only once, loading in every new project
#install.packages("corrplot")
library(corrplot)

?corrplot

m.cor = cor(tab2, use = "complete.obs")
corrplot(m.cor, method = "color", type = "upper")
corrplot.mixed(m.cor, lower.col = "black", upper = "circle")

corrplot(m.cor, type = "upper", method = "color")



#linear regression - lm()
?lm

reg_lin = lm(HL ~ Age, tab)
reg_lin 
summary(reg_lin)
plot(reg_lin)
scatter.smooth(tab$Age, tab$HL)



#predicting "new" values based on regression model
pred_HL = predict(reg_lin, tab)
pred_HL
plot(tab$HL, pred_HL)



#multiple linear regression
reg_mul = lm(HL ~ Age + Elevation, tab)
summary(reg_mul)

reg_mul2 = lm(SI ~ Age + HL, tab)
summary(reg_mul2)
scatter.smooth(tab$SI, tab$HL)

#polynomial regression - SI as a function of elevation
scatter.smooth(tab$Elevation, tab$SI)

reg_poly = lm(tab$SI ~ poly(tab$Elevation,2))
summary(reg_poly)

#comparison with linear regression  
reg_lin = lm(tab$SI ~ tab$Elevation)
summary(reg_lin)

#ithere are many other methods for regressions such as GAM or machine learning techniques... 


#GGPLOT2 package - for visualization
library(ggplot2)

ggplot(tab, aes(Elevation, SI))

ggplot(tab, aes(Elevation, SI))+
  geom_point()

#the same as above:
ggplot(tab)+
  geom_point(aes(Elevation, SI))
  

ggplot(tab, aes(Elevation, SI))+
  geom_point(color = "steelblue", size = 5, alpha = 0.6)+
  geom_smooth(se = 0, color = "black", size = 1.2)+
  xlim(500,1300)+
  ylim(15, 40)+
  labs(title = "Elevations vs Site Index", x = "Site Index", y = "Elevation")

p = ggplot(tab, aes(Elevation, SI, color = Aspect, size = Age)) + #colors and sizes related to other variables!
  geom_point(alpha = 0.6)+
  #geom_hline(yintercept = 40, size = 1.2, alpha = 0.6)+
  #geom_smooth(size =2, se = 0)+
  xlim(500, 1400)+
  theme_bw()

p + geom_hline(yintercept = 40, size = 1.2, alpha = 0.6)


#ggplot - adding regression line - different ways

reg1 = lm(tab$SI ~ tab$Elevation)
coefficients(reg1)

ggplot(tab, aes(Elevation, SI))+
  geom_point( color = "black")+
  geom_abline(intercept = 51.650001, slope = -0.02083231, color = "blue")
  #geom_point(aes(Elevation, predict(reg1, tab)), color = "orange", size = 1.4)
  #stat_smooth(method = "lm", formula = y ~ poly(x,2), color = "red", se= 0)+
  #stat_smooth(method = "lm", formula = y ~ x, color = "darkgreen", se = 0)




#other types of plots in ggplot2:

ggplot(tab, aes(x = HL))+
  geom_histogram()

ggplot(tab, aes(x = Age, fill = District))+
  geom_density(alpha= 0.5)
  #geom_vline(aes(xintercept = mean(Age)), linetype = "dashed", size = 1)+
  #theme(legend.position = "bottom")


ggplot(tab, aes(x = Age))+
  geom_density(alpha= 0.5)+
  geom_vline(aes(xintercept = mean(Age)), linetype = "dashed", size = 1)+
  theme(legend.position = "bottom")+
  facet_grid(.~District)


ggplot(tab, aes(y = HL, x = geology, color = geology))+
  geom_boxplot()+
  geom_jitter()



##-----------------------------------------------------------------------------------------------------------------------------------------------------------------
# Homework:
        #1 - create two regression models - simple linear and polynomial, which explain the relationship between HL (response variable) and Dg (predictor variable)
        #2 - using ggplot create plot with real observations as points
        #3 - add two regression lines (in different colors)
        #4 - set size of points according to the age and set alpha to 0.4
        #5 - describe x lab as "diameter", y lab as "Height" and the title as "Linear vs polynomial regression"




