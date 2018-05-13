# Getting-and-cleaning-data-week-4
Create a tidy data set

In the "run_analysis.R" there is the code to create the tidy data set "my_analysis.txt" (whose variables descripions are in the file "Code book.md"), starting from the assigned data:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

First of all I've downloaded the data linked to from the course website that represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

Then with the script "run_analysis.R" i made the following steps:

First of all I've downloaded the data linked to from the course website that represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

I stored the data sets in local data frames and looking to their dimensions I've merged them in order to create a single data set.

I've selectet only measurements about "mean" and "standard deviation" and added the activity name carrosponding to the activity ID and I've renamed variables in a more descriptive way in order to make the data set more understandable.

Finally I've created a tidy data set "my_analysis.txt", containing the average of each variable for each activity and each subject.
