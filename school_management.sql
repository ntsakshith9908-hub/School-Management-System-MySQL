# mini project 
# Project title: School Management System
CREATE DATABASE IF NOT EXISTS school_management;
show databases;
use school_management;
# Students table
CREATE TABLE Students (
	student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
    );

DESC Students;

# Subjects table
CREATE TABLE Subjects (
	subject_id INT PRIMARY KEY AUTO_INCREMENT,
    subject_name VARCHAR(100) NOT NULL UNIQUE
);

DESC Subjects;

# Exams table 
CREATE TABLE Exams (
	exam_id INT PRIMARY KEY AUTO_INCREMENT,
    exam_name VARCHAR(100) NOT NULL
);

DESC Exams;

# Marks table 
CREATE TABLE Marks (
	mark_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    exam_id INT NOT NULL,
    score DECIMAL(5, 2) NOT NULL,
    FOREIGN KEY(student_id) REFERENCES Students(student_id),
	FOREIGN KEY(subject_id) REFERENCES Subjects(subject_id),
    FOREIGN KEY(exam_id) REFERENCES Exams(exam_id)
);

DESC Marks;

# Add exam date for Question 3
ALTER TABLE Exams 
ADD COLUMN exam_date DATE;

DESC Exams;

# inserting students data 
INSERT INTO Students 
(first_name, last_name) VALUES 
('Kanna', 'Praveen'),
('Virat', 'Kohli'),
('Arjun', 'Reddy'),
('Allu', 'Arjun'),
('Bhagat', 'Singh'),
('Priya', 'Sharma'),
('fit', 'Vatsav');

select * from Students;

# inserting subjects data 
INSERT INTO Subjects
(subject_id, subject_name) VALUES 
(1, 'Mathematics'),
(2, 'Physics'),
(3, 'English'),
(4, 'Hindi');

select * from Subjects;

# inserting exams data 
INSERT INTO Exams
(exam_id, exam_name, exam_date) VALUES 
(1, 'Quarterly', '2025-11-20'),
(2, 'Half-Yearly', '2026-03-25'),
(3, 'Annual Exam', '2026-08-28');

select * from Exams;

# inserting marks data 
INSERT INTO Marks
(student_id, subject_id, exam_id, score) VALUES 
(1,1,1,85), (1,2,1,78), (1,3,1,92),
(1,4,1,74), (1,1,2,88), (1,2,2,91),
(2,1,1,95), (2,2,1,89), (2,3,2,84),
(2,4,2,90), (3,1,1,67), (3,2,2,72),
(3,3,2,68), (3,4,3,81), (4,1,2,76),
(4,2,2,82), (4,3,3,88), (4,4,3,79),
(5,1,1,58), (5,2,1,64), (5,3,2,71),
(5,4,3,69), (6,1,2,93), (6,2,3,96),
(6,3,3,87), (6,4,3,91);

SELECT * FROM Marks;

-- Q1. Retrieve first name and last name of every student.
SELECT first_name, last_name FROM Students;

--  Q2. Marks with scores greater than 80
SELECT * FROM marks WHERE score > 80;

-- Q3. Exams sorted by their date, starting with the most recent.
SELECT exam_name, exam_date FROM Exams
ORDER BY exam_date DESC;


-- Q4. Student name, subject and score
SELECT s.first_name, sub.subject_name, m.score
from Marks m
JOIN Students s 
ON m.student_id = s.student_id
JOIN Subjects sub 
ON m.subject_id = sub.subject_id;

-- Q5. Calculate the average score for each subject
SELECT sub.subject_name, ROUND(AVG(m.score), 2) as average_score
from Subjects sub
JOIN Marks m
ON sub.subject_id = m.subject_id
GROUP BY sub.subject_id, sub.subject_name;
 
-- Q6. Count Exams: Count marks recorded for Priya Sharma
SELECT COUNT(m.mark_id) AS marks_recorded 
from Students s
JOIN Marks m
ON s.student_id = m.student_id
WHERE s.first_name = 'Priya' AND s.last_name = 'Sharma';

-- Q7. Student with the highest single score in any exam 
SELECT s.first_name, s.last_name, m.score 
from Students s 
JOIN Marks m 
ON s.student_id = m.student_id
WHERE m.score = (SELECT MAX(score) from Marks);	

-- Q8. Display exams whose total score exceeds 250
SELECT e.exam_name, SUM(m.score) As total_score
from Exams e 
JOIN Marks m 
ON e.exam_id = m.exam_id
GROUP BY e.exam_id, e.exam_name
HAVING SUM(m.score) > 250; 
-- Q9. Pass/fail report "Pass" if the score is 70 or above, and "Fail" if below.
SELECT CONCAT(s.first_name, ' ', s.last_name) AS student_name, 
	sub.subject_name, 
    m.score,
	CASE 
		WHEN m.score >= 70 THEN 'Pass' 
		ELSE 'Fail' 
	END AS status
from Marks m
JOIN Students s ON m.student_id = s.student_id
JOIN Subjects sub ON m.subject_id = sub.subject_id;
