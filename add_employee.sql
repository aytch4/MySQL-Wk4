use employees;

drop procedure if exists add_employee;

delimiter //

CREATE PROCEDURE add_employee(IN new_emp_no int, new_birth_date date, new_first_name VARCHAR(25), new_last_name varchar(25), new_gender char(1), new_hire_date date)
BEGIN
	INSERT INTO employees (emp_no, birth_date, first_name, last_name, gender, hire_date)
    VALUES (new_emp_no, new_birth_date, new_first_name, new_last_name, new_gender, new_hire_date); 
END //
    
delimiter ; //

call add_employee(902, '2010-10-06', "Benjamin", "Staples", 'M', '2021-06-28');

select * from employees where emp_no=902;