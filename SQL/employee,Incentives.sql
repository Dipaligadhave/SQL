----------table for employee-------
create table Employee2(
Emp_id number (10),
First_name varchar2 (100),
Last_name varchar2 (100),
salary number ,
Joining_date date,
Department varchar2(50),
primary key (Emp_id));

select * from employee2;

--DROP TABLE Employee2;
---DROP TABLE Incentive;


-----insert value into Employee2-------------
insert into Employee2 values(1,'John','Abraham',1000000,'01-JAN-13','Banking');

insert into Employee2 values(2,'Michael','Clarke',800000,'01-JAN-13','Insurance');

insert into Employee2 values(3,'Roy','Thomas',700000,'01-FEB-13 ','Banking');

insert into Employee2 values(4,'Tom','Jose',600000,'01-FEB-13 ','Insurance');

insert into Employee2 values(5,'Jerry','Pinto',650000,'01-FEB-13 ','Insurance');

insert into Employee2 values(7,'Philip','Mathew',750000,'01-JAN-13','Services');


--------create table Incentives----

create table Incentive(
Employee_ref_id number (10),
Incentive_date DATE,
Incentive_amount number ,
foreign key ( Employee_ref_id) REFERENCES Employee2(Emp_id));

select * from Incentive;

----drop table Incentives;

-------value insert into Incentives----------

insert into Incentive values(1,'01-Feb-13',5000);

insert into Incentive values(2,'01-Feb-13',3000);

insert into Incentive values(3,'01-Feb-13',4000);

insert into Incentive values(1,'01-Jan-13',4500);

insert into Incentive values(2,'01-Jan-13',3500);


----insert into Incentives values(1,'01-Feb-13',5000);

----4.	Get First_Name,Last_Name from employee table--

select First_name,Last_name from Employee2;

------5.	Get First_Name from employee table using alias name “Employee Name”
select First_name AS Employee_Name
from Employee2;

-----6.	Get First_Name from employee table in upper case---
select First_name, upper (First_name) from employee2;

------7.	Select first 3 characters of FIRST_NAME from EMPLOYEE
select substr(first_name, 1,3)
from employee2;

----6.	Get First_Name from employee table in upper case
SELECT first_name , upper(first_name) as first_name
from employee2;

-----7.	Select first 3 characters of FIRST_NAME from EMPLOYEE
select substr(first_name,1,3)
from employee2;

----------8.	Get position of 'o' in name 'John' from employee table
select instr('john','o')
from employee2;

------9.	Get FIRST_NAME from employee table after removing white spaces from right side.
select rtrim(first_name)
from employee2;

-----------10.	Get First_Name from employee table after replacing 'o' with '$'
select first_name, replace('$','o') AS First_Name
from employee2;

select first_name translate('o','$')
from employee2;

-----11.	Get First_Name and Last_Name as single column from employee table separated by a '_'
select first_name  ||'A'||  last_name  from employee2;

--------12.Get FIRST_NAME, Joiningyear, Joining Month and Joining Date from employee tablE

SELECT FIRST_NAME ,EXTRACT(YEAR FROM JOINING_DATE) AS JOINING_YEAR,
EXTRACT(MONTH FROM JOINING_DATE) AS JOINING_MONTH,
EXTRACT(DAY FROM JOINING_DATE) AS JOINING_DAY
FROM EMPLOYEE2;

SELECT FIRST_NAME,JOINING_DATE FROM EMPLOYEE2;

-----13.	Get all employee details from the employee table order by First_Name Ascending
select * from employee2
order by first_name asc;

---------14.	Get all employee details from the employee table order by First_Name Ascending and Salary Descending?
select * from employee2
order by salary desc ,
first_name asc;
-----15.	Get employee details from employee table whose employee name is “John”
select * from employee2
where first_name ='John';

-----16.	Get employee details from employee table whose employee name are “John” and “Roy”
select * from employee2
where first_name in ('John','Roy');

---------17.	Get employee details from employee table whose employee name are not “John” and “Roy”.
select * from employee2
where first_name NOT in ('John','Roy');


-----18.	Get employee details from employee table whose first name starts with 'J'.

select * from employee2
where first_name like 'J%';

SELECT * FROM employee2;
-----19.	Get employee details from employee table whose first name contains 'o'.
select * from employee2
where first_name like '%o%';

-----20.	Get employee details from employee table whose first name ends with 'n'.
select * from employee2
where first_name like '%n';

------21.	Get employee details from employee table whose first name ends with 'n' and name contains 4 letters.

select * from employee2
where first_name like '___n';

----------22.	Get employee details from employee table whose first name starts with 'J' and name contains 4 letters.
select * from employee2
where first_name like 'J___';

------23.	Get employee details from employee table who’s Salary greater than 600000.
select * from employee2;
having salary is > 600000;

---------24.	Get employee details from employee table whose joining year is “2013”.
select * from employee2
WHERE TO_CHAR(JOINING_DATE ,'YYYY')='2013';

------25.	Get employee details from employee table whose joining month is “January”.
select *from employee2 
WHERE to_char(joining_date,'MM')='01';

-------------26.	Get employee details from employee table who joined before January 1st 2013.
SELECT *
FROM employee2
WHERE joining_date < '01-JAN-13';

-----27.	Get employee details from employee table who joined after January 31st
SELECT * FROM EMPLOYEE2
WHERE JOINING_DATE > '31-JAN-2013';

----28.	Get Joining Date and Time from employee table
SELECT JOINING_DATE FROM EMPLOYEE2;

--29.	Get Joining Date, Time including milliseconds from employee table
---------30.	Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table.
SELECT first_name ,JOINING_DATE-INCENTIVE_DATE 
FROM EMPLOYEE2 E INNER JOIN Incentive I
ON E.JOINING_DATE = I.INCENTIVE_DATE
;

Select FIRST_NAME,INCENTIVE_DATE  - JOINING_DATE from employee2 a inner join 
incentives B on A.EMPLOYEE_ID = B.EMPLOYEE_REF_ID 
---31.group by(I.INCENTIVE_DATE , E.JOINING_DATE) AS days_difference
SELECT first_name ,JOINING_DATE-INCENTIVE_DATE 
FROM EMPLOYEE2 E INNER JOIN Incentive I
ON E.JOINING_DATE = I.INCENTIVE_DATE,
GROUP BY E.JOINING_DATE = I.INCENTIVE_DATE
;



-------32.	Get department, total salary with respect to a department from employee table order by total salary descending.
SELECT Department,SUM(SALARY)  TOTAL_SALARY 
FROM EMPLOYEE2
GROUP BY DEPARTMENT
ORDER BY TOTAL_SALARY DESC
;
SELECT * FROM EMPLOYEE2;
.

----33.	Get department, no of employees in a department, total salary with respect to a department from employee table order by total salary descending.
SELECT Department,SUM(SALARY)  TOTAL_SALARY ,
COUNT(EMP_ID) 
FROM EMPLOYEE2
GROUP BY DEPARTMENT
ORDER BY TOTAL_SALARY DESC
;

----------34.	Get department wise average salary from employee table order by salary ascending?
SELECT Department,AVG(SALARY)  AVG_SALARY 
FROM EMPLOYEE2
GROUP BY DEPARTMENT
ORDER BY AVG_SALARY ASC
;

-----35.	Get department wise maximum salary from employee table order by salary ascending?
SELECT Department,MAX(SALARY)  MAX_SALARY 
FROM EMPLOYEE2
GROUP BY DEPARTMENT
ORDER BY MAX_SALARY ASC
;

-----36.	Get department wise minimum salary from employee table order by salary ascending?
SELECT Department,MIN(SALARY)  MIN_SALARY 
FROM EMPLOYEE2
GROUP BY DEPARTMENT
ORDER BY MIN_SALARY ASC
;

----------37.	Select no of employees joined with respect to year and month from employee table.
SELECT TO_CHAR(JOINING_DATE ,'YYYY') JOIN_YEAR,
TO_CHAR(JOINING_DATE ,'MON') JOIN_MONTH
FROM EMPLOYEE2
GROUP BY TO_CHAR(JOINING_DATE ,'YYYY'),TO_CHAR(JOINING_DATE ,'MON');

----38.	Select department,total salary with respect to a department from employee table where total salary greater than 800000 order by Total_Salary descending
SELECT DEPARTMENT , SUM(SALARY) TOTAL_SALARY
FROM EMPLOYEE2 
GROUP BY DEPARTMENT 
HAVING SUM(SALARY) > 800000
ORDER BY TOTAL_SALARY DESC;

-------------39.	Select employee details from employee table if data in incentive table?
SELECT * FROM EMPLOYEE2 WHERE EXISTS(SELECT * FROM incentive);

------40.	Select 20 % of salary from John, 10% of Salary for Roy and for other 15 % of salary from employee table
SELECT FIRST_NAME,
CASE FIRST_NAME when 'John' then salary *.20
  when 'Roy' then salary*.10
     else  salary*.15
end as total_salary
 from employee2;

-----------41.	Select Banking as 'Bank Dept', Insurance as 'Insurance Dept' and Services as    'Services Dept' from employee table.
SELECT distinct DECODE (DEPARTMENT, 'Banking', 'Bank 
Dept',  'Insurance',  'Insurance  Dept',  'Services',  'Services  Dept')
 FROM EMPLOYEE2;

----------42.	Delete employee data from employee table who got incentives in incentive table

DELETE FROM EMPLOYEE2 EMP_ID WHERE EMP_ID IN (SELECT EMPLOYEE_REF_ID FROM INCENTIVE);
DELETE FROM INCENTIVE EMPLOYEE_REF_ID WHERE EMPLOYEE_REF_ID IN(SELECT  EMP_ID FROM EMPLOYEE2);
ROLLBACK;

---------43.	Select first_name, incentive amount from employee and incentives table for those employees who have incentives.

SELECT FIRST_NAME ,INCENTIVE_AMOUNT FROM EMPLOYEE2 E
INNER JOIN   INCENTIVE I
ON E.EMP_ID = I.EMPLOYEE_REF_ID


SELECT * FROM INCENTIVE
----44.	Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
SELECT FIRST_NAME ,INCENTIVE_AMOUNT FROM EMPLOYEE2 E
INNER JOIN   INCENTIVE I
ON E.EMP_ID = I.EMPLOYEE_REF_ID
WHERE INCENTIVE_AMOUNT > 3000;

----45.	Select first_name, incentive amount from employee and incentives table for all employees even if they didn't get incentives
SELECT FIRST_NAME ,INCENTIVE_AMOUNT FROM EMPLOYEE2 E
LEFT JOIN   INCENTIVE I
ON E.EMP_ID = I.EMPLOYEE_REF_ID

-----46.	Select first_name, incentive amount from employee and incentives table for all employees even if they didn't get incentives and set incentive amount as 0 for those employees who didn't get incentives.
SELECT FIRST_NAME ,
NVL(I.INCENTIVE_AMOUNT , 0) AS INCENT_AMOUNT
 FROM EMPLOYEE2 E
LEFT JOIN   INCENTIVE I
ON E.EMP_ID = I.EMPLOYEE_REF_ID;


-----------47.	Select first_name, incentive amount from employee and incentives table for all employees who got incentives using left join
SELECT FIRST_NAME ,INCENTIVE_AMOUNT FROM EMPLOYEE2 E
LEFT JOIN   INCENTIVE I
ON E.EMP_ID = I.EMPLOYEE_REF_ID;


select first_name , incentive_amount from Employee2 E
left join incentive I
on E.EMP_ID=I.EMPLOYEE_REF_ID

----48.	Select max incentive with respect to employee from employee and incentives table using sub query.

SELECT DEPARTMENT,(SELECT NVL (MAX(INCENTIVE_AMOUNT),0)
FROM INCENTIVE WHERE EMPLOYEE_REF_ID = EMP_ID) AS MAX_INCENT 
FROM EMPLOYEE2;


select * from employee2
where rownum<=(select count(*)/2 from employee2)
minus
select rownum < > (select count(*)/2) from employee2



select * from (select * from employee2
order by emp_id desc)
where rownum <4
order by rownum desc

select max(salary) from employee2
where salary <(select max(salary) from employee2)

select max(salary) from employee2
where salary < (select max(salary) from employee2);

select distinct  salary 
from employee2
order by salary desc
limit 1 offset 2;

select * from employee2

------------------Rownumber--------------

select emp_id , salary ,first_name , row_number() over(partition by Department
 order by Salary desc) as salry_number from employee2; 

select first_name ,salary, row_number() over (order by salary desc) from employee2;
select first_name, last_name,salary ,row_number()over(partition by Department 
order by salary desc) as number_row from employee2;

---------------Rank()----------------------
select first_name , salary,rank() over(order by salary desc) as salary_rnk from employee2;
select LAst_name , first_name ,Salary ,
rank() over(order by Salary desc) as salary_rank from employee2 

--5. Highest salary in each department
select * from (
select  first_name ,department,salary ,rank() over (
partition by department order by salary desc) as rnk from employee2 ) where rnk=1; 

select * from (select first_name ,last_name,department ,Salary ,rank() over(
order by salary desc) as rnk2 from employee2) where rnk2 =2;

---7. Second highest salary in each department
select * from (select first_name,department,salary, dense_rank() over (
partition by department order by salary desc)as rnk3
from employee2) where rnk3 =2;
