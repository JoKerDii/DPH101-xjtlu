setwd("C:/r")

mydata7<-read.csv("HINTS 4 Cycle 4 Data.csv")[,c("electciglessharm",
                                                 "age",
                                                 "bmi",
                                                 "dma",
                                                 "selfage",
                                                 "weight")]

library(dplyr)
mydata8<-filter(mydata7,electciglessharm>=0,age>=0,
                bmi>=0,dma>=0,
                selfage>=0,weight>=0)


library(car)
scatterplotMatrix(~ bmi + age + dma + selfage + weight, data = mydata8)
library(GGally)
ggpairs(columns = 2:6, data = mydata8, upper = list(continuous = "points"))


mydata8$electciglessharm<-factor(mydata8$electciglessharm)

library(MASS)
mydata8.plr<-polr(mydata8$electciglessharm~mydata8$bmi+
                 mydata8$dma+
                 mydata8$selfage+mydata8$weight,
                data=mydata8)

summary(mydata8.plr)


predict(mydata8.plr, type = "p")
addterm(mydata8.plr, ~.^2, test = "Chisq")
mydata8.plr2 <- stepAIC(mydata8.plr, ~.^2)
mydata8.plr2$anova
anova(mydata8.plr,mydata8.plr2)
mydata8.plr<-update(mydata8.plr,Hess=T)
pr <- profile(mydata8.plr)
confint(pr)
plot(pr)
pairs(pr)

