library(dplyr)

data = read.table("data.out/data_tidy.csv", header=TRUE)

#5 creates a second, independent tidy data set with the average of each variable 
#  for each activity and each subject.

s = tbl_df(data) %>% group_by(activity, subject) %>% summarize_each(funs(mean))
    
write.table(s,"data.out/data_summary.csv",row.name=FALSE)

