CREATE TABLE departments
(
  dept_no character varying(50),
  dept_name character varying(50),
  CONSTRAINT dept_pkey PRIMARY KEY (dept_no)
)

SELECT * FROM departments;

CREATE TABLE employees
(
  emp_no integer,
  birth_date date,
  first_name character varying(50),
  last_name character varying(50),
  gender character varying(50),
  hire_date date,
  CONSTRAINT emp_pkey PRIMARY KEY (emp_no)
);

CREATE TABLE dept_emp
(
  emp_no integer,
  dept_no character varying(50),
  from_date date,
  to_date date,
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  FOREIGN KEY (emp_no)  REFERENCES employees(emp_no)
);

CREATE TABLE dept_manager
(
  dept_no character varying(50),
  emp_no integer,
  from_date date,
  to_date date,
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  FOREIGN KEY (emp_no)  REFERENCES employees(emp_no)
);

CREATE TABLE salaries
(
  emp_no integer,
  salary integer,
  from_date date,
  to_date date,
  FOREIGN KEY (emp_no)  REFERENCES employees(emp_no)
);

CREATE TABLE titles
(
  emp_no integer,
  title character varying(50),
  from_date date,
  to_date date,
  FOREIGN KEY (emp_no)  REFERENCES employees(emp_no)
);

SELECT * FROM employees
LIMIT 3;

select employees.birth_date, employees.first_name, employees.last_name, employees.gender, employees.hire_date
from dept_emp
inner join employees on
employees.emp_no=dept_emp.emp_no;

select departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
from employees
inner join dept_emp on (employees.emp_no=dept_emp.emp_no)
inner join departments on (dept_emp.dept_no=departments.dept_no);

select departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
from employees
inner join dept_emp on (employees.emp_no=dept_emp.emp_no)
inner join departments on (dept_emp.dept_no=departments.dept_no)
where departments.dept_name = 'Sales';

select departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
from employees
inner join dept_emp on (employees.emp_no=dept_emp.emp_no)
inner join departments on (dept_emp.dept_no=departments.dept_no)
where departments.dept_name in ('Development','Sales');

SELECT first_name, last_name
from employees
where hire_date between '1986-01-01' and '1986-12-31';

select *
from employees
where first_name = 'Hercules' and last_name like 'B%';


