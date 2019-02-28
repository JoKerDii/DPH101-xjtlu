setwd("C:/r")
mydata1<-read.csv("HINTS 4 Cycle 4 Data.csv")[,c("bmi","averagedailytvgames")]


install.packages("dplyr")
library(dplyr)
mydata2<-filter(mydata1,bmi>=0)


lm.data <- lm(formula=mydata2$bmi~mydata2$averagedailytvgames)
summary(lm.data)

#test1 
library(car)
crPlots(lm.data)

#test2
mydata2$PRED<-predict(lm.data)
mydata2$RESID<-residuals(lm.data)
avPlots(lm.data, ask = F)

#test3
hist(mydata2$RESID, main = "Histogram of Residuals")
plot(density(mydata2$RESID), main = "Density of Residuals")
qqnorm(mydata2$RESID, main = "Quantile-Quantile Plot of Residuals")
shapiro.test(mydata2$RESID)


#test4
plot(mydata2$RESID ~ mydata2$PRED, data = mydata2); abline(h=0)

#test5
scatterplotMatrix(~mydata2$bmi + mydata2$averagedailytvgames,
                  data = mydata2,
                  diag = "boxplot")


