# CodeBook.md

## Data Description

The dataset includes measurements from the accelerometers of the Samsung Galaxy S smartphone. The data has been processed to create a tidy dataset with the average of each variable for each activity and each subject.

## Variables

- **subject**: ID of the test subject.
- **activity**: Type of activity performed (e.g., WALKING, SITTING).
- **[variable names]**: Mean and standard deviation measurements of the accelerometer signals.

## Transformations

1. **Merged Data**: Combined training and test datasets.
2. **Extracted Features**: Selected only mean and standard deviation measurements.
3. **Descriptive Names**: Replaced activity codes with descriptive activity names.
4. **Averaged Data**: Calculated the mean of each variable for each subject and activity.

