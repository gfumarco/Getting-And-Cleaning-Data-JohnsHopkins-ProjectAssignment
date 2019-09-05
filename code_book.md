# Course Project Code Book


Source of raw data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

Original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  


## Code description

The attached R script (run_analysis.R) performs the following to clean up the data:  

* **STEP 1**: Merges the training and test sets to create one data set, namely:  
  
  1. "train/X_train.txt"" with "test/X_test.txt": the result is a 10299x561 data frame, as in the original description (10299 Instances and 561 Number of Attributes).
  2. "train/y_train.txt"" with "test/y_test.txt"", the result is a 10299x1 data frame with activity IDs.
  3. "train/subject_train.txt"" with "test/subject_test.txt"", the result is a 10299x1 data frame with subject IDs. 
    
    
* **STEP 2**: Reads features.txt and extracts **only** the measurements on the mean and standard deviation for each measurement.  
The result is a 10299x66 data frame: only 66 out of 561 attributes are measurements on the mean and standard deviation.  
All measurements seem floating point numbers between -1 and 1.  

* **STEP 3**: Reads activity_labels.txt and applies descriptive activity names to name the activities in the dataset:  

        walking  
        
        walkingupstairs  
        
        walkingdownstairs  
        
        sitting  
        
        standing  
        
        laying  

* **STEP 4**: The dataset is labeled with descriptive names: all features/attributes and activity names are converted to lower case, underscores _ and brackets () are removed.  
  The 10299x66 dataframe containing features is merged with the 10299x1 data frames containing activity labels and subject IDs.  
  The result is saved as **tidy_dataset.txt**, a 10299x68 data frame with the first column containing subject IDs, the second column activity names, and the last 66 columns measurements.  
  Subject IDs are integers between 1 and 30 inclusive.  
  The names of the attributes are the following:  

        tbodyacc-mean-x   
        
        tbodyacc-mean-y   
        
        tbodyacc-mean-z   
        
        tbodyacc-std-x  
        
        tbodyacc-std-y  
        
        tbodyacc-std-z  
        
        tgravityacc-mean-x  
        
        tgravityacc-mean-y  

* **STEP 5**: A second independent tidy dataset is created, containing the average of each measurement for each activity and each subject.  
The result is saved as **avg_tidy_dataset.txt**, with dimension 180x68 data frame.  
There are 30 subjects and 6 activities, for a total of 180 rows.  
The 1st column contains subject IDs, the 2nd column contains activity names.  
The columns from 3 to 68 contain then the averages for each of the 66 attributes. 