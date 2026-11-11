# HR Analytics: Employee Retention

End-to-end analysis of 50,000 employee records to understand attrition, pay and work-life balance, built with **Excel, MySQL, Tableau and Power BI**.

> Team project (7 members) | Data Analytics Bootcamp | Sep 2026 – Oct 2026

## Problem Statement
Why do employees leave, is pay fair, and is performance rewarded? This project answers these questions with 6 KPIs and also checks whether the data itself can be trusted for real HR decisions.

## Dataset
- Provided by the ExcelR project team: `HR_1` and `HR_2` (50,000 records each)
- Joined on `EmployeeNumber` (HR_1) = `EmployeeID` (HR_2)

## KPIs Analysed
1. Department-wise attrition rate
2. Average hourly rate of male Research Scientists
3. Attrition rate vs monthly income group
4. Average working years per department
5. Job role vs work-life balance
6. Attrition rate vs years since last promotion

## Tools Used
| Stage | Tool |
|---|---|
| Data cleaning and merging | Excel (Power Query) |
| KPI dashboard | Excel Pivot Tables |
| KPI queries | MySQL |
| Interactive dashboards | Tableau, Power BI |

## Key Insights
- Overall attrition is **50.21%** across 50K employees, with no clear driver (overtime, income, tenure and satisfaction show almost no effect).
- Gender and department split are almost perfectly even (25K male / 25K female), and average pay is flat across departments (about 25K–27K).
- Average work-life balance rating is **2.50 / 4**.
- High and low performance ratings receive almost the same salary hike.
- Tenure fields (years at company, in role, with manager) are internally consistent and reliable.

## Data Quality Findings
- Columns like `StandardHours`, `Over18` and `EmployeeCount` never change and add no analytical value.
- Nearly every category is evenly distributed, which is unusual for a real workforce. The data looks partly synthetic: good for practice, but it needs validation before supporting real HR decisions.

## Dashboard Previews
<!-- Add screenshots here: drag images into this file while editing -->
### Excel
<img width="1219" height="735" alt="image" src="https://github.com/user-attachments/assets/78ed56ce-265d-4361-95cb-e150c179a43c" />

### Power BI
<img width="1512" height="853" alt="image" src="https://github.com/user-attachments/assets/700ac9e4-d8f5-45fd-9beb-f676b946b4db" />

### Tableau
<img width="1699" height="867" alt="HR_Tableau_Dashboard" src="https://github.com/user-attachments/assets/2fe3e573-ee62-4abe-b64f-e61e1c1333a1" />

## Repository Files
| File | Description |
|---|---|
| `HR Analytics SQL.sql` | MySQL queries for all 6 KPIs |
| `HR Analytics Excel.xlsx` | Pivot table dashboard |
| `HR Analytics Power BI.pbix` | Power BI dashboard |
| `HR Analytics Tableau.twbx` | Tableau dashboard |
| `HR Analytics PPT.pptx` | Final presentation |

## My Contribution
Built the **Excel Pivot Table dashboard** and handled **quality checking**.

## Team
Anne Saadhuri (Team Lead, Tableau) · Malepati Rajitha (SQL, QC) · Kartik Kasrale (Power BI) · Shrutika Shantaram Kanse (Reporting) · Ganesh Vitthal Khillari (Documentation) · Sasmita Panigrahi (Data Prep, Reporting) · **Jeeban Jyoti Das** (Excel Dashboard, QC)
