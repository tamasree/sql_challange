-- drop table if exists

DROP TABLE IF EXISTS salary;
DROP TABLE IF EXISTS dept_manager;
DROP VIEW IF EXISTS "Employee_Department";
DROP TABLE IF EXISTS department,dept_emp,titles,employees;

--crete table department
CREATE TABLE department(dept_no VARCHAR PRIMARY KEY NOT NULL,
						dept_name VARCHAR);

-- verify successful data import
SELECT * FROM department;

--create table dept_emp

CREATE TABLE dept_emp(emp_no INT,
					 dept_no VARCHAR,
					  PRIMARY KEY (emp_no,dept_no),
					 FOREIGN KEY (dept_no)REFERENCES department(dept_no));

-- verify successful data import
SELECT * FROM dept_emp;

--create table titles

CREATE TABLE titles(title_id VARCHAR PRIMARY KEY,
				   title VARCHAR);
-- verify successful data import
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

-- verify successful data import					  
SELECT * FROM employees;				   
				   
--create table dept_manager

CREATE TABLE dept_manager(dept_no VARCHAR,
						 emp_no INTEGER,
						  PRIMARY KEY(dept_no, emp_no),
						 FOREIGN KEY(dept_no) REFERENCES department(dept_no),
						  FOREIGN KEY(emp_no) REFERENCES employees(emp_no));

-- verify successful data import
SELECT * FROM dept_manager;

--create table salary

CREATE TABLE salary(emp_no INT PRIMARY KEY NOT NULL,
				   salary INT,
				   FOREIGN KEY (emp_no)REFERENCES employees(emp_no));
-- verify successful data import
SELECT * FROM salary;	













