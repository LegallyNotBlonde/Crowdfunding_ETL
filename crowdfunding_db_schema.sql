-- Schema to create 4 tables in the certain order to avoid referennces to non-existent tables

--Create 'contacts_Pandas_option' table----------
CREATE TABLE contacts_pandas_option (
    contact_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

--Create 'category' table-----------------------
CREATE TABLE category (
    category_id VARCHAR(20) PRIMARY KEY,
    category VARCHAR(50)
);

--Create 'subcategory' table ------------------
CREATE TABLE subcategory (
    subcategory_id VARCHAR(20) PRIMARY KEY,
    subcategory VARCHAR(50)
);

--Create 'campaign' table ------------------
CREATE TABLE campaign (
    cf_id SERIAL PRIMARY KEY,
    contact_id INT,
    company_name VARCHAR(100),
    description TEXT,
    goal DECIMAL(15, 2),
    pledged DECIMAL(15, 2),
    outcome VARCHAR(20),
    backers_count INT,
    country VARCHAR(2),
    currency VARCHAR(3),
    launched_date DATE,
    end_date DATE,
    category_id VARCHAR(20),
    subcategory_id VARCHAR(20),
    CONSTRAINT fk_contact_id FOREIGN KEY (contact_id) REFERENCES contacts_pandas_option(contact_id),
    CONSTRAINT fk_category_id FOREIGN KEY (category_id) REFERENCES category(category_id),
    CONSTRAINT fk_subcategory_id FOREIGN KEY (subcategory_id) REFERENCES subcategory(subcategory_id)
);

-- Query all fields from the 'contacts_Pandas_option' table
SELECT *
FROM contacts_pandas_option;

-- Query all fields from the 'category' table
SELECT *
FROM category;

-- Query all fields from the 'subcategory' table
SELECT *
FROM subcategory;

-- Query all fields from the 'campaign' table
SELECT *
FROM campaign;
