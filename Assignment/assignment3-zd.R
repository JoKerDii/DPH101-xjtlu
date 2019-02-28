
mydata5 <- read.csv("HINTS 4 Cycle 4 Data.csv")[ ,c('heardhpvvaccine2',
                                                    'qualitycare', 'whenpaptest', 
                                                    'age','speakenglish')]


mydata6<-filter(mydata5,heardhpvvaccine2>=0,qualitycare>=0,whenpaptest>=0,
                age>=0,speakenglish>=0)


plot(mydata6$heardhpvvaccine2~mydata6$qualitycare,data=mydata6)

mydata6$heardhpvvaccine2.F <- factor(mydata6$heardhpvvaccine2, labels = c(0,1))
mydata6.glm<-glm(mydata6$heardhpvvaccine2.F~mydata6$qualitycare,
                 data=mydata6,
                 family=binomial)
summary(mydata6.glm)


crPlots(mydata6.glm)
influence.measures(mydata6.glm)
influencePlot(mydata6.glm)
