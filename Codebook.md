run_analysis script:-
1)It combines the train set and test set into a single set
2)It Extracts only the measurements of mean and standard deviation for each measurement 
3)Creates a new tinydata set with average of each variable for each activity and each subject

VARIABLES USED:
a)x_train,x_test,y_train,y_test,subject_train,subject_test contains data from the given data set.
b)xtotal,ytotal and subtotal contains the merged datasets
c)variable_names contains the features of xtotal dataset
d)actv_labels has the activitylabels for y dataset
