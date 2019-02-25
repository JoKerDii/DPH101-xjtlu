# SET YOUR WORKING DIRECTORY!
# setwd("G:/Dropbox/00 - Working Folder/Teaching/DPH112/2017-2018/Week 02")

##################
##              ##
##   Packages   ##
##              ##
##################

# Load the "ChickWeight" dataset.
# The dataset is included in R and is used for standard analysis
data("ChickWeight")

# View the help file associated with the dataset
help("ChickWeight")

# Plot the chick's weight by time
plot(ChickWeight$Time, ChickWeight$weight)

# Add axis labels
plot(ChickWeight$Time, ChickWeight$weight, xlab="Time (days)", ylab="Weight (grams)")

# We want to see the results for the four different diets.
# This is not possible using the plot() function.
# However, the xyplot() function does this very well.
xyplot(weight~Time|Diet, data=ChickWeight)

# R can't find the command.
# Let's ask for help.
help(xyplot)

# R can't find it either.
??xyplot

# We need to load the lattice package to use the xyplot() function
library(lattice)

# We can now use the xyplot() function
help(xyplot)
xyplot(weight~Time, data=ChickWeight)

# Let's plot the weights over time for each diet
xyplot(weight~Time|Diet, data=ChickWeight)

# If a package does not appear on the list, you need to install it first.
install.packages("fortunes")

# Having installed a package does not mean it has been loaded.
fortune(256)

# You need to load it first
library(fortunes)
fortune(256)

# To unload a package, use the detach() function
detach(package:fortunes)

# To completely uninstall a package, use the remove.packages() function
remove.packages("fortunes")

###########################
##                       ##
##   Working with Data   ##
##                       ##
###########################

# Open the file DPH101.xlxs
# We will enter the data into R and produce a data frame
STUDENT <- c(1004, 1855, 2464, 2986)
SEX <- c("M", NA, "F", "M")
GRADE <- c(89, 65, NA, 76)
DPH101 <- data.frame(STUDENT, SEX, GRADE)

# You can use R's built-in data viewer to inspect and edit data
View(DPH101)

# You can use R's built-in data editor to inspect and edit data
edit(DPH101)

# You can save the data into a directory
save(DPH101, file="G:/Dropbox/00 - Working Folder/Teaching/DPH112/Week 02/DPH101.RData")

# In order to simplify saving and loading tasks, set the working directory
setwd("G:/Dropbox/00 - Working Folder/Teaching/DPH112/Week 02")
save(DPH101, file="DPH101.RData")

# We can load the file using the load() function
load("DPH101.RData")

# Now, open the file GLOW500.csv in Excel
# We need an easier way to enter this into R
GLOW500_WORK <- read.csv("GLOW500.csv")
save(GLOW500_WORK, file="GLOW500.RData")

# Check the data frame
View(GLOW500_WORK)

# Let's look at one of the variables PRIORFRAC and compare it to the codebook
GLOW500_WORK$PRIORFRAC

# Note that this is a numerical variable
class(GLOW500_WORK$PRIORFRAC)

# We want to change this variable type to a factor variable
TWEAK <- factor(GLOW500_WORK$PRIORFRAC)
class(TWEAK)
TWEAK
TWEAK <- factor(GLOW500_WORK$PRIORFRAC, labels=c("No", "Yes"))
class(TWEAK)
TWEAK
GLOW500_WORK$PRIORFRAC1 <- factor(GLOW500_WORK$PRIORFRAC, labels=c("No", "Yes"))
class(GLOW500_WORK$PRIORFRAC1)

# Let's check that PRIORFRAC and PRIORFRAC1 contain the same data
table(GLOW500_WORK$PRIORFRAC, GLOW500_WORK$PRIORFRAC1)

# Try revising PREMENO
class(GLOW500_WORK$PREMENO)
GLOW500_WORK$PREMENO1 <- factor(GLOW500_WORK$PREMENO, labels=c("No", "Yes"))
class(GLOW500_WORK$PREMENO1)
table(GLOW500_WORK$PREMENO, GLOW500_WORK$PREMENO1)

# Try revising all other factor variables MOMFRAC, ARMASSIST, 
# SMOKE, RATERISK, FRACTURE

# You should try this on your own. Below, however, I have supplied the answers
# Revising MOMFRAC
GLOW500_WORK$MOMFRAC1 <- factor(GLOW500_WORK$MOMFRAC, labels=c("No", "Yes"))
table(GLOW500_WORK$MOMFRAC, GLOW500_WORK$MOMFRAC1)

# Revising ARMASSIST
GLOW500_WORK$ARMASSIST1 <- factor(GLOW500_WORK$ARMASSIST, labels=c("No", "Yes"))
table(GLOW500_WORK$ARMASSIST, GLOW500_WORK$ARMASSIST1)

# Revising SMOKE
GLOW500_WORK$SMOKE1 <- factor(GLOW500_WORK$SMOKE, labels=c("No", "Yes"))
table(GLOW500_WORK$SMOKE, GLOW500_WORK$SMOKE1)

# Revising FRACTURE
GLOW500_WORK$FRACTURE1 <- factor(GLOW500_WORK$FRACTURE, labels=c("No", "Yes"))
table(GLOW500_WORK$FRACTURE, GLOW500_WORK$FRACTURE1)

# Revising RATERISK
GLOW500_WORK$RATERISK1 <- factor(GLOW500_WORK$RATERISK, labels=c("Less", "Same", "Greater"))
table(GLOW500_WORK$RATERISK, GLOW500_WORK$RATERISK1)

# Cutting variables
# Consider the variable AGE
summary(GLOW500_WORK$AGE)

GLOW500_WORK$AGECAT <- cut(GLOW500_WORK$AGE, breaks=c(54,59,64,69,74,79,84,89,Inf))
GLOW500_WORK$AGECAT

# The labels are awkward. Let's change them.

GLOW500_WORK$AGECAT <- cut(GLOW500_WORK$AGE, breaks=c(54,59,64,69,74,79,84,89,Inf),
                           labels=c("55-59", "60-64", "65-69", "70-74", 
                                    "75-79", "80-84", "85-89", "90"))
summary(GLOW500_WORK$AGE)
summary(GLOW500_WORK$AGECAT)

# Create a variable called BMICAT which has the value 
# Underweight if BMI<18.5
# Normal if BMI is between 18.5 and 24.9, inclusive
# Overweight if BMI is between 25.0 and 29.9, inclusive
# Obese if BMI is at least 30.0

GLOW500_WORK$BMICAT <- cut(GLOW500_WORK$BMI, breaks=c(13, 18.5, 25, 30, Inf),
                           labels=c("Underweight", "Normal", "Overweight", "Obese"))
GLOW500_WORK$BMICAT

# Let's summarise all our variables
summary(GLOW500_WORK)

# Let's drop some superfluous variables
GLOW500_WORK[,"PRIORFRAC"] <- list(NULL)
GLOW500_WORK[,"PREMENO"] <- list(NULL)
GLOW500_WORK[,"MOMFRAC"] <- list(NULL)
GLOW500_WORK[,"ARMASSIST"] <- list(NULL)
GLOW500_WORK[,"SMOKE"] <- list(NULL)
GLOW500_WORK[,"RATERISK"] <- list(NULL)
GLOW500_WORK[,"FRACTURE"] <- list(NULL)

# Save the dataset as GLOW500FINAL.RData
save(GLOW500_WORK, file="GLOW500FINAL.RData")

#########################
##                     ##
##   Subsetting Data   ##
##                     ##
#########################

# Logical operators in R consist of 
# &     AND
# |     OR
# !     NOT

G <- c(1:10)
G[(G>3) & (G<8)]
G[(G>=8) & ! G==9]
G[(G>8) | (G<3)]

# Remove object G
rm(G)

# List all participants who are aged 90
subset(GLOW500_WORK, AGE==90)

# List the Subject ID of participants who are 90 and who are overweight
subset(GLOW500_WORK, AGE==90 & BMICAT=="Overweight") # Not correct
subset(GLOW500_WORK, AGE==90 & BMICAT=="Overweight", select=SUB_ID)

# Produce a new dataset with only the subject ID, weight and height of
# obese people with a prior fracture. Then, summarise the weight.
GLOW500_WORK.F1 <- subset(GLOW500_WORK, BMICAT=="Obese" & PRIORFRAC=="Yes",
                          select=c(SUB_ID, WEIGHT, HEIGHT))
summary(GLOW500_WORK.F1$WEIGHT)








