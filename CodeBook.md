** Code book for Coursera Getting and Cleaning Data course project
======================================================

The result data set of the discussed script is exported by the script into the file `avg_tidy_data.txt` (found in this repository or on the relevant folder which supplies the original data to the discussed script, after running the script of course).

See the `README.md` file of this repository for background information and explanation on this data set.

The structure of the data set is described in the [Data](#data) section, its variables are listed in the [Variables](#variables) section.
The logic steps that were taken to obtain the data set based on the source data are presented in the `README.md` file.

## Data <a name="data"></a>

The `avg_tidy_data.txt` data file is a text file, containing space-separated values.

The first row contains the names of the variables, which are listed and described in the [Variables](#variables) section, and the following rows contain the values of these variables. 

## Variables <a name="variables"></a>

Each row contains, for a given subject and activity, 79 averaged signal measurements.

### Identifiers <a name="identifiers"></a>

- `subject`

	Subject identifier, integer, ranges from 1 to 30.

- `activity`

	Activity identifier, string with 6 possible values: 
	- `WALKING`: subject was walking
	- `WALKING_UPSTAIRS`: subject was walking upstairs
	- `WALKING_DOWNSTAIRS`: subject was walking downstairs
	- `SITTING`: subject was sitting
	- `STANDING`: subject was standing
	- `LAYING`: subject was laying

### Average of measurements <a name="average-measurements"></a>

All measurements are floating-point values, normalised and bounded within [-1,1].
All of the measurements were taken from the original data sets provided and chosen to the final data set, as those represented mean or standard diviation calculation measurement.

### About the script code variables:
==================================
* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the data from the downloaded files.
* `data`, `data_act` and `subjects` merge the previous datasets to further analysis.
* `features` contains the correct names for the `data` dataset, which are applied to the column names stored in
* `selected_features_index` and `selected_features` are temporary variables which assist to retrieve only the mean and std measurements from the `data` dataset
* `selected_data` contains the `data` dataset, filtered on the mean and std measurements only and attached with `data_act` and `subjects` merged datasets
* `avg_tidy_data` contains the final average tidy data which is also the script result to be exported
