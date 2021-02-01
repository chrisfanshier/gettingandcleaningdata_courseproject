library(dplyr)
##read in the files
read.table("activity_labels.txt") -> activity_labels
read.table("features.txt") -> features

read.table("./train/subject_train.txt") -> subject_train
read.table("./train/X_train.txt") -> X_train
read.table("./train/y_train.txt") -> y_train

read.table("./test/subject_test.txt") -> subject_test
read.table("./test/X_test.txt") -> X_test
read.table("./test/y_test.txt") -> y_test

## create variable names from table of feature names
colnames(features) <- c("V1", "feature")
colnames(X_test) <- features$feature
colnames(X_train) <- features$feature

##create "subject" variable and combine with data
cbind(subject_test, X_test) -> test
cbind(subject_train, X_train) -> train
colnames(train)[1] <- "subject"
colnames(test)[1] <- "subject"

##combine activity data with main data
merge(y_train, activity_labels) -> train_activity
merge(y_test, activity_labels) -> test_activity

rename(test_activity, activity = V2) -> test_activity
rename(train_activity, activity = V2) -> train_activity

##combine to one dataset
cbind(test_activity, test) -> test
cbind(train_activity, train) -> train
rbind(test, train) -> bigdat

##select only columns with std or mean
grep("std", colnames(bigdat)) -> std_cols
grep("mean", colnames(bigdat)) -> mean_cols
c(mean_cols, std_cols) -> ext_col
bigdat[,c("subject", "activity")] -> new_cols
bigdat[,ext_col] -> ext_cols
cbind(new_cols, ext_cols) -> df_final

##create table of averages grouped by activity and subject
df_final %>% group_by(activity, subject) %>% summarise_all(mean) -> avgs
arrange(avgs, subject) -> avgs
write.table(avgs, file = "averages.txt", row.names = FALSE)


