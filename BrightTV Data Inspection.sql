-- Databricks notebook source
SELECT*
FROM brighttv.default.user_profiles
LIMIT 100;
--------------------------------------------------
Gender Checks
--------------------------------------------------
SELECT DISTINCT gender
FROM brighttv.default.user_profiles; 

SELECT DISTINCT
  CASE 
    WHEN gender = 'None' THEN 'unknown'
    WHEN gender = ' ' THEN 'unknown'
    WHEN gender is NULL THEN 'unknown'
    ELSE gender
  END AS sex
FROM brighttv.default.user_profiles;
----------------------------------------------
Race Checks
----------------------------------------------
SELECT DISTINCT race
FROM brighttv.default.user_profiles;

SELECT DISTINCT
  CASE 
    WHEN race = 'other' THEN 'unknown'
    WHEN race = 'None' THEN 'unknown'
    WHEN race = ' ' THEN 'unknown'
    WHEN race is NULL THEN 'unknown'
    ELSE race
  END AS ethnicity
FROM brighttv.default.user_profiles;

SELECT COUNT (DISTINCT userid) AS subs,
  CASE 
    WHEN race = 'other' THEN 'unknown'
    WHEN race = 'None' THEN 'unknown'
    WHEN race = ' ' THEN 'unknown'
    WHEN race is NULL THEN 'unknown'
    ELSE race
  END AS ethnicity
FROM brighttv.default.user_profiles
GROUP BY ethnicity;
---------------------------------------------------------------
Province Checks
---------------------------------------------------------------
SELECT DISTINCT 
  CASE 
    WHEN province = 'None ' THEN 'unknown'
    WHEN province = ' ' THEN 'unknown'
    WHEN province is NULL THEN 'unknown'
    ELSE province
  END AS Region
FROM brighttv.default.user_profiles;
------------------------------------------------------
Age checks
------------------------------------------------------
SELECT MIN (Age) AS min_age,
    MAX (Age) AS max_age,
    AVG (Age) AS mean_age
FROM brighttv.default.user_profiles

SELECT 
    CASE
        WHEN Age = 0 THEN 'Infant'
        WHEN Age BETWEEN 1 AND 12 THEN 'Kids'
        WHEN Age BETWEEN 13 AND 17 THEN 'Youth'
        WHEN Age BETWEEN 18 AND 35 THEN 'Young Adults'
        WHEN Age Between 36 AND 50 THEN 'Adults'
        WHEN Age > 50 AND AGE <=60 THEN 'Elder'
        WHEN Age > 60 THEN 'Pensioner'
    END AS Age_group
FROM brighttv.default.user_profiles;
