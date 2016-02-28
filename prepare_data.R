#1 Merges the training and the test sets to create one data set.

test_features = read.table("data.in/test/X_test.txt")
train_features = read.table("data.in/train/X_train.txt")
all_features = rbind(test_features,train_features)

#2 Extracts only the measurements on the mean and standard deviation for each measurement. 

feature_names = read.table("data.in/features.txt")
some_names = grep(pattern="std\\(\\)|mean\\(\\)",x=feature_names$V2)
doctored_names = feature_names$V2
names(all_features) = doctored_names
some_features = all_features[,some_names]

#3 Uses descriptive activity names to name the activities in the data set

test_activities  = read.table("data.in/test/y_test.txt")
train_activities = read.table("data.in/train/y_train.txt")
actitivy_labels = read.table("data.in/activity_labels.txt")
some_features$activity = factor(x=c(test_activities$V1,train_activities$V1),labels=actitivy_labels$V2)

test_subjects = read.table("data.in/test/subject_test.txt")
train_subjects = read.table("data.in/train/subject_train.txt")
some_features$subject = c(test_subjects$V1,train_subjects$V1)

#4 Appropriately labels the data set with descriptive variable names. 
# Please see lines 12,20,24. here are the names:

names(some_features) 

# Now save the data 
write.csv(some_features,"data.out/data_tidy.csv")
