#  SQL Data Cleaning Project: World Layoffs Dataset

## About the Project

This was a personal project I did to practice data cleaning using SQL. The dataset I worked with is the [World Layoffs dataset from Kaggle](https://www.kaggle.com/datasets/salimwid/layoffs-2022) — it contains information on company layoffs across various industries, countries, and dates.

I used MySQL Workbench to write and run queries that cleaned and standardized the data. My main goals were to:

- Practice writing clean, modular SQL
- Understand how to safely clean messy real-world data
- Work through a full data cleaning process step-by-step

---

##  Dataset Overview

The dataset contains layoff announcements from various companies and includes columns like:

- `company`
- `industry`
- `location`
- `country`
- `total_laid_off`
- `percentage_laid_off`
- `funds_raised_millions`
- `date`
- `stage`

---

##  What I Did

Here’s a quick breakdown of the steps I followed:

### 1. Create a Staging Table

I started by copying the original `layoffs` table into a new table called `layoffs_staging` so I could work without touching the raw data.

### 2. Remove Duplicates

Used a `ROW_NUMBER()` window function to flag duplicates based on:
- `company`, `industry`, `total_laid_off`, `percentage_laid_off`, `date`, `country`, and `funds_raised_millions`

Then deleted any rows where `row_num > 1`.

### 3. Standardize the Data

- Trimmed spaces from values using `TRIM()`
- Replaced variations like "Crypto, crypto, Crypto/Web3" with just `"crypto"`
- Removed trailing periods from countries like `"United States."`
- Converted `date` from string to proper `DATE` type using `STR_TO_DATE()`

### 4. Handle Null or 'None' Values

- Replaced placeholder values like `'None'` with real nulls or dropped rows when appropriate
- Filled in missing `industry` values by joining on company/location from rows with known values
- Deleted rows where both `total_laid_off` and `percentage_laid_off` were missing

### 5. Final Touches

- Dropped the `row_num` column after deduplication
- Verified that the cleaned table (`layoffs_staging2`) was ready for analysis

---

## Tools Used

- MySQL Workbench
- SQL (window functions, `JOIN`s, `UPDATE`, `DELETE`, `CTEs`, etc.)
- Kaggle dataset: [Layoffs](https://github.com/AlexTheAnalyst/MySQL-YouTube-Series/blob/main/layoffs.csv)

---

## Why I Did This

I wanted to get hands-on experience with the kind of messy data you might find in the real world. This project helped me understand what actually goes into cleaning a dataset — not just removing nulls, but standardizing formats, catching hidden duplicates, and making the data analysis-ready.

---

## What's Next

Now that the data is cleaned, I’m planning to either:

- Build a dashboard with Tableau or Power BI
- Run some exploratory data analysis (EDA) using SQL or Python (Pandas)

---

## File Guide

- `layoffs_cleaning.sql` – full SQL script, step-by-step, with comments
- (optional) `layoffs_cleaned.csv` – final cleaned dataset export (if I upload it)

---

