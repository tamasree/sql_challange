DROP TABLE salary;
DROP TABLE dept_manager;
DROP VIEW "Employee_Department";
DROP TABLE department,dept_emp,titles,employees;

--crete table department
CREATE TABLE department(dept_no VARCHAR PRIMARY KEY NOT NULL,
						dept_name VARCHAR);
SELECT * FROM department;

--create table dept_emp

CREATE TABLE dept_emp(emp_no INT,
					 dept_no VARCHAR,
					  PRIMARY KEY (emp_no,dept_no),
					 FOREIGN KEY (dept_no)REFERENCES department(dept_no));

SELECT * FROM dept_emp;

--create table titles

CREATE TABLE titles(title_id VARCHAR PRIMARY KEY,
				   title VARCHAR);
SELECT * FROM titles;

--create table employees

CREATE TABLE employees(emp_no INT PRIMARY KEY NOT NULL,
					 emp_title VARCHAR,
					 birth_date DATE,
					  first_name VARCHAR,
					  last_name VARCHAR,
					  SEX VARCHAR(1),
					  hire_date DATE,
					  FOREIGN KEY (emp_title)REFERENCES titles(title_id));
					  
SELECT * FROM employees;				   
				   
--create table dept_manager

CREATE TABLE dept_manager(dept_no VARCHAR,
						 emp_no INTEGER,
						  PRIMARY KEY(dept_no, emp_no),
						 FOREIGN KEY(dept_no) REFERENCES department(dept_no),
						  FOREIGN KEY(emp_no) REFERENCES employees(emp_no));

SELECT * FROM dept_manager;

--create table salary

CREATE TABLE salary(emp_no INT PRIMARY KEY NOT NULL,
				   salary INT,
				   FOREIGN KEY (emp_no)REFERENCES employees(emp_no));
SELECT * FROM salary;	













