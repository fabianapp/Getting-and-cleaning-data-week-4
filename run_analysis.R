## I start reading the files and storing them in single data frames

    y_train<-read.table("y_train.txt")
    x_train<-read.table("X_train.txt")
    subject_train<-read.table("subject_train.txt")
    y_test<-read.table("y_test.txt")
    x_test<-read.table("X_test.txt")
    subject_test<-read.table("subject_test.txt")
    
## 1. Merges the training and the test sets to create one data set.
    
    
    ## I create a data frame about "test" merging by column: subject_test, y_test and x_test 
        table_test<-cbind(subject_test,y_test,x_test)
        
    ## I create a data frame about "train" merging by column: subject_train, y_train and x_train
        table_train<-cbind(subject_train,y_train,x_train)
        
    ## I merge by row the two dataframes above created, and I obtain the desired data frame 
        table_run<-rbind(table_test,table_train)
    
    ## Now I go to assign names to the column of the data frame "table_run"
        features<-read.table("features.txt")
        colnames(table_run)[1:2]<-c("subject","activity")
        colnames(table_run)[3:563]<-as.vector(features[,2])
        
##2. Extracts only the measurements on the mean and standard deviation for each measurement
        
    ## I filter the colums of the data frame witch contains "mean" or "sd"
        column_mean_sd<-table_run[,grepl("mean|sd",colnames(table_run))]
        table_run<-cbind(table_run[,1:2],column_mean_sd)
        
        
##3.Uses descriptive activity names to name the activities in the data set        
        
    ## Now I search the name of the activity related to the activity code
       
        activity_name_vector<-character()
        activity_labels<-read.table("activity_labels.txt")
        len_table_run<-length(table_run[,1])
        
        for (i in 1:len_table_run) {
            position<-grep(table_run[i,2],activity_labels[,1])
            activity_name<-as.character(activity_labels[position,2])
            activity_name_vector<-c(activity_name_vector,activity_name)
        }
        
        table_run<-cbind(table_run,activity_name_vector)
    
##4. Appropriately labels the data set with descriptive variable name
 
    colnames(table_run)<-colnames(table_run)%>% 
        gsub("-"," ",.) %>% 
        gsub("^t","time",.) %>% 
        gsub("^f","freq",.) %>%
        gsub("_"," ",.)
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

    ## I add a new column witch contains the couple subject -activity
    new_data_set<-table_run%>%group_by(subject,activity)%>%summarise_at(.vars = colnames(.)[3:49],mean)
    
    