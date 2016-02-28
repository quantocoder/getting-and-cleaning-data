Getting and Cleaning Data Course Project
----------------------------------------

The original zipped archive for this project, 'UCI HAR Dataset.zip', is unzipped and placed in 'data.in' directory. Original code book 'features_info.txt' is included for reference.

The output is created by the scripts described below is saved in 'data.out' directory.

The project contains the following scripts: 'run_analysis.R', 'prepare_data.R' and 'summarize_data.R':

'run_analysis.R' is a top level script that runs 'prepare_data.R' and 'summarize_data.R'.

'prepare_data.R' - to merge, name and tidy the data as per project's instructions. It reads input data, creates the first data set and saves it to 'data.out/data_tidy.csv'

'summarize_data.R' - to group clean data by activity and subject and calculate averages of each variable. The script reads 'data.out/data_tidy.csv' and creates 'data.out/data_summary.csv"

For details of each scrip, please, see CodeBook.md

Please, note in order to run the scripts 'data.in' directory should be present. This directory is not submitted to this repo.

To run type:

> R < prepare_data.R --no-save
>
> R < summarize_data.R --no-save

the output will be in 'data.out'
