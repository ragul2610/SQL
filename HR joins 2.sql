-- Task 1 : Top 5 cities that have maximum number of employees

use hr

select locations.city,count(employees.employee_id) from locations 
inner join departments on locations.location_id=departments.location_id 
inner join employees on employees.department_id=departments.department_id
group by locations.city
order by count(employees.employee_id) desc
limit 5;

-- Task 2 :The first_name,last_name,countries,cities,department,salaries of the employees
--                                          from the top 5 cities identified in Task 1

select locations.city,employees.first_name,employees.last_name,countries.country_name,
departments.department_name ,employees.salary from locations
inner join countries on countries.country_id=locations.country_id 
inner join departments on locations.location_id=departments.location_id 
inner join employees on employees.department_id=departments.department_id
where city in ('South San Francisco','Oxford','Seattle','Southlake','Toronto')

-- Task 3 :The cities in which the number of employees is less than 10
select city,count(employee_id) from employees
join departments using (department_id)
join locations using (location_id)
group by city having count(employee_id)<10
order by count(employee_id);

-- Task 4 :Find the average experience(in years) of the employyes of each cities identified in Task 3

select city,count(employee_id),avg(year(now())-year(hire_date)) experience from employees
join departments d on d.department_id=employees.department_id 
join locations using (location_id)
group by city having count(employee_id)<10
order by avg(year(now())-year(hire_date));

-- Task 5 :Find the details of first name, last name, email, phone number

select e.first_name,e.last_name,e.email,e.phone_number,(year(current_date())-year(e.hire_date)) as experience from employees e
inner join departments d on e.department_id = d.department_id 
inner join locations l	on d.location_id = l.location_id 
where (year(current_date())-year(e.hire_date)) > 10
group by e.first_name,e.last_name,e.email,e.phone_number,(year(current_date())-year(e.hire_date))
order by  (year(current_date())-year(e.hire_date)) desc;

-- Task 6 : List the IDs of the managers of the employees identified in Task 5

select e.manager_id,concat(first_name,' ',last_name) as name from employees e inner join departments d on e.department_id = d.department_id inner join locations  l
on d.location_id = l.location_id where  (year(current_date())-year(e.hire_date)) > 10
group by e.first_name,e.last_name,e.email,e.phone_number,e.manager_id,(year(current_date())-year(e.hire_date))
order by  (year(current_date())-year(e.hire_date)) desc;

