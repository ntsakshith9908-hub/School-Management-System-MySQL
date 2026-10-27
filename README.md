# School Management System using MySQL

## About the Project

I created this project as part of my MySQL practice. The main idea is to store student details, subjects, exam information, and marks in a database and use SQL queries to get useful information from it.

I created four tables and connected them using primary keys and foreign keys. I also wrote nine queries to practice different SQL concepts, from basic SELECT statements to joins, subqueries, and aggregate functions.

## Tools Used

- MySQL
- MySQL Workbench
- SQL
- GitHub

## Database Tables

  The database name is `school_management`.

**1. Students**

This table stores the first name, last name, and ID of each student.

**2. Subjects**

This table contains the subject ID and subject name, such as Mathematics, Science, Hindi, and English.

**3. Exams**

This table stores the exam ID, exam name, and exam date. I included the exam date to practice sorting exams from newest to oldest.

**4. Marks**

This table stores the marks obtained by each student in a particular subject and exam. It uses foreign keys to connect the other three tables.

## What I Implemented

I worked on the following SQL questions as part of the project:

1. Display the first and last names of all students.
2. Find marks greater than 80.
3. Display exams in descending order of their dates.
4. Show student names, subjects, and their scores using joins.
5. Calculate the average score for each subject.
6. Count the marks recorded for Aarav Sharma.
7. Find the student who scored the highest marks.
8. Display exams whose total scores are greater than 250.
9. Generate a Pass/Fail report, where a score of 70 or above is a pass.

## How to Run the Project

1. Install MySQL Server and MySQL Workbench.
2. Download or clone this repository.
3. Open `school_management.sql` in MySQL Workbench.
4. Connect to your MySQL server.
5. Execute the SQL script.
6. Check the tables and run the queries to see the results.

You can also run the script from the MySQL command line:

```bash
mysql -u YOUR_USERNAME -p < school_management.sql
```

Replace `YOUR_USERNAME` with your MySQL username. Enter your password when prompted.

**Note:** The script recreates the tables and inserts the sample data. Running it again will remove the existing tables and their data before creating them again.

## Sample Data

I used sample records to test the queries.

| Table | Number of Records |
|---|---:|
| Students | 6 |
| Subjects | 4 |
| Exams | 3 |
| Marks | 26 |

The data includes both passing and failing scores so that I could test the final report.

## SQL Concepts Practiced

While working on this project, I practiced:

- Creating databases and tables
- Inserting records
- SELECT and WHERE
- ORDER BY
- INNER JOIN
- GROUP BY and HAVING
- COUNT, SUM, AVG, and MAX
- Subqueries
- CASE statements
- Primary keys and foreign keys

## Project Files

```text
school-management-mysql/
├── school_management.sql
├── README.md
└── screenshots/
```

The SQL file contains the table creation statements, sample data, and practice queries. The screenshots folder can contain the query outputs captured in MySQL Workbench.

## What I Learned

Through this project, I got more practice with writing SQL queries and connecting related tables. I also learned how aggregate functions can be used to calculate averages and totals, and how CASE statements can be used to classify scores.

## Future Improvements

In the future, I would like to add student attendance, more detailed academic reports, and a simple interface to make the system easier to use.
