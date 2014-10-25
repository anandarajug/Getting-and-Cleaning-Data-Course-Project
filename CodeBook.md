CodeBook for 
run_analysis.R and tidy_data.txt
================================================================
        This codebook describes the data file tidy_data.txt that result from running the run_analysis.R script on the data sets downloaded from the UCI Machine Learing Repository on human activity recognition using smartphones available at:
        
        https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

the full description is available at the site :
        
        http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The goal of this project is to prepare tidy data that can be used for later analysis.

# A. Origin dataset information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

The dataset includes the following files:
        
        > * *README.txt*
        > * *features_info.txt* : Shows information about the variables used on the feature vector.
> * *features.txt* : List of all features.
> * *activity_labels.txt* : Links the class labels with their activity name.
> * *train/X_train.txt* : Training set.
> * *train/y_train.txt* : Training labels.
> * *test/X_test.txt* : Test set.
> * *test/y_test.txt* : Test labels.


# B. Data processing by this script
## B1.  Read files  
> * Read *activity_labels.txt* to data frame *activities*
        > * Read *features.txt* to data frame *features*
        > * Read *X_train.txt* to data frame *X_train*
        > * Read *X_test.txt* to data frame *X_test*
        > * Read *y_train.txt* to data frame *y_train*
        > * Read *y_test.txt* to data frame *y_test*
        > * Read *subject_train.txt* to data frame *subject_train*
        > * Read *subject_test.txt* to data frame *subject_test*
        
        ## B2. Merges and labels data set
        Using **cbind()** function, we first combine  *subject_train* , *y_train* and *X_train* by columns, which has also done for test data. Then we Using **rbind()** function combine training data and test data in one data frame named *Merges* which contains all records.

Then we names the column in *Merges* by using descriptive variable names in *features*. The first two  columns were named by "subject" and "activity".

At last,  we use descriptive activity names in *activities* to name the activities in the data set *Merges*.

## B3. Extracts needed features
Since only the measurements on the mean and standard deviation for each measurement are needed. we use  **grep()** function on the features vector to look for **mean()** and **std()** strings and return a *tidy_data* which has 68 columns.

## B4. Create the final tidy data
we create a independent tidy data set with the average of each variable for each activity and each subject, with using **melt()** and **dcast()** function. 

What we get is the average value for each couple {subject, activity} of the 66 selected features (mean and standard deviation for each measurement).

Having 30 subjects, 6 activites and 66 features, we finally get a 180 x 68 tidy data set.

Then by using **write.table()** function, we create a text file containing this new tidy data set, which is the final *tidy_data.txt* .

## B5. variables in the final tidy data
> *  [1] "subject"                         "activity"                       
> *  [3] "tBodyAcc-mean()-X"               "tBodyAcc-mean()-Y"              
> *  [5] "tBodyAcc-mean()-Z"               "tGravityAcc-mean()-X"           
> *  [7] "tGravityAcc-mean()-Y"            "tGravityAcc-mean()-Z"           
> *  [9] "tBodyAccJerk-mean()-X"           "tBodyAccJerk-mean()-Y"          
> * [11] "tBodyAccJerk-mean()-Z"           "tBodyGyro-mean()-X"             
> * [13] "tBodyGyro-mean()-Y"              "tBodyGyro-mean()-Z"             
> * [15] "tBodyGyroJerk-mean()-X"          "tBodyGyroJerk-mean()-Y"         
> * [17] "tBodyGyroJerk-mean()-Z"          "tBodyAccMag-mean()"             
> * [19] "tGravityAccMag-mean()"           "tBodyAccJerkMag-mean()"         
> * [21] "tBodyGyroMag-mean()"             "tBodyGyroJerkMag-mean()"        
> * [23] "fBodyAcc-mean()-X"               "fBodyAcc-mean()-Y"              
> * [25] "fBodyAcc-mean()-Z"               "fBodyAcc-meanFreq()-X"          
> * [27] "fBodyAcc-meanFreq()-Y"           "fBodyAcc-meanFreq()-Z"          
> * [29] "fBodyAccJerk-mean()-X"           "fBodyAccJerk-mean()-Y"          
> * [31] "fBodyAccJerk-mean()-Z"           "fBodyAccJerk-meanFreq()-X"      
> * [33] "fBodyAccJerk-meanFreq()-Y"       "fBodyAccJerk-meanFreq()-Z"      
> * [35] "fBodyGyro-mean()-X"              "fBodyGyro-mean()-Y"             
> * [37] "fBodyGyro-mean()-Z"              "fBodyGyro-meanFreq()-X"         
> * [39] "fBodyGyro-meanFreq()-Y"          "fBodyGyro-meanFreq()-Z"         
> * [41] "fBodyAccMag-mean()"              "fBodyAccMag-meanFreq()"         
> * [43] "fBodyBodyAccJerkMag-mean()"      "fBodyBodyAccJerkMag-meanFreq()" 
> * [45] "fBodyBodyGyroMag-mean()"         "fBodyBodyGyroMag-meanFreq()"    
> * [47] "fBodyBodyGyroJerkMag-mean()"     "fBodyBodyGyroJerkMag-meanFreq()"
> * [49] "tBodyAcc-std()-X"                "tBodyAcc-std()-Y"               
> * [51] "tBodyAcc-std()-Z"                "tGravityAcc-std()-X"            
> * [53] "tGravityAcc-std()-Y"             "tGravityAcc-std()-Z"            
> * [55] "tBodyAccJerk-std()-X"            "tBodyAccJerk-std()-Y"           
> * [57] "tBodyAccJerk-std()-Z"            "tBodyGyro-std()-X"              
> * [59] "tBodyGyro-std()-Y"               "tBodyGyro-std()-Z"              
> * [61] "tBodyGyroJerk-std()-X"           "tBodyGyroJerk-std()-Y"          
> * [63] "tBodyGyroJerk-std()-Z"           "tBodyAccMag-std()"              
> * [65] "tGravityAccMag-std()"            "tBodyAccJerkMag-std()"          
> * [67] "tBodyGyroMag-std()"              "tBodyGyroJerkMag-std()" 
