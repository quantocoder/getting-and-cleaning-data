
library(dplyr)

#1 Merges the training and the test sets to create one data set.

test_features = read.table("UCI HAR Dataset/test/X_test.txt")
train_features = read.table("UCI HAR Dataset/train/X_train.txt")
all_features = rbind(test_features,train_features)

#2 Extracts only the measurements on the mean and standard deviation for each measurement. 

feature_names = read.table("UCI HAR Dataset/features.txt")
some_names = grep(pattern="std\\(\\)|mean\\(\\)",x=feature_names$V2)
names(all_features) = feature_names$V2
some_features = all_features[,some_names]

#3 Uses descriptive activity names to name the activities in the data set

test_activities  = read.table("UCI HAR Dataset/test/y_test.txt")
train_activities = read.table("UCI HAR Dataset/train/y_train.txt")
actitivy_labels = read.table("UCI HAR Dataset/activity_labels.txt")
some_features$activity = factor(x=c(test_activities$V1,train_activities$V1),labels=actitivy_labels$V2)

test_subjects = read.table("UCI HAR Dataset/test/subject_test.txt")
train_subjects = read.table("UCI HAR Dataset/train/subject_train.txt")
some_features$subject = c(test_subjects$V1,train_subjects$V1)

#4 Appropriately labels the data set with descriptive variable names. 
# Please see lines 14,22,26. here are the names:


#5 creates a second, independent tidy data set with the average of each variable 
#  for each activity and each subject.

s = tbl_df(some_features) %>% group_by(activity, subject) %>% summarize_each(funs(mean))

write.table(s,"tidy.dat",row.name=FALSE)
