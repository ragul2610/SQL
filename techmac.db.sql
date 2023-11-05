					/*task 1 create database and use it*/
                    
create database techmac_db;
use techmac_db;

                       /*task 2 create tables */

create table techhyve_employees(employee_id varchar(10) ,first_name varchar(50),last_name varchar(50),gender varchar(10),age int);
alter table techhyve_employees add primary key (employee_id);
alter table techhyve_employees add constraint check (age between 21 and 55);
create table techcloud_employees(employee_id varchar(10) ,first_name varchar(50),last_name varchar(50),gender varchar(10),age int);
alter table techcloud_employees add primary key (employee_id);
alter table techcloud_employees add constraint check (age between 21 and 55);
create table techsoft_employees(employee_id varchar(10) ,first_name varchar(50),last_name varchar(50),gender varchar(10),age int);
alter table techsoft_employees add primary key (employee_id);
alter table techsoft_employees add constraint check (age between 21 and 55);
describe techhyve_employees;
desc techmac_db.techsoft_employees;
desc techcloud_employees;

                          /*Task 3 Adding the new column in all three tables as communication_proficiency*/

alter table techhyve_employees add column communication_proficiency int default 1;    
alter table techcloud_employees add column communication_proficiency int default 1;
alter table techsoft_employees add column communication_proficiency int default 1;   

                         /*Task 4 - Inserting the values in the tables*/

insert into techhyve_employees (employee_id ,first_name,last_name,gender,age,communication_proficiency) values('TH0001','Eli','Evans','Male',26,1),('TH0002','Carlos','Simmons','Male',32,2),('TH0003','Kathie','Bryant','Female',25,1),('TH0004','Joey','Hughes','Male',41,4),('TH0005','Alice','Matthews','Female',52,4);
select * from techhyve_employees
insert into techcloud_employees (employee_id ,first_name,last_name,gender,age,communication_proficiency) values('TC0001','Teresa','Bryant','female',39,2),('TC0002','Alexis','Patterson','male',48,5),('TC0003','Rose','Bell','female',42,3),('TC0004','Gemma','Watkins','female',44,3),('TC0005','Kingston','Martinez','male',29,2);
select * from techcloud_employees
insert into techsoft_employees (employee_id ,first_name,last_name,gender,age,communication_proficiency) values('TS0001','Peter','Burtler','male',44,4),('TS0002','Harold','Simmons','male',54,4),('TS0003','Juliana','Sanders','female',36,2),('TS0004','Paul','Ward','male',29,2),('TS0005','Nicole','Bryant','female',30,2);
select * from techsoft_employees;
 
                        /*Task 5 - Taking the backup of the all three tables created*/

create table techhyve_employees_bkp like techhyve_employees;
insert into techhyve_employees_bkp select * from techhyve_employees;
select * from techhyve_employees_bkp;
create table techcloud_employees_bkp like techcloud_employees;
insert into techcloud_employees_bkp select * from techcloud_employees;
select * from techcloud_employees_bkp;
create table techsoft_employees_bkp like techsoft_employees;
insert into techsoft_employees_bkp select * from techsoft_employees;
select * from techsoft_employees_bkp;

                       /*Task 6 - delete the selected employees id's in the original data and not in backup data*/

delete from techhyve_employees where employee_id in ('TH0003','TH0005');
select * from techhyve_employees
delete from techcloud_employees where employee_id in ('TC0001','TC0004');
select * from techcloud_employees

                      /*Task 7 - creating a new table techhyvecloud_employees and merging two tables techhyve and techcloud into it*/

create table techhyvecloud_employees(select * from techhyve_employees) union (select * from techcloud_employees);
select * from techmac_db.techhyvecloud_employees;