#######################
##                   ##
##   Week 03         ##
##   Graphics in R   ##
##                   ##
#######################

# Set working directory
setwd("G:/DPH112/2017-2018/Week 03")

load("GLOW500FINAL.RData")

# Recall the structure of the dataset


####################################
##                                ##
##   Using the graphics package   ##
##                                ##
####################################

### Histograms ###
# Let's produce a histogram of HEIGHT
hist(GLOW500_WORK$HEIGHT)

# Let's increase the number of bins and change the colour
hist(GLOW500_WORK$HEIGHT, breaks=15, col="tan")

# I'm getting tired of entering "GLOW500_WORK" all the time, so I will attach it
attach(GLOW500_WORK)

# Now I can enter the column names!
hist(HEIGHT, breaks=15, col="tan") # Note the change in the titles

# Let's change the main title and the axis labels
hist(HEIGHT, breaks=15, col="tan", xlab="Height (cm)",
     main="Histogram of Heights in GLOW500")

# Exercise: create a histogram of BMI.

### Boxplots ###
boxplot(AGE, ylab="Years", main="Distribution of Age in GLOW500")

# Produce a boxplot of AGE by BMICAT
boxplot(AGE ~ BMICAT, ylab="Years", xlab="BMI Category",
        main="Distribution of Age by BMI Category in GLOW500")

# Exercise: produce a boxplot of WEIGHT by RATERISK.

### Bar Charts ###
# Let's produce a table of the age categories of the participants
AGECAT.1 <- table(AGECAT)
AGECAT.1

# Let's produce a visual summary
barplot(AGECAT.1, xlab="Age (years)", ylab="Frequency",
        main="Ages of Participants in GLOW500")

# Let's produce a horizontal plot
barplot(AGECAT.1, col="plum", xlab="Age (years)", 
        ylab="Frequency", main="Ages of Participants 
        in GLOW500", horiz=TRUE)

# Oops, the axis labels are reversed.
barplot(AGECAT.1, col="plum", ylab="Age (years)", 
        xlab="Frequency", main="Ages of Participants 
        in GLOW500", horiz=TRUE)

# Let's tabulate BMI category against age
table(BMICAT, AGECAT)
AGECAT.2 <- table(BMICAT, AGECAT)

# Let's produce a visual summary
barplot(AGECAT.2)

# Let's format this properly
barplot(AGECAT.2, ylab="Frequency", xlab="Age (years)",
        main="BMI Classification by Age in GLOW500",
        col=c("gray0","gray25","gray50","gray75"),
        legend=rownames(AGECAT.2))

# I don't like stacked bar charts. Can we place them beside each other?
barplot(AGECAT.2, ylab="Frequency", xlab="Age (years)",
        main="BMI Classification by Age in GLOW500",
        col=c("gray0","gray25","gray50","gray75"),
        legend=rownames(AGECAT.2), beside=TRUE)

# Exercise: create a bar chart of BMICAT by PRIORFRAC1

### Scatterplots ###
# Plot BMI by AGE
plot(AGE, BMI, ylab="BMI (kg/m^2)", xlab="Age(Years)",
     main="BMI by Age in GLOW500")

# Produce a scatterplot matrix of all numeric variables
pairs(~ AGE + BMI + WEIGHT + HEIGHT + FRACSCORE)

### Mosaic Plots ###
# Consider two categorical variables. We can create a cross-tabulation
table(FRACTURE1, MOMFRAC1)

# Can we plot this?
mosaicplot(FRACTURE1~MOMFRAC1, ylab="Mother had hip fracture",
           xlab="Fracture in the first year",
           main="", color=TRUE)

###################################
##                               ##
##   Using the lattice package   ##
##                               ##
###################################
library("lattice")

# Lattice improves on the capabilities of the graphics package.
# Note the changed syntax.
# graph_type(formula, data=)

### Histogram in graphics ###
hist(WEIGHT, breaks=15)

### Histogram in lattice ###
histogram(~ WEIGHT, data=GLOW500_WORK, breaks=15)

# Let's produce histograms of WEIGHT by BMICAT
histogram(~ WEIGHT | BMICAT, data=GLOW500_WORK)

# Let's produce histograms of AGE by SMOKE1
histogram(~ AGE | SMOKE1, data=GLOW500_WORK)

# Now let's produce histograms of AGE by SMOKE for every level of RATERISK1
histogram(~ AGE | SMOKE1 * RATERISK1, data=GLOW500_WORK)

### Boxplots in lattice ###
bwplot(AGE ~ SMOKE1 | RATERISK1)

### Scatterplots in graphics ###
# Plot BMI by AGE
plot(AGE, BMI, ylab="BMI (kg/m^2)", xlab="Age(Years)",
     main="BMI by Age in GLOW500")
# Note that x comes before y.

### Scatterplots in lattice ###
xyplot(BMI ~ AGE, data=GLOW500_WORK, 
       ylab="BMI (kg/m^2)", xlab="Age(Years)",
       main="BMI by Age in GLOW500")

xyplot(BMI ~ AGE | RATERISK1, data=GLOW500_WORK)

xyplot(BMI ~ AGE | RATERISK1 * PRIORFRAC1, data=GLOW500_WORK)

cloud(HEIGHT ~ WEIGHT * AGE, data=GLOW500_WORK, group=SMOKE1)

###################################
##                               ##
##   Using the ggplot2 package   ##
##                               ##
###################################
install.packages("ggplot2")
library("ggplot2")

### Histograms ###
qplot(x=AGE, geom="histogram", data=GLOW500_WORK)

qplot(x=AGE, geom="histogram", data=GLOW500_WORK,
      binwidth=5, main="Distribution of Age", 
      xlab="Age (Years)", ylab="Frequency", 
      fill=I("blue"), col=I("red"), alpha=I(0.2))

### Boxplots ###
qplot(y=BMI, x=AGECAT, geom="boxplot", data=GLOW500_WORK,
      main="BMI by AGE", xlab="Age (years)")

### Scatterplot ###
qplot(y=BMI, x=AGE, data=GLOW500_WORK,
      color=FRACSCORE, facets=~RATERISK1)
