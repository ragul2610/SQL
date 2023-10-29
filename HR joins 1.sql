				/*Task 1 - ID's,first name,last name of the employees working in IT department*/
use hr

select employee_id,first_name,last_name from employees e
join departments d on e.department_id = d.department_id 
where department_name LIKE'IT%';

                    /*Task 2 - Minimum and Maximum salaries for each department*/

select departments.department_name, min(salary) as minsalary, max(salary) as maxsalary from employees
inner join departments
on employees.department_id = departments.department_id group by departments.department_name;  

                   /*Task 3 - Top 10 cities having the maximum number of employees*/

SELECT city,COUNT(*) from employees
inner join departments using (department_id)
inner join locations using (location_id)
GROUP BY city
ORDER BY 2 DESC
LIMIT 10;
                   
				/*Task 4 - list employee id,first name,last name of employee whose last working day was 1999-12-31*/
SELECT e.employee_id, e.first_name, e.last_name
FROM employees e
INNER JOIN job_history j ON e.employee_id = j.employee_id
WHERE j.end_date = '1999-12-31';
                    
                    
			/*Task 5 - Extract the employee id,first name,department name and total experience of employees
																		who have completed 25 years in organisation*/
                    
select first_name,employee_id,department_name,year(now())-year(start_date) experience
from employees
inner join departments using (department_id)
inner join job_history using (employee_id)
where year(now())-year(start_date)>=25;                   
                    