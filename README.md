# Mystic Manuscripts Data Cleaning
 <b>The situation</b>

You've been assigned to a crucial project for one of our esteemed clients, "Mystic Manuscripts". They have entrusted you with a significant dataset, crucial for their upcoming analysis. Your mission is to ensure the integrity and quality of this data before it's used for any further analysis.

<b>The project</b>

First I created a table with columns and column names in the same format as the Excel file provided (see dynamo_table_create.sql). Then I uploaded the data into the SQL database.

Quality checks were performed including row counts, column counts, count of nulls, min, max, and sum per column, special character check, etc. (see dynamo_qc_check.sql). The details can be found in the Quality Control Form.