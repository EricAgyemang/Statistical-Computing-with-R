#Eric Agyemang
#HMW1

#Total time taken: 1.25 hours
#PROBLEM 1
#---------------------------------------------------------------------------------------
#############
# Script 1###
#############
#
# Store the sample data in a vector
x <- c(74.3, 69.9, 65.7, 70.1, 56.8, 69.2, 73.2, 49.6, 73.4, 77.8)
# Store the length of the vector
n<-length(x)
# Calculate and store the mean 
xBar<-sum(x)/n
# Calculate and store the standard deviation
s <- sqrt(sum((x-xBar)^2)/(n-1))
# Set the alpha level
alpha <-0.05
# Find and store the critical Z value
critValue <-qt(p=alpha/2, df=n-1, lower.tail = FALSE)
# Calculate and store the distance from the mean of our upper and lower bounds 
error <- critValue*s/sqrt(n)
# Store the values of upper and lower bounds
bounds <- round(xBar + c(-error, error), 1)
#Print statement about the confidence interval of the mean of our vector
cat(paste("The ", 1-alpha, "% confidence for the mean of x is: [", 
	bounds[1], ", ", bounds[2], "]\n", sep=""))


#PROBLEM 2
#-----------------------------------------------------------------------------------------
#Running a t-test on a vector will also return a 95% confidence interval
t.test(x)

