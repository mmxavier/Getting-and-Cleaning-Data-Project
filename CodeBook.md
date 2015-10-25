# Solution Steps Description

* At first, all data are read and stored in variables
* Then the training and the test sets acquired data are mergedto create one data set.
* After the merging, only the measurements on the mean and standard deviation are extracted, with correct names from `features.txt`.
* In the 3th step of project, descriptive activity names from `activity_labels.txt` are used to name the activities in the data set
* Finally, the file `averages_data.txt` is gererated as a new dataset with all the average measures for each subject and activity type.

# Variables used in project

* `xtrain`, `ytrain`, `xtest`, `ytest`, `subtrain`, `subtest`, `features`: RAW data.
* `features`, `activities`: contains correct names for RAW data
* `xdata`, `ydata`, `subject_data`: merged data.
* `all_data`: merged data after analysys
* `averages_data` averages data for output