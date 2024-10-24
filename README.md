# Mystic Manuscripts Data Cleaning
## Overview

This project focuses on cleaning and validating a dataset provided by Mystic Manuscripts. The dataset was initially in Excel format, and the first step was to structure it for analysis by uploading it into a PostgreSQL database. After successfully importing the data, a SQL table was created with columns that mirrored the original structure of the Excel file.

Once the data was loaded into the database, extensive data quality checks were performed to ensure the dataset was ready for further analysis. These checks included verifying row and column counts, identifying missing values, handling special characters, and detecting outliers. Each issue was documented in a Quality Control Form, and the dataset was cleaned accordingly. This process ensured that the data provided to the client was both accurate and reliable for future analysis tasks.

## Objectives
The primary objectives of this project were:

* To structure and upload the dataset into a PostgreSQL database.
* To conduct thorough data quality checks to assess the integrity of the data.
* To clean the dataset, addressing issues such as missing values, special characters, and outliers.
* To document the entire process in a Quality Control Form to provide transparency and traceability of the data cleaning process.

## Project Details
### Data Quality Checks
After the dataset was imported into the PostgreSQL database, a series of quality checks were carried out using SQL queries. These checks included:

* Row and Column Counts: Ensuring that the number of rows and columns in the PostgreSQL table matched the original Excel file.
* Null Value Detection: Identifying missing values across all columns.
* Special Character Detection: Assessing the dataset for any special characters that might disrupt analysis or reporting.
* Outlier Detection: Checking for extreme values or anomalies in numerical fields.
* Summary Statistics: Generating basic statistics such as the minimum, maximum, and sum for each column to identify any irregularities.

Each identified issue was documented in a Quality Control Form and then addressed during the cleaning process. The cleaned dataset was verified again to ensure that all data integrity issues had been resolved.

## Repository Structure

* Book Sales Records - V2.xlsx: The primary dataset used in this project.
* dynamo_table_create.sql: SQL script for table creation
* dynamo_qc_check.sql: SQL script used to perform quality checks including row counts, column counts, count of nulls, min, max, and sum per column, special character check, etc.
* Project Dynamo Quality Control Form.pdf: This document provides a detailed report of the data quality checks, including descriptions of the issues found and the steps taken to address them during the data cleaning process.

## How to Use the Project
1. Clone the repository to your local environment.
2. Open dynamo_table_create.sql to see how the table structure was created and adjust it if necessary for other datasets.
3. Execute dynamo_qc_check.sql in PostgreSQL to perform similar data quality checks on any dataset you wish to clean.
4. Review the Project Dynamo Quality Control Form.pdf for detailed information on the quality control process, the issues identified, and the cleaning steps taken.
