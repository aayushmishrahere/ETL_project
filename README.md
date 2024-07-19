Loan Borrowers ETL and Analysis Project
By Aayush Mishra

Project Proposal
Based upon the data given to me as "5k_borrowers.csv", the data needed to be Extracted, Transformed and Loaded into a Mysql database from a CSV file to perform different analysis and get the answers of given questions.

Project Description
Loaded the CSV data using python "pandas" library and performed different cleaning and standardizing methods to transform the data and loaded the data using
"sqlalchemy" into a mysql database and performed different analysis.

Data Cleanup and Analysis
TRANSFORMATION STEPS My transformation steps I needed to clean the data to be readable, presentable, and easy for me to query in the later stages. This was done by:

1. 'pip install pandas' in cmd then Importing Pandas and reading the CSV file using 'import pandas as pd'.
2.  Checking for null values in all the columns of the data, Duplicating the original data to perform data cleaning and Standardization on the duplicate data.
3.  Parsing the JSON column 'Repayment History' and splitting it in Three Columns 'Number of Payments', 'First Payment Date'and 'Last Payment Date'
   for better analysis and results in future .
4. Converting Datatypes, Standardizing texts like of Columns like 'Email Address' to lowercase and providing countrycode to all the phone numbers.
5. Splitting and Deleting Columns Like 'Days Left to Pay Current EMI' into 'Due Payment' and 'Days left to pay' for better analysis.
LOADING STEPS

1. I established a connection to a local MySql server in my desktop to store the data in Borrowersdb Database
2. I used 'pip install sqlalchemy' to install in my pc and then used 'from sqlalchemy import create_engine, VARCHAR, Integer, Float, DateTime'
   to import create engine and diffrent datatypes for loading
3. I pushed the Pandas DataFrame to the local Mysql server so I can retrieve and query the data in Workbench Mysql
Analysis / SQL Queries In this part, given question to find:

1. WHAT IS THE AVERAGE LOAN AMOUNT FOR BORROWERS WHO ARE MORE THAN 5 DAYS PAST DUE
2. WHO ARE THE TOP 10 BORROWERS WITH THE HIGHEST OUTSTANDING BALANCE
3. LIST OF ALL THE BORROWERS WITH GOOD REPAYMENT HISTORY
4. BRIEF ANALYSIS WITH RESPECT TO LOAN TYPE
