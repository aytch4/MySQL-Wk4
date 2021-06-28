use employees;
drop procedure if exists get_employees_by_dept;
delimiter //
CREATE PROCEDURE get_employees_by_dept(IN name VARCHAR(50))
		Select e.first_name, e.last_name, d.dept_name from employees e
		INNER JOIN current_dept_emp cde ON cde.emp_no =  e.emp_no
		INNER JOIN departments d ON cde.dept_no = d.dept_no
		WHERE d.dept_name = name; //
delimiter ; //
call get_employees_by_dept("Marketing");
