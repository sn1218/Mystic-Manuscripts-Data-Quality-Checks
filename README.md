# Mystic Manuscripts Data Cleaning
## Overview

In this project, the provided dataset from Mystic Manuscripts was first structured and uploaded into a SQL database. A table was created with columns matching the format of the original Excel file. Once the data was loaded, thorough quality checks were conducted to ensure the integrity of the dataset.

These checks included verifying row and column counts, detecting null values, and assessing special characters and outliers. Issues were identified and documented in a Quality Control Form. The dataset was cleaned, ensuring it was accurate and reliable for further analysis by the client.

## The Project
### Key Files in the Repository

* dynamo_table_create.sql: SQL script for table creation
* dynamo_qc_check.sql: performed quality checks including row counts, column counts, count of nulls, min, max, and sum per column, special character check, etc.
* Project Dynamo Quality Control Form.pdf: details the quality checks
