------create table for Salespeople
create table Salespeople1(
Snum number(10),
Sname varchar2 (100),
City varchar2 (100),
Comm NUMBER,
primary key (Snum));

select * from Salespeople;
DROP TABLE Salespeople;
drop table Customers;
drop table orders

------value insert into saleapeople
insert into Salespeople1 values(1001,'Peel','London',.12);

insert into Salespeople1 values(1002,'Serres','San Jose',.13);

insert into Salespeople1 values(1004,'Monika','London',.11);

insert into Salespeople1 values(1007,'Rifkin','Barcelona',.15);

insert into Salespeople1 values(1003,'Axelrod','New York',.10);

insert into Salespeople1 values(1005,'Franc','London',.26);

-----------create table for Customers

create table Customerrss(
Cnum number,
Cname varchar2(100),
City varchar2 (100),
Rating number,
Snum number,
primary key (Cnum),
foreign key (Snum) REFERENCES Salespeople1(Snum));

SELECT * FROM  CUSTOMERS;

insert into customerrss values(2001,'Hoffman','London',100,1001);
insert into customerrss values(2002,'Giovanni','Rome',200,1003);
insert into customerrss values(2003,'Liu','San Jose',200,1002);
insert into customerrss values(2004,'Grass','Berlin',300,1002);
insert into customerrss values(2006,'Clemens','London',100,1001);
insert into customerrss values(2008,'Cisneros','San Jose',300,1007);
insert into customerrss values(2007,'Pereira','Rome',100,1004);


-----------create table for ORDERS---
 
create table ORDERS1(
Onum number,
Amt number,
Odate date ,
Cnum number,
Snum number (10),
primary key (Onum),
foreign key (Cnum) REFERENCES customerrss(Cnum),
foreign key (Snum) REFERENCES Salespeople1(Snum)
);
---DROP TABLE ORDERS;

selEct * from ORDERS1;

INSERT INTO ORDERS1 VALUES(3001,18.69, to_date('03-Oct-96 12:30', 'dd-mon-yyyy hh24:mi') ,2008 ,1007);
INSERT INTO ORDERS1 VALUES(3003,767.19, to_date('03-Oct-96 13:45', 'dd-mon-yyyy hh24:mi') ,2001 ,1001);
INSERT INTO ORDERS1 VALUES(3002,1900.10, to_date('03-Oct-96 12:05', 'dd-mon-yyyy hh24:mi') ,2007 ,1004);
INSERT INTO ORDERS1 VALUES(3005,5160.45, to_date('03-Oct-96 14:00 ', 'dd-mon-yyyy hh24:mi') ,2003 ,1002);
INSERT INTO ORDERS1 VALUES(3006,1098.16, to_date('03-Oct-96 13:37 ', 'dd-mon-yyyy hh24:mi') ,2008 ,1007);
INSERT INTO ORDERS1 VALUES(3009,1713.23, to_date('04-Oct-96 15:21 ','dd-mon-yyyy hh24:mi') ,2002 ,1003) ;
INSERT INTO ORDERS1 VALUES(3007,75.75, to_date('04-Oct-96 16:02 ', 'dd-mon-yyyy hh24:mi') ,2002 ,1003);
INSERT INTO ORDERS1 VALUES(3008,4723.00, to_date('05-Oct-96 12:07 ', 'dd-mon-yyyy hh24:mi') ,2006 ,1001);
INSERT INTO ORDERS1 VALUES(3010,1309.95, to_date('06-Oct-96 13:12 ', 'dd-mon-yyyy hh24:mi') ,2004 ,1002);
INSERT INTO ORDERS1 VALUES(3011,9891.88, to_date('06-Oct-96 13:09 ', 'dd-mon-yyyy hh24:mi') ,2006 ,1001);
INSERT INTO ORDERS1 VALUES(3012,3455.78, to_date('04-Oct-96 15:21 ', 'dd-mon-yyyy hh24:mi') ,2002 ,1003);
INSERT INTO ORDERS1 VALUES(3013,1245.98, to_date('04-Oct-96 16:32', 'dd-mon-yyyy hh24:mi') ,2002 ,1003);
INSERT INTO ORDERS1 VALUES(3014,3721.53, to_date('05-Oct-96 12:45', 'dd-mon-yyyy hh24:mi') ,2006 ,1001);
INSERT INTO ORDERS1 VALUES(3015,734.50, to_date('06-Oct-96 13:16', 'dd-mon-yyyy hh24:mi') ,2004 ,1002);
INSERT INTO ORDERS1 VALUES(3016,1729.67, to_date('06-Oct-96 13:07', 'dd-mon-yyyy hh24:mi') ,2006 ,1001);

------1.	List all customers with a rating of 100.
select* from CUSTOMERS
where rating = 100;

------2.	Find all records in the Customer table with NULL values in the city column.
select * from customers
where City ='null';

------3.	Find the largest order taken by each salesperson on each date.
SELECT  Snum, Odate,
MAX(AMT) AS largest_order
FROM orders
GROUP BY Snum, Odate;

----------------------4.	Arrange the Orders table by descending customer number.
SELECT * FROM ORDERS
ORDER BY Cnum DESC;

--------------5.	Find which salespeople currently have orders in the Orders table.
SELECT s.snum ,s. SName 
FROM Salespeople s
WHERE exists(select * from orders o
where o.snum =s.snum);

select * from orders
select * from  Salespeople
select * from customers
----------------6.	List names of all customers matched with the salespeople serving them.
select c.cname,s.sname from customerrss c
inner join Salespeople1 s
on c.cnum = s.snum;

-----7.	Find the names and numbers of all salespeople who had more than one customer.
select s.snum ,s.sname 
from Salespeople1 s 
inner join customerrss c
on s.snum = c.snum
group by s.snum , s.sname
having count ( c.cnum)> 1;



-----8.	Count the orders of each of the salespeople and output the results in descending order.
select s.snum , s.sname, count(o.onum) as total_order  
from  Salespeople s  
inner join orders o
on s.snum= o.snum 
group by s.snum ,s.sname
order by total_order  desc;

-----9.	List the Customer table if and only if one or more of the customers in the Customer tables are located in San Jose.
select * from customerrss
where city in 'San Jose';

---10.	Match salespeople to customers according to what city they lived in.
select s.snum ,s.sname ,s.city from salespeople s
inner join customers c
on s.city = s.city;

select * from orders1

---11.	Find the largest order taken by each salesperson.
select s.snum ,s.snum ,s.sname,max(o.amt) as total_amt from salespeople s 
inner join orders o
on s.snum = o.snum
group by  s.snum ,s.sname;
 
----12.	Find customers in San Jose who has a rating above 200.
select * from customers
where city in 'San Jose' and rating > 200;

-----13.	List the names and commissions of all salespeople in London.
select sname ,comm from salespeople
where city in 'London';


select * from orders
-----14.	List all the orders of salesperson Monika from the Orders table.
select s.sname , s.snum  from salespeople s
inner join orders o 
on s.snum = o.snum 
where s.sname in 'Monika';

----15.	Find all customers with orders on October 3.
select * from customers

select distinct o.cnum ,c.cnum,o.odate from customers c 
inner join orders o
on o.cnum = o.cnum
where to_char(o.odate ,'day/mm') = '03/10';

--SELECT DISTINCT c.cnum, c.cname
--FROM Customers c
--JOIN Orders o
--ON c.cnum = o.cnum
--WHERE TRUNC(o.odate) = DATE '1996-10-03';

---16.	Give the sums of the amounts from the orders table, grouped by date, 
select sum(amt)  total_amount
from orders
group by trunc (odate)
order by total_amount ;

---17.	Eliminating all those dates where the SUM was not at least 2000.00 above the MAX amount.
select sum(amt)  total_amount,
max(amt) as total_max
from orders
group by trunc (odate)
having sum(amt) >= max(amt) + 2000
order by total_amount ;

select sum(amt)  total_amount
from orders
group by trunc (odate)
having sum(amt) >= max(amt) + 2000
order by total_amount ;

---18.	Select all orders that had amounts that were greater than at least one of the orders from October 6.

Select onum, amt from orders 
where odate != '06-oct-94' and amt > ( select min(amt) from orders 
where odate = '06-oct-94');

-----19.	Write a query that uses the EXISTS operator to extract all salespeople who have customers with a rating of 300.
SELECT  * FROM CUSTOMERS
SELECT * FROM SALESPEOPLE

SELECT * FROM SALESPEOPLE S
WHERE SNUM = (
SELECT SNUM  FROM CUSTOMERS C
WHERE S.SNUM = C.SNUM
AND RATING IN ('300'));

----20.	Find all pairs of customers having the same rating.
SELECT C.CNAME , S.CNAME ,C.RATING
FROM CUSTOMERS C, CUSTOMERS S 
WHERE C.RATING = S.RATING AND
 C.CNUM != S.CNUM ;
 ----21.	Find all customers with CNUM, 1000 above the SNUM of Serres.
SELECT CNUM, CNAME FROM CUSTOMERS
WHERE CNUM >(SELECT  SNUM+1000
FROM SALESPEOPLE
WHERE SNAME ='Serres');
 
---22.	Give the salespeople’s commissions as percentage instead of decimal numbers.
select snum , sname ,Comm * 100 
from salespeople;

----23.	Find the largest order taken by each salesperson on each date, eliminating those MAX orders, which are less than $3000.00 in value.
select snum , odate ,max(amt)as total_amount
from orders
group by snum , odate 
having max(amt) > 3000;

----24.	List the largest orders on October 3, for each salesperson.

select snum, trunc(odate), max(amt) as larget_order from orders 
where to_char(odate, 'dd-mm')='03-10'
group by snum, trunc(odate);
 
 select * from orders
 
 SELECT SNUM, MAX(amt) AS largest_order
FROM orders
WHERE TRUNC(odate) = TO_DATE('03-OCT-1996','DD-MON-YYYY')
GROUP BY SNUM;
 
;

--25.	Find all customers located in cities where Serres (SNUM 1002) has customers.
select cnum,city from customers
where city in (select city from salespeople
where snum =1002);

----26.	Select all customers with a rating above 200.00.
select * from customers
where rating > 200;

-----27.	Count the number of salespeople currently listing orders in the Orders table.
select count(distinct snum) from orders

------------28.	Write a query that produces all customers serviced by salespeople with a commission above 12%. Output the customer’s name and the salesperson‘s rate of commission
select * from salespeople

select c.cname ,s.comm from customers c
 join salespeople s
on c.snum = s.snum 
and s.comm  >.12; 

---29.	Find salespeople who have multiple customers.
select snum , count(snum)
from customers
group by snum having (snum) > 1;

----30.	Find salespeople with customers located in their city.
select s.snum , s.city from salespeople s
join customers c
on c.snum = s.snum
where c.city = s.city;


---31.Find all salespeople whose name starts with ‘P’ and the fourth character is ‘I’.
select * from salespeople
where sname like 'F__i';

----32.	Write a query that uses a sub query to obtain all orders for the customer named ‘Cisneros’. Assume you do not know his customer number.
select * from orders 
where snum =(select snum from customers 
where cname ='Cisneros')
;

---33.	Find the largest orders for ‘Serres’ and ‘Rifkin’.
select snum ,max(amt) from orders group by snum
having snum in (select snum from salespeople where sname = 'Serres'
or sname ='Rifkin');

----34.	Extract the Salespeople table in the following order: SNUM, SNAME, COMMISSION, CITY.
select snum , sname ,comm,city
from salespeople;

---35.	Select all customers whose names fall in between ‘A’ and ‘G’ alphabetical range
select * from customers
where cname between 'A' AND 'G'
ORDER BY CNAME  ;

select * from customers
where cname LIKE 'A%' cname LIKE'G%';
----------36.	Select all the possible combinations of customers that you can assign.
SELECT C.CNAME , S.SNAME FROM CUSTOMERS C 
INNER JOIN SALESPEOPLE S 
ON C.SNUM = S.SNUM;

SELECT * FROM CUSTOMERS C 
INNER JOIN ORDERS O 
ON C.CNUM = O.CNUM;

---------37.	Select all orders that are greater than the average for October 4.
SELECT AMT TRUNC(ODATE ,'HH24:MM') FROM ORDERS 
WHERE AMT > (SELECT AVG(AMT) FROM ORDERS WHERE ODATE IN ( SELECT ODATE FROM ORDERS  
GROUP BY ODATE 
HAVING ODATE ='4-OCT-96'));

SELECT * FROM ORDERS
--38.	Write a select command using a correlated sub query that selects the names and numbers of all customers with ratings equal to the maximum for their city.
SELECT CNUM ,CNAME ,CITY,RATING FROM CUSTOMERS
WHERE RATING IN(SELECT MAX(RATING)
FROM CUSTOMERS
GROUP BY CITY);
----39.	Write a query that totals the orders for each day and places the results in descending order.
SELECT SUM(AMT) AS TOTAL_AMOUNT FROM ORDERS
GROUP BY ODATE 
ORDER BY TOTAL_AMOUNT DESC;

---40.	Write a select command that produces the rating followed by the name of each customer in San Jose.
SELECT * FROM CUSTOMERS;
SELECT CNUM ,CNAME, RATING FROM CUSTOMERS
WHERE CITY IN 'San Jose';

--41.	Find all orders with amounts smaller than any amount for a customer in San Jose.
select onum,amt from orders o
where amt < (select max(amt) from orders 
where amt in (select o.amt from customers c ,orders
where c.cnum=o.cnum
and c.city='San Jose'));

select * from orders
select * from customers

----------42.	Find all orders with above average amounts for their customers.
select onum ,amt ,cnum from orders 
where amt >(select avg(amt) from orders where cnum in (select cnum from orders   
group by cnum));              

--43.	Write a query that selects the highest rating in each city.

select city , max(rating) from customers
group by city;

select * from orders
select * from salespeople
select * from customers
---44.	Write a query that calculates the amount of the salesperson’s commission on order by a customer with a rating above 100.00
select sname, comm*amt from salespeople s,orders
where s.snum in (select snum from customers c where rating > 100);

-----45.	Count the customers with rating above San Jose’s average.
select count(city)from customers
where rating >(select avg(rating) from customers 
where city ='San Jose');

---46.	Write a query that produces all pairs of salespeople with themselves as well as duplicate rows with the order reversed

SELECT s1.sname AS s_1,
       s2.sname AS s_2
FROM salespeople s1,
     salespeople s2;
     
 ----47.	Find all salespeople that are located in either Barcelona or London
 select * from salespeople
 where city ='Barcelona'or city='London';
 ----48.	Find all salespeople with only one customer.

select snum,sname from salespeople
where snum in (select snum from customers 
where cnum in(select cnum from orders 
having count(cnum)=1 
group by cnum));
 
----49.	Write a query that joins the Customer table to itself to find all pairs of customers served by a single salesperson.
select c.cname ,c.cname from customers c,customers c2
where c.snum = c2.snum
and c.cnum!= c2.cnum;

----50.	Write a query that will give you all orders for more than $1000.00
select  * from orders
where amt>100;

---Write a query that lists each order number followed by the name of the customer who made that order.
select o.onum,c.cname from orders o
inner join customers c
on c.cnum= o.cnum  ;

---52.	Write 2 queries that select all salespeople (by name and number) who have customers in their cities who they do not service, one using a join and one a correlated subquery. Which solution is more elegant?
select s.sname ,c.snum, s.snum from salespeople s
inner join customers c
on s.city=c.city
group by c.snum,s.snum,s.sname
having c.snum!= s.snum;

select snum,sname  from salespeople s where exists 
     (select * from customers c 
     where s.city = c.city and s.snum <>c.snum)

SELECT s.snum, s.sname  FROM   Salespeople s
WHERE  EXISTS (SELECT 1 FROM   Customers1 c1
WHERE  c1.snum = s.snum) AND EXISTS (SELECT 1 FROM Customers1 c1
WHERE  c1.city = s.city ANDc2.snum <> s.snum);
            
----53.	Write a query that selects all customers whose ratings are equal than ANY (in the SQL sense) of Serres.
select cname from customers where rating >= any
(select rating from customers where snum =(select snum from salespeople
 where sname ='Serres'));
 
---54.	Write2 queries that will produce all orders taken on October3 or October 4.
select onum  from orders
where trunc(odate ) ='03-oct-96' or trunc(odate)= '04-oct-96'; 

----55.	Write a query that produces all pairs of orders by a given customer. Name that customer and eliminate duplicates
select o.onum,c.cname from orders o
inner join customers c
on c.cnum = o.cnum
group by c.cname ,o.onum;

----56.	Find only those customers whose ratings are higher than every customer in Rome.
select * from customers
where rating >(select max(rating ) from customers
where city ='Rome');

---57.	Write a query on the customers table whose output will exclude all customers with a rating < = 100.00, unless they are located in Rome.
select * from customers
where rating <= 100 or
 city ='Rome';

---58.	Find all rows from the Customer table for which the salesperson number is 1001.
select c.cnum , s.snum ,c.cname from customers c
inner join salespeople s
on c.snum =s.snum
where s.snum =1001; 

select * from customers
where snum =1001;

------59.	Find the total amount in Orders for each salesperson for which this total is greater than the amount of the largest order in the table.

select  sum(snum),snum from orders
having sum(amt) > max(amt)
group by snum;

----60.	Write a query that selects all orders that have Zeroes or NULL in the Amount field.
select onum ,amt  from orders 
where amt = null or amt =0;

------61.	Produce all combinations of salespeople and customer names such that the former precedes the latter alphabetically, and the latter has a rating of less than 200.
select s.sname,c.cname,c.rating from customers c
inner join salespeople s
on s.sname =c.cname
where rating < 200
group by s.sname , c.cname,c.rating
having c.cname >=s.sname
order by cname asc;

select s.sname,c.cname,c.rating from customers c ,salespeople s
where c.rating < 200
group by s.sname , c.cname,c.rating
having c.cname >=s.sname
order by c.cname , s.sname 
 asc;
 
----62.	List all salespeople’s names and the commission they have earned.
select s. sname,sum(comm *amt*0.1)from salespeople s ,orders o
where s.snum=o.snum
group by sname;

-----63.	Write a query that produces the names and cities of all customers with the same rating as Hoffman. Write the query using Hoffman’s CNUM rather than his rating, so that it would still be usable if his rating changed.
select cnum , city from customers
where rating in(select rating from customers
 where snum =(select snum from customers
 where cname ='Hoffman'));
 
-----64.	Find all salespeople for whom there are customers that follow them in alphabetical order.

select s.sname,c.cname from customers c
inner join salespeople s
on s.snum=c.cnum

group by s.sname , c.cname
having c.cname >= s.sname;


select s.sname ,c.cname from customers c, salespeople s
where s.snum =c.snum
group by s.sname , c.cname 
having c.cname >= s.sname;

---------65.	Write a query that produces the names and ratings of all customers of all who have above average orders.
select cname ,rating from customers
where rating >(select avg(rating) from customers);

---66.	Find the sum of all purchases from the Orders table.
select * from orders;
select sum(amt) as total_amount from orders;

----67.	Write a select command that produces the order number, amount, and date for all rows in the Order table.
select onum ,amt,odate from orders;

---68.	Count the number of not null rating fields in the Customer table including duplicates.
select count(rating) from customers;

--69.	Write a query that gives the names of both the salesperson and the customer for each order after the order number.
select cname , odate ,sname from salespeople s,customers c , orders o
where s.snum = o.snum and c.cnum = o.cnum;

---70.	List the commissions of all salespeople servicing customers in London.
select snum ,comm,city  from salespeople
where city = 'London';

select city from customers
----71.	Write a query using ANY or ALL that will find all salespeople who have no customers located in their city.
select snum,sname from salespeople 
where sname not in (select sname from salespeople
where city = any(select city from customers));

----72.	Write a query using the EXISTS operator that selects all salespeople with customers located in their cities who are not assigned to them.
select s.sname from salespeople s
where exists (select * from customers c
where c.city=s.city and c.snum <> s.snum); 

--73.	Write a query that selects all customers serviced by Peel or Motika
select cname from customers
where snum in(select snum from salespeople
where sname ='monika' or sname = 'peel');

select * from salespeople

-----74.	Count the number of salespeople registering orders for each day. (If a salesperson has more than one order on a given day, he or she should be counted only once.).
select count(distinct snum),odate from orders 
group by odate;

----75.	Find all orders attributed to salespeople in London.
select * from orders
where snum in (select snum from salespeople
where city = 'London'); 

----76.	Find all orders by customers not located in the same cities as their salespeople.
select onum from orders
where cnum in (select cnum from customers c
where snum in(select snum from salespeople s
where c.city = s.city));


select onum from orders
where cnum in (select distinct cnum from customers c, salespeople s
where c.city not in (select s.city from salespeople));

---77.	Find all salespeople who have customers with more than one current order.
select distinct snum from orders 
where cnum in (select cnum from orders
group by cnum 
having count(cnum)>1);

----78.	Write a query that extracts from the Customer table every customer assigned to a salesperson who currently has at least one other customer (besides the customer being selected) with orders in the Orders table.
select snum from customers
group by snum
having count(snum)>1;

---79.	Write a query that selects all customers whose name begins with ‘C’.
select * from customers
where cname like 'C%';

---80.	Write a query on the Customers table that will find the highest rating in each city. Put the output in this form:  for the city (city) the highest rating is : (rating).
select city ,max(rating)  from customers
group by city;

---81.	Write a query that will produce the Snum values of all salespeople with orders currently in the Orders table without any repeats.
select distinct snum from customers;

---82.	Write a query that lists customers in descending order of rating. Output the rating field first, followed by the customers’ names and numbers.
select cname ,cnum,rating from customers
order by rating desc;

---83.	Find the average commission for salespeople in London.
select avg(comm) from salespeople
where city in 'London';

---84.	Find all orders credited to the same salesperson that services Hoffman
select onum from orders
where snum in(select  snum from customers 
where cname in 'Hoffman');

---85.	Find all salespeople whose commission is in between 0.10 and 0.12 both inclusive.
select snum ,comm from salespeople
where comm ='0.10' or comm= '0.12';

---86.	Write a query that will give you the names and cities of all salespeople in London with commission above 0.10
select snum ,sname , city  from salespeople
where city in 'London'
and comm<>(0.10);

---87.	What will be the output from the following query? 
SELECT * FROM ORDERS 
WHERE (AMT < 1000 OR NOT (ODATE = '03-oct-1996' AND CNUM > 2003));

---88.	Write a query that selects each customer’s smallest order.
select cnum , min(amt) from orders
group by cnum;

---89.	Write a query that selects the first customer in alphabetical order whose name begins with ‘G’.
select * from customers
where cname like 'G%' and rownum =1;

--90.	Write a query that counts the number of different not NULL city values in the Customers table.
select count(distinct city)from customers;

----91.	Find the average amount from the Orders table.
select avg(amt) from orders;

----92.	What would be the output from the following query?
SELECT*FROM ORDERS 
WHERE NOT  ( odate ='03-oct-1996' OR Snum>1006) AND amt>=1500;

--93.	Find all customers who are not located in San Jose & whose rating is above 200.
select * from customers
where city not in 'San Jose' and rating >200;

--94.	Give a simpler way to write this query:
--SELECT Snum, Sname, city, Comm FROM salespeople WHERE (Comm>0.12 and Comm <0.14);
select * from salespeople
WHERE (Comm >+0.12 or Comm <0.14);

select snum,sname ,city,comm from salespeople
where (comm>+ 0.12 or comm < 0.14);

--95.	Evaluate the following query:
SELECT * FROM orders 
WHERE NOT ((odate = '03-oct-1996'AND Snum>1002) OR amt>2000);
---96.	Which salespeople attend to customers not in the city they have been assigned to?
select s.sname,s.city,c.cname ,c.city from salespeople s
inner join customers c
on s.snum =c.cnum
where c.city not in s.city;

select s.sname,s.city,c.cname ,c.city from salespeople s,customers c
where c.city != s.city and s.snum=c.cnum;

---97.	Which salespeople get commission greater than 0.11 and serving customers rated less than 250?
select * from salespeople
where Comm >0.11 and snum in(select snum from customers where rating > 250);

---98.	Which salespeople have been assigned to the same city but get different commission percentages?
select * from salespeople
where city in(select city from salespeople
group by city having count(city) >1);  

--99.	Which salesperson has earned the most by way of commission?
select * from 
(select sum(comm*amt*0.1) as amt ,sname from salespeople , orders 
group by sname 
order by amt desc)
where rownum < 2 ;

--100.	Does the customer who has placed the maximum number of orders have the maximum rating?
select cnum,count(onum) from orders 
having count(onum) in (select max(count(onum))from orders
 group by cnum)group by cnum;

-------101.	Has the customer who has spent the largest amount of money been given the highest rating?
SELECT max(rating) from customers 
where cnum in (select cnum from orders 
having count(onum) in (select max(count (onum))  from orders 
group by cnum) 
group by cnum); 

---102.	List all customers in descending order of customer rating.
select * from customers
order by rating desc;

----103.	On which days has Hoffman placed orders?
select odate from orders
where cnum in(select cnum from customers
where cname = 'Hoffman');

----104.	Do all salespeople have different commissions?
select count(distinct Comm) ,count(distinct snum) from salespeople;

---105.	Which salespeople have no orders between 10/03/1996 and 10/05/1996?
select sname from salespeople 
where  snum in(select snum from orders 
where odate not in (select odate from orders 
where odate between '03-oct-1996' and '05-oct-1996'));

-------106.	How many salespersons have succeeded in getting orders?
select count(distinct snum) from orders;

--107.	How many customers have placed orders?
select count(distinct cnum ) from orders;

--108.	On which date has each salesperson booked an order of maximum value?
select odate from orders
where amt in (select max(amt) from orders
group by snum);

----109.	Who is the most successful salesperson?
select snum, amt  from orders
where amt in (select sum(amt) from orders
group by snum);

select sum(comm*amt*0.01) as amt ,sname from salespeople,orders
group by sname
order by amt desc;

select sum(amt) from orders
where snum in (select snum from orders 
group by snum);

----110.	Who is the worst customer with respect to the company?
select cnum from orders
where amt in(select min(amt*0.01) from orders
group by cnum);

---111.	Are all customers not having placed orders greater than 200 totally been serviced by salesperson Peel or Serres?
select snum from salespeople
where snum in  (select snum from customers where rating >200)
and sname not in 'peel' and sname not in 'serres';

SELECT * FROM ORDERS
WHEER AMT < 2000;

SELECT CASE
WHEN SNAME NOT IN ('Peel', 'Serres')
THEN 'YES'
ELSE 'NO'
END AS RESULT
FROM (SELECT S.SNAME FROM SALESPEOPLE S 
INNER JOIN CUSTOMERS C
ON S.SNUM - C.SNUM
INNER JOIN ORDERS O
ON C.CNUM=O.CNUM
WHERE O.AMT < 2000)

--112.	Which customers have the same rating?
select * from customers
where rating in(select rating from customers 
group by rating
having count(*) >1); 
 
----113.	Find all orders greater than the average for October 4th.
select onum from orders
where amt in(select avg(amt) from orders 
where odate  = '04-oct-1996');

---114.	Which customers have above average orders?
select cnum from orders
where amt in(select avg(amt) from orders
group by cnum);

select avg(count(cnum))from orders
group by cnum;

----115.	List all customers with ratings above San Jose’s average.
select * from customers
where rating > (select avg(rating) from customers
 where  city = 'San Jose');
  
---116.	Select the total amount in orders for each salesperson for which the total is greater than the amount of the largest order in the table.
select sum(amt) from orders
where snum in(select snum from orders 
group by snum
having max(amt) > snum);

---117.	Give names and numbers of all salesperson that have more than one customer.
select sname , snum from salespeople
where snum in (select snum from customers
group by snum
having count(snum)>1);

---118.	Select all salesperson by name and numbers who have customers in their city whom they don’s the service.
select s.snum,s.sname from salespeople s
inner join customers c
on s.city = c.city
where s.snum != c.snum;

---119.	Which customers’ rating should be lowered?
select C.* from customers C
where cnum in(select cnum from orders
group by cnum 
having sum(amt) =(select min(sum(amt))from orders
 group by cnum));
 
---120.	Is there a case for assigning a salesperson to Berlin?
select * from salespeople 
where snum in(select snum from customers
where city ='Berlin');

---121.	Is there any evidence linking the performance of a salesperson to commission that he or she is being paid?
SELECT s.sname ,s.comm ,SUM(o.amt) 
FROM salespeople s
JOIN orders o
ON s.snum = o.snum
GROUP BY s.sname, s.comm
ORDER BY  SUM(o.amt)  DESC;

--122.	Dose the total amount in orders by customer in Rome and London exceeds the commission paid to salesperson in London and New York by more than 5 times?

--123.	Which is the date, order number, amt and city for each salesperson (byname) for   the maximum order he has obtained?

select * from salespeople
select * from orders

select o.odate,o.onum,o.amt,s.city from orders o
join salespeople s
on o.onum = s.snum
group by o.odate,o.onum,o.amt,s.city 
having max(amt) ;


---124.	Which salesperson(s) should be fired?
select o.snum, o.amt from orders o
left join salespeople s 
on o.snum = s.snum 
where s.snum != amt
group by o.snum ,o.amt
having amt<1; 

--125.	What is the total income for the company? 
select sum(amt) from orders;

select sum(comm*amt) from orders,salespeople;

