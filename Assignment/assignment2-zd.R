
setwd("C:/r")
mydata3 <- read.csv("HINTS 4 Cycle 4 Data.csv")[ ,c('averagedailytvgames', 
                                                    'genderc', 'generalhealth', 
                                                    'weight')]

library(dplyr)
mydata4=filter(mydata3,mydata3$averagedailytvgames>=0,mydata3$genderc>=0,
               mydata3$generalhealth>=0,mydata3$weight>=0)


scatterplotMatrix(~mydata3$averagedailytvgames+mydata3$genderc
                  +mydata3$weight,
                  data=mydata4,
                  diag="boxplot")


mydata4.lm1<-lm(mydata3$generalhealth~mydata3$genderc+
                  mydata3$averagedailytvgames+mydata3$weight,
                data=mydata3)
summary(mydata4.lm1)


confint(mydata4.lm1)
avPlots(mydata4.lm1, ask = F)



#不知道下面的代码为什么会报错：
#“Error in `$<-.data.frame`(`*tmp*`, PRED, value = 
#c(2.04888016728824, 3.88155815086202,  : 
#replacement has 3677 rows, data has 3354”

mydata4$PRED<-predict(mydata4.lm1)
mydata4$RESID<-residuals(mydata4.lm1)
avPlots(mydata4.lm1, ask = F)



