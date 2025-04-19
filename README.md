# 🎵 Music Store SQL Analysis

This project showcases the use of SQL to analyze a fictional music store database. It involves answering real-world business questions using SQL queries and documenting key insights related to customer behavior, music preferences, and sales performance.

## 📌 Project Highlights

- 🔍 Project Type: SQL Data Analysis (Personal Project)
- 🗃️ Dataset: 11 CSV files including Customers, Invoices, Tracks, Albums, Genres, Employees, etc.
- 🧰 Tools Used: Microsoft SQL Server, Git & GitHub
- 📄 Deliverables: SQL Queries, Business Questions, Final Insight Report (PDF)

## 📁 Folder Structure

```
music-store-sql-analysis/
├── 01_Music_Store_Database_Schema.png
├── 02_Music_Store_Dataset/
├── 03_SQL_Queries_Music_Store.sql
├── 04_Music_Store_Analysis_Questions.pdf
├── 05_Music_Store_Insights_Report.pdf
```

## 🎯 Objectives

- Import CSV files into SQL Server  
- Understand relational database schema  
- Write and execute optimized SQL queries  
- Answer key business questions  
- Generate insights and document findings

## 🧠 Business Questions Answered

- What are the top 3 most purchased music genres?
- Which cities generated the highest revenue?
- Who are the top spending customers?
- What is the distribution of tracks across playlists?
- What is the employee reporting structure?

📄 Full list available in: `04_Music_Store_Analysis_Questions.pdf`

## 💡 Sample SQL Query

```sql
SELECT g.Name AS Genre, COUNT(il.Quantity) AS Total_Purchases
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
JOIN Genre g ON t.GenreId = g.GenreId
GROUP BY g.Name
ORDER BY Total_Purchases DESC;
```

## 📊 Key Insights

- 🎧 Top Genre: Rock is the most purchased genre
- 🌆 Top City: Prague generated the highest sales
- 💰 Top Customer: Richard Cunningham spent the most
- 📂 Playlists: Music playlist distribution identified
- 👨‍💼 Employee Reports: Reporting structure mapped

📘 See full insights → `05_Music_Store_Insights_Report.pdf`

## 🛠 Technologies Used

- SQL Server – Querying and analysis
- Git & GitHub – Version control and project hosting
- DB Diagram – Schema visualization
- Canva/PDF – Reporting

## 🙋‍♂️ About Me

Hi! I'm **Prasenjit Barman**, an aspiring Data Analyst skilled in SQL, Power BI, Excel, and Python.  
I enjoy solving problems with data and turning raw numbers into clear, actionable insights.

🔗 [GitHub](https://github.com/prasenjit1234674)  
🔗 [LinkedIn](https://www.linkedin.com/in/prasenjit-barman-968283359/)

> ⭐ If you found this project helpful, feel free to give it a star and check out more on my GitHub!
