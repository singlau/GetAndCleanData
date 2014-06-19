GetAndCleanData
===============

The data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

1. Download and open the zip file.  
2. Place the following files into the working directory.
	activity_labels.txt
	features.txt
	subject_test.txt
	X_test.txt
	y_test.txt
	subject_train.txt
	X_train.txt
	y_train.txt
3. Download the program run_analysis.R from https://github.com/singlau/GetAndCleanData
4. Run the program run_analysis.R
5. A text summary file tidyData.txt is created in the working directory.
6. To read the text summary file tidyData.txt :
   tidyData <- read.csv("tidyData.txt", sep="")