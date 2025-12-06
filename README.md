# COVID-19 SQL Analysis


![COVID-19](https://scwcontent.affino.com/AcuCustom/Sitename/DAM/022/data_graph__virus_Adobe.jpg)


## Project Overview
This project contains a curated set of **SQL queries** executed on the `covid_19` dataset. The dataset tracks COVID-19 cases, deaths, and population across countries, along with date-specific information.  

The queries are organized by functionality, enabling comprehensive analysis of the dataset using **MySQL**.

---

## Dataset Structure

| Column Name     | Data Type | Description                        |
|-----------------|-----------|------------------------------------|
| date            | text      | Date of record (`yyyy-mm-dd`)      |
| day             | int       | Day of the month                   |
| month           | int       | Month number                        |
| year            | int       | Year of the record                 |
| cases           | int       | Number of COVID-19 cases           |
| deaths          | int       | Number of COVID-19 deaths          |
| countries       | text      | Country name                        |
| geoId           | text      | Geographical identifier             |
| countrycodes    | text      | ISO country code                     |
| population      | int       | Population of the country           |

> Note: The dataset contains records from **December 2019 to April 2020**. The `date` column is stored as **text** in `yyyy-mm-dd` format.

---

## Query Categories

### 1. Arithmetic Operations
Queries performing calculations on numerical columns, including addition, subtraction, multiplication, division, modulus, and derived metrics.

### 2. Logical Operators
Queries using **`AND`**, **`OR`**, and **`NOT`** to filter records based on multiple conditions.

### 3. Special Operators
Queries demonstrating:
- **`IN` / `NOT IN`**
- **`BETWEEN` / `NOT BETWEEN`**
- **`LIKE` / `NOT LIKE`**
- **`IS NULL` / `IS NOT NULL`**
- **`EXISTS`**
- **`ANY` / `ALL`**
- **`DISTINCT`** and **column aliasing (`AS`)**

### 4. Aggregate Functions
Queries using:
- `COUNT()`
- `SUM()`
- `AVG()`
- `MIN()`
- `MAX()`

### 5. Sorting (`ORDER BY`)
Queries ordering data in ascending (`ASC`) or descending (`DESC`) order, including multi-column ordering.

### 6. Conditional Logic (`CASE`)
Queries classifying data using **`CASE WHEN ... THEN ... ELSE ... END`**.

### 7. Date Extraction
Queries extracting components from the `date` column:
- `YEAR()`
- `MONTH()`
- `MONTHNAME()`
- `DAY()`
- `DAYNAME()`
