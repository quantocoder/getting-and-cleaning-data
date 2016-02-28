
This code book describes the variables, the data, and transformations that were performed to clean up the data. For original data description, please, see 'features_info.txt'. This file is included in this repo as a fererence.

For data flow description, please see 'README.md', details of transformations for each script are as follows:

prepare_data.R
--------------

1) The script reads original feature data into separate data frames and merges the data. The new data frame is saved into 'all_features'. Only features are read in at this point, not the subject or label information. 

> test_features = read.table("data.in/test/X_test.txt")
>
> train_features = read.table("data.in/train/X_train.txt")
>
> all_features = rbind(test_features,train_features)

2) Feature names are read in and required columns are selected (the names containing 'mean()' and 'std()'. All features are named. After that the required columns are extracted from the merged data frame. The new data frame is saved into 'some_features'

> feature_names = read.table("data.in/features.txt")
>
> some_names = grep(pattern="std\\(\\)|mean\\(\\)",x=feature_names$V2)
>
> names(all_features) = feature_names$V2
>
> some_features = all_features[,some_names]

The following columns from the original data sets are selected:

tBodyAcc-mean()-X
tBodyAcc-mean()-Y
tBodyAcc-mean()-Z
tBodyAcc-std()-X
tBodyAcc-std()-Y
tBodyAcc-std()-Z
tGravityAcc-mean()-X
tGravityAcc-mean()-Y
tGravityAcc-mean()-Z
tGravityAcc-std()-X
tGravityAcc-std()-Y
tGravityAcc-std()-Z
tBodyAccJerk-mean()-X
tBodyAccJerk-mean()-Y
tBodyAccJerk-mean()-Z
tBodyAccJerk-std()-X
tBodyAccJerk-std()-Y
tBodyAccJerk-std()-Z
tBodyGyro-mean()-X
tBodyGyro-mean()-Y
tBodyGyro-mean()-Z
tBodyGyro-std()-X
tBodyGyro-std()-Y
tBodyGyro-std()-Z
tBodyGyroJerk-mean()-X
tBodyGyroJerk-mean()-Y
tBodyGyroJerk-mean()-Z
tBodyGyroJerk-std()-X
tBodyGyroJerk-std()-Y
tBodyGyroJerk-std()-Z
tBodyAccMag-mean()
tBodyAccMag-std()
tGravityAccMag-mean()
tGravityAccMag-std()
tBodyAccJerkMag-mean()
tBodyAccJerkMag-std()
tBodyGyroMag-mean()
tBodyGyroMag-std()
tBodyGyroJerkMag-mean()
tBodyGyroJerkMag-std()
fBodyAcc-mean()-X
fBodyAcc-mean()-Y
fBodyAcc-mean()-Z
fBodyAcc-std()-X
fBodyAcc-std()-Y
fBodyAcc-std()-Z
fBodyAccJerk-mean()-X
fBodyAccJerk-mean()-Y
fBodyAccJerk-mean()-Z
fBodyAccJerk-std()-X
fBodyAccJerk-std()-Y
fBodyAccJerk-std()-Z
fBodyGyro-mean()-X
fBodyGyro-mean()-Y
fBodyGyro-mean()-Z
fBodyGyro-std()-X
fBodyGyro-std()-Y
fBodyGyro-std()-Z
fBodyAccMag-mean()
fBodyAccMag-std()
fBodyBodyAccJerkMag-mean()
fBodyBodyAccJerkMag-std()
fBodyBodyGyroMag-mean()
fBodyBodyGyroMag-std()
fBodyBodyGyroJerkMag-mean()
fBodyBodyGyroJerkMag-std()

3) 

Two new columns are added: activity and subject. Activity codes for test and train sets are read and merged to create a vector of activity codes. Activity names are read and used to create a factor vercor that is assigned to 'some_features' data frame as an extra column named activity. 

> test_activities  = read.table("data.in/test/y_test.txt")
>
> train_activities = read.table("data.in/train/y_train.txt")
>
> actitivy_labels = read.table("data.in/activity_labels.txt")
>
> some_features$activity = factor(x=c(test_activities$V1,train_activities$V1),labels=actitivy_labels$V2)

In a similar manner the 'subject' column is attached to 'some_features' data frame.

> test_subjects = read.table("data.in/test/subject_test.txt")
>
> train_subjects = read.table("data.in/train/subject_train.txt")
>
> some_features$subject = c(test_subjects$V1,train_subjects$V1)

4) Finally the data is saved to 'data.out/data_tidy.csv'
                                                                                                                     
> write.csv(some_features,"data.out/data_tidy.csv")

summarize_data.R
----------------

The script first reads the tidy data set:

> data = read.csv("data.out/data_tidy.csv")

It then uses the dplyr package to create a table, group the data by activity and subject and finally summaraze each group by computing a mean of each variable:

> s = tbl_df(data) %>% group_by(activity, subject) %>% summarize_each(funs(mean))

Finally the data is saved:

> write.csv(s,"data.out/data_summary.csv")

Thank you!
