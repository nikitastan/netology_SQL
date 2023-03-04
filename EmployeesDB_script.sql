create table if not exists departments(
	department_id SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT null
);

create table if not EXISTS employees(
	employee_id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT null,
	post varchar(40) NOT NULL,
	department_id INTEGER references departments(department_id)
);

create table if not EXISTS employees_directors(
	director_id INTEGER references employees(employee_id),
	employee_id INTEGER references employees(employee_id)
);

INSERT INTO departments(name)
VALUES('АО'),
VALUES('OKA'),
VALUES('ООТ')

INSERT INTO employees(name, post, department_id)
VALUES('Иванов', 'Начальник отдела',2),
VALUES('Петров', 'Аналитик',2),
('Васечкин', 'Аналитик',2)

INSERT INTO employees_directors(director_id, employee_id)
VALUES (1,2),
(1,3)

SELECT e.employee_id, e.name, e.post, e.department_id, ed.director_id 
INTO tst 
FROM employees e LEFT JOIN employees_directors ed 
ON e.employee_id=ed.employee_id  

SELECT t1.*, e.name AS "Начальник" FROM tst t1 LEFT JOIN employees e 
ON t1.director_id = e.employee_id 
