
# 🛒 Walmart Sales Data Analysis Project

This project is a complete end-to-end analysis of Walmart’s retail sales dataset using PostgreSQL and Python. The goal was to extract meaningful insights from transactional sales data and answer real business questions using data cleaning, SQL queries, and Python-based visualization.

The project is inspired by a YouTube tutorial, but this version reflects my own structuring, analysis, and presentation. All files used and steps taken are included and documented.

---

## 📁 Files Included

- `Walmart.csv` – Raw sales data
- `walmart-sales-datasets-cleaned.csv` – Cleaned dataset after preprocessing
- `Walmart Postgresql.sql` – SQL file to create and populate database tables
- `walmartData.ipynb` – Jupyter notebook with EDA, visualizations, and analysis
- `walmart-10k-sales-datasets.zip` – Compressed archive of the dataset
- `requirements.txt` – Python libraries used in the project

---

## 🧰 Tools & Libraries Used

- **Database**: PostgreSQL
- **Python Libraries**: pandas, sqlalchemy, pymysql, psycopg2
- **Notebook**: Jupyter

---

## 🚀 How to Run the Project

1. **Set up a Python environment** (e.g., `venv`):
    ```powershell
    .\myproj_env1\Scripts\Activate.ps1
    ```

2. **Install required libraries**:
    ```bash
    pip install -r requirements.txt
    ```

3. **Load the data into PostgreSQL**:
    - Run the SQL script `Walmart Postgresql.sql` to create and populate the database.

4. **Launch the Jupyter notebook**:
    ```bash
    jupyter notebook walmartData.ipynb
    ```

---

## 🔍 Business Questions Explored

- Which branch brings in the most revenue?
- What are the busiest hours and days?
- What product lines are the best sellers?
- Which city has the highest customer ratings?
- Which payment methods are most preferred?
- Do customer types (Member vs Normal) affect sales or ratings?

---

## 📊 Key Insights

- **Branch C** consistently shows the highest revenue and customer satisfaction.
- **Evenings (6-9 PM)** tend to have the most transactions across all branches.
- **Electronic Accessories** and **Food and Beverages** are top-performing product lines.
- **Ewallets** are increasingly popular, especially in urban areas.
- Customer ratings skew slightly higher in **Yangon** and **Naypyitaw** compared to **Mandalay**.

---

## ✅ What I Did Differently

- Cleaned and validated raw data before running any queries.
- Reorganized project structure for better readability and access.
- Wrote custom SQL queries using `GROUP BY`, `CASE`, and `JOIN`s.
- Integrated SQL data pulls directly into Python using SQLAlchemy.
- Produced clear, labeled charts for each key insight.
- Wrote detailed markdown commentary throughout the notebook.

---

## 📦 Requirements

Python libraries needed:

```
pandas
pymysql
sqlalchemy
psycopg2
```

Install all at once:

```bash
pip install -r requirements.txt
```

---

## 📄 License

MIT License

---

## 🙌 Acknowledgments

Big thanks to [Tushar Kumar](https://www.youtube.com/watch?v=49C3Mkmhskg) for the YouTube tutorial that inspired this project. I used his repo as a guide and made the project my own by restructuring and customizing the analysis.

---

## 🔗 Connect

Feel free to connect if you want to discuss the project or collaborate.

- GitHub: [your-username](https://github.com/your-username)
- LinkedIn: [your-link](https://linkedin.com/in/your-link)
