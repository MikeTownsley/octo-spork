#run_analysis.R 

# assumes data in working directory

# setwd(<your directory here>) # or you could specify it here and uncomment this line

# Merges the training and the test sets to create one data set.

test_subject_number <- read.table("test/subject_test.txt")
test_X_data <- read.table("test/X_test.txt", sep = "")
test_y_number <- read.table("test/y_test.txt")

train_subject_number <- read.table("train/subject_train.txt")
train_X_data <- read.table("train/X_train.txt")
train_y_number <- read.table("train/y_train.txt")

combined_data <- rbind(cbind(test_subject_number, test_X_data,test_y_number),
                       cbind(train_subject_number, train_X_data,train_y_number))

rm(test_subject_number, test_X_data,test_y_number,
   train_subject_number, train_X_data,train_y_number)

# now gives proper variable names

feature_names <- read.table("features.txt")

names(combined_data) <- c("subject_id",as.character(feature_names$V2),
                          "activity")

# Extracts only the measurements on the mean and standard deviation for each measurement. 

library(stringr)

mean_sd_columns <- str_detect(names(combined_data), pattern = "subject_id|mean|std|activity")

combined_data <- combined_data[,mean_sd_columns]

combined_data <- combined_data[, !str_detect(names(combined_data), pattern = "meanFreq")]

# Uses descriptive activity names to name the activities in the data set

activity_names <- read.table("activity_labels.txt")

library(dplyr)

combined_data <- left_join(combined_data, activity_names, by = c("activity" = "V1"))
names(combined_data)[69] <- "activity_label"
# Appropriately labels the data set with descriptive variable names. 

full_column_names <- names(combined_data)

full_column_names <- str_replace(full_column_names, pattern = "Acc", replacement = "accelerometer")
full_column_names <- str_replace(full_column_names, pattern = "Gyro", replacement = "gyroscope")
full_column_names <- str_replace(full_column_names, pattern = "^t", replacement = "time")
full_column_names <- str_replace(full_column_names, pattern = "^f", replacement = "frequency")
full_column_names <- str_replace(full_column_names, pattern = "mean()", replacement = "mean")
full_column_names <- str_replace(full_column_names, pattern = "std()", replacement = "standarddeviation")
full_column_names <- str_replace(full_column_names, pattern = "[(]", replacement = "")
full_column_names <- str_replace(full_column_names, pattern = "[)]", replacement = "")
full_column_names <- str_replace(full_column_names, pattern = "Mag", replacement = "magnitude")
full_column_names <- str_replace(full_column_names, pattern = fixed("-"), replacement = "")


names(combined_data) <- full_column_names
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for 
# each activity and each subject.

combined_data %>%
    group_by(activity_label,subject_id) %>%
    summarise_each(funs(mean)) -> summary_df

summary_df
#write.table(summary_df, "summary_dataframe.txt", row.name=FALSE)
