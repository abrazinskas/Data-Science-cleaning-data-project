# 1. Merges the training and the test sets to create one data set.
  #- training set
  train<-read.table('datasets/train/X_train.txt')
  train<-cbind(train,read.table('datasets/train/subject_train.txt'))
  train<-cbind(train,read.table('datasets/train/y_train.txt'))
  
  #- test set
  test<-read.table('datasets/test/X_test.txt')
  test<-cbind(test,read.table('datasets/test/subject_test.txt'))
  test<-cbind(test,read.table('datasets/test/y_test.txt'))
  
  #- merging all together
  data<-data.frame(rbind(train,test))

# 2. Appropriately labels the data set with descriptive variable names.   
  #- getting feature names and converting into a vector format
  names<-as.vector(t(read.table('datasets/features.txt')[2]))
  names<-c(names,'subject','activity')
  
  #- fixing duplicates
  duplicates<-unique(names[duplicated(names)])
  for(i in 1:length(duplicates)){
    #- iterating over duplicates to give them proper postfix indexes
    for(j in 1:sum(names==duplicates[i])){
      index= which(names==duplicates[i])[1] # grabbing a first index of an element that is a duplicate
      names[index]<-paste(duplicates[i],j,sep ='_') # assigning a new name to the duplicate
    }
  }
  #- assigning names to the dataframe
  names(data)<-names  
  
# 3. Extracts only the measurements on the mean and standard deviation for each measurement. 
  data<-data[,grepl('.*\\-(mean|std)\\(\\).*',names(data[1:561]))]

# 4. Uses descriptive activity names to name the activities in the data set
  activities<-read.table('datasets/activity_labels.txt')
  data<-merge(data,activities,by.x = 563,by.y=1)[-1]
  

    
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  library(dplyr)
  tidy<-data %>%
        group_by(subject,activity) %>%
        summarise_each(funs(mean))
  
# 6. Writing to a file
  write.table(tidy,'tidy.txt',row.name=FALSE)
  
  