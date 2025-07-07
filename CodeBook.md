# CodeBook

## Overview

This CodeBook describes the variables, transformations, and processes performed to clean and tidy the Human Activity Recognition Using Smartphones Dataset (UCI HAR Dataset).

---

## Variables

The tidy dataset includes the following variables:

- **subject**: Identifier of the participant (integer from 1 to 30).
- **activity_code**: Numeric code representing the type of activity performed.
- **activity**: Descriptive label for the activity (e.g., WALKING, SITTING).
- **All other variables**: Represent sensor signal summaries of accelerometer and gyroscope readings, specifically:

### Example variable names and explanations:

| Variable Name                              | Meaning                                                                      |
| ------------------------------------------ | ---------------------------------------------------------------------------- |
| `TimeBodyAccelerometer.mean...X`           | Mean of body acceleration along X-axis in time domain                        |
| `FrequencyBodyGyroscopeJerk.std...Z`       | Standard deviation of gyroscope jerk signal along Z-axis in frequency domain |
| `TimeGravityAccelerometerMagnitude.mean..` | Mean magnitude of gravitational acceleration vector in time domain           |
| `FrequencyBodyAccelerometer.meanFreq...Y`  | Weighted average frequency of body acceleration on Y-axis                    |


### Explanation

| Component            | Meaning                                                                |
| -------------------- | ---------------------------------------------------------------------- |
| `Time` / `Frequency` | Domain of the signal: time domain or frequency domain (after FFT)      |
| `Body` / `Gravity`   | Type of acceleration: body motion or gravitational force               |
| `Accelerometer`      | Data from the accelerometer sensor                                     |
| `Gyroscope`          | Data from the gyroscope sensor                                         |
| `Jerk`               | The rate of change (derivative) of acceleration or angular velocity    |
| `Magnitude`          | The Euclidean norm (vector magnitude) of the 3D signal components      |
| `.mean..`, `.std..`  | The statistical function: mean (average) or standard deviation         |
| `X`, `Y`, `Z`        | The axis along which the measurement was taken (if applicable)         |
| `meanFreq`           | Weighted average of the frequency components (only for frequency data) |

#### Variables grouped by Signal Type:

- **Accelerometer signals**:
  - `TimeBodyAccelerometer.*`
  - `FrequencyBodyAccelerometer.*`

- **Gyroscope signals**:
  - `TimeBodyGyroscope.*`
  - `FrequencyBodyGyroscope.*`

- **Jerk signals**:
  - `TimeBodyAccelerometerJerk.*`
  - `FrequencyBodyAccelerometerJerk.*`
  - `TimeBodyGyroscopeJerk.*`
  - `FrequencyBodyGyroscopeJerk.*`

- **Magnitude signals**:
  - `TimeBodyAccelerometerMagnitude.*`
  - `FrequencyBodyAccelerometerMagnitude.*`
  - etc.

## Cleaning and Transformation Steps

1. **Data loading**: Training and test datasets were read into R using `read.table()`.
2. **Variable naming**: Column names of sensor data (`X_train`, `X_test`) were assigned based on `features.txt`.
3. **Merging datasets**: Training and test sets for subjects, activities, and sensor measurements were combined using `rbind()` and `cbind()`.
4. **Selecting features**: Only features related to mean and standard deviation were selected using `grep("mean|std", ...)`.
5. **Adding descriptive activity labels**: `activity_code` was joined with `activity_labels.txt` to include readable activity names.
6. **Creating tidy dataset**: The data was grouped by subject and activity, and the average for each measurement was calculated.
7. **Export**: The final tidy dataset was saved as `tidy_dataset.txt`.

---

## Summary

The final tidy dataset contains one row per subject-activity combination and one column for each variable that captures the average of a mean or standard deviation feature.
