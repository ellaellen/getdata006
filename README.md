Project for Getting and Cleanning Data on Coursera.

Original instructions:
You should create one R script called run_analysis.R that does the following.

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive activity names.
Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Steps in run_analysis.R:
download the UCI HAR Dataset into ./data
expand the compressed dataset
load the label codes key from activity_labels.txt
load the feature key from features.txt
determine the indices of desired features (those containing -mean() or -std())
load the training and test data sets and only retain data columns determined by indices from step #5
merge the training and test data sets
replace label codes in the dataset with text labels determined by step #3
reshape data to use label and subject as identifiers
produce a tidy data set (tidy_data_set.txt) with the average of each variable for each activity/subject combination
produce CodeBook.md with a list of column names (which were taken from features.txt)

Notes:
For descriptions of data types and how data was collected, check these files included with the original data: README.txt, features_info.txt

