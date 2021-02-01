Data are taken from wearables data examining accelerometer and gyroscope data for different subjects performing different activities.

Variables referenced in file:

activity_labels: numerical codes for 6 activities
features: fields of data provided. This vector will be come column names for main data files
subject_train: Provides vector of which subject referenced for each observation (row name) for training data
subject_test: Same as above but for test data
X_train: numerical observed data and calculated fields for accelerometers and gyroscopes
X_test: same but for test data
y_train: vector of data providing activity code for each observation
y_test: same but for test data

test & train: Code file merges activity vector with numerical data and joins with activity labels to create character vector of activities for each row of test and training data.
bigdat: combined test and train data
df_final: final dataframe after selecting only columns that contain std and means
averages: dataframe summarizing df_final by showing means for subject/activity

