library(dplyr)
#Read in test data
x_test<-read.table("C:/Users/USER/Desktop/R/RProgramming/Getting and cleaning data/project/UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("C:/Users/USER/Desktop/R/RProgramming/Getting and cleaning data/project/UCI HAR Dataset/test/y_test.txt")
sub_test<-read.table("C:/Users/USER/Desktop/R/RProgramming/Getting and cleaning data/project/UCI HAR Dataset/test/subject_test.txt")

#Read in train data
x_train<-read.table("C:/Users/USER/Desktop/R/RProgramming/Getting and cleaning data/project/UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("C:/Users/USER/Desktop/R/RProgramming/Getting and cleaning data/project/UCI HAR Dataset/train/y_train.txt")
sub_train<-read.table("C:/Users/USER/Desktop/R/RProgramming/Getting and cleaning data/project/UCI HAR Dataset/train/subject_train.txt")

#read features
variable_names<-read.table("C:/Users/USER/Desktop/R/RProgramming/Getting and cleaning data/project/UCI HAR Dataset/features.txt")

#read activity labels
actv_labels<-read.table("C:/Users/USER/Desktop/R/RProgramming/Getting and cleaning data/project/UCI HAR Dataset/activity_labels.txt")

#1)Merge both training and test set into one dataset
xtotal<-rbind(x_train,x_test)
ytotal<-rbind(y_train,y_test)
subtotal<-rbind(sub_train,sub_test)

#2)Extracting on;y mean and standard deviation for each measurement
variables<-variable_names[grep("mean\\(\\)|std\\(\\)",variable_names[,2]),]
xtotal<-xtotal[,variables[,1]]

#3)naming activities using descriptive activity
colnames(ytotal)<-"activity"
ytotal$activitylabel<-factor(ytotal$activity,labels=as.character(actv_labels[,2]))
activitylabel<-ytotal[,-1]

#using descriptive variable names to label dataset
colnames(xtotal)<-variable_names[variables[,1],2]

#creating tiny independent data set with average of each variable for each subject and activity
colnames(subtotal)<-'subject'
all<-cbind(xtotal,activitylabel,subtotal)
all_mean<-all %>% group_by(activitylabel,subject) %>% summarize_each(funs(mean))
write.table(all_mean,file='C:/Users/USER/Desktop/R/RProgramming/Getting and cleaning data/project1/tinydata.txt',row.names=FALSE,col.names=TRUE)

