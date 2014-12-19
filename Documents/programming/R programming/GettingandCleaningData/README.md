##  Course Project - Getting and Cleaning Data
Author: Wouter Droog
This is the repo for the Course Project of the course "Getting and Cleaning Data".

### Important
* Set you R working directory to the right path. For instructions see below, section Files and data.
* You need to install the dplyr package.

### General information
The goal of this project was to process the dataset so that the result would be a nice clean dataset that is ready for subsequent analysis. The data is from smartphone users performing several physical activities. For more information of the data [click this link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

### package
*** dplyr package**: This package is needed to run the analysis script ("run_analysis.R").

### Scripts
* **run_analysis.R**: Script reads all data and processes it in a way to create a tidy dataset. 

### Files and data 
* **CodeBook.md**:  The code book describes the variables, the data, and all transformations or work done to get the clean data set that is ready for further analysis.
* **UCI HAR Dataset**: [Download the data here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Unzip this folder and set your R working directory (setwd) to the folder where you saved the dataset. Do not include the data folder itself in your working directory path. So, if your "UCI HAR Dataset" is saved and unzipped in the "GettingandCleaningData" folder you should set your working directory to that folder like this "C:/User/Documents/GettingandCleaningData" do not include the "UCI HAR Dataset" folder like this "C:/User/Documents/GettingandCleaningData/UCI HAR Dataset". 
* **Cleaned_Activity_Smartphone.csv**: The result of run_analysis.R
 
### Course Project instructions
For reference I included the course project instructions

 You should create one R script called run_analysis.R that does the following. 

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in step 4, creates a second, independent tidy data set with the average                 of each variable for each activity and each subject.




