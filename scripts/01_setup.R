# Project: R Data Quality and Exploratory Analysis 
# Author: Akash Bhardwaj 
# Purpose: Check that RStudio is working and establish project folders 
 
# Display R version 
version 
 
# Show current project working directory 
getwd() 
 
# List files in the project folder 
list.files() 
 
# Define key project paths 
raw_data_path <- "data_raw" 
processed_data_path <- "data_processed" 
figures_path <- "outputs/figures" 
tables_path <- "outputs/tables" 
reports_path <- "reports" 
 
# Confirm that required folders exist 
required_folders <- c( 
 raw_data_path, 
 processed_data_path, 
 figures_path, 
 tables_path, 
 reports_path 
) 
 
folder_check <- data.frame( 
 folder = required_folders, 
 exists = dir.exists(required_folders) 
) 
 
print(folder_check) 
