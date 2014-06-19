## Getting and Cleaning Data Course Project

## This R program first reads the data files and adds the column names.
## Next, it row bind the training  and test sets. 
## The subject, activity and the set data is column bind together to 
## from a big data file.
## The program summizes the set data based on each subject and each
## activity.
## Finally, a summary data text file is outputed to the working directory.


## read the activity label and features file
actLab <- read.csv("activity_labels.txt", colClasses = "character", header = FALSE, sep = "")
features <- read.csv("features.txt", colClasses = "character", header = FALSE, sep = "")


## read the test set, label and subject files
xTest <- read.csv("x_test.txt", header = FALSE, sep = "")
yTest <- read.csv("y_test.txt", colClasses = "character", header = FALSE)
subTest <- read.csv("subject_test.txt", colClasses = "numeric", header = FALSE)

## read the training set, label and subject files
xTrain <- read.csv("x_train.txt", header = FALSE, sep = "")
yTrain <- read.csv("y_train.txt", colClasses = "character", header = FALSE)
subTrain <- read.csv("subject_train.txt", colClasses = "numeric", header = FALSE)

## Name the column names of each file

names(features) <- c("Row", "featureName")

names(xTrain) <- features$featureName

names(xTest) <- features$featureName

names(actLab) <- c("activity", "ActivityName")

names(yTrain) <- "activity"
names(yTest)  <- "activity"

names(subTest) <- "subject"
names(subTrain) <- "subject"

## row bind Training labels to Test labels
y <- rbind(yTrain, yTest)

## row bind Training set and Test set
x <- rbind(xTrain, xTest)

## row bind Training subjects and Test subjects
sub <- rbind(subTrain, subTest)

## gets the set columns with "mean" or "std" in the column name 
## and form a smaller set
smallx <- x[, grepl("mean|std", names(x))]

## column bind activity, subject and set
smallysubx <- cbind(y, sub, smallx)

library(plyr)

## join the activity name with the set data
smallysubxAct <- join(actLab, smallysubx, by="activity", type = "right")

## get the column names with mean or std measurements
varList <- names(smallx)

library(reshape2)

## melt the set data according to the subject and the activity name
## the variables are the mean or std measurements
smallysubxActMelt <- melt(smallysubxAct, id=c("subject", "ActivityName"), measure.vars=varList)

## from the data frame with each row of different subject and activity combination
## the varible columns are the mean or std measurements
subActSummary <- dcast(smallysubxActMelt, subject + ActivityName ~ variable, mean)

## write the summary to a text file "tidyData.txt"
write.table(subActSummary, file="tidyData.txt", row.names=FALSE)

## to read the summary file "tidyData.txt : read.csv("tidyData.txt", sep="")

