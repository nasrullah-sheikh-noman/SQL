--  create a new database named "company".
CREATE DATABASE company;
CREATE DATABASE company1;
CREATE DATABASE company2;

--  Select the "compnay" database for operations
USE company;

--  list all available databases.
SHOW databases;

--  Delete database using the database name.
DROP DATABASE company1;

--  Display currently activate databases.
SELECT DATABASE();

--  Creating a structured table to store employees data.
CREATE TABLE employees(
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  department VARCHAR(30),
  salary DECIMAL(10,2),
  hiring_date DATE
);

--  Show table
DESCRIBES employees;

--  Insert one records or data in table
INSERT INTO employees(name, department, salary, hiring_date);
VALUES("Rahim", "IT", 80000.00, "2022-09-1");

--  Inset multiple records or data in table
INSERT INTO employees
VALUES 
("Karim", "HR", 40000.00, "2023-04-10"),
("Jabbar", "Marketing", 30000.00, "2023-10-01"),
("sadman", "Finance", 35000.00, "2021-12-01");

--  Partial insert
INSERT INTO employees(name, department);
VALUES("Nilima", "Sales");

--  Retrives all data from employees table.
SELECT * FROM employees;

--  Display complete table creation syntax.
SHOW CREATE TABLE employees;

--  List all tables in current databases.
SHOW TABLES;

--  Gets only specific attributes or colurms from table.
SELECT name , department FROM employees;

--  Filter for "IT" department staff.
SELECT * FROM employees
WHERE department = "IT";

--  Shows news hires first (DESC=Desending, ASC=Ascending)
SELECT * FROM employees
 ORDER BY hiring_date DESC;

--  Display attributes or colums with aliases
SELECT name AS employee_name, salary AS employee_salary FROM employees;

--  Returned salary above 35000
SELECT * FROM employees
WHERE salary > 35000;

--  Excludes HR department employees
SELECT * FROM employees
WHERE department <> "HR";

--  Used logical AND operator
SELECT * FROM employees
WHERE department = "HR" AND salary > 30000;

--  Check if a value exist in a relation or table or list.
SELECT * FROM employees
WHERE department IN ("IT", "Marketing");

--  Excludes certain category
SELECT * FROM employees
WHERE department NOT IN ("Health Care", "Sales");

--  Range filtering(BETWEEN)
SELECT * FROM employees
WHERE hiring_date BETWEEN "2023-10-01" AND "2025-01-01";


--  LIKE(Pattern matching with "%" AND "_").
--  % = any number of characters. if use ("A&") this way any number of characters in string after A, if use ("%A") this way any number of characters in strign before A. if use ("%n%") this way, if n exist in string return this tuples(row).
--  _ = single character
SELECT * FROM employees
WHERE name LIKE "%n";

SELECT * FROM employees
WHERE name LIKE "R%";

SELECT * FROM employees
WHERE name LIKE "Kari_";

--  Checks for missing or non-missing value (IS NULL, IS NOT NULL).
SELECT * FROM employees
WHERE salary IS NOT NULL;

SELECT * FROM employees
WHERE salary IS NULL;

--  Sorting Data(ORDER BY)
SELECT & FROM employees 
ORDER BY salary ASC, name ASC;

--  Retrive only the first N employees(LIMIT(Top N rows)), serially who's info add in relation or table 
SELECT & FROM employees 
LIMIT 2;

--  High salary's employees (OFFSET=Skips rows before returing result(userfull for pagination)).
SELECT & FROM employees ORDER BY salary DESC LIMIT 2 OFFSET 1;

--  Count all employees records or row or tuples
SELECT COUNT(*) FROM employees;

--  Count specific department employees
SELECT COUNT(*) FROM employees 
WHERE department "IT";

--  Count unique departments
SELECT COUNT(DISTINT department) FROM employees;

--  SUM() = Total sum of numeric COLUMN.
SELECT SUM(salary) FROM employees;

--  Salary sum for hires after 2023.
SELECT SUM(salary) FROM employees hiring_date > "2024-01-01";

--  Average salary accross comapny.
SELECT AVG(salary) FROM employees;

--  Average salary in specefic department.
SELECT AVG(salary) FROM employees
WHERE department = "IT";

--  MIN() & MAX() (Finding Extremes).
SELECT MIN(salary), MAX(salary) FROM employees;

--  Recent joined employee
SELECT MAX(hiring_date) FROM employees
WHERE department = "IT";

INSERT INTO employees
VALUES
("saimon", "HR", 50000.00, "2021-03-13"),
("Khairul", "Marketing", 40000.00, "2022-07-14"),
("Sohel", "Finance", 45000.00, "2024-09-11")
("Johir", "HR", 30000.00, "2020-01-16"),
("Jubayer", "Marketing", 40000.00, "2021-11-21"),
("Siam", "Finance", 45000.00, "2022-02-21")
("Kuddus", "HR", 50000.00, "2025-042-17"),
("Joynal", "Marketing", 60000.00, "2020-05-28"),
("Sultan", "Finance", 35000.00, "2025-11-30")
("Kaiyum", "HR", 30000.00, "2022-12-19"),
("Jahidul", "Marketing", 50000.00, "2021-08-27"),
("Sumon", "Finance", 25000.00, "2026-04-07")
("Kasem", "HR", 55000.00, "2023-06-25"),
("Jihad", "Marketing", 35000.00, "2025-03-23"),
("Saddam", "Finance", 55000.00, "2024-05-18")
("Shamin", "IT", 90000.00, "2021-06-17")
("Shanto", "IT", 85000.00, "2022-08-13")
("Nilima", "IT", 76000.00, "2022-01-19")
("Najmul", "IT", 100000.00, "2022-02-15")
("Mujammel", "IT", 95000.00, "2022-05-16");

--  Employee count by department.
SELECT department, COUNT(*) FROM employees GROUP BY department;

--  Average salary by department(for 40k > salaries).
SELECT department, AVG(salary) employees
WHERE salary > 40000 GROUP BY department;

--  If department employees count > 2 then show output.
SELECT department, COUNT(*) employees
GROUP BY department HAVING COUNT(*) > 2;

--  If department AVG salary > 40K then show output.
SELECT department, AVG(salary) employees 
GROUP BY department HAVING AVG(*) > 40000;

--  If every each department salaries sum > 200k then show output.
SELECT department, SUM(salary) FROM employees
GROUP BY department HAVING SUM(salary) > 200000;

--  Safe mode off command
SET SQL_SAFE_UPDATES = 0; 

--  Safe mode on command
SET SQL_SAFE_UPDATES = 1;

--  Update salary for employee using id.
UPDATE FROM employees SET salary = 80000
WHERE id = 5;

--  Update multiple attributes or colurm for specific employee
UPDATE FROM employees SET salary = 7500, department = "IT" 
WHERE id = 7;

--  DELETE employee using id
DELETE FROM employees WHERE id = 8;

--  Add new attribute or COLUMN in on relation or TABLE.
ALTER TABLE employees ADD email VARCHAR(120);

--  Remove attribute or COLUMN in on relation or TABLE.
ALTER TABLE employees
DROP COLUMN email;

--  Modify attribute or COLUMN info in on relation or TABLE.
ALTER TABLE employees
MODIFY name VARCHAR(150);

--  Rename relation or TABLE name.
RENAME TABLE employees TO Employees;

--  ⚠️ Danger Zone  ⚠️
DELETE TABLE employees;
--  Or
DELETE FROM employees;

--  =============================== JOINS IN SQL ====================================

CREATE DATABASE college;

USE college;

CREATE TABLE student (
  id INT PRIMARY KEY,
  name VARCHAR(50)
);

INSERT INTO student (id, name)
VALUES
(101, "rahim"),
(102, "karim"),
(103, "Jabbam");

CREATE TABLE course (
  id INT PRIMARY KEY,
  subject VARCHAR(80)
);

INSERT INTO course (id, course)
VALUES
(102, "English"),
(104, "Math"),
(103, "Science"),
(104, "Computer Science");

--  INNER JOIN in 2 tables. INNER JOIN returns records that have matching values in both tables.
SELECT * FROM student AS s         --  Use aliases
INNER JOIN course AS c    --  Use aliases
ON s.id = c.id;

--  LEFT JOIN in 2 tables, LEFT JOIN returns all records from the left table, and the matched records from the right table.
SELECT * FROM student AS s
LEFT JOIN course AS c
ON s.id = c.id;

--  RIGHT JOIN in 2 tables, RIGHT JOIN returns all records from the right table, and the matched records from the left table.
SELECT * FROM student AS s
RIGHT JOIN course AS c 
ON s.id = c.id;

--  FULL JOIN in 2 tables, FULL JOIN returns all records when there is a match in either left or right table.
SELECT * FROM student AS s
LEFT JOIN course AS c 
ON s.id = c.id 
UNION
SELECT * FROM student AS s 
RIGHT JOIN course AS c 
ON s.id = c.id;

--  LEFT Exclusive JOIN in 2 tables, LEFT Exclusive JOIN returns all records from the left table where don't matched the records from the right table.
SELECT * FROM student AS a 
LEFT JOIN course As b 
ON a.id = b.id
WHERE b.id IS NULL;

--  RIGHT Exclusive JOIN in 2 tables, RIGHT Exclusive JOIN returns all records from the right table where don't matched the records from the left table.
SELECT * FROM student AS a 
RIGHT JOIN course AS b 
ON a.id = b.id 
WHERE a.id IS NULL;

--  LEFT & RIGHT Includive JOIN in 2 tables, LEFT & RIGHT Inclusive JOIN returns when there is a match in left and right table.
SELECT * FROM student AS a 
LEFT JOIN course AS b 
ON a.id = b.id 
WHERE b.id IS NOT NULL;

--  Self JOIN, It's a regular join but the table is joined with itself.
CREATE TABLE employee(
  id INT PRIMARY KEY,
  name VARCHAR(60),
  manager_id INT
);

INSERT INTO employee (id, name, manager_id)
VALUES
(101, "adam", 103),
(102, "kali", 104),
(103, "Bob", NULL),
(104, "John", 103);

SELECT * FROM employee;

SELECT * FROM employee AS a 
JOIN employee AS b 
ON a.id = b.manager_id;

--  Self JOIN syntax
SELECT a.name AS manager_name, b.name 
from employee AS a 
JOIN employee AS b 
ON a.id = b.manager_id;

--  UNION. UNION return all UNIQUE values.
SELECT name FROM employee
UNION
SELECT name FROM employee;

--  UNION ALL, UNION ALL returned value if this value included multiple set.
SELECT name FROM employee
UNION ALL 
SELECT name FROM employee;

--  SQL sub queries
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
(103, "Mahmud", 80, 'B', "Rajshahi"),
(103, "Enamul", 90, 'A', "Sylhet"),
(104, "Sukumar", 80, 'B', "Rajshahi"),
(105, "Sathi", 80, 'B', "Sylhet"),
(106, "Bhumika", 70, 'C', "Rajshahi");

SELECT * FROM student;

--  SQL sub query syntax - find the person name and mark who's mark is getter then of average mark of all students.
SELECT name, marks
FROM student
WHERE marks > (
  SELECT AVG(marks) 
  FROM student
);

--  find the names of all students with even roll numbers. using subquery
SELECT name, rollno
FROM student
WHERE rollno IN (
  SELECT rollno
  FROM student
  WHERE rollno % 2 == 0
);

--  Find the max marks from the students of Rajshahi. using SQL sub query.
SELECT name, MAX(marks)
FROM (
  SELECT *
  FROM student
  WHERE city = "Rajshahi"
);

--  Find the max marks from the students of Rajshahi.
SELECT name, MAX(marks)
FROM student
WHERE city = "Rajshahi";

