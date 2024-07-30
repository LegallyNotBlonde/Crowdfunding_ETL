# Crowdfunding ETL Data Analysis 
___

### Overview

The project involves building an ETL pipeline to extract and transform crowdfunding data and then load it into a PostgreSQL database. This process extensively uses Python and Pandas for data transformation and includes handling foreign key constraints to ensure data integrity during data loading.

___

### Installation

* **Tools and Languages**:

    * Used Python, Pandas library, and SQL.
    * Installed VS Code and pgAdmin4 for development and database management.
* **Dependencies**:
    * Imported pandas, NumPy, json, and re (regex module) libraries.
* **Database**:
    * Used PostgreSQL, managed via pgAdmin4.
___

### Code examples

* **Example 1** (comprehension method)
  ```python

    # Use a list comprehension to add "cat" to each category_id. 
        cat_ids = [f'cat{cat_id}' for cat_id in category_ids]
    # Use a list comprehension to add "subcat" to each subcategory_id.
        scat_ids = [f'subcat{subcat_id}' for subcat_id in subcategory_ids]
    # Displaying results 
        print(cat_ids)
        print(scat_ids)
  ```

* **Example 2** (comprehension method) 
   ```python
    # Initialize an empty lists to store the list values and keys
        dict_values = []
        column_names = []
    # Iterate through the DataFrame.
        for i, row in contact_info_df.iterrows():
        data = row.iloc[0]
    # Convert each row to a Python dictionary.
        converted_data = json.loads(data)

    # Use a list comprehension to get the keys from the converted data.
        columns = [k for k,v in converted_data.items()]
    # Use a list comprehension to get the values for each row.
        row_values = [v for k, v in converted_data.items()]
    # Append the keys and list values to the lists created in step 1.  
        column_names.append(columns)
        dict_values.append(row_values)
    # Print out the list of values for each row and columns names
      print(column_names[0])
      print(dict_values)
   ```

* **Example 3** (Regex)
   ```python
    # Extract the name of the contact and add it to a new column.
        contacts_next = pd.DataFrame(contacts_df)
    # Function to extract name from contact_info using regex
        def extract_name(contact_info): #define the function
    # Set paramenters of the search: any range and any characters and whitespaces after "name" except the double quote.
        match = re.search(r'"name":\s*"([^"]+)"', contact_info) 
        return match.group(1) if match else '' #save results of the search if the match is found
    # Apply the function to the contact_info column and create a new column 'name'
        contacts_next['name'] = contacts_next['contact_info'].apply(extract_name)
    # Display the first few rows of the new DataFrame
        print(contacts_next.head())

___
### Roadmap

* The **[ETL_Mini_Project_OSLinden](https://github.com/LegallyNotBlonde/Crowdfunding_ETL/blob/main/ETL_Mini_Project_OSLinden.ipynb)** file contains the main ETL code using Pandas libraries, comprehensive data manipulation, and Regex.
* "**crowdfunding_db_schema**" is a SQL code to upload extracted and transformed data frames.
* "**Resources**" folder includes original data files and transformed data frames.
* "**Images_SQL_Data_Upload**" folder features screenshots showing that the schema was executed and data was successfully uploaded into each table.
