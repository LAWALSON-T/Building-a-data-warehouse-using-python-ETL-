# Building-a-data-warehouse-using-python-ETL-
This project focuses on developing a comprehensive data warehouse for video game data, utilizing a structured ETL (Extract, Transform, Load) 
process to optimize data management and analysis.The motivation behind this research stems from the increasing complexity of gaming datasets, 
which require effective methods for cleaning, organizing, and analyzing data to derive meaningful insights

# Goal
The primary problem addressed is the need to transform a dirty dataset into a well-structured database while ensuring accurate representation of the underlying data.
The project employs Dask for efficient data manipulation and MySQL for data storage, enabling the handling of large datasets while maintaining performance.
A production-grade data engineering system that ingests raw gaming data, processes it at scale, transforms it into analytics-ready structures, and serves it through a tested,
validated data warehouse orchestrated by Apache Airflow.

| Layer                  | Tools                              |
| ---------------------- | ---------------------------------- |
| Big-data ingestion     | Dask                               |
| Data processing        | Python, Pandas                     |
| Data modeling          | Star Schema (Fact & Dimensions)    |
| Data warehouse         | MySQL                              |
| Orchestration          | Apache Airflow                     |
| Validation             | Python test framework + SQL checks |
| Environment management | dotenv                             |
| Version control        | Git + GitHub                       |


# Architecture

CSV (Steam Dataset)  
⬇  
Dask (Big-data processing)  
⬇  
Python ETL  
⬇  
Star Schema  
⬇  
MySQL Data Warehouse 

[Analytics / BI / Dashboards]


# Table structure 
## FACT Table:
 - fact_games: Stores game sales data, review scores, and release dates.
  
## Dimension Tables:
  1. dim_support_info: Stores supported languages and multiplayer options.
  2. dim_reviews: Contains review IDs and scores.
  3. dim_platforms: Holds platform names and release dates.
  4. dim_media: Contains media URLs and types.
  5. dim_genres_categories: Stores genre and category types.
  6. dim_game_info: Holds game descriptions and age ratings.
  7. dim_developer_publisher: Lists developers and publishers.

# ETL processes
The ETL process was implemented in Python and involved the following steps:
1.	Extract: Data was imported from CSV files into a Dask DataFrame to handle large datasets efficiently. During extraction, initial checks were performed to identify inconsistencies in the data.
2.	Transform: The transformation step included various data cleaning techniques. Missing values were filled appropriately, and data types were standardized; for example, dates were converted to the YYYY-MM-DD format. String values were further processed to remove extraneous characters, such as brackets from lists in the Full audio languages, Reviews, Categories, Genres, and Tags columns. These columns were then split and exploded into separate rows for better normalization. For the estimated owners column, the upper bound was selected and then converted to int, also all columns were given underscore in-between characters to meet database standard 
3.	Load: The cleaned data was loaded into MySQL using the MySQL Connector for Python. The fact games table was created to store aggregated sales data.
4. Validate
- Referential integrity tests
- Row count checks
- Data quality rules
- Infrastructure connectivity tests
5. Orchestrate
- Apache Airflow runs the entire pipeline on schedule


# OLAP Operations
The dashboard for our project was designed using Power BI, which was connected to the MySQL database for OLAP operations. The key metrics analyzed included:
•	Roll-up: Aggregating sales data by game genres and categories, allowing for a comprehensive view of overall performance.
•	Drill-down: Enabling users to explore individual game sales from higher category levels, providing insights into specific product performance.
•	Slice-and-dice: Facilitating comparisons of sales performance across different platforms, regions, or time periods.
•	Pivoting: Rearranging data to analyze sales by year or by platform, which aids in identifying trends and seasonal variations.


# How to Run

1. Clone the repo
2. Create `.env` from `.env.example`
3. Install dependencies  
   `pip install -r requirements.txt`
4. Run  
   `python etl/run_etl.py`



