CREATE DATABASE clg;
CREATE DATABASE IF NOT EXISTS clg;

CREATE DATABASE temp1;
CREATE DATABASE temp2;
DROP DATABASE IF EXISTS temp1;
DROP DATABASE temp2;

USE clg;

CREATE TABLE students (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50),
  age INT NOT NULL
);

INSERT INTO students
VALUES("Noman", 18);

INSERT INTO students
VALUES("Nasrullah", 17);

SELECT * FROM students;

SHOW DATABASES;

SHOW TABLES;

DROP TABLE students;

CREATE TABLE stdnt (
  rollno INT PRIMARY KEY AUTO_INCREMENT;
  name VARCHAR(50);
)

SELECT * FROM stdnt;

INSERT INTO stdnt(rollno, name)
VALUES
(52334, "Rahim"),
(89623, "Karim");

INSERT INTO stdnt VALUES (23892, "Jabbar");

CREATE DATABASE google;

USE google;

CREATE TABLE employees (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50),
  salary FLOAT NOT NULL
);

INSERT INTO employees
VALUES 
("Adam", 25000.00),
("Bob", 30000.00),
("Casey", 40000.00);

SELECT * FROM employees;

CREATE TABLE temp1 (
  id INT UNIQUE,
  name VARCHAR(50),
  age INT,
  city VARCHAR(30),
  PRIMARY KEY (id, name)
);

CREATE TABLE temp2 (
  cus_id INT,
  age INT DEFAULT 18,
  FOREIGN KEY (cus_id) references temp1(id)
);

CREATE DATABASE college;

USE college;

CREATE TABLE student (
  rollno INT PRIMARY KEY,
  name VARCHAR(50),
  marks INT NOT NULL,
  grade VARCHAR(1),
  city VARCHAR(30) 
)

INSERT INTO student
(rollno, name, marks, grade, city)
VALUES
(101, "Anil", 90, 'A', "Dhaka"),
(103, "Mahmud", 80, 'B', "Bogura"),
(103, "Enamul", 90, 'A', "Sylhet"),
(104, "Sukumar", 80, 'B', "Rajshahi"),
(105, "Sathi", 80, 'B', "Sylhet"),
(106, "Bhumika", 70, 'C', "Rajshahi");

SELECT name marks FROM student;
SELECT DISTINCT city student;

SELECT * FROM student
WHERE marks >= 80;

SELECT * FROM student
WHERE marks >= 80 AND city = "Rajshahi";

SELECT * FROM student
WHERE marks + 10 >= 100;

SELECT * FROM student
WHERE marks BETWEEN 80 AND 90;

SELECT * FROM student
WHERE city IN ("Dhaka", "Rajshahi");

SELECT * FROM student
WHERE city NOT IN ("Dhaka", "Rajshahi");

SELECT * FROM student
LIMIT 3;

SELECT * FROM student
WHERE marks >= 70 LIMIT 3;

SELECT * FROM student
ORDER BY marks DESC;

SELECT * FROM student
ORDER BY marks DESC LIMIT 3;

SELECT MAX(marks) FROM student;

SELECT MIN(marks) FROM student;

SELECT AVG(marks) FROM student;

SELECT COUNT(rollno) FROM student;

SELECT city, COUNT(rollno) FROM student
GROUP BY city;

SELECT city, name, COUNT(rollno)
FROM student
GROUP BY city, name;

SELECT city, AVG(marks)
FROM student
GROUP BY city 
ORDER BY AVG(marks) ASC;

SELECT grade, COUNT(rollno)
FROM student
GROUP BY grade
ORDER BY grade;

SELECT city, COUNT(rollno)
FROM student
GROUP BY city
HAVING MAX(marks) > 85;

SELECT city, AVG(marks)
FROM student
WHERE grade = 'B'
GROUP BY city
HAVING MAX(marks) >= 80;
ORDER BY AVG(marks) DESC;

--  Safe mode off command
SET SQL_SAFE_UPDATES = 0; 

--  Safe mode on command
SET SQL_SAFE_UPDATES = 1;

UPDATE student
SET grade = 'O';
WHERE grade = 'A'

SELECT * FROM student;

UPDATE student
SET grade = 'A';
WHERE grade = 'O'

UPDATE student
SET marks = 75;
WHERE marks = 70

UPDATE student
SET grade = 'B'
WHERE marks BETWEEN 80 AND 89;

SELECT * FROM student;

UPDATE student
SET marks = marks + 1;

INSERT INTO student
VALUES 
(107, "Anam", 37, "F", "Jashore");

--  Delete row or tuple from TABLE or ralation
DELETE FROM student
WHERE marks < 40;

CREATE TABLE department (
  id INT PRIMARY KEY,
  name VARCHAR(50)
);

INSERT INTO department 
VALUES
(101, "English"),
(102, "IT");

UPDATE department
SET id = 103
WHERE id = 102;

UPDATE department
SET id = 111
WHERE id = 101;

SELECT * FROM department;

CREATE TABLE teacher (
  id INT PRIMARY KEY,
  name VARCHAR(60),
  dept_id INT,
  FOREIGN KEY (dept_id) references department(id)
  ON UPDATE CASCADE
  ON DELETE CASCADE
);

INSERT INTO teacher
VALUES
(101, "Adam", 101),
(102, "Harry", 102);

SELECT * FROM teacher;

SELECT * from student;

--  Add column in relaton or TABLE
ALTER TABLE student
ADD COLUMN age INT NOT NULL DEFAULT 18;

--  Change column name
ALTER TABLE student
CHANGE COLUMN age std_age VARCHAR(3);

--  Modify column name
ALTER TABLE student
MODIFY std_age INT;

--  Delete column in relation or TABLE
ALTER TABLE student
DROP COLUMN std_age;

--  Rname relation or TABLE name
ALTER TABLE student
RENAME TO studentss;

ALTER TABLE studentss
RENAME TO student;

--  Delte all TABLE or relation data's, Not a table or relation. DROP delete this table but TRUNCATE delete all table data's.
TRUNCATE TABLE student;

ALTER TABLE student
CHANGE COLUMN name full_name;

DELETE FROM student
WHERE marks < 80;

ALTER TABLE student
DROP COLUMN grade;

