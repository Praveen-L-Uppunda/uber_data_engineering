# Uber Data Analytics Project

## Objectives
- Take a dataset of Uber and build a data model.
- Data Transformation in Python and deploy the code on GCP cloud instance.
- Build a pipeline using MAGE.
- Load the data on BigQuery and perform Data Analytics.
- Create a dashboard on Looker Studio.

### Dataset
The dataset used for this project is taken from Uber trip records of NYC's Taxi and Limousine Commission (TLC) that can be accessed using this [Link](https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page) . <br />
A subset of the data consisting 100k trips is used for this project - [Dataset](https://github.com/Praveen-L-Uppunda/uber_data_engineering/blob/491202e1b207b3f1eaad137dcd4603f024220990/dataset/uber_data.csv)
<br />
Data Dictionary for Yellow Taxi Trip data - https://www.nyc.gov/assets/tlc/downloads/pdf/data_dictionary_trip_records_yellow.pdf


### Tech Stack
* Languages Used
  1. Python
  2. SQL
     
* Tools Used
  1. Google Cloud Storage
  2. Compute Instance
  3. MAGE
  4. Google BigQuery
  5. Looker Studio


## Approach
### 1. Data  Acquisition
The dataset is taken from Uber trip records of NYC's Taxi and Limousine Commission (TLC). Only a subset of the data consisting 100k trips is used for analysis. 
This CSV file is stored on Google Cloud Storage Bucket and is fetched using **MAGE Data Loader** block for subsequent steps in the ETL pipeline. 

### 2. Data Modeling
The flat file obtained as data set will be converted to Fact Table and Dimension Table.

#### Fact Table
- Has quantitative measures used for analysis.
- Contains references to Dimension table.
- Has columns with high cardinality and changes frequently.
- Contains columns which are not useful for analysis by themselves but are necessary for calculating metrics.

#### Dimension Table
- Contains columns which describe attributes of data being analyzed.
- Has Primary Keys that links fact table. 
- Has columns with low cardinality and doesn't change frequently.
- Contains columns which are used for grouping or filtering data for analysis. 

![image](https://github.com/Praveen-L-Uppunda/uber_data_engineering/assets/31701395/135be8ad-1825-4695-b0b8-8ebf8b9d86a0)

### 3. Data Transformation
Transformation of the loaded data as per our requirement is done using **MAGE Transformation** block. <br />
Some of the transformation done include:
- Data Cleaning
- Dropping duplicates and resetting indexes.
- Converting the columns storing date values/timestamp in the DataFrame to *datetime* type.
- Developing Dimension Tables and Fact Table. 
Once all the dimension tables are created, to create a fact table we merge the main dataframe on all of the dimension tables based on the common key present between them.

### 4. BigQuery Analytics
The Dimension tables and fact table created in Transformation block is uploaded on to BigQuery. Google BigQuery is a fully-managed data warehouse that provides efficient data storage, retrieval, and querying capabilities, and valuable insights from the data.

  
