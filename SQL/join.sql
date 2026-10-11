------------------------------------------01/01/2026--------------------------------
-----------join
----------extract all th eemployee detail with respspective department name

-----inner join
-----left join 
-----right join
--- full outer

select employee_id , first_name,last_name,salary,e.department_id,DEPARTMENT_NAME
from hr.employees e , hr.departments d
where e.department_id = d.department_id;
-----------INNER JOIN
select employee_id , first_name,last_name,salary,e.department_id,DEPARTMENT_NAME
from hr.employees e INNER JOIN hr.departments d
ON e.department_id = d.department_id;

SELECT * FROM HR.DEPARTMENTS;
SELECT * FROM HR.EMPLOYEES;
SELECT * FROM HR.LOCATIONS;

------LEFT JOIN
select employee_id , first_name,last_name,salary,e.department_id,DEPARTMENT_NAME
from hr.employees e LEFT JOIN hr.departments d
ON e.department_id = d.department_id;
-----------RIGHT JOIN
select employee_id , first_name,last_name,salary,D.department_id,DEPARTMENT_NAME
from hr.employees e RIGHT JOIN hr.departments d
ON e.department_id = d.department_id;
-------FULL JOIN
select employee_id , first_name,last_name,salary,D.department_id,DEPARTMENT_NAME
from hr.employees e FULL JOIN hr.departments d
ON e.MANAGER_ID = d.MANAGER_ID;
----LEFT JOIN
select employee_id , first_name,last_name,salary,D.department_id,DEPARTMENT_NAME
from hr.employees e, hr.departments d
WHERE e.MANAGER_ID (+)= d.MANAGER_ID;

-----RIGHT JOIN
select employee_id , first_name,last_name,salary,D.department_id,DEPARTMENT_NAME
from hr.employees e, hr.departments d
WHERE e.MANAGER_ID = d.MANAGER_ID (+);


----I WANT CITY ALSO
select employee_id , first_name,last_name,salary,e.department_id,DEPARTMENT_NAME,CITY
from hr.employees e INNER JOIN hr.departments d
ON e.department_id = d.department_id
left JOIN HR.LOCATIONS l
ON d.LOCATION_ID = l.LOCATION_ID
group by department_name
;

-----cross join
select employee_id , first_name,last_name,salary,e.department_id,DEPARTMENT_NAME
from hr.employees e cross JOIN hr.departments d;

------------self join


select e1.* from hr.employees e1, hr.employees e2
where e1.employee_id=e2.manager_id;

select e1.employee_id , e1.first_name,e2.first_name as manager_name
from hr.employees e1, hr.employees e2
where e1.employee_id =e2.manager_id;

select * from hr.employees;


--------------------3/1/26-----------------------------------------
----------------SET OPERATORS--------------------------
------------UNION=> UNION WILL DISCARD DUPLICATE RECORD . IT DOSENT SHOW DUPLICATE RECORD
SELECT 1 FROM DUAL
UNION
SELECT 2 FROM DUAL

---
SELECT 1 FROM DUAL
UNION
SELECT 2 FROM DUAL
UNION
SELECT 2 FROM DUAL

---
SELECT DEPARTMENT_ID FROM  HR.EMPLOYEES
UNION 
SELECT DEPARTMENT_ID FROM HR.DEPARTMENTS;

--------------UNION ALL => IT ALSO SHOWS ALL DUPLICATE RECORD
SELECT 1 FROM DUAL
UNION ALL
SELECT 2 FROM DUAL
UNION ALL
SELECT 2 FROM DUAL

---------
SELECT DEPARTMENT_ID FROM HR.EMPLOYEES
UNION ALL
SELECT DEPARTMENT_ID FROM HR.DEPARTMENTS;

------------MINUS ==> IT CAN DO MINUS 
SELECT DEPARTMENT_ID FROM  HR.EMPLOYEES
MINUS
SELECT DEPARTMENT_ID FROM HR.DEPARTMENTS;

SELECT DEPARTMENT_ID FROM HR.EMPLOYEES
MINUS
SELECT DEPARTMENT_ID FROM HR.DEPARTMENTS;

-------------INTERSECT----- IT CAN RETURN COMBINE RESULT 
SELECT DEPARTMENT_ID FROM HR.EMPLOYEES
INTERSECT
SELECT DEPARTMENT_ID FROM HR.DEPARTMENTS;


CREATE TABLE AMOUNT1
(ID NUMBER,
AMOUNT NUMBER);

INSERT INTO AMOUNT1 VALUES(101 ,500);
INSERT INTO AMOUNT1 VALUES(102 ,600);

INSERT INTO AMOUNT1 VALUES(103 ,700);

SELECT * FROM AMOUNT1;

SELECT SUM(AMOUNT) FROM AMOUNT1;



SELECT TO_CHAR (ID),AMOUNT FROM AMOUNT1
UNION ALL
SELECT 'SUM' , SUM(AMOUNT) 
FROM AMOUNT1;

------------------INNER QUERY- also known as sub query-----------------------
---------EXTRACT ALL EMPLOYEE DETAILS THOSE ARE BELONG FROM DEPARTMENTI IT

SELECT * FROM HR.DEPARMETS
WHERE DEPARTMENT_NAME ='IT';

SELECT * FROM HR.EMPLOYEES  E
INNER JOIN HR.DEPARTMENTS D
ON E.DEPARTMENT_ID =D.DEPARTMENT_ID
WHERE D.DEPARTMENT_NAME ='IT'
SELECT * FROM HR.DEPARTMENTS;

SELECT * FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID =(
SELECT DEPARTMENT_ID FROM HR.DEPARTMENTS
WHERE DEPARTMENT_NAME IN( 'IT'));


--------------------CO REALATED SUB QUERY => FIRST OUTER QURY EXECUTE AND RESULT SEND TO INNER QUERY AND LATER RESULT SNED TO THE OUTER QUERY THEN THIS EXECUTE ------------------
------------sub query
SELECT * FROM HR.EMPLOYEES E
WHERE DEPARTMENT_ID =(
SELECT DEPARTMENT_ID FROM HR.DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND DEPARTMENT_NAME IN( 'IT'));

------------------CO REALATED
select * from hr.employees
where department_id in(
                          select department_id from hr.departments 
                          where location_id = (
                                                 SELECT location_id FROM HR.LOCATIONS
                                                  WHERE CITY = 'Seattle')
                      );


------------------------------------------4/1/2026-----------------------------------------
---------------EXTRACT THE EMPLOYEE DETAIL WHOSE HAVING SALARY GREATHER THAN AVG SALARY

SELECT * FROM HR.EMPLOYEES
WHERE SALARY>(SELECT AVG(SALARY) FROM HR.EMPLOYEES);
---------------WITH
WITH AVG_SALARY AS (SELECT AVG(SALARY) AVG_SALARY FROM HR.EMPLOYEES
SELECT 









--------------------VIEWS---- IT IS VIRTUAL REPRESENTATION OF THE TABLE
---------------VIEW IS DATABASE OBJECT IT IS LOGICAL REPRESENTATION OF TABLE 
---------IT DOSE NOT SAVE THE DATA ON ACTUAL TAB
CREATE OR REPLACE VIEW DEPT_60
AS SELECT * FROM HR . EMPLOYEES WHERE DEPARTMENT_ID = 60;

SELECT * FROM  DEPT_60
