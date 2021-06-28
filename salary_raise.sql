use employees;

drop procedure if exists salary_raise;
delimiter //

CREATE PROCEDURE salary_raise(IN dept_num VARCHAR(4), IN increase_percentage DECIMAL(0,2) )
	
	UPDATE salaries s,
       (SELECT cde.emp_no, cde.dept_no, s.salary from salaries s
		Inner join current_dept_emp cde on cde.emp_no = s.emp_no
        where cde.dept_no = dept_num AND s.to_date >= now())
	SET s.salary = (s.salary * increase_percentage) + s.salary
	WHERE  cde.dept_no = dept_num;
    delimiter ; //

call salary_raise('d001', 0.05);