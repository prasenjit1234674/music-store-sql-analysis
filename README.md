# 🎵 Music Store SQL Analysis

This project demonstrates the use of SQL to perform data analysis on a fictional music store database. The analysis helps answer critical business questions related to customer behavior, music trends, sales performance, and employee records.

## 📌 Project Highlights

- 📊 Tool Used: Microsoft SQL Server
- 🗃️ Dataset: 11 CSV files covering customers, employees, invoices, genres, playlists, and tracks
- 🧠 Focus: SQL joins, aggregations, subqueries, window functions, filtering & sorting
- 📄 Documentation: PDF-based business questions and insights report included

## 📁 Project Structure

music-store-sql-analysis/ ├── 01_Music_Store_Database_Schema.png ├── 02_Music_Store_Dataset/ ├── 03_SQL_Queries_Music_Store.sql ├── 04_Music_Store_Analysis_Questions.pdf ├── 05_Music_Store_Insights_Report.pdf


## 🎯 Objectives

- Import CSV datasets into SQL Server  
- Understand schema relationships  
- Write and execute optimized SQL queries  
- Generate actionable business insights  
- Document the process in a professional report

## 💡 Sample Questions Answered

- Which genres are most popular by number of purchases?
- Which city generated the most revenue?
- Which customers are top spenders?
- Who are the employees and who do they report to?
- What is the distribution of tracks across playlists?

## 🧰 Tools & Technologies Used

- SQL Server (Querying & Analysis)
- DB Browser / SSMS (for database work)
- Git & GitHub (Version control)
- VS Code / Notepad++ (Query editing)
- PDF & Canva (Reporting)

## 📌 Sample SQL Query

```sql
SELECT c.FirstName + ' ' + c.LastName AS Customer,
       SUM(i.Total) AS Total_Spent
FROM Invoice i
JOIN Customer c ON i.CustomerId = c.CustomerId
GROUP BY c.FirstName, c.LastName
ORDER BY Total_Spent DESC;
📎 Reports & Deliverables
🔍 04_Music_Store_Analysis_Questions.pdf — A list of 15+ analysis questions

📑 05_Music_Store_Insights_Report.pdf — Clean insights, KPIs, and charts

🧾 03_SQL_Queries_Music_Store.sql — All SQL queries used

🧭 01_Music_Store_Database_Schema.png — Database schema visualization

🙋‍♂️ About Me
Hi, I'm Prasenjit Barman, an aspiring Data Analyst skilled in SQL, Power BI, Excel, and Python.
I love exploring real-world datasets and converting raw data into valuable business insights.

📎 My GitHub
📎 My LinkedIn
