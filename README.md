Step by step description of the purpose and the output for each step of the run_analysis.R source code
1. Set the URL"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
2. The file name is file
3. Download file using the URL above with the name file
4. Unzip file, data saved under Project
5. Read feature.txt file and pass the variable names to variable "feature"
6. Read X_test file, pass the variable name to that file, as "X_test"
7. Select columns including "mean" "Mean" and "std", as "X_test_select"
8. Read subject_test and y_test file, add subject ID and activity ID to the X_test selected file, as "testData_select"
9. Perform the same transformation to X_Train file, final output passed to "trainData_select"
10. Combine " testData_select  and " trainData selected", passed to Data_select
11. Add "activity_content" to "Data_select"  using merge function, passed to tidy_Data
12. Group "tidy_Data" by "subject.identity" and "activity_content"
13. add new coloum with the mean of each variable for each group in "tidy_Data", passed the output to tidy_Data
14. Delete the "activity.identity" column
15. Save the output as the "tidy_Data.txt"

