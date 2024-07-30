# Crowdfunding_ETL Data Analysis 
___

### Description

The data integration and analysis process involves multiple steps to manage and analyze Crowdfunding data, including Extract, Transform, and Load (ETL).

The extracted and transformed data has been processed to ensure compatibility with the existing database schema. The appropriate tables are populated with comprehensive details such as contact information, company name, description, financial goals, pledged amounts, outcomes, backer counts, country, currency, launch date, end date, category ID, and subcategory ID.

A critical aspect of the work involves addressing foreign key constraints to maintain data integrity between the campaign table and related tables, specifically the contacts table. This includes verifying that all contact_id values in the campaign data exist in the contacts_pandas_option table. Any discrepancies are resolved by inserting missing contact records into the contacts_pandas_option table.

SQL and Python have been utilized for this data integration process, with the pandas library playing a key role in streamlining data manipulation and insertion tasks. Automation is employed to identify and insert missing contacts into the database, ensuring the campaign data can be successfully imported into the campaign table while maintaining all foreign key constraints.

This meticulous approach guarantees a consistent and accurate database, supporting reliable data analysis and reporting. Each step ensures that the database remains robust and ready for any subsequent analytical tasks, providing a solid foundation for business intelligence operations.

___

### Installation

Used Python, Pandas library, and SQL language.
* Installed VS Code and pgAdmin4.
* Imported pandas, NumPy, json, and re (regex module) dependencies.

___

### Code examples

* Example 1 (comprehension method)

--- Use a list comprehension to add "cat" to each category_id. 

cat_ids = [f'cat{cat_id}' for cat_id in category_ids]

--- Use a list comprehension to add "subcat" to each subcategory_id.
scat_ids = [f'subcat{subcat_id}' for subcat_id in subcategory_ids]

--- Displaying results    
print(cat_ids)
print(scat_ids)

* Example 2 (comprehension method)

--- Iterate through the contact_info_df and convert each row to a dictionary 
--- The code iterates through rows and indexes as the data has both in each row

--- Trim column names to remove leading and trailing spaces
contact_info_df.columns = contact_info_df.columns.str.strip()

--- Initialize an empty lists to store the list values and keys
dict_values = []
column_names = []

---  Iterate through the DataFrame.
for i, row in contact_info_df.iterrows():
    data = row.iloc[0]
    --- Convert each row to a Python dictionary.
    
    converted_data = json.loads(data)
    
    --- Use a list comprehension to get the keys from the converted data.
    columns = [k for k,v in converted_data.items()]
   --- Use a list comprehension to get the values for each row.
    row_values = [v for k, v in converted_data.items()]
    --- Append the keys and list values to the lists created in step 1.  
    column_names.append(columns)
    dict_values.append(row_values)

--- Print out the list of values for each row and columns names
print(column_names[0])
print(dict_values)

* Example 3 (Regex)

--- Extract the name of the contact and add it to a new column.
contacts_next = pd.DataFrame(contacts_df)
--- Function to extract name from contact_info using regex
def extract_name(contact_info): #define the function
    --- set paramenters of the search: any range and any characters and whitespaces after "name" except the double quote.
    match = re.search(r'"name":\s*"([^"]+)"', contact_info) 
    return match.group(1) if match else '' #save results of the search if the match is found

--- Apply the function to the contact_info column and create a new column 'name'
contacts_next['name'] = contacts_next['contact_info'].apply(extract_name)

--- Display the first few rows of the new DataFrame
print(contacts_next.head())

___
### Roadmap

* "ETL_Mini_Project_OSLinden" file contains the main ETL code using Pandas libraries, comprehensive data manipulation, and Regex.
* "crowdfunding_db_schema" is a SQL code to upload extracted and transformed data frames.
* "Resources" folder includes original data files and extracted data frames from
* "Images_SQL_Data_Upload" folder features screenshots showing that the schema was executed and data was successfully uploaded into the tables.
