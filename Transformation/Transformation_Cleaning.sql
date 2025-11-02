-- ================================================================
-- STEP: Data Profiling on Silver Layer
-- PURPOSE: Inspect selected important columns for anomalies and blanks
-- ================================================================

-- Reference Area
SELECT DISTINCT REF_AREA FROM silver_ilo_data;
SELECT DISTINCT REF_AREA_LABEL FROM silver_ilo_data;

-- Indicator Information
SELECT DISTINCT INDICATOR FROM silver_ilo_data;
SELECT DISTINCT INDICATOR_LABEL FROM silver_ilo_data;

-- Gender and Age
SELECT DISTINCT SEX FROM silver_ilo_data;
SELECT DISTINCT AGE FROM silver_ilo_data;

-- Frequency and Aggregation
SELECT DISTINCT FREQ FROM silver_ilo_data;
SELECT DISTINCT FREQ_LABEL FROM silver_ilo_data;
SELECT DISTINCT AGG_METHOD FROM silver_ilo_data;

-- Observation Period and Value
SELECT DISTINCT TIME_PERIOD FROM silver_ilo_data;
SELECT DISTINCT OBS_VALUE FROM silver_ilo_data;

-- ================================================================
-- STEP: Detect Blank or Meaningless Strings
-- PURPOSE: Identify '', 'NA', 'N/A', 'Unknown' for selected columns
-- ================================================================

SELECT 
    SUM(CASE WHEN REF_AREA IN ('', 'NA', 'N/A', 'Unknown') THEN 1 ELSE 0 END) AS bad_REF_AREA,
    SUM(CASE WHEN REF_AREA_LABEL IN ('', 'NA', 'N/A', 'Unknown') THEN 1 ELSE 0 END) AS bad_REF_AREA_LABEL,
    SUM(CASE WHEN INDICATOR IN ('', 'NA', 'N/A', 'Unknown') THEN 1 ELSE 0 END) AS bad_INDICATOR,
    SUM(CASE WHEN INDICATOR_LABEL IN ('', 'NA', 'N/A', 'Unknown') THEN 1 ELSE 0 END) AS bad_INDICATOR_LABEL,
    SUM(CASE WHEN SEX IN ('', 'NA', 'N/A', 'Unknown') THEN 1 ELSE 0 END) AS bad_SEX,
    SUM(CASE WHEN AGE IN ('', 'NA', 'N/A', 'Unknown') THEN 1 ELSE 0 END) AS bad_AGE,
    SUM(CASE WHEN FREQ IN ('', 'NA', 'N/A', 'Unknown') THEN 1 ELSE 0 END) AS bad_FREQ,
    SUM(CASE WHEN FREQ_LABEL IN ('', 'NA', 'N/A', 'Unknown') THEN 1 ELSE 0 END) AS bad_FREQ_LABEL,
    SUM(CASE WHEN AGG_METHOD IN ('', 'NA', 'N/A', 'Unknown') THEN 1 ELSE 0 END) AS bad_AGG_METHOD,
    SUM(CASE WHEN OBS_VALUE IN ('', 'NA', 'N/A', 'Unknown') THEN 1 ELSE 0 END) AS bad_OBS_VALUE
FROM silver_ilo_data;

