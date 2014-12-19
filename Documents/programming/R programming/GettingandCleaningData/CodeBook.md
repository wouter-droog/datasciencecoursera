##  Codebook
The code book describes the variables, the data, and all transformations or work done to get the clean data set that is ready for further analysis.

### Table of contents
* **Important**
* **Original Data**
* **Experiment**
* **Explanation of the measures**
* **Transformations performed by run_analysis.R script**

### Important
* Set you R working directory to the right path. For instructions see README file, section Files and data.
* You need to install the dplyr package.

### Original Data
The original data can be obtained from: [Download the data here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
For more information of the data [click this link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) or read information below.

### Experiment
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.  

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### Explanation of the measures
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

### Transformations performed by run_analysis.R script
The script reads in all necessary files and datasets from the "UCI HAR Dataset" folder. As mentioned above the original data contains two datasets, test_subject data and train_subject data. Both of these datasets contain 561 column variables (features.txt). In total 30 subjects performed 6 activities (activity_label.txt). 

Transcript of transformations:
* The two datasets are merged into one.  The script will later create a new variable to keep track of from which group the subject came.
* It assigns the 561 column names from the feature.txt
* Selects only column names with mean and std in it, resulting in 86 columns. Columns with Mean (note capital M) were ignored because these were mean values used in the angle() variables. In contrary to some others doing this assignment I have included the meanFreq() variables because in principle it just calculates the mean just like mean() variables and I'm not sure what kind of analysis follows. I rather be save than sorry.
* Subject id's are added to the table from the subject_test.txt and  subject_train.txt.
* Activities are added to table and changed to descriptive characters (from activity_labels.txt).
* Subject.group is added to track in which group participant was from (test or train).
* Rearrange column order
* By use of the "dplyr" package functions a tidy dataset is created (tidy_data). The data is grouped by subject.id and activity. For the resultant group the averages are obtained and put into a table by the function sumarise. As expected the result gives us 180 observations (30 subjects x 6 activities). So, each row is an observation and each column is a variable.
* The column names of the tidy_data are made more descriptive. Apart from std all abbreviations are spelled out, every word within a variable now starts with a Capital letter for readability purposes and brackets and "-" are removed.
* Finally the tidy_data is written to a .csv file with the name "Cleaned_Activity_Smartphone.csv"

