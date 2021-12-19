#########################
## HMW 3 Script ##
#########################
#
#****************
# Preliminaries *
#****************
#
#
#----------
# Vectors -
#----------
#
#
# Create some vectors
# Note: By enclosing the assignment statement within parentheses
#       the contents assigned to each vector are displayed
(numbers <- seq(from = 1, to = 10, by = 2.5))
(words <- rep(x = c("male", "female"), times = c(3, 2)))
set.seed(seed = 4)
(boolean <- sample(x = c(TRUE, FALSE), size = 5, replace = TRUE))
#
# Determine if these objects are vectors
is.vector(numbers); is.vector(words); is.vector(boolean)
#
# Determine the classes of the objects
class(numbers); class(words); class(boolean)
#
# Determine the type of (the contents of) the objects
typeof(numbers); typeof(words); typeof(boolean)
#
# Using the str function to look at the structure of an object
str(numbers); str(words); str(boolean)
#
#----------
# Factors -
#----------
#
# Convert the vector words into a factor
words <- as.factor(words)
#
# Now check its class
class(words); typeof(words)
#
# Provide a list of the levels of words
levels(words)
#
# Take a look at the structure of words
str(words)
#
# Use the fix function to look inside words
fix(words)   # Close the R Editor window for words when done.
#
#-----------------------------------
# Two Useful Bookkeeping Functions -
#-----------------------------------
#
# List objects in the workspace
ls()
#
# Remove all objects from the workspace
rm(list = ls(all = TRUE))
ls()
#
#--------
# Lists -
#--------
#
# Generate two random samples from normal distributions
set.seed(seed = 5)
sample1 <- round(rnorm(n = 5, mean = 5, sd = 1.25), 2)
set.seed(seed = 13)
sample2 <- round(rnorm(n = 7, mean = 9, sd = 0.79), 2)
#
# Place these in a list
sampleFormat <- list(males = sample1, females = sample2)
#
# Determine class of sampleFormat
class(sampleFormat)
#
# Print sampleFormat to the console
sampleFormat
#
# List all objects in the workspace
ls()
#
# Remove sample1 and sample 2
rm(sample1, sample2)
#
# See what's left
ls()
#
# See what's in sampleFormat
names(sampleFormat)
#
# Use str to examine the structure of sampleFormat
str(sampleFormat)
#
# Try to display contents of males
males
#
#..................................
# Accessing the contents of lists .
#..................................
#
# Using the $ operator to access the contents of a list
sampleFormat$males
#
# Using indices to access the contents of a list
sampleFormat[1]
#
# Using the with function to access the contents of a list
with(data = sampleFormat, expr = males)
#
# Using the attach function
attach(sampleFormat)
males
detach(sampleFormat)   # Important to detach when done
#
#---------------------------------------
# Another Helpful Bookkeeping Function -
#---------------------------------------
#
# List attached objects (and loaded packages)
search()
#
# Attach sampleFormat and then lis attached objects/packages
attach(sampleFormat)
search()
#
# detach sampleFormat and then lis attached objects/packages
detach(sampleFormat)
search()
#
#--------------
# Data Frames -
#--------------
#
# Extract contents of sampleFormat and place in a single vector
scores <- unlist(x = sampleFormat, use.names = FALSE)
#
# Get lengths of vectors in sampleFormat
(n <- sapply(X = sampleFormat, FUN = length))
#
# Set what are to be used as levels, male for sample1,
# and female for sample2
categories <- c("male", "female")
#
# Create a factor corresponding to scores
genders <- as.factor(rep(x = categories, times = n))
#
# Store the two in a data frame
bivarFormat <- data.frame(score = scores, gender = genders)
#
# Determine class of bivarFormat
class(bivarFormat)
#
# Look at the structure
str(bivarFormat)
#
# See first three rows and last three rows
head(x = bivarFormat, n = 3)
tail(x = bivarFormat, n = 3)
#
# Check the workspace
ls()
#
# Remove all objects except sampleFormat and bivarFormat
rm(categories, genders, scores, n)
#
# Check
ls()
#
#........................................
# Accessing the contents of data frames .
#........................................
#
# Dimensions of sampleFormat
dim(sampleFormat)
#
# The dimensions of bivarFormat
dim(bivarFormat)
#
# What are the contents of the data frame sampleFormat?
names(bivarFormat)
#
# Accessing the score data using the $ operator
bivarFormat$score
#
# Accessing the gender data using the with function
with(data = bivarFormat, expr = gender)
#
# Using the attach Function
attach(bivarFormat)
tapply(X = score, INDEX = gender, FUN = mean)
detach(bivarFormat)
#
# Output all columns in the 3rd and 9th rows
bivarFormat[c(3, 9), ]
#
# Output all columns for females
with(data = bivarFormat, expr = bivarFormat[gender == "female", ])
#
# Output all rows of the first column
bivarFormat[ , 1]
#
#***************************************
# Saving and Loading R Data Structures *
#***************************************
#
# Save the objects sampleFormat and bivarFormat
# Will have to select a directory and assign a file name
# Use the filename trialData.RData
save(list = c("sampleFormat", "bivarFormat"),
    file = file.choose())
#
# Remove all objects
rm(list = ls(all = TRUE))
#
# Check to be sure
ls()
#
# What about attached objects
search()
#
# To load trialData.RData run
load(file = file.choose())
# and select the file
#
# Check workspace
ls()
#
#******************************************
# Examples of using Lists and Data Frames *
#******************************************
#
# Use the var.test function to compare two population variances when the
# data are stored in sample format
with(data = sampleFormat,
    expr = var.test(x = males, y = females, alternative = "two.sided",
        conf.level = 0.95))
#
# Use the var.test to compare two population variances when the
# data are stored in bivariate format
var.test(formula = score ~ gender, data = bivarFormat,
    alternative = "two.sided", conf.level = 0.95)
#

# Use the t.test to compare two population means when the
# data are stored in sample format
with(data = sampleFormat,
    expr = t.test(x = males, y = females, alternative = "two.sided",
        paired = FALSE, var.equal = FALSE, conf.level = 0.95))
#
# Use the t.test to compare two population means when the
# data are stored in bivariate format
t.test(score ~ gender, data = bivarFormat, alternative = "two.sided",
        paired = FALSE, var.equal = FALSE, conf.level = 0.95)
#
# Find out about the function var.test
?var.test
#
# Find out about the function t.test
?t.test
#
#************************
# Exploratory Exercises *
#************************
#
# Find out about the sapply function
?sapply
# Try looking at the (very unintuitive) examples for this function
example(sapply)
#
# Find out about the tapply function
?tapply
# Try looking at the (very unintuitive) examples for this function
example(tapply)
#
# Find out about the by function
?by
# Again, take a look at the examples
example(by)
#
# Take a look at the function table
?table
example(table)
#
# and the function xtabs
?xtabs
example(xtabs)
#
# Moral of the story: The examples provided are not always very helpful!






