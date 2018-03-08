README : `run_analysis.R`
-------------------------

This script is designed to extract and summarize select data features
contained in the processed smartphone data from the Human Activity
Recognition Using Smartphones Dataset Version 1.0\[1\].

BACKGROUND: The dataset (see link below) contains both raw sensor data
as well as processed data features from the smartphone dataset. The
processed dataset contains 561 data features obtained from 30 subjects
while performing 6 separate activities with a range for 36-95
measurements per subject per activity. The complete processed dataset
contains a total of 10, 299 observations of the 561 data features plus
identifiers for subject and activity. This script will extract only a
subset of the 561 features, as described below.

The smartphone data cannot be readily analyzed in the form provided.
Processed data is provided in distinct text files which must be merged
prior to analysis.

Files:

1.  `X_train.txt and X_test.txt` : processed data features for the
    training and test data sets
2.  `y_train.txt, y.test.txt` : identifiers for activities associated
    with the data features
3.  `subject_train.txt, subject_test.txt` : identifiers for subjects
    associated with the respective train/test dataset  
4.  `features.txt` descriptive names for each of the data features

PURPOSE OF SCRIPT: This script will merge the files listed above into a
readily analyzed tidy dataset. The script will create:

1.  A single tidy data set containing data features that represent mean
    or standard deviations (mean frequency is not included) for each
    observation contained in the test and training data files.
2.  Summary data table wherein all extracted data features are averaged
    to produce a single mean value for each subject and activity.

HOW TO USE:

1.  Download the file:
    <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>
2.  Unzip the contents and without modification to the filenames or
    directory structure.  
3.  Execute the code in "run\_analysis.R" with the working directory set
    to "UCI HAR Dataset" found in the unzipped data file. The code is
    compatible with R version x.x.x or dply package v X.x.x installed
    and may not run correctly on older or newer versions.

The script will write two following files to the working directory:

1.  Filename = tidy-summary-by-grp-activity.txt This file is a
    space-delimited .txt file containing column header information
    Dimensions: 180 rows - 30 subjects x 6 activities x 1 averaged value
    68 columns -subject, activity, + 66 data features Contents: Group
    and subjects averaged observations from test / train data sets for
    the extracted data features.

2.  Filename = tidy-extracted-data-all-observations.txt This file is a
    space-delimited .txt file containing column header information
    Dimensions: 10,299 rows - 30 subjects x 6 activities x 36-95
    observations 68 columns - subject, activity, + 66 data features
    Contents: This file contains all observations from test / train data
    sets for the extracted data features.

The Files can be read back into R with the following code:

read.table("filename", header = TRUE, check.names = FALSE)

See the Codebook for descriptions of the data fields included in
extracted dataset.

DATA LICENSE: Use of this dataset in publications must be acknowledged
by referencing the following publication \[1\]

\[1\] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and
Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a
Multiclass Hardware-Friendly Support Vector Machine. International
Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz,
Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or
explicit can be addressed to the authors or their institutions for its
use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita.
November 2012. \`
