**Getting and Cleaning Data Course Project**
========================================

## General explanation on the project's data
One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

## Original downloaded data
The script was developed to prepare tidy data in order to further analyze the data later on.
The project's data is from [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
The project's script assumes that:
a) the downloaded zip file was unzipped
b) the relevant files, required for the tidy work, exist in the unzipped folder - "UCI HAR Dataset"
c) working directory is defined to the unzipped folder "UCI HAR Dataset"

The following files from the original downloaded data are in use by the script:
  1. ***features.txt*** - descriptions of the measured features
  2. ***train/X_train.txt*** - the measurements of the features in train set
  3. ***test/X_test.txt*** - the measurements of the features in test set
  4. ***activity_labels.txt*** - activities' description
  5. ***train/y_train.txt*** - activity for each measurement from the train set
  6. ***test/y_test.txt*** - activity for each measurement from the test set
  7. ***train/subject_train.txt*** - subject for each measurement in the train set
  8. ***test/subject_test.txt*** - subject for each measurement in the test set


## How script works
The written script performs the following steps:

**STEP 1 -** load measures train data set file ***X_train.txt*** and measures test data set file from ***X_test.txt*** and merge them to one measures data set. Also, in the same way, load the suitable train and test activities data sets from files ***y_train.txt*** and ***y_test.txt*** and merge them to one activities data set.

**STEP 2 -** load the file ***features.txt*** to have the description of the measured features and search for all the mean and standard deviation measures. Then, retrieve from the merged measures data set only the mean and the std measures.   
  
**STEP 3 -** load the file ***activity_labels.txt*** to attach this activities' description to the merged activities data set. After having a description for each activity id, attach for each sample (row in the measures data set filtered on mean and std meaures) its suitable activity and activity description. This output will be referred as "handled data set" for our convience.
In this step we also assign column names for the activity labels loaded from the file and for the merged activities data set.

**STEP 4 -** assign column names for the handled data set, using the column names given to the merged activities data set in STEP 3 and the descriptions of the measured features which were loaded on step 2.

**STEP 5 -** load the train and test subjects data sets from the suitable files ***subject_train.txt*** and ***subject_test.txt*** and merge them to one subjects data set. Then, attach for each sample in the handled data set its suitable subject (id only, already with a suitable column name). Based on the handled data set (after the last update - subject addition), create a new data set which will contain a summarized average data of all the measures per subject and activity. Meaning, for each subject and activity combination we will have average of each measure. This summarized average data set will be exported to a new file named ***"avg_tidy_data.txt"***.
