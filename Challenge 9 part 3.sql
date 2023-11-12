-----------------------------------------------------------------------------------------
--List the employee number, last name, first name, sex, and salary of each employee.
-----------------------------------------------------------------------------------------

SELECT
	E.emp_no, 
	E.last_name,
	E.first_name,
	E.sex,
	S.salary
FROM
	employees as E join salaries as S on E.emp_no = S.emp_no;
	
-----------------------------------------------------------------------------------------
--List the first name, last name, and hire date for the employees who were hired in 1986.
-----------------------------------------------------------------------------------------

SELECT
	E.first_name,
	E.last_name,
	E.hire_date
FROM
	employees as E 
WHERE
	E.hire_date between '1986-01-01' and '1986-12-31';
	
--------------------------------------------------------------------------------------------------------------------------------------
--List the manager of each department along with their department number, department name, employee number, last name, and first name.
--------------------------------------------------------------------------------------------------------------------------------------

SELECT 
    d.dept_no,
    d.dept_name,
    e.emp_no,
    e.last_name,
    e.first_name
FROM 
    departments d
JOIN 
    dept_manager dm ON d.dept_no = dm.dept_no
JOIN 
    employees e ON dm.emp_no = e.emp_no;
	
--------------------------------------------------------------------------------------------------------------------------------------
--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
--------------------------------------------------------------------------------------------------------------------------------------

SELECT 
    de.dept_no,
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM 
    employees e
INNER JOIN 
    dept_emp de ON e.emp_no = de.emp_no
INNER JOIN 
    departments d ON de.dept_no = d.dept_no;
	
---------------------------------------------------------------------------------------------------------------------------------
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
---------------------------------------------------------------------------------------------------------------------------------

SELECT 
    first_name, 
    last_name, 
    sex
FROM 
    employees
WHERE 
    first_name = 'Hercules'
    AND last_name LIKE 'B%';
	
---------------------------------------------------------------------------------------------------------
--List each employee in the Sales department, including their employee number, last name, and first name.
---------------------------------------------------------------------------------------------------------

SELECT 
    e.emp_no,
    e.last_name,
    e.first_name
FROM 
    employees e
INNER JOIN 
    dept_emp de ON e.emp_no = de.emp_no
INNER JOIN 
    departments d ON de.dept_no = d.dept_no
WHERE 
    d.dept_name = 'Sales';

-------------------------------------------------------------------------------------------------------------------------------------------
--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
-------------------------------------------------------------------------------------------------------------------------------------------

SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM 
    employees e
INNER JOIN 
    dept_emp de ON e.emp_no = de.emp_no
INNER JOIN 
    departments d ON de.dept_no = d.dept_no
WHERE 
    d.dept_name IN ('Sales', 'Development');

------------------------------------------------------------------------------------------------------------------------------------
--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
------------------------------------------------------------------------------------------------------------------------------------

SELECT 
    last_name,
    COUNT(last_name) AS frequency
FROM 
    employees
GROUP BY 
    last_name
ORDER BY 
    frequency DESC;
