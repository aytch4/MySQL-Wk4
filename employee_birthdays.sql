use employees;

drop procedure if exists employee_birthdays;

delimiter //

CREATE PROCEDURE employee_birthdays(IN DOB date)
	Select e.first_name, e.last_name, e.birth_date, d.dept_name from employees e
	INNER JOIN current_dept_emp cde ON cde.emp_no =  e.emp_no
	INNER JOIN departments d ON cde.dept_no = d.dept_no
	Where birth_date = DOB; //
    
    delimiter ; //
    
    call employee_birthdays('1964-06-02');
	

