install.packages("devtools") #Tool necessary to download tabulating tool to your console
library(devtools)
install.packages('data.table') #Tool that allows the user to quickly generate summary statistics from outputted HOBOWare files
library(data.table)
data = read.csv('10944720CLEAN.csv') #Replace with the name of the downloaded HOBOfile data and be sure to set the location of the data as the working directory
ST = setDT(data)[, list(maxT=max(Temp), minT=min(Temp), meanT=mean(Temp)), by=list(Date)] #Creates a new file of the daily maximum, minimum, and average temperatures from the HOBOfile based upon the Date
ST[[1]] = as.Date(ST[[1]], format = "%m/%d/%Y") #Adds the Date in the m/d/y format to the front of the data set, could add as the last column by replacing [1] with [4]
ST = cbind(siteID = "10944720", ST) #Sets the siteID as the first column the HOBO serial number is how we set our IDs
setwd("~/Capstone/R Diagnostics/StreamThermal_Ordered") #If you want to output the new file in the same folder don't do this set, but it is reccomended to create a new folder to house the summary data and then set that folder as the working directory for this step
write.csv(ST, file = "10944720_Ordered.csv") #Outputs the new summary data set as a csv file in the current working directory, naming conventions are up to the user

