use employees;

drop procedure if exists employee_history;

delimiter //

Create procedure employee_history(IN fname VARCHAR(25), lname VARCHAR (25))
	select e.emp_no, e.first_name, e.last_name, t.title, s.to_date, s.from_date, s.salary
	from employees e
	inner join titles t on t.emp_no = e.emp_no
	inner join salaries s on s.emp_no = t.emp_no
    where e.first_name = fname AND e.last_name = lname
    order by s.to_date;//

delimiter ; //

call employee_history("Deborah", "Peck");