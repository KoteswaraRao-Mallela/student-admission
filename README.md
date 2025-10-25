🎯 Project Overview

The Student Admissions Dashboard is an end-to-end data analytics project designed to analyze and visualize university admission trends.
It covers data cleaning (SQL), transformation, and visualization (Power BI) to generate actionable insights for decision-making.

🗂️ Project Structure

File	Description
student_admission_record_dirty.csv	Raw admissions data containing inconsistencies, null values, and duplicates.
data_cleaning_script.sql	SQL script for cleaning and transforming the raw dataset — handles duplicates, nulls, invalid values, and inconsistent text formats.
student_admission_record.csv	Cleaned dataset generated after executing the SQL script — ready for analytics and visualization.
Student Admissions Dashboard.pbix	Power BI dashboard built on the cleaned dataset for admissions trend analysis.
🧹 Data Cleaning Process (SQL)

Key operations performed in data_cleaning_script.sql:

Removed duplicate and null records.

Standardized Name, Gender, City, and Admission Status fields.

Validated numeric fields:

Age between 15 and 30

Admission Test Score and High School Percentage between 0 and 100.

Normalized text case for consistency.

Derived and verified final dataset ready for dashboard use.

📊 Dashboard Insights (Power BI)

Main KPIs:

Total Applicants

Accepted Applicants

Rejected Applicants

Average High School Percentage

Average Test Score

Acceptance Rate (%)

Key Visuals:

👥 Gender Distribution of Applicants

🏙️ Top 10 Cities by Application Volume

📈 Average High School % vs Test Score

🗺️ Geographical Distribution of Applicants

🥧 Applicants by Admission Status

Filters / Slicers:

City

Age

Admission Status

(Optional) Gender

💡 Business Insights

Multan and Quetta generated the highest applicant volume.

Overall acceptance rate: 43%.

Female applicants slightly outperform males in test performance.

Students with higher high-school % and test scores have higher acceptance odds.

City-level data supports targeted outreach campaigns for underrepresented regions.

🧠 Tools & Technologies

SQL – Data cleaning and validation

Power BI – Data visualization and KPI analysis

Excel/CSV – Data export/import formats

🧾 How to Use

Run the SQL script data_cleaning_script.sql on your MySQL or SQL environment.

Export the cleaned data as student_admission_record.csv.

Open Student Admissions Dashboard.pbix in Power BI Desktop.

Update data source path if required (Transform Data → Data Source Settings).

Refresh to view the latest results.

🏁 Outcome

A fully interactive Admissions Analysis Dashboard showing:

Admission patterns by region, gender, and performance.

Actionable insights for improving recruitment strategy.

Clean, ready-to-publish project for analytics portfolios.

👤 Author

Koteswara Rao Mallela
📧 koteswararao.mallela9@gmail.com
💬 Data Analyst | Business Intelligence | SQL | Power BI | Data Visualization
