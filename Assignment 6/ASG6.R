
# HMW6
#
# Total Time Taken: 
#
#
# Remove all objects from the workspace
rm(list = ls(all = TRUE))
# Load the data
load(file = file.choose())
#
#..............................................................................................
#PROBLEM #1
#..............................................................................................
# Prepare a function that performs the runs test. Include appropriate safety checks and 
# permit users to choose between the exact or the approximate methods but put in sample
# size restrictions for the normal approximation method. 
#
nonrandom.test<-function(x, method="exact", confLevel=0.95, dec=4)
{ # Start the function body
  #
  # Arguments
  # x         : vector of observations 
  # method    : user selects between "exact" or "approximate" methods of computation,
  #             default is the exact method
  # confLevel : confidence level as a number between 0 and 1, default is 95%
  # dec       : a non-negative integer, default is 4 decimal places 
  #
  #
  # Output
  # Uses the vector of observations to output a p-value resulting from the test 
  # of non-randomness 
  #
  #
  # Warnings
  # A warning will be produced and the function stopped if the confidence level
  # is less than 0 or greater than 1. If raw data is not entered for either sample the function
  # will issue a warning and stop. If np<5 or n(1-p)<5 for either sample, issue warning.
  #
  # Start with basic data checks
  # If x is missing, stop with a error message
  if (missing(x)) {stop("ERROR! Need data (x)")}
  # If method missing 
  # If the confidence level not within range [0,1], stop with error message
  if (confLevel<0) {stop("Confidence level must be a positive number!")}
  else {
    if (confLevel>1) {stop("Confidence level must be less than 1! \n\n
        (Hint:95% confidence -> confLevel=0.95)")}}
  # If dec not a positive stop with error message
  if(dec<0) {stop("Dec argument must be a positive integer!")}
  # If dec not an integer then stop with an error message 
  if(dec%%1!=0) {stop("Dec argument must be an integer!")}
  # If method isn't "exact" or "approximate, stop with error message
  if(method!="approximate" & method!="exact")
    {stop("ERROR! Method argument must be either 'exact' or 'approximate'")}
  
  #
  #
  # Perform preliminary assignments and initializations
  #
  # Get sample length and median
  n <- length(x); xMed <- median(x)
  # Initialize a NULL object for the vector g
  g <- NULL
  #
  # Now use a for-loop to populate g with a sequence of A's and B's,
  # making sure to exclude cases that equal the median
  for (i in 1:n)
  {   # Start for-loop body
    # If entry is greater than median, store an A
    if (x[i] > xMed) {g <- c(g, "A")
    # Else, if entry is less than median, store a B
    } else {if (x[i] < xMed) {g <- c(g, "B")}}
  }   # End for-loop
  #
  # Now get a and b
  a <- length(g[g == "A"]); b <- length(g[g == "B"])
  #
  # Now use a for-loop to get the number of runs, r
  # First initialize r, and get length of g
  r <- 1; m <- length(g)
  # Now loop through g
  for (i in 1:(m-1)){if (g[i+1] != g[i]){r <- r+1}}
  #
  #
  #
  #--------------------------------------
  # Test Using the Normal Approximation -
  #--------------------------------------
  #
  #
  if (method=="approximate"){
    # Check for sample size restrictions in normal approx method
    if (a<10) {stop ("Sample size too small! Try the exact method instead")}
      else {if (b<10) {stop ("Sample size too small! Try the exact method instead")}
        else { #run the function if sample size appropriate
          # First get the mean
          (rMu <- 2*a*b/(a + b) + 1)
          # Then the variance
          (rVar <- 2*a*b*(2*a*b - a - b)/((a + b)^2*(a + b - 1)))
          # Then, since r < rMu, the test value with a correction for continuity
          (zVal <- (r + 0.5 - rMu)/sqrt(rVar))
          # Finally the calculate the p-value, round and store it
          pValue<-round(2*pnorm(q = abs(zVal), lower.tail = FALSE), dec)
          # Output 
          cat(paste(
            "\n\t", confLevel*100, "% Confidence level test for non-randomness\n\n",
            # State the method used
            "Method used:\t", method, "\n",
            # Print the p-value 
            "P-value:\t", pValue, sep = ""))}}}
    #
    #-----------------------------------
    # Test Using Classical Probability -
    #-----------------------------------
    #
    #
    else {if(method=="exact"){
   
      # First create a function that computes P(R = k)
      p.runs <- function(a, b, k){
        # If k is even (i.e., k mod 2 = 0)
        if (k%%2 == 0){
          return(2*choose(a-1, k/2-1)*choose(b-1, k/2-1)/choose(a+b, a))
          # else, if k is not even
        } else {
          return((choose(a-1, (k-1)/2)*choose(b-1, (k-3)/2) +
                    choose(a-1, (k-3)/2)*choose(b-1, (k-1)/2))/choose(a+b, a))}}
      #
      # Now calculate p-value, including a check on P(R <= r)
      chck <- 0
      for (i in 2:r) {chck <- sum(chck, p.runs(a, b, k = i))}
      # Finally find the p-value, round and store it
      pVal<-round(ifelse(chck < 0.5, 2*chck, 2*(1 - chck)), dec)
      # Output 
      cat(paste(
        "\n\t", confLevel*100, "% Confidence level test for non-randomness\n\n",
        # State the method used
        "Method used:\t", method, "\n",
        # State the resulting p-value 
        "P-value:\t", pVal, sep = ""))}}
      # Error message if method is something other than "exact" or "approximate"
  
}  #end the function body

#
#
#
#--------------------------------------
# Test out my function :-)
#--------------------------------------  
  
# Test the function with the oneSampRand using normal approximation
nonrandom.test(x=oneSampRand, method="approximate", confLevel=0.95, dec=4)
# We find the p-value=0.4838, indicating that at any traditional alpha level we would
# find insufficient evidence to reject the assumption of randomness. 
#
#
#
# Test the function with oneSampRand using the exact method (default)
nonrandom.test(x=oneSampRand)
# Test the missing x error message
nonrandom.test()
# Test the confLevel restriction
nonrandom.test(x=oneSampRand, confLevel=95)
# Test the decimal restriction
nonrandom.test(x=oneSampRand, dec=.1)
# Test the method argument restrictions
nonrandom.test(x=oneSampRand, method="approx")
# Test the sample size restriction
smallSamp<-c(10,11,12,13,14)
nonrandom.test(x=smallSamp, method="approximate")
# 
# Test the function with handbreak data with normal approximation
nonrandom.test(x=handbreak, method="approximate")
# Our p-value=0.8657 indicated that we will fail to reject our null hypothesis of
# randomness at any traditional alpha level 


