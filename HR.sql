                             /*Task 1 - Find the count of employees in organisation*/
use hr
select count(first_name) from employees

                             /*Task 2 - Find the department_id-wise count of employees in organisation*/
                         
select * from employees                         
select count(first_name),department_id from employees group by department_id

				/*Task 3 - Find the first_name,last_name and salary of employees whose salary is greater than $6000*/

select first_name,last_name,salary from employees where salary > 6000;           

                             /*Task 4 - Determine the count of employees who are earning a salary greater than $20,000*/

select count(first_name) from employees where salary > 20000;                         

							/*Task 5 - Details of employee who gets commission*/

select * from employees where commission_pct >0;                      
                       
                           /*Task 6 - sending ivite for the employees who get commission ,address them with full names*/

select concat(first_name,' ',last_name) as 'Full_name' from employees where commission_pct >0;

                           /*Task 7 - Details of the employees who get commission:employee_id,employee_name,email id,phone number*/

select employee_id,concat(first_name,' ',last_name) as 'Full_name',email,phone_number from employees where commission_pct >0;

					       /*Task 8 - Top 3 department_id having highest total salary of employees*/
                       
SELECT department_id, SUM(salary) AS total_salary FROM employees GROUP BY department_id ORDER BY total_salary DESC LIMIT 3;

                            /*Task 9 - Details of employee from IT department*/
                   
SELECT * FROM employees WHERE department_id = (SELECT department_id FROM departments WHERE department_name = 'IT');
                   
                           /*Task 10 - Count of all employee in IT department and their average salary*/
                      
SELECT count(first_name),avg(salary) FROM employees WHERE department_id = (SELECT department_id FROM departments WHERE department_name = 'IT'); 

			/*Task 11 - Identify the department_id and the number of employees for the department where salary ranges from $7000 to $10,000*/
                      
SELECT department_id, COUNT(*) AS num_employees FROM employees WHERE salary >= 7000 AND salary <= 10000 GROUP BY department_id;
