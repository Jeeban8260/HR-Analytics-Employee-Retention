 CREATE DATABASE IF NOT EXISTS hr_analytics;
USE hr_analytics;
SELECT 'hr_1' AS table_name, COUNT(*) AS total_rows
FROM hr_analytics.hr_1
UNION ALL
SELECT 'hr_2', COUNT(*)
FROM hr_analytics.hr_2;
SHOW COLUMNS FROM hr_analytics.hr_2;

SELECT COUNT(*) AS total_rows,
       COUNT(DISTINCT EmployeeNumber) AS unique_ids
FROM hr_analytics.hr_1;

SELECT COUNT(*) AS total_rows,
       COUNT(DISTINCT EmployeeID) AS unique_ids
FROM hr_analytics.hr_2;

SELECT 'hr_1' AS table_name,
       COUNT(*) AS total_rows,
       COUNT(DISTINCT EmployeeNumber) AS unique_ids
FROM hr_analytics.hr_1
UNION ALL
SELECT 'hr_2',
       COUNT(*),
       COUNT(DISTINCT EmployeeID)
FROM hr_analytics.hr_2;

SELECT COUNT(*) AS matched_employees
FROM hr_analytics.hr_1 AS h1
INNER JOIN hr_analytics.hr_2 AS h2
    ON h1.EmployeeNumber = h2.EmployeeID;
    
    /* KPI 1: Department-wise Attrition Rate */
    SELECT Department,
       COUNT(*) AS total_employees,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
           AS employees_left,
       ROUND(
           100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
           / COUNT(*), 2
       ) AS attrition_rate_pct
FROM hr_analytics.hr_1
GROUP BY Department
ORDER BY attrition_rate_pct DESC;

/* KPI 2: Male Research Scientists average hourly rate */
SELECT ROUND(AVG(HourlyRate), 2) AS avg_hourly_rate
FROM hr_analytics.hr_1
WHERE Gender = 'Male'
  AND JobRole = 'Research Scientist';
  
  /* KPI 3: Income Group Attrition */
  SELECT
    CASE
        WHEN h2.MonthlyIncome < 20000 THEN 'Low'
        WHEN h2.MonthlyIncome < 40000 THEN 'Medium'
        ELSE 'High'
    END AS income_group,
    ROUND(
        100.0 * SUM(CASE WHEN h1.Attrition = 'Yes'
                        THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS attrition_rate_pct
FROM hr_analytics.hr_1 AS h1
JOIN hr_analytics.hr_2 AS h2
    ON h1.EmployeeNumber = h2.EmployeeID
GROUP BY income_group;

  /* KPI 4: Average Working Years by Department */
SELECT h1.Department,
       ROUND(AVG(h2.TotalWorkingYears), 2) AS avg_working_years
FROM hr_analytics.hr_1 AS h1
JOIN hr_analytics.hr_2 AS h2
    ON h1.EmployeeNumber = h2.EmployeeID
GROUP BY h1.Department
ORDER BY avg_working_years DESC;

/* KPI 5: Average Work-Life Balance by Job Role */
 SELECT h1.JobRole,
       ROUND(AVG(h2.WorkLifeBalance), 2) AS avg_work_life_balance
FROM hr_analytics.hr_1 AS h1
JOIN hr_analytics.hr_2 AS h2
    ON h1.EmployeeNumber = h2.EmployeeID
GROUP BY h1.JobRole
ORDER BY AVG(h2.WorkLifeBalance) DESC;

/* KPI 6: Attrition by Years Since Last Promotion */
/* KPI 6: Attrition by Years Since Last Promotion */
SELECT
    CASE
        WHEN h2.YearsSinceLastPromotion <= 10 THEN '0-10 Years'
        WHEN h2.YearsSinceLastPromotion <= 20 THEN '11-20 Years'
        WHEN h2.YearsSinceLastPromotion <= 30 THEN '21-30 Years'
        ELSE '31+ Years'
    END AS promotion_group,
    ROUND(
        100.0 * SUM(CASE WHEN h1.Attrition = 'Yes'
                        THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS attrition_rate_pct
FROM hr_analytics.hr_1 AS h1
JOIN hr_analytics.hr_2 AS h2
    ON h1.EmployeeNumber = h2.EmployeeID
GROUP BY promotion_group
ORDER BY MIN(h2.YearsSinceLastPromotion);
    