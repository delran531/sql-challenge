-- List the following details of each employee: employee number, last name, first name, gender, and salary.
select e.empno
	, e.lastname
	, e.firstname
	, e.gender
	, s.salary
from employees e
join salaries s on e.empno = s.empno;
	
-- List employees who were hired in 1986.
select *
from employees
where hiredate between '1986-01-01' and '1986-12-31';

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select d.deptno
	, d.deptname
	, e.empno
	, e.lastname
	, e.firstname
	, s.fromdate
	, s.todate
from depts d
join deptmgr dm on dm.deptno = d.deptno
join employees e on e.empno = dm.empno
join salaries s on s.empno = e.empno
order by 1,6;

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
select e.empno
	, e.lastname
	, e.firstname
	, d.deptname
from employees e
join deptemp de on de.empno = e.empno
join depts d on d.deptno = de.deptno;

-- List all employees whose first name is "Hercules" and last names begin with "B."
select *
from employees
where firstname = 'Hercules'
and lastname like 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.empno
	, e.lastname
	, e.firstname
	, d.deptname
from employees e
join deptemp de on de.empno = e.empno
join depts d on d.deptno = de.deptno
where d.deptname = 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, 
-- and department name.
select e.empno
	, e.lastname
	, e.firstname
	, d.deptname
from employees e
join deptemp de on de.empno = e.empno
join depts d on d.deptno = de.deptno
where d.deptname in ('Sales','Development');

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select lastname
	, count(*)
from employees
group by 1
having count(*) > 1
order by 2 desc;

-- ## Bonus (Optional)

-- As you examine the data, you are overcome with a creeping suspicion that the dataset is fake. 
-- You surmise that your boss handed you spurious data in order to test the data engineering skills of a new employee. 
-- To confirm your hunch, you decide to take the following steps to generate a visualization of the data, with which 
-- you will confront your boss:

-- 1. Import the SQL database into Pandas. (Yes, you could read the CSVs directly in Pandas, but you are, after all, 
-- trying to prove your technical mettle.) This step may require some research. Feel free to use the code below to get started. 
-- Be sure to make any necessary modifications for your username, password, host, port, and database name:

--    ```sql
--    from sqlalchemy import create_engine
--    engine = create_engine('postgresql://localhost:5432/<your_db_name>')
--    connection = engine.connect()
--    ```

-- * Consult [SQLAlchemy documentation](https://docs.sqlalchemy.org/en/latest/core/engines.html#postgresql) for more information.

-- * If using a password, do not upload your password to your GitHub repository. 
-- See [https://www.youtube.com/watch?v=2uaTPmNvH0I](https://www.youtube.com/watch?v=2uaTPmNvH0I) and 
-- [https://martin-thoma.com/configuration-files-in-python/](https://martin-thoma.com/configuration-files-in-python/) 
-- for more information.

-- 2. Create a histogram to visualize the most common salary ranges for employees.

-- 3. Create a bar chart of average salary by title.

-- ## Epilogue

-- Evidence in hand, you march into your boss's office and present the visualization. 
-- With a sly grin, your boss thanks you for your work. On your way out of the office, you hear the words, 
-- "Search your ID number." You look down at your badge to see that your employee ID number is 499942.

-- ## Submission

-- * Create an image file of your ERD.

-- * Create a `.sql` file of your table schemata.

-- * Create a `.sql` file of your queries.

-- * (Optional) Create a Jupyter Notebook of the bonus analysis.

-- * Create and upload a repository with the above files to GitHub and post a link on BootCamp Spot.

