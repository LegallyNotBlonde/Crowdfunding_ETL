# Crowdfunding ETL Data Analysis 
___

### Overview

* This project demonstrates the development of an ETL (Extract, Transform, Load) pipeline to process crowdfunding data. 
* The pipeline extracts raw data, performs transformations using Python and Pandas, and loads the cleaned data into a PostgreSQL database. 
* To ensure data integrity, the project incorporates foreign key constraints during data loading.

___

### Installation

* **Tools and Languages**:

    * Python (including Pandas and NumPy libraries).
    * PostgreSQL, managed via pgAdmin4.
    * VS Code for development.
* **Dependencies**:
    * Imported pandas, NumPy, json, and re (regex module).

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

* **[ETL_Project:](https://github.com/LegallyNotBlonde/Crowdfunding_ETL/blob/main/ETL_Project.ipynb)** Contains the main ETL pipeline code, showcasing data transformation with Pandas and Regex techniques.
* **[crowdfunding_db_schema:](https://github.com/LegallyNotBlonde/Crowdfunding_ETL/blob/main/crowdfunding_db_schema.sql)** SQL script to create the database schema and load transformed data.
* **[Resources:](https://github.com/LegallyNotBlonde/Crowdfunding_ETL/tree/main/Resources)** Includes raw data files and transformed datasets.
* **[Images_SQL_Data_Upload:](https://github.com/LegallyNotBlonde/Crowdfunding_ETL/tree/main/Images_SQL_Data_Upload)** Features screenshots verifying successful data upload into PostgreSQL tables.

___
### Resources
* The data used in this analysis is fictional and was created solely for the purpose of showcasing data analytics and ETL skills.