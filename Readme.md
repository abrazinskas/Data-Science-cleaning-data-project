# Data Science cleaning data project
This repo contains a set of files that perform a cleaning of Samsung Galaxy S collected data, the detailed process description is provided in the work flow section. The output is a tidy data that contains an average of variables for each subject and activity. The project was performed for the coursera course **[Getting and Cleaning Data provided by John's Hopkins University](https://www.coursera.org/course/getdata)**. The data used for the project can be obtained [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 

## Installation instructions
Clone the repository, specify the current working directory, and execute run_analysis.R. Please note that the folder has to contain initial datasets. The datasets and their descriptions are located in the folder 'datasets'.

## The work flow
The **run_analysis.R** file contains some comments about steps with corresponding numbers, those steps are described in details below. The order of steps in the description of the project was assumed to be optional and has been slightly modified to make a flow of the program easier to understand, as well as to simplify the implementation. In addition, the steps have a general description, for more technical information please refer to the source code.   

1. The training and test datasets are merged together in combination with records of subjects and activities. 
2. The labels for columns(features) are extracted from the text file located in the datasets folder. In addition, the last column names: 'subject', 'activities' are added. To avoid problems and confusion, duplicate column names were prefixed with a number of occurances. For example, if a dataframe contains 1 duplicate of the column 'column_measure', then the first one will be renamed to: 'column_measure_1', while the second one to: 'column_measure_2'.  
3. Selection of columns only containing means and standard devisions is performed. Those columns are stored for a later use. Other columns are removed, except the subject and activities. The following operation is perform with RegEx matcher. 
4. Activity ID's in the column 'activities' are converted into activity names, such as 'Walking', 'Sitting', etc.
5. The tidy data is created with averages of variables for subject and activities. For this purpose the library dplyr described in the swirl programming assignment has been used. 
6. The file containg a tidy data 'tidy.txt' is stored in a current directory including a column names.






