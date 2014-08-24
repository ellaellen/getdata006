# download data from the web
#if (!file.exists("./data")) {dir.create("./data")}
#fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(fileUrl, destfile = "./data/getdataprojects.zip", method = "curl")
#unzip("./data/getdataprojects.zip")

#1. Merges the training and the test sets to create one data set.
x_merge1 <- read.table("UCI HAR Dataset/train/X_train.txt")
x_merge2 <- read.table("UCI HAR Dataset/test/X_test.txt")
x_merged <- rbind(x_merge1, x_merge2)

y_merge1 <- read.table("UCI HAR Dataset/train/y_train.txt")
y_merge2 <- read.table("UCI HAR Dataset/test/y_test.txt")
y_merged <- rbind(y_merge1, y_merge2)

subject_merge1 <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_merge2 <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_merged <- rbind(subject_merge1, subject_merge2)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
read_measurements <- read.table("UCI HAR Dataset/features.txt")
index_mean_and_sd <- grep("-mean\\(\\)|-std\\(\\)", read_measurements[, 2])
x_merged <- x_merged[, index_mean_and_sd]
names(x_merged) <- read_measurements[index_mean_and_sd, 2]
names(x_merged) <- gsub("\\(|\\)", "", names(x_merged))
names(x_merged) <- tolower(names(x_merged))

#3. Uses descriptive activity names to name the activities in the data set
read_activity <- read.table("UCI HAR Dataset/activity_labels.txt")
read_activity[,2] = gsub("_", "", tolower(as.character(read_activity[,2])))
y_merged[,1] = read_activity[y_merged[,1], 2]
names(y_merged) <- "activity"

#4. Appropriately labels the data set with descriptive variable names. 
names(subject_merged) <- "subject"
tidydata <- cbind(subject_merged, x_merged, y_merged)
write.table(tidydata, "tidy_data_set.txt")

#5. Creates a second, independent tidy data set with the average of each variable 
# for each activity and each subject. 
#unique_subjects <- unique(subject_merged)[,1]
average_results <- aggregate(x_merged, by = list(activity = y_merged[,1], subject = subject_merged[,1]), mean)

write.table(average_results, "average_data_set.txt", row.name = FALSE)
