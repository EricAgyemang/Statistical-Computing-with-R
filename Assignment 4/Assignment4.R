#########################
## HMW 4 Script ##
#########################
#
# Clear the workspace of all objects
rm(list = ls(all = TRUE))
#
#****************************
# Getting Data to Play With *
#****************************
#
# Create a regular sequence of x-values
indepVar <- seq(from = 1, to = 10, length.out = 25)
#
# Shuffle the numbers around to make things exciting
# First set the random number generator seed so as to be able to duplicate
# output in the following illustrations
set.seed(seed = 7)
#
# Now create a new permutation of the data in indepVar
indepVar <- sample(x = indepVar, size = 25, replace = FALSE)
#
# Now get some y-values
# Set the seed
set.seed(seed = 17)
#
# Get y-values that are from a normal distribution, and that correspond
# to the above x-values
depVar <- 2 + 3*indepVar + rnorm(n = 25, mean = 0, sd = 2.75)
#
#
#*****************************
# Preliminary Graphics Notes *
#*****************************
#
#
#----------------------
# The Graphics Window -
#----------------------
#
# Construct a scatter plot of y against x
plot(x = indepVar, y = depVar,
    main = "Plot of y against x",
    xlab = "x (independent variable)",
    ylab = "y (dependent variable)",
    sub = "(This is just for fun)")
#
# Construct a line graph of y against x
plot(x = indepVar, y = depVar, type = "l",
    main = "Plot of y against x",
    xlab = "x (independent variable)",
    ylab = "y (dependent variable)",
    sub = "(What a mess!)")
#
# Construct a scatter plot of y against x with customized
# symbols for plotted points
plot(x = indepVar, y = depVar, pch = 11,
    main = "Plot of y against x",
    xlab = "x (independent variable)",
    ylab = "y (dependent variable)",
    sub = "(This really is a lot of fun!)")
#
#
#---------------------------------------------
# Identifying Case Numbers of Plotted Points -
#---------------------------------------------
#
# Get back the basic scatter plot of y against x
plot(x = indepVar, y = depVar,
    main = "Plot of y against x",
    xlab = "x (independent variable)",
    ylab = "y (dependent variable)")
#
# To identify plotted points by case numbers, first run
identify(x = indepVar, y = depVar)
# Then, to identify a point left-click on the point, and
# to stop, right-click and select stop
#
#
#-----------------------------------------
# Customizing the Plotting Window's Size -
#-----------------------------------------
#
# Open a window with width 3.5 inches and height 4 inches
# Mac users, you will have to use the function quartz
win.graph(width = 3.5, height = 4)
#
# Now get the xy-scatterplot
plot(x = indepVar, y = depVar,
    main = "Plot of y against x",
    xlab = "x (independent variable)",
    ylab = "y (dependent variable)")
#
#
#----------------------------------------------
# Customizing the Graphics Parameter Settings -
#----------------------------------------------
#
# Open a window with width 3.5 inches and height 4 inches
# Mac users, you will have to use the function quartz
win.graph(width = 3.5, height = 4)
#
# Set the fontsize to 10 points, and scale all plotted images
# by a factor of 0.75
par(ps = 10, cex = 0.75)
#
# Reconstruct the plot
plot(x = indepVar, y = depVar,
    main = "Plot of y against x",
    xlab = "x (independent variable)",
    ylab = "y (dependent variable)")
#
# Identify some points of interest
identify(x = indepVar, y = depVar)
#
# Insert a sub-title
title(sub = "(Wooooohooooo!)")
#
# Clear the workspace of all objects
rm(list = ls(all = TRUE))
#
#
#********************************
# Statistical Charts and Graphs *
#********************************
#
# Load the data frame bubbaStudy by first running
load(file = file.choose())
# Then select the file Assignment4.RData from the appropriate directory
#
#
#-------------
# Bar Charts -
#-------------
#
# Set a window size and graphics parameters
win.graph(width = 5, height = 3.5)
par(ps = 10, cex = 0.75)
#
# Get frequencies of fields (overall)
# nobs = number of observations
nobs <- with(data = bubbaStudy, expr = table(field))  
#
# Construct a default bar chart of fields (overall)
barplot(height = nobs)
#
# Construct a customized Pareto Chart
#
# First get the window ready
win.graph(width = 5, height = 3.5)
par(ps = 10, cex = 0.75)
#
# Next, get frequencies in descending order
nobs <- sort(x = nobs, decreasing = TRUE)
#
# Now construct a bar chart
barplot(height = nobs,
    # Set range for vertical axis, up 5% of maximum
    ylim = c(0, 1.05*max(nobs)),
    # Insert horizontal axis and tick marks
    axis.lty = 1,
    # Insert label for horizontal axis
    xlab = "Field",
    # Insert label for vertical axis
    ylab = "Frequency",
    # Insert main title
    main = "Pareto Chart of Student Fields",
    # And, maybe, stick in a subtitle indicating the sample size
    sub = paste("(Sample size = ", sum(nobs),")"))
#
# Go a bit further
#
# First get the window ready
win.graph(width = 5, height = 3.5)
par(ps = 10, cex = 0.75)
#
# Next, get a two dimensional contingency table
nobs <- with(data = bubbaStudy, expr = table(field, gender))
#
# Now construct a bar chart
barplot(height = nobs,
    # Set range for vertical axis, up 20% of maximum
    ylim = c(0, 1.20*max(nobs)),
    # Insert horizontal axis and tick marks
    axis.lty = 1,
    # Place bars beside each other
    beside = TRUE,
    # Set spaces between bars
    space = c(0, 0.5),
    # Insert a legend
    legend.text = rownames(nobs),
    # Provide some legend argument settings
    args.legend = c(bty = "n", x = "topright"),
    # Insert label for horizontal axis
    xlab = "Field",
    # Insert label for vertical axis
    ylab = "Frequency",
    # Insert main title
    main = "Bar Chart of Student Fields by Gender",
    # And, maybe, stick in a subtitle indicating the sample size
    sub = paste("(Overall sample size = ", sum(nobs),")"))
# Maybe insert sizes of male and female samples
sizes <- colSums(nobs)
mtext(text = paste("(",sizes,")", sep = ""),
    at = c(2.5, 7), side = 1, line = 2, cex = 0.75)
#
# Go even further
#
# First get a three dimensional contingency table
# Be sure to see what it looks like, enter nobs in the console
nobs <- with(data = bubbaStudy, expr = table(field, gender, course))
nobs; class(nobs)
#
# Next, get the window ready
win.graph(width = 10, height = 3.5)
# Use mfrow to split window into 1 row with 2 columns
par(mfrow = c(1, 2), ps = 10, cex = 0.75)
#
# Now construct a bar chart using a for-loop
# Get dimension 3 names
courses <- dimnames(nobs)[[3]]
#
# Start loop
for (i in courses)
    # Begin for-loop body
    {   
    barplot(height = nobs[, , i],
        # Set range for vertical axis, up 20% of maximum
        ylim = c(0, 1.20*max(nobs)),
        # Insert horizontal axis and tick marks
        axis.lty = 1,
        # Place bars beside each other
        beside = TRUE,
        # Set spaces between bars
        space = c(0, 0.5),
        # Insert a legend
        legend.text = rownames(nobs[ , , i]),
        # Provide some legend argument settings
        args.legend = c(bty = "n", x = "topright"),
        # Insert label for horizontal axis
        xlab = "Field",
        # Insert label for vertical axis
        ylab = "Frequency",
        # Insert main title
        main = paste("Bar Chart of Student Fields by Gender\n",
            "(",ifelse(i == "trad", "Traditional", "Project-based"),
            ")", sep = ""),
        # And, maybe, stick in a subtitle indicating the sample size
        sub = paste("(Overall sample size = ", sum(nobs[ , , i]),")"))
    # Insert sizes of male and female samples
    sizes <- colSums(nobs[ , , i])
    mtext(text = paste("(",sizes,")", sep = ""),
        at = c(2.5, 7), side = 1, line = 2, cex = 0.75)
    # End loop body
    }
#
#
# Try using the apply function to duplicate the above figure
win.graph(width = 10, height = 3.5)
# Use mfrow to split window into two compartments
par(mfrow = c(1, 2), ps = 10, cex = 0.75)
apply(X = nobs, MARGIN = 3, FUN = barplot,
    ylim = c(0, 1.20*max(nobs)), axis.lty = 1,
    beside = TRUE, legend.text = dimnames(nobs)[[1]],
    space = c(0, 0.5),
    args.legend = c(bty = "n", x = "topright"),
    xlab = "Field", ylab = "Frequency")
#
# I still have to figure out how to get main titles inserted
# within the apply function. Here's an alternative approach
# Move back to the first plot
par(mfg = c(1, 1), new = TRUE)
plot.new()
# Insert main title
title(main = "Bar Chart of Student Fields by Gender\n (Project-based)")
# Move to next plot
plot.new()
# Insert main title
title("Bar Chart of Student Fields by Gender\n (Traditional)")
#
#
#-------------
# Pie Charts -
#-------------
#
# First get a three dimensional contingency table
# Same as before
nobs <- with(data = bubbaStudy, expr = table(field, gender, course))
nobs
#
# Create a function to calculate frequency percentages
get.percents <- function(x){round(x/sum(x)*100, 1)}
#
# Turn nobs into a frequency table using the apply function
# See what the result looks like
pobs <- apply(X = nobs, MARGIN = c(2, 3), FUN = get.percents)
pobs
#
# Create pie chart slice labels containing percentages and
# be sure to take a look at contents
pobLabels <- array(data = paste(
    dimnames(pobs)[[1]],": ", pobs,"%", sep = ""),
    dim = c(4, 2, 2), dimnames = dimnames(pobs))
pobLabels
#
# Get text vectors to build chart main titles
courses <- c(proj = "Project-based", trad = "Traditional")
genders <- c(female = "Females", male = "Males")
#
# Next, get the window ready
win.graph(width = 8, height = 8)
# Use mfrow to split window into 2 rows and 2 columns
par(mfrow = c(2, 2), ps = 10, cex = 0.75)
# Construct pie charts using the for loop
for (i in dimnames(pobs)[[3]]){
    for(j in dimnames(pobs)[[2]]){
        pie(x = pobs[ , j , i], labels = pobLabels[ , j, i],
            col = gray(seq(from = 0.5, to = 1, length.out = 5)),
            main = paste("Pie Chart of Field for", genders[j], "\n in\n", 
                courses[i], "Course"))}}
#
# List objects in workspace
ls()
#
# Clear everything except bubbaStudy
rm(courses, genders, get.percents, i, j,
    nobs, pobLabels, pobs, sizes)
#
# Check to make sure
ls()
#
#
#-----------
# Boxplots -
#-----------
#
# Construct a boxplot for participant ages
#
# Basic boxplot call
with(data = bubbaStudy, expr = boxplot(x = age, horizontal = TRUE,
    xlab = "Age"))
#
# What is the range of ages?
range(bubbaStudy$age)
#
# Prepare a suitably sized window
win.graph(width = 5, height = 2.5)
par(ps = 10, cex = 0.75)
#
# Construct a horizontal boxplot, suppress axes and set
# range for axis from 15 to 60
with(data = bubbaStudy,
    expr = boxplot(x = age, horizontal = TRUE, axes = FALSE,
        ylim = c(15, 60), main = "Boxplot of Age of Participants"))
#
# Now insert an axis with custom scaling, starting at 15
# with tick-marks every 5 units uptil 60
axis(side = 1, at = seq(from = 15, to = 60, by = 5))
# Insert a label for the axis
title(xlab = "Age")
#
# Construct boxplots for ages by gender
#
# Find ranges by gender
with(data = bubbaStudy, 
    expr = tapply(X = age, INDEX = gender, FUN = range))
#
# Prepare window
win.graph(width = 5, height = 2.5)
par(ps = 10, cex = 0.75)
#
# Construct boxplots of age by gender. In this case,
# a formula approach can be used since age and gender (a factor)
# are in the same data frame
boxplot(formula = age ~ gender, data = bubbaStudy,
    horizontal = TRUE, axes = FALSE,
    ylim = c(15, 60), main = "Ages by Gender")
#
# Insert custom horizontal axis
axis(side = 1, at = seq(from = 15, to = 60, by = 5))
#
# Insert labels for gender
axis(side = 2, at = c(1, 2), labels = levels(bubbaStudy$gender),
    lty = 0)
title(xlab = "Age")
#
#
#--------------
# Stripcharts -
#--------------
#
# Basic vertical stripchart of age by gender
#
# Prepare window
win.graph(width = 5, height = 3.5)
par(ps = 10, cex = 0.75)
with(data = bubbaStudy,
    expr = stripchart(x = age ~ gender, method = "jitter", 
           vertical = TRUE, ylab="Age", xlab="Gender", pch = 1, 
           axes = TRUE, frame.plot = FALSE))
#
# Fine tune things a bit
#
# Prepare window
win.graph(width = 5, height = 3.5)
par(ps = 10, cex = 0.75)
#
# With the data frame bubbaStudy
with(data = bubbaStudy,
    # Construct a vertical, jittered stripchart of age by gender
    expr = stripchart(x = age ~ gender, method = "jitter",
        vertical = TRUE,
        # Label the y- and x- axes, and use circles for the plotting symbol
        ylab="Age", xlab="Gender", pch = 1,
        # Set the x- and y-limits to spread the axes out a bit
        ylim = c(15, 60), xlim = c(0.5, 2.5), 
        # Suppress the axes, and the plot frame        
        axes = FALSE, frame.plot = FALSE,
        # Put in a main title
        main = "Stripchart of Age by Gender"))
#
# Now insert labels for gender
axis(side = 1, at = c(0.5, 1:2, 2.5),
    labels = c("", levels(bubbaStudy$gender),""))
#
# And insert custom vertical axis, put numbers horizontal
axis(side = 2, at = seq(from = 15, to = 65, by = 5), las = 1)
#
#
#-------------
# Histograms -
#-------------
#
# Basic density histogram for age
#
# Prepare window
win.graph(width = 5, height = 3.5)
par(ps = 10, cex = 0.75)
#
# Get default histogram
with(data = bubbaStudy,
    expr = hist(x = age, freq = FALSE))
#

# Fine-tuned density histogram for age
#
# Prepare window
win.graph(width = 5, height = 3.5)
par(ps = 10, cex = 0.75)
#
# With bubbaStudy
with(data = bubbaStudy,
    # Construct a right-open, density histogram with axes suppressed
    expr = hist(x = age, freq = FALSE, axes = FALSE, right = FALSE,
        # Set axes limits (after checking the data)
        ylim = c(0, 0.05), xlim = c(10,65),
        # Identify user-defined class limits
        breaks = seq(from = 10, to = 65, by = 5)))
# Now put in a customized horizintal axis
axis(side = 1, at = seq(from = 10, to = 65, by = 5))
# And put in a customized vertical axis
axis(side = 2, at = seq(from = 0, to = 0.05, by = 0.01), las = 1)
#
# Overlay a normal distribution curve
#
# Create a large set of x-values over the range of age
x <- seq(from = 10, to = 65, length.out = 101)
# With bubbaStudy
with(data = bubbaStudy,
    # Plot a density curve having mean and sd same as for dataset age
    expr = curve(expr = dnorm(x, mean = mean(age), sd = sd(age)),
    # Add this curve to the existing histogram, use a dashed line
    add = TRUE, xlab = NULL, lty = 3))
#
# Open the documentation page for the function hist to follow along the
# discussion in the assignment document
?hist
#
#
#----------------
# xy-Scatter Plots -
#----------------
#
# Examples of non-default uses of plot
with(data = bubbaStudy, expr = plot(age ~ field))
#
x <- rnorm(n = 25, mean = 5, sd = 7)
y <- 2*x + runif(n = 25, min = -10, max = 10)
z <- 3*y - 1.5*x + rnorm(n = 25, mean = 0, sd = 5.3)
plot(data.frame(x, y, z))
#
pairs(cbind(x, y, z))
#
# Find out more about the default plot function
?plot.default
#
#
#-----------
# QQ-Plots -
#-----------
#
# Get the QQ-plot of the scores for females in the mathematical sciences
#
# Set window properties
win.graph(width = 3.5, height = 4)
par(ps = 10, cex = 0.75)
#
# Now extract the relevant data
mathGirls <- with(data = bubbaStudy,
    expr = score[(gender == "female") & (field == "mathsci")])
#
# Construct the QQ-Plot with specified main title
qqnorm(y = mathGirls,
    main = "QQ-plot for Scores of Female\n Math/Sci Students")
#
# Insert a dashed qqline
qqline(mathGirls, lty = 2)
#
#
# QQ-plot for standardized samples
#
# Set window properties
win.graph(width = 3.5, height = 4)
par(ps = 10, cex = 0.75)
#
# Get the standardized sample (z-scores)
mgs <- (mathGirls - mean(mathGirls))/sd(mathGirls)
qqnorm(y = mgs,
    main = "QQ-plot for Scores of Female\n Math/Sci Students",
    sub = "(Standardized Scores)")
#
# Insert the line y=x for reference
abline(a = 0, b = 1, lty = 2)
#
#
#************************
# Exploratory Exercises *
#************************
#
# Find out about the layout function
example(layout)
#
# Find out about the split.screen function
example(split.screen)

