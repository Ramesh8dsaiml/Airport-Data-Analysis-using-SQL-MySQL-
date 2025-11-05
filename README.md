# Airport-Data-Analysis-using-SQL-MySQL-
A practical SQL project that analyzes airport and flight data using MySQL. It includes database creation, data import, relational schema design, analytical queries, views, and stored procedures to find insights like top airports, passenger flow, and population-to-passenger ratios.

Project Overview  
This project focuses on analyzing **airport and flight data** using SQL.  
It involves data import, relational schema creation, and advanced analytical queries to generate insights about passenger flow, airport performance, and city-level air traffic analysis.  

The project demonstrates practical SQL concepts like joins, aggregation, subqueries, views, and stored procedures.  
Features / Steps Implemented  

1. **Prerequisites Setup** – Database creation (`flight_analysis`).  
2. **Data Import** – Loaded CSV files (`City.csv`, `Airport.csv`, `Flight.csv`).  
3. **Relational Table Creation** – Designed normalized tables with proper keys.  
4. **Data Insertion** – Inserted data manually or via import.  
5. **Data Analysis Queries**  
   - Passenger count per city  
   - Business flight route identification  
   - Top performing airports  
   - City population insights  
   - Population vs Origin/Destination analysis  
6. **Views Creation** – For reusable query logic.  
7. **Stored Procedures** – Automated repeated SQL tasks.


 Technologies Used  
- **Database:** MySQL  
- **Language:** SQL  
- **Tools:** MySQL Workbench

-  Key Insights  
- Determined **top-performing airports** by total passengers.  
- Found **passenger-to-population ratios** for various cities.  
- Highlighted **routes with highest business-class passengers**.  


  Airport_SQL_Project/
│
├── All_City.csv
├── Airport_project_data.csv
├── Airport_Project.sql 
└── README.md # Documentation file

SQL Concepts Covered  
- **DDL:** CREATE, ALTER, DROP  
- **DML:** INSERT, UPDATE, DELETE  
- **Joins & Aggregation:** INNER JOIN, GROUP BY, SUM(), COUNT()  
- **Views:** Simplified reusable queries  
- **Stored Procedures:** Encapsulated logic for automation  
- **Data Analysis:** Query-based insights  
How to Run  

1. Open your SQL IDE (MySQL Workbench / VS Code   
2. Create and select the database:
   ```sql
   CREATE DATABASE flight_analysis;
   USE flight_analysis;
   
Author
Ramesh Kumar
