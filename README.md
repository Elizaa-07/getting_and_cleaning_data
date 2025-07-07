
# Getting and Cleaning Data - Course Project

## Overview

This repository contains the R script `run_analysis.R` that:

- Downloads and unzips the UCI HAR Dataset
- Merges training and test datasets
- Extracts only measurements on the mean and standard deviation
- Applies descriptive activity names and variable labels
- Creates a tidy dataset with the average of each variable per subject and activity

## Files

- `run_analysis.R`: Main script that performs the entire analysis.
- `tidy_dataset.txt`: Output of the script – a tidy dataset.
- `CodeBook.md`: Description of variables and transformations (see CodeBook).

## How to Run

1. Make sure you have R and the `dplyr` and `tidyr` packages installed.
2. Place `run_analysis.R` in your working directory.
3. Run the script. It will:
   - Download and unzip the dataset (if needed)
   - Generate `tidy_dataset.txt` in the same directory

```r
source("run_analysis.R")
