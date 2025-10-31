-- #################################################################
-- # ILO Employment Data Warehouse - Staging Load
-- #################################################################

-- Project Overview:
-- This project demonstrates the first step of a data warehouse ETL pipeline
-- for International Labour Organization (ILO) employment data.
-- It focuses on the Extraction phase, where raw CSV data is loaded into SQL Server
-- safely for further cleaning and transformation.
-- The goal is to create a staging table (Bronze layer) that preserves all original
-- data from the CSV before any processing, making it ready for analysis or transformation
-- into fact and dimension tables.

-- #################################################################
-- # Database & Table Created
-- #################################################################

-- Database: ilo_data
-- Staging Table: staging_ilo_emp

-- Columns in the staging table:
-- STRUCTURE, STRUCTURE_ID, ACTION, FREQ, FREQ_LABEL
-- REF_AREA, REF_AREA_LABEL, INDICATOR, INDICATOR_LABEL
-- SEX, SEX_LABEL, AGE, AGE_LABEL, URBANISATION, URBANISATION_LABEL
-- UNIT_MEASURE, UNIT_MEASURE_LABEL
-- COMP_BREAKDOWN_1, COMP_BREAKDOWN_1_LABEL
-- COMP_BREAKDOWN_2, COMP_BREAKDOWN_2_LABEL
-- COMP_BREAKDOWN_3, COMP_BREAKDOWN_3_LABEL
-- TIME_PERIOD, OBS_VALUE
-- AGG_METHOD, AGG_METHOD_LABEL
-- DATABASE_ID, DATABASE_ID_LABEL
-- UNIT_MULT, UNIT_MULT_LABEL, UNIT_TYPE, UNIT_TYPE_LABEL
-- TIME_FORMAT, TIME_FORMAT_LABEL
-- OBS_STATUS, OBS_STATUS_LABEL, OBS_CONF, OBS_CONF_LABEL

-- Note: OBS_VALUE is stored as NVARCHAR (text) initially
-- to avoid type conversion errors from the raw CSV.

-- #################################################################
-- # Steps Performed (ETL - Extraction Phase)
-- #################################################################

-- Step 1: Create the database
-- A new database named 'ilo_data' is created to store all tables for this project.
-- This keeps the project data separate from other SQL Server databases.
-- CREATE DATABASE ilo_data;
-- USE ilo_data;

-- Step 2: Create the staging table
-- The table 'staging_ilo_emp' is created to match the CSV structure exactly.
-- All columns are stored as text to ensure no data is lost or rejected during loading.
-- This table represents the Bronze layer in the data warehouse.

-- Step 3: Prepare the CSV file
-- The CSV file is placed in a folder accessible by SQL Server.
-- Necessary permissions are granted to allow SQL Server to read the file.

-- Step 4: Load data into the staging table
-- A bulk insert process is used to efficiently import all rows from the CSV.
-- The first row is ignored because it contains headers.
-- Text encoding is set to UTF-8 to handle any special characters.
-- BULK INSERT staging_ilo_emp
-- FROM 'C:\Users\<username>\Downloads\ILO_EMP.csv'
-- WITH (
--     FIRSTROW = 2,
--     FIELDTERMINATOR = ',',
--     ROWTERMINATOR = '\n',
--     TABLOCK,
--     CODEPAGE = '65001'
-- );

-- Step 5: Verify the data
-- Check the top 10 rows to confirm that the data loaded correctly.
-- SELECT TOP 10 * FROM staging_ilo_emp;

-- #################################################################
-- # Key Points
-- #################################################################

-- 1. This is the Extraction stage of ETL.
-- 2. Raw data is preserved without cleaning for safe transformation later.
-- 3. Prepares the dataset for fact and dimension tables, aggregation, and analysis.




DROP TABLE IF EXISTS staging_ilo_emp;
GO
CREATE TABLE staging_ilo_emp (
    STRUCTURE NVARCHAR(100),
    STRUCTURE_ID NVARCHAR(50),
    ACTION NVARCHAR(50),
    FREQ NVARCHAR(50),
    FREQ_LABEL NVARCHAR(100),
    REF_AREA NVARCHAR(50),
    REF_AREA_LABEL NVARCHAR(200),
    INDICATOR NVARCHAR(100),
    INDICATOR_LABEL NVARCHAR(300),
    SEX NVARCHAR(50),
    SEX_LABEL NVARCHAR(100),
    AGE NVARCHAR(50),
    AGE_LABEL NVARCHAR(100),
    URBANISATION NVARCHAR(50),
    URBANISATION_LABEL NVARCHAR(100),
    UNIT_MEASURE NVARCHAR(50),
    UNIT_MEASURE_LABEL NVARCHAR(100),
    COMP_BREAKDOWN_1 NVARCHAR(50),
    COMP_BREAKDOWN_1_LABEL NVARCHAR(100),
    COMP_BREAKDOWN_2 NVARCHAR(50),
    COMP_BREAKDOWN_2_LABEL NVARCHAR(100),
    COMP_BREAKDOWN_3 NVARCHAR(50),
    COMP_BREAKDOWN_3_LABEL NVARCHAR(100),
    TIME_PERIOD NVARCHAR(50),
    OBS_VALUE NVARCHAR(50),  -- change FLOAT → NVARCHAR(50)
    AGG_METHOD NVARCHAR(50),
    AGG_METHOD_LABEL NVARCHAR(100),
    DATABASE_ID NVARCHAR(50),
    DATABASE_ID_LABEL NVARCHAR(100),
    UNIT_MULT NVARCHAR(50),
    UNIT_MULT_LABEL NVARCHAR(50),
    UNIT_TYPE NVARCHAR(50),
    UNIT_TYPE_LABEL NVARCHAR(100),
    TIME_FORMAT NVARCHAR(50),
    TIME_FORMAT_LABEL NVARCHAR(100),
    OBS_STATUS NVARCHAR(50),
    OBS_STATUS_LABEL NVARCHAR(100),
    OBS_CONF NVARCHAR(50),
    OBS_CONF_LABEL NVARCHAR(100)
);
GO

BULK INSERT staging_ilo_emp
FROM 'C:\Users\HP\Downloads\ILO_EMP.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK,
    CODEPAGE = '65001',
    MAXERRORS = 10000 -- ignore invalid rows up to this number
);
SELECT DISTINCT INDICATOR_LABEL FROM staging_ilo_emp ORDER BY INDICATOR_LABEL;

