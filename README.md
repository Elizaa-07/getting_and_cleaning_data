# getting_and_cleaning_data
Assignment Week 4, with Code, Codebook and README

# Getting and Cleaning Data: Course Project

## Overview

This repository contains the R script and supporting files for the "Getting and Cleaning Data" course project. The goal is to demonstrate data cleaning skills by producing a tidy dataset based on the UCI HAR Dataset (Human Activity Recognition Using Smartphones).

---

## Files

- `run_analysis.R`: Main R script that loads, cleans, and transforms the data.
- `CodeBook.md`: Description of the dataset, variables, and all processing steps.
- `tidy_dataset.txt`: Final tidy dataset output.
- `README.md`: This file, explaining the structure and purpose of the project.

---

## How to Run the Script

1. Download and unzip the UCI HAR dataset from:
   [UCI HAR Dataset](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

2. Place the folder `UCI HAR Dataset` (or renamed as `UCI_HAR`) in your working directory.

3. Open R or RStudio and run:

```r
source("run_analysis.R")
