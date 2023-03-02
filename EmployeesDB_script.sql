create table if not exists departments(
	department_id INTEGER PRIMARY KEY,
	name VARCHAR(80) NOT null
);

create table if not exists employees(
	employee_id INTEGER PRIMARY KEY,
	name VARCHAR(40) NOT null,
	department_id INTEGER references departments(department_id)
);

ALTER TABLE departments ADD director_id INTEGER references employees(employee_id);
