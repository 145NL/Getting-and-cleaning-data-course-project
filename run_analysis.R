features <- read.table("features.txt")
> activities <- read.table("activity_labels.txt")
> train_x <- read.table("train/X_train.txt")
> test_x  <- read.table("test/X_test.txt")
> all_x   <- rbind(train_x, test_x)
> train_y <- read.table("train/y_train.txt")
> test_y  <- read.table("test/y_test.txt")
> all_y   <- rbind(train_y, test_y)
> train_subj <- read.table("train/subject_train.txt")
> test_subj  <- read.table("test/subject_test.txt")
> all_subj   <- rbind(train_subj, test_subj)
> colnames(all_x) <- features[, 2]
> colnames(all_subj) <- "subject"
> colnames(all_y) <- "activity"
> target_columns <- grep("-(mean|std)\\(\\)", features[, 2])
> all_x <- all_x[, target_columns]
> final_data <- cbind(all_subj, all_y, all_x)
> head(final_data[,1:5])
subject activity tBodyAcc-mean()-X
1       1        5         0.2885845
2       1        5         0.2784188
3       1        5         0.2796531
4       1        5         0.2791739
5       1        5         0.2766288
6       1        5         0.2771988
tBodyAcc-mean()-Y tBodyAcc-mean()-Z
1       -0.02029417        -0.1329051
2       -0.01641057        -0.1235202
3       -0.01946716        -0.1134617
4       -0.02620065        -0.1232826
5       -0.01656965        -0.1153619
6       -0.01009785        -0.1051373
> final_data$activity <- activities[final_data$activity, 2]
> current_names <- names(final_data)
> current_names <- gsub("^t", "Time", current_names)
> current_names <- gsub("^f", "Frequency", current_names)
> current_names <- gsub("Acc", "Accelerometer", current_names)
> current_names <- gsub("Gyro", "Gyroscope", current_names)
> current_names <- gsub("Mag", "Magnitude", current_names)
> current_names <- gsub("BodyBody", "Body", current_names)
> names(final_data) <- current_names
> tidy_data <- final_data %>%
  +     group_by(subject, activity) %>%
  +     summarise_all(list(mean = mean))
Error in final_data %>% group_by(subject, activity) %>% summarise_all(list(mean = mean)) : 
  could not find function "%>%"

> head(tidy_data)
Error: object 'tidy_data' not found

> library(dplyr)

Attaching package: ‘dplyr’

The following objects are masked from ‘package:stats’:
  
  filter, lag

The following objects are masked from ‘package:base’:
  
  intersect, setdiff, setequal, union
> tidy_data <- final_data %>%
  +     group_by(subject, activity) %>%
  +     summarise_all(list(mean = mean))
> dim(tidy_data)
[1] 180  68
> write.table(tidy_data, "tidy_data.txt", row.name = FALSE)