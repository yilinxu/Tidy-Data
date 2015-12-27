library(plyr)
library(dplyr)
#Download Data
file.Url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
file<-basename(file.Url)
download.file(file.Url,file)
#Unzip the file
unzip(file,exdir="./Project")
list.files("Project")
#label the dataset with descriptive variable names in test data
#select column with "std","mean" or "Mean" in test data
#Add activity identity and subject identity with the selected dataset in test data
feature<-read.table("./Project/UCI HAR Dataset/features.txt")
feature<-feature[,2]
X_test<-read.table("./Project/UCI HAR Dataset/test/X_test.txt",col.names=feature)
X_test_select<-select(X_test,contains("std"),contains("mean"),contains("Mean"))
subject_test<-read.table("./Project/UCI HAR Dataset/test/subject_test.txt",col.names="subject identity")
y_test<-read.table("./Project/UCI HAR Dataset/test/y_test.txt",col.names = "activity identity")
testData_select<-data.frame(X_test_select,y_test,subject_test)
#label the dataset with descriptive variable names in train data
#select column with "std","mean" or "Mean" in train data
#Add activity identity and subject identity with the selected dataset in test file
X_train<-read.table("./Project/UCI HAR Dataset/train/X_train.txt",col.names=feature)
X_train_select<-select(X_train,contains("std"),contains("mean"),contains("Mean"))
y_train<-read.table("./Project/UCI HAR Dataset/train/y_train.txt",col.names = "activity identity")
subject_train<-read.table("./Project/UCI HAR Dataset/train/subject_train.txt",col.names="subject identity")
trainData_select<-data.frame(X_train_select,y_train,subject_train)
#conbine test data and train data
Data_select<-rbind(testData_select,trainData_select)
#add descriptive activity content to the combined data
activity_identify<-read.table("./Project/UCI HAR Dataset/activity_labels.txt",col.names=c("activity identity","activity_content"))
tidy_Data<-merge(Data_select,activity_identify,"activity.identity")
#calculate the average of each variable for each activity and each subject
tidy_Data<-group_by(tidy_Data,subject.identity,activity_content)
tidy_Data<-summarize_each(tidy_Data,funs(mean))
tidy_Data<-select(tidy_Data,-activity.identity)
write.table(tidy_Data,file="tidy_Data.txt",row.names=FALSE, col.names=names(tidy_Data),sep=" ")

