# needed package
library(dplyr)

# all file paths in "UCI HAR Dataset" folder and subfolders
files_list <- list.files("UCI HAR Dataset", recursive = TRUE, full.names = TRUE)

#  remove text files from files_list which won't be used 
remove_string <- c("total","body","info", "README")
remove_these_files <- unique(grep(paste(remove_string,collapse="|"), 
                        files_list, value=TRUE))
files_list <- files_list[! files_list %in% remove_these_files]

# from files_list read in all tables and store them as lists in the list "my_list"
my_list <- lapply(files_list, read.table)

# file_names contains the names of all tables in my_list. The names come from files_list 
file_names <- as.character()
for (i in 1:length(files_list)){
    temp <- sub(".txt", "", files_list[i])  # remove extension .txt
    temp <- strsplit(temp, "/")             # split string at /
    temp <- temp[[1]][length(temp[[1]])]    # select last part of string (filename)
    file_names <- c(file_names, temp)       # Create vector with file names in it
}

# for every table list in my_list create a data frame andd assign it to the filename
for (i in 1:length(file_names)){
    assign(file_names[i], do.call(rbind.data.frame, my_list[i]))
}

# Merge test and training set to create one dataset
all_data <- rbind(X_test, X_train)

# assign the features to the data as collumn names
colnames(all_data) <- as.character(features$V2)

# collumns we need to keep, everything with mean and std in column name
all_data <- all_data[ ,grep("std|mean",colnames(all_data))]

# Create subject_id variable and add it to all_data
subject.id <- rbind(subject_test, subject_train) 
all_data$subject.id <- subject.id[ ,1]

# add activity and change them to descriptive names
activity <- rbind(y_test, y_train)
all_data$activity <- activity_labels$V2[activity[,1]]

# add variable to table that gives info of where data came from (test or train)
subject.group <- c(rep(c("test"),each=nrow(subject_test)), rep(c("train"),each=nrow(subject_train)))
all_data$subject.group <- subject.group

# rearrange columns to have subject_id, activity and subject_group in front
all_data <- select(all_data, subject.id, activity, subject.group, 1:(ncol(all_data)-3))

# make a new tidy data_set with the average of each variable for each activity and each subject
tidy_data <- 
    all_data %>%
        group_by(subject.id, activity, subject.group) %>%
        summarise_each(funs(mean))

# tidy up the collumn names and make them more descriptive
col_names <- names(tidy_data)
col_names <- gsub("mean", "Mean", col_names) 
col_names <- gsub("std", "Std", col_names) 
col_names <- gsub("^(f)","Freq",col_names)
col_names <- gsub("^(t)","Time",col_names)
col_names <- gsub("Acc","Acceleration",col_names)
col_names <- gsub("Mag","Magnitude",col_names)
col_names <- gsub("[()]", "", col_names) 
col_names <- gsub("[-]", ".", col_names) 
col_names <- gsub("BodyBody", "Body", col_names) 
colnames(tidy_data) <- col_names

# Write tidy_data to csv file
write.csv(tidy_data, "Cleaned_Activity_Smartphone.csv")

