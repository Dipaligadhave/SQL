--Q1. Write a query to generate following output.

SELECT employee_id,first_name||' '||last_name Full_name,email,salary
FROM hr.employees;

--Q2.Write aSELECT job_id,count(manager_id)
SELECT job_id,count(manager_id)
from hr.employees 
where manager_id>1
group by job_id;

---Q3. Display the country name and number of employees those working in particular city that count of employee is greater than 30.
--(Hint: Using Equijoin and Group by )
SELECT count(employee_id),
c.country_name
FROM hr.employees e,hr.departments d,hr.locations l,hr.countries c
WHERE e.department_id=d.department_id 
AND d.location_id=l.location_id
AND l.country_id=c.country_id
group by c.country_name
HAVING count(employee_id)>30;

select * from hr.employees

--Q4. Display cities name and number of departments present those cities. And exculde departments there are no any employees.
SELECT l.city,count(d.department_id)
from hr.employees e,hr.departments d,hr.locations l
WHERE e.department_id=d.department_id 
AND d.location_id=l.location_id
AND employee_id is not null
group by l.city;

---Q5. Display the salary range and number of employees how are salary in between of range. 
--(Hint : Job_Grade table , Equijoin , Group by )
select count(employee_id)as Number_Of_Employees, min(salary) as low_sal,max(salary) as high_sal
from hr.employees
group by job_id


---Q6. Display Year list and number of Employees join in particular year.
--(Hint: Group by and To_Char Function)
SELECT to_char(hire_date,'yyyy'),count(employee_id)
FROM hr.employees
group by to_char(hire_date,'yyyy')
order by 1;

--Q7. Display Manager_id , Manager Full Name and Under number of employees only those managers how have more than 5 employees under working. Result sort by manager_ID
select  manager_id ,first_name ||''|| last_name as full_name ,count(employee_id) as Number_Of_Employees
from hr.employees
group by manager_id,full_name , Number_Of_Employees
having  count(employee_id) > 5;


SELECT
    m.employee_id AS Manager_ID,
    m.first_name || ' ' || m.last_name AS Manager_Full_Name,
    COUNT(e.employee_id) AS Number_Of_Employees
FROM
    hr.employees e 
JOIN
    hr.employees m 
ON
    e.manager_id = m.employee_id 
GROUP BY
    m.employee_id, Manager_Full_Name 
HAVING
    COUNT(e.employee_id) > 5 
ORDER BY
    Manager_ID; 
