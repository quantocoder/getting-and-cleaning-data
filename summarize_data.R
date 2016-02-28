library(dplyr)

data = read.csv("data.out/data_tidy.csv")

#5 creates a second, independent tidy data set with the average of each variable 
#  for each activity and each subject.

s = tbl_df(data) %>% group_by(activity, subject) %>% summarize_each(funs(mean))
    
write.csv(s,"data.out/data_summary.csv")

