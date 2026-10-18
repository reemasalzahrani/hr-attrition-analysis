-- Employee Attrition Analysis (IBM HR Dataset)
-- Table name: hr

-- 1. Employees by department
SELECT Department, COUNT(*) AS total_employees
FROM hr
GROUP BY Department;

-- 2. Attrition rate by department
SELECT Department,
       COUNT(*) AS total,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS left_count,
       ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 1) AS attrition_pct
FROM hr
GROUP BY Department
ORDER BY attrition_pct DESC;

-- 3. Attrition rate by overtime
SELECT OverTime,
       COUNT(*) AS total,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS left_count,
       ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 1) AS attrition_pct
FROM hr
GROUP BY OverTime
ORDER BY attrition_pct DESC;

-- 4. Attrition rate by monthly income band
SELECT CASE
         WHEN MonthlyIncome < 3000 THEN '1. Under 3000'
         WHEN MonthlyIncome < 6000 THEN '2. 3000-5999'
         WHEN MonthlyIncome < 10000 THEN '3. 6000-9999'
         ELSE '4. 10000+'
       END AS income_band,
       COUNT(*) AS total,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS left_count,
       ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 1) AS attrition_pct
FROM hr
GROUP BY income_band
ORDER BY income_band;

-- 5. Average age and tenure: employees who left vs stayed
SELECT Attrition,
       COUNT(*) AS total,
       ROUND(AVG(YearsAtCompany), 1) AS avg_years_at_company,
       ROUND(AVG(Age), 1) AS avg_age
FROM hr
GROUP BY Attrition;
