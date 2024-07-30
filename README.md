# Crowdfunding_ETL Data Analysis 
___

### Summary of Work Done

The data integration and analysis process involves multiple steps to manage and analyze Crowdfunding data, including Extract, Transform, and Load (ETL).

The extracted and transformed data has been processed to ensure compatibility with the existing database schema. The appropriate tables are populated with comprehensive details such as contact information, company name, description, financial goals, pledged amounts, outcomes, backer counts, country, currency, launch date, end date, category ID, and subcategory ID.

A critical aspect of the work involves addressing foreign key constraints to maintain data integrity between the campaign table and related tables, specifically the contacts table. This includes verifying that all contact_id values in the campaign data exist in the contacts_pandas_option table. Any discrepancies are resolved by inserting missing contact records into the contacts_pandas_option table.

SQL and Python have been utilized for this data integration process, with the pandas library playing a key role in streamlining data manipulation and insertion tasks. Automation is employed to identify and insert missing contacts into the database, ensuring the campaign data can be successfully imported into the campaign table while maintaining all foreign key constraints.

This meticulous approach guarantees a consistent and accurate database, supporting reliable data analysis and reporting. Each step ensures that the database remains robust and ready for any subsequent analytical tasks, providing a solid foundation for business intelligence operations.

___
### Roadmap

* "ETL_Mini_Project_OSLinden" file contains the main ETL code using Pandas libraries, comprehensive data manipulation, and Regex.
* "crowdfunding_db_schema" is a SQL code to upload extracted and transformed data frames.
* "Resources" folder includes original data files and extracted data frames from
* "Images_SQL_Data_Upload" folder features screenshots showing that the schema was executed and data was successfully uploaded into the tables.