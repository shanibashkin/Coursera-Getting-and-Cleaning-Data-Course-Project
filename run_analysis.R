#-----------------------------------------------------------------------
# Coursera: Getting and Cleaning Data Course Project
# Peer-graded Assignment
#-----------------------------------------------------------------------
# File: run_analysis.R
# Programmer: Shani Nachmias
# Date 28.4.2019
#-----------------------------------------------------------------------
# This project demonstrates the ability to collect, work with, and 
# clean a data set.
# The goal of this assignment is to prepare tidy data that can be used 
# for later analysis of data collected from the accelerometers from the 
# Samsung Galaxy S smartphone.
# The tidy calculated averages result will be stored in an export file
# "avg_tidy_data.txt".
#
# See README.md CodeBook.md for details.
#-----------------------------------------------------------------------


# 1. Create one data set by merging the training data and the test data

x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")

data <- rbind(x_test, x_train)
data_act <- rbind(y_test, y_train)


# 2. Retrieve all the mean and standard deviation measurements only

features <- read.table("features.txt")

selected_features_index <- grep("mean()|std()", features$V2)
selected_features <- features[selected_features_index,]
selected_data <- data[,selected_features_index]


# 3. Add descriptive activity names to the activities in the data set

activity_labels <- read.table("activity_labels.txt")

library(dplyr)
names(data_act) <- c("activity")
names(activity_labels) <- c("activity", "activity_name")
data_act <- left_join(data_act, activity_labels)
selected_data <- cbind(data_act, selected_data)


# 4. Label the data set with descriptive variable names

names(selected_data) <- c(names(activity_labels), as.character(selected_features$V2))


# 5. Create a tidy data set which calculates the measurements' average per each activity and each subject

subject_test <- read.table("test/subject_test.txt")
subject_train <- read.table("train/subject_train.txt")
subjects <- rbind(subject_test, subject_train)
names(subjects) <- c("subject")

selected_data <- cbind(subjects, selected_data)

avg_tidy_data <- selected_data %>% group_by(subject, activity, activity_name) %>% summarise_all(funs(mean))


# 6. Export the new average tidy data to a file 

write.table(avg_tidy_data, "avg_tidy_data.txt", row.names = FALSE)