Getting and Cleaning Data Course Project CodeBook
=================================================



==================================================================
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
==================================================================



Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.



=================
=================
Feature Selection 
=================
=================



The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

We grouped all the data by subject and activity and determined the mean of all the features.

=================================================
=================================================
Complete list of variables of each feature vector
=================================================
=================================================

```
1 subject
2 activitylabel
3 tBodyAccstdX
4 tBodyAccstdY
5 tBodyAccstdZ
6 tGravityAccstdX
7 tGravityAccstdY
8 tGravityAccstdZ
9 tBodyAccJerkstdX
10 tBodyAccJerkstdY
11 tBodyAccJerkstdZ
12 tBodyGyrostdX
13 tBodyGyrostdY
14 tBodyGyrostdZ
15 tBodyGyroJerkstdX
16 tBodyGyroJerkstdY
17 tBodyGyroJerkstdZ
18 tBodyAccMagstd
19 tGravityAccMagstd
20 tBodyAccJerkMagstd
21 tBodyGyroMagstd
22 tBodyGyroJerkMagstd
23 fBodyAccstdX
24 fBodyAccstdY
25 fBodyAccstdZ
26 fBodyAccJerkstdX
27 fBodyAccJerkstdY
28 fBodyAccJerkstdZ
29 fBodyGyrostdX
30 fBodyGyrostdY
31 fBodyGyrostdZ
32 fBodyAccMagstd
33 fBodyBodyAccJerkMagstd
34 fBodyBodyGyroMagstd
35 fBodyBodyGyroJerkMagstd
36 tBodyAccmeanX
37 tBodyAccmeanY
38 tBodyAccmeanZ
39 tGravityAccmeanX
40 tGravityAccmeanY
41 tGravityAccmeanZ
42 tBodyAccJerkmeanX
43 tBodyAccJerkmeanY
44 tBodyAccJerkmeanZ
45 tBodyGyromeanX
46 tBodyGyromeanY
47 tBodyGyromeanZ
48 tBodyGyroJerkmeanX
49 tBodyGyroJerkmeanY
50 tBodyGyroJerkmeanZ
51 tBodyAccMagmean
52 tGravityAccMagmean
53 tBodyAccJerkMagmean
54 tBodyGyroMagmean
55 tBodyGyroJerkMagmean
56 fBodyAccmeanX
57 fBodyAccmeanY
58 fBodyAccmeanZ
59 fBodyAccmeanFreqX
60 fBodyAccmeanFreqY
61 fBodyAccmeanFreqZ
62 fBodyAccJerkmeanX
63 fBodyAccJerkmeanY
64 fBodyAccJerkmeanZ
65 fBodyAccJerkmeanFreqX
66 fBodyAccJerkmeanFreqY
67 fBodyAccJerkmeanFreqZ
68 fBodyGyromeanX
69 fBodyGyromeanY
70 fBodyGyromeanZ
71 fBodyGyromeanFreqX
72 fBodyGyromeanFreqY
73 fBodyGyromeanFreqZ
74 fBodyAccMagmean
75 fBodyAccMagmeanFreq
76 fBodyBodyAccJerkMagmean
77 fBodyBodyAccJerkMagmeanFreq
78 fBodyBodyGyroMagmean
79 fBodyBodyGyroMagmeanFreq
80 fBodyBodyGyroJerkMagmean
81 fBodyBodyGyroJerkMagmeanFreq
82 angletBodyAccMeangravity
83 angletBodyAccJerkMeangravityMean
84 angletBodyGyroMeangravityMean
85 angletBodyGyroJerkMeangravityMean
86 angleXgravityMean
87 angleYgravityMean
88 angleZgravityMean
```
