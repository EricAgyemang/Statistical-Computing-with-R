#########################
## HMW 5 Script ##
#########################
#
# Clear workspace of everything
rm(list = ls(all = TRUE))
#
# Load Bubba's Data from Assignment #4 (i.e., Assignment4.RData)
# Data from this file will be used in some of the illustrations
# and some of the exercises to be submitted
load(file = file.choose())
#
#************************************
# Statistical Tests for Proportions *
#************************************
#
#-----------------------------------------
# Testing a single Population Proportion -
#-----------------------------------------
#
#.........
# z-test .
#.........
#
# Get hypothesized proportion and data
p0 <- 0.30; q0 <- 1 - p0; n = 35; x = 13
# Compute p-hat
pHat <- x/n
# Compute test statistic
z <- (pHat - p0)/sqrt(p0*q0/n)
# Compute p-value
pValue <- round(pnorm(q = z, lower.tail = TRUE), 4)
# Use the cat function to format and output results
cat(paste("\n", "z-test for a Single Population Proportion\n\n",
    "Data: Successes = ", x, ", Trials = ", n, "\n",
    "Alternative: True proportion is less than ", p0, "\n",
    "z = ", round(z, 6), ", p-value = ", pValue, "\n",
    "Sample Estimate = ", round(pHat, 7), "\n", sep = ""))
#
#.................
# ChiSquare-test .
#.................
#
prop.test(x = 13, n = 35, p = 0.30,
     alternative = "less", conf.level = .95, correct = FALSE)
#
# Compare X-squared with z^2 from previous illustration
z^2
#................
# Binomial-test .
#................
#
binom.test(x = 13, n = 35, p = 0.30, alternative = "less", conf.level = .95)
#
# Check p-value using the pbinom function
pbinom(q = 13, size = 35, prob = 0.30, lower.tail = TRUE)
#
#
#-------------------------------------
# Testing Two Population Proportions -
#-------------------------------------
#
# First extract the data, use the lapply function
# The number of scores >= 70 (successes) are
(successes <- with(bubbaStudy[bubbaStudy$score >= 70, ],
    expr = tapply(X = score, INDEX = course, FUN = length)))
# and the respective course specific sample sizes are
(trials <- with(bubbaStudy,
    expr = tapply(X = score, INDEX = course, FUN = length)))

#.........
# z-test .
#.........
#
# Get pHats
pHats <- successes/trials
# Get pBar and qBar
pBar <- sum(successes)/sum(trials); qBar <- 1 - pBar
# Calculate the test statistic
# Note use of [[ ]] instead of [ ]
z <- (pHats[[1]] - pHats[[2]])/sqrt(pBar*qBar*sum(1/trials))
# Compute p-value
pValue <- 2*round(pnorm(q = abs(z), lower.tail = FALSE), 4)
# Create output strings
suc <- paste(names(successes), " = ", successes, sep = "")
trl <-  paste(names(trials), " = ", trials, sep = "")
props <- paste(names(pHats), " = ", round(pHats,4), sep = "")
# Use the cat function to format and output results
cat(paste("\n", "z-test for Two Population Proportions\n\n",
    "Data and Sample Estimates:\n",
    " Successes:\t", suc[1], ",\t ", suc[2], "\n",
    " Trials:\t", trl[1], ",\t ", trl[2], "\n",
    " Estimates:\t", props[1], ",\t ", props[2],"\n\n",
    "Alternative: True proportions are not equal\n",
    "z = ", round(z, 6), ", p-value = ", pValue, "\n", sep = ""))
#
#.................
# ChiSquare-test .
#.................
#
prop.test(x = successes, n = trials,
     alternative = "two.sided", conf.level = .95, correct = FALSE)
#
# Compare X-squared with z^2 from previous illustration
z^2
#
#
#-----------------------------------------------
# Testing More than Two Population Proportions -
#-----------------------------------------------
#
# Extract the observed frequencies and sample sizes
# Bind the successes and failures by rows in a 2x4 matrix
obs <- rbind(
    with(bubbaStudy[bubbaStudy$score >= 70, ],
        expr = tapply(X = score, INDEX = field, FUN = length)),
    with(bubbaStudy,
        expr = tapply(X = score, INDEX = field, FUN = length)))
# Give the rows names, take a look at the results
rownames(obs) <- c("successes", "trials"); obs
#
# Use prop.test with x and n
prop.test(x = obs["successes", ],
    n = obs["trials", ], correct = FALSE)
#
# Use prop.test with successes and failures
# First change second row entries to failures
#
# Slick matrix multiplication approach
X <- matrix(c(0, 0, 1, 0), byrow = TRUE, nrow = 2, ncol = 2)
obsNew <- obs - X%*%obs
#
# Simpler grunt approach
# Create a new observed frequency table
obsNew <- obs
# Replace secons row with failures
obsNew[2, ] <- obsNew[2, ] -obsNew[1, ]
# Rename rows
rownames(obsNew) <- c("successes", "failures"); obsNew
#
# Perform computations using the chisq.test function
chisq.test(x = obsNew, correct = FALSE)
#
# Alternatively, can use obsNew in prop.test
# Need to transpose the matrix obsNew
prop.test(x = t(obsNew), correct = FALSE)
#
#
#************************
# Exploratory Exercises *
#************************
#
#----------------------------
# Reading Text Files into R -
#----------------------------
#
# Choose the file trial1.txt
read.table(file = file.choose())
#
# Choose the file trial2.txt
read.table(file = file.choose(), header = TRUE)
#
# Choose the file trial3.txt
read.table(file = file.choose(), header = FALSE,
    col.names = c("y", "x", "g"))
#
#
#-------------------------------------------------
# Putting Data from a Text File into an R Object -
#-------------------------------------------------
#
# Choose the file trial2.txt
trialData <- read.table(file = file.choose(), header = TRUE)
#
# List contents of workspace
ls()
#
# Print trialData to the screen
trialData
#
# What is the class of trialData
class(trialData)
#
# Take a look at the summary
summary(trialData)
#
# What about the class of the variable g?
class(trialData$g)
#
# Or, lets look at the structure
str(trialData)
#
#
#------------------------
# Handling Missing Data -
#------------------------
#
# Choose the file trial4.txt
incompData <- read.table(file = file.choose(),
    row.names = as.character(1:10), header = TRUE)
#
# Take a look
incompData
#
# Check if there are any NA's
is.na(incompData)
#
# Find which entries are missing
which(is.na(incompData), arr.ind = TRUE)
#
# Choose the file trial5.txt
read.table(file = file.choose(), header = TRUE,
    row.names = as.character(1:10), na.strings = "*")
#
# Remove all cases having missing data
na.omit(incompData)
#
#
#-----------------------------------------
# Saving and Exporting Data Revised in R -
#-----------------------------------------
#
# Clean out cases with missing entries
(cleanData <- na.omit(incompData))
#
# Take a look at number of rows, columns, and dimensions
nrow(cleanData)
ncol(cleanData)
dim(cleanData)
#
# Rename rows
row.names(cleanData) <- as.character(c(1:7)); cleanData
#
# Save as an .RData file
save("cleanData", file = file.choose())
#
# Write as a table to a text file
write.table(x = cleanData, file = file.choose())