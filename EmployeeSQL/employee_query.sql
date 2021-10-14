
--Q1. create employee details(emp_no, last_name, first_name,sex, salary)
SELECT e.emp_no, e.first_name,e.last_name,e.sex,s.salary 
FROM employees AS e
LEFT JOIN salary AS s
USING (emp_no);

--Q2. list first_name, last_name, hire_date of employees who was hired in 1986

SELECT first_name, last_name, hire_date FROM employees
WHERE EXTRACT(YEAR FROM hire_date)=1986;

-- Q3.LIST the manager of each department with (dept_no,dept_name,emp_no,last_name,first_name)

SELECT m.emp_no AS "Manager", m.dept_no, d.dept_name,dem.emp_no AS "Employee Number",
e.first_name AS "Employee first_name" ,e.last_name AS "Employee last_name"
FROM dept_manager AS m
INNER JOIN department AS d
USING (dept_no)
INNER JOIN dept_emp AS dem
USING (dept_no)
INNER JOIN employees AS e
ON dem.emp_no=e.emp_no
WHERE m.emp_no!=e.emp_no
ORDER BY m.dept_no; 
  
--Q4.List the department of each employee with the following information: 
--employee number, last name, first name, and department name.


CREATE VIEW "Employee_Department" AS 
SELECT e.emp_no, e.first_name,e.last_name,d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS dem
USING (emp_no)
INNER JOIN department AS d
ON dem.dept_no=d.dept_no;

SELECT * FROM "Employee_Department";

--Q5.List first name, last name, and sex for employees
--whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex FROM employees
WHERE first_name='Hercules'
AND last_name LIKE 'B%';

--Q6.List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
SELECT * FROM "Employee_Department"
WHERE dept_name='Sales';

--Q7.List all employees in the Sales and Development departments,
--including their employee number, last name, first name, and department name.
SELECT * FROM "Employee_Department"
WHERE dept_name='Sales'
OR dept_name='Development';

--Q8.In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) AS "Count" FROM employees
GROUP BY last_name
ORDER BY "Count" DESC;







