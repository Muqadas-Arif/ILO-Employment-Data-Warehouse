-- ================================================================
-- STEP: Data Profiling - Inspect distinct values for each column
-- PURPOSE: Understand categories, spot anomalies, and prepare for cleaning
-- ================================================================

-- Structure Information
SELECT DISTINCT STRUCTURE FROM staging_ilo_emp;
SELECT DISTINCT STRUCTURE_ID FROM staging_ilo_emp;
SELECT DISTINCT ACTION FROM staging_ilo_emp;

-- Frequency Information
SELECT DISTINCT FREQ FROM staging_ilo_emp;
SELECT DISTINCT FREQ_LABEL FROM staging_ilo_emp;

-- Reference Area
SELECT DISTINCT REF_AREA FROM staging_ilo_emp;
SELECT DISTINCT REF_AREA_LABEL FROM staging_ilo_emp;

-- Indicator Details
SELECT DISTINCT INDICATOR FROM staging_ilo_emp;
SELECT DISTINCT INDICATOR_LABEL FROM staging_ilo_emp;

-- Gender Information
SELECT DISTINCT SEX FROM staging_ilo_emp;
SELECT DISTINCT SEX_LABEL FROM staging_ilo_emp;

-- Age and Urbanisation
SELECT DISTINCT AGE FROM staging_ilo_emp;
SELECT DISTINCT AGE_LABEL FROM staging_ilo_emp;
SELECT DISTINCT URBANISATION FROM staging_ilo_emp;
SELECT DISTINCT URBANISATION_LABEL FROM staging_ilo_emp;

-- Unit of Measurement
SELECT DISTINCT UNIT_MEASURE FROM staging_ilo_emp;
SELECT DISTINCT UNIT_MEASURE_LABEL FROM staging_ilo_emp;

-- Composition Breakdowns
SELECT DISTINCT COMP_BREAKDOWN_1 FROM staging_ilo_emp;
SELECT DISTINCT COMP_BREAKDOWN_1_LABEL FROM staging_ilo_emp;
SELECT DISTINCT COMP_BREAKDOWN_2 FROM staging_ilo_emp;
SELECT DISTINCT COMP_BREAKDOWN_2_LABEL FROM staging_ilo_emp;
SELECT DISTINCT COMP_BREAKDOWN_3 FROM staging_ilo_emp;
SELECT DISTINCT COMP_BREAKDOWN_3_LABEL FROM staging_ilo_emp;

-- Observation & Aggregation
SELECT DISTINCT TIME_PERIOD FROM staging_ilo_emp;
SELECT DISTINCT OBS_VALUE FROM staging_ilo_emp;
SELECT DISTINCT AGG_METHOD FROM staging_ilo_emp;
SELECT DISTINCT AGG_METHOD_LABEL FROM staging_ilo_emp;

-- Database Info
SELECT DISTINCT DATABASE_ID FROM staging_ilo_emp;
SELECT DISTINCT DATABASE_ID_LABEL FROM staging_ilo_emp;

-- Unit Type and Multiplier
SELECT DISTINCT UNIT_MULT FROM staging_ilo_emp;
SELECT DISTINCT UNIT_MULT_LABEL FROM staging_ilo_emp;
SELECT DISTINCT UNIT_TYPE FROM staging_ilo_emp;
SELECT DISTINCT UNIT_TYPE_LABEL FROM staging_ilo_emp;

-- Time Format
SELECT DISTINCT TIME_FORMAT FROM staging_ilo_emp;
SELECT DISTINCT TIME_FORMAT_LABEL FROM staging_ilo_emp;

-- Observation Status
SELECT DISTINCT OBS_STATUS FROM staging_ilo_emp;
SELECT DISTINCT OBS_STATUS_LABEL FROM staging_ilo_emp;
SELECT DISTINCT OBS_CONF FROM staging_ilo_emp;
SELECT DISTINCT OBS_CONF_LABEL FROM staging_ilo_emp;

-- Step: Detect Blank or Meaningless Strings in the Staging Table
-- Purpose: Identify fields containing '', 'NA', 'N/A', or 'Unknown' values
-- This helps in assessing data quality before applying any transformation

SELECT 
    SUM(CASE WHEN STRUCTURE IN ('', 'NA', 'N/A', 'Unknown') THEN 1 ELSE 0 END) AS bad_STRUCTURE,
    SUM(CASE WHEN ACTION IN ('', 'NA', 'N/A', 'Unknown') THEN 1 ELSE 0 END) AS bad_ACTION,
    SUM(CASE WHEN FREQ IN ('', 'NA', 'N/A', 'Unknown') THEN 1 ELSE 0 END) AS bad_FREQ,
    SUM(CASE WHEN FREQ_LABEL IN ('', 'NA', 'N/A', 'Unknown') THEN 1 ELSE 0 END) AS bad_FREQ_LABEL,
    SUM(CASE WHEN REF_AREA IN ('', 'NA', 'N/A', 'Unknown') THEN 1 ELSE 0 END) AS bad_REF_AREA,
    SUM(CASE WHEN REF_AREA_LABEL IN ('', 'NA', 'N/A', 'Unknown') THEN 1 ELSE 0 END) AS bad_REF_AREA_LABEL,
    SUM(CASE WHEN INDICATOR IN ('', 'NA', 'N/A', 'Unknown') THEN 1 ELSE 0 END) AS bad_INDICATOR,
    SUM(CASE WHEN INDICATOR_LABEL IN ('', 'NA', 'N/A', 'Unknown') THEN 1 ELSE 0 END) AS bad_INDICATOR_LABEL,
    SUM(CASE WHEN SEX IN ('', 'NA', 'N/A', 'Unknown') THEN 1 ELSE 0 END) AS bad_SEX,
    SUM(CASE WHEN SEX_LABEL IN ('', 'NA', 'N/A', 'Unknown') THEN 1 ELSE 0 END) AS bad_SEX_LABEL,
    SUM(CASE WHEN AGE IN ('', 'NA', 'N/A', 'Unknown') THEN 1 ELSE 0 END) AS bad_AGE,
    SUM(CASE WHEN AGE_LABEL IN ('', 'NA', 'N/A', 'Unknown') THEN 1 ELSE 0 END) AS bad_AGE_LABEL,
    SUM(CASE WHEN OBS_VALUE IN ('', 'NA', 'N/A', 'Unknown') THEN 1 ELSE 0 END) AS bad_OBS_VALUE
FROM staging_ilo_emp;
