File: subActSummary

Column:

subject	-		30 volunteers within an age bracket of 19-48 years

ActivityName -		Six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS,
			SITTING, STANDING, LAYING)

tBodyAcc-mean()-X, tBodyAcc-mean()-Y, tBodyAcc-mean()-Z, ..., fBodyBodyGyrojerkMag-std(), fBodyBodyGyrojerkMag-MeanFreq() -

3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.Columns are either the mean of mean or mean of std at each activity and each subject. Total 79 columns.


Data Transformation and Cleaning

1. Merges the training and test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity name to name the activities in the data set.
4. Appropiately labels the data set with descriptive variable name.
5. Create the independent tidy data set subActSummary with the average of each variable
   for each activity and each subject.
