Steps taken when running run_analysis.R:


    Merges the training and the test sets to create one data set.
      original data taken from files X_train, X_test, Y_train, Y_test, subject_train and subject_test (.txt)
      merged into variables X,Y and S (in pairs).
      
    Extracts only the measurements on the mean and standard deviation for each measurement. 
      Loads features.txt (features contained in X names), selects those who have mean or std in their name and save them into a variable called: mean_std_feat
      Sets tha names of variable X to those features.
      
    Uses descriptive activity names to name the activities in the data set
      Loads activity_labels.txt (labels of the diffeent activities) and set the names of the Y variable.
      activities: (walking, walkingupstairs, walkingdownstairs, sitting, standing, layingh activity and each subject. 

    Appropriately labels the data set with descriptive activity names. 
      data set labels/data content: tbodyacc-mean-x, tbodyacc-mean-y, tbodyacc-mean-z, tbodyacc-std-x, tbodyacc-std-y, tbodyacc-std-z, tgravityacc-mean-x, tgravityacc-mean-y

    Creates a second, independent tidy data set with the average of each variable for each activity and each subject.       
      First obtain subjects and activities length and stores them in variables: num_activities and num_subjects.
      In the for blocks runs over all activities and all subjects of the data with the former explained activities and subjects (data stored in variable cleaned) creating a new data set with their mean and std taken from cleaned. The new data frame is stored at variable= result.
      finally, the program stores an output txt file called: tidy_data_set.txt.

