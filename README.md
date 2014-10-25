GettingAndCleaningData_Project
==============================

This repository was created for the course project in Coursera "Getting and Cleaning Data" course.

## Requirements
> * The data is provided in a [ZIP][1] file.
> * R version 3.1.1 (2014-07-10) -- "Sock it to Me".
> * Platform: i386-w64-mingw32/i386 (32-bit).

The data should be unzipped directly in the same working directory with the R script. After that, there should be a UCI HAR Dataset folder in the current working directory, containing all needed data.

## CodeBook
The CodeBook  describes:
> * the information of origin dataset.
> * the work and transformations how the provided raw data have been processed to get a final tidy data.

## R code
The run_analysis.R script contains the R code necessary to:
> * load the raw data set.
> * process the data.
> * export the final tidy data set.


This code is fully commented and strictly follows the description of the data processing in the CodeBook. It can be executed (given that the requirements above are fulfilled) to reproduce the creation of a tidy data set for further use.

