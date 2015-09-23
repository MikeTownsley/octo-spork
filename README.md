# README.md

The repo contains three files:

1. `README.md`: this document explains how all of the scripts work and how they are connected.
2. `CodeBook.md`: details the variables, the data, and any transformations or work that you performed to clean up the data.
3. `run_analysis.R`: contains all R code to create the two data.frames from the raw data.

## Data

The raw data were sourced from `https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip`. This contained data from smartphone sensors used by 30 subjects in a series of tasks designed to recognise different activities. The subjects are split into a training and test group.

## Procedure

The zip file should be downloaded and unzipped. The source file `run_analysis.R` should be placed in the same directory as the unzipped file. `run_analysis.R` does the following:

1. Merges the training and the test sets into a single consolidated data set.
    + lines 9--11 and 13--15 import the test and train dataset respectively.
    + lines 17--18 uses a combination and `rbind` and `cbind` commands to create a consolidated data set. 
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    + this step takes place on lines 32--38 and requires the use of the `stringr` package.
    +  line 34: an indexing variable (`mean_sd_columns`) is created that contains the column numbers if the columns names contain the string patterns `mean`, `std`, `subject_id` and `activity`. The latter two are required as they identify which rows relate to which subject and activity type.
    + line 36: the indexing variable is used to select just the columns required
    + line 38: some variables contain the string `meanFreq`, which is matched in line 34, but this does not relate to the the mean of a measurement. This line removes those columns.
3. Uses descriptive activity names to name the activities in the data set.
    + this step takes place on lines 41--47.
    + line 42 reads in the activity labels (translates between a numberic values and the corresponding activity label, i.e. the categorical value) to an objected called `activity_names`
    + line 44 launches the `dplyr` package, required for the `left_join` in the next step
    + line 46 performs a left join on `combined_data` and `activity_names`. As there are no common variable names, the join criterion is explicitly declared using the `by` argument
    + line 47 gives the new variable a more appropriate name.
4. Appropriately labels the data set with descriptive variable names.  
    + this takes place in two steps. The first takes place to enable the selection of measurement of mean and standard deviation (outlined above) in a straighforward way
    + lines 25--28 provide the consolidated data set the feature names (the column names). This is done by importing `features.txt` and renaming the variable names in `combined_data`. 
    + lines 50--60 takes the existing variable names and generates more intuitive value names. So, `Acc` becomes `accelerometer` and so on.
    + line 62 replaces the existing column names with the new ones
5. Two data.frames are created: `combined_data`, which has all observations, and `summary_df`, which has the average of each variable for each activity and each subject. 


