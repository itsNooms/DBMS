create table Customers(Customer_Id int primary key,Customer_Name varchar(50),Contact int,City varchar(50));

insert into Customers values(01,'Nooman',8143288576,'VZM');
insert into Customers values(02,'Sampath',9831887354,'Guntur');
insert into Customers values(03,'Leela',6743542897,'Vizag');
insert into Customers values(04,'Gowtham',7867453261,'Vizag');

create table Orders(Order_Id int,Customer_Id int primary key,Orders_ date,Price int);

insert into Orders values(110,01,'30-JUL-2024',500);
insert into Orders values(111,02,'02-JUN-2024',780);
insert into Orders values(112,03,'18-FEB-2024',1190);
insert into Orders values(113,04,'04-DEC-2024',890);

select * from Customers;
select * from Orders;


--Experiment–1(Equi join or Natural Join)
--1) Display the list of all Customers and orders. (using Equi join)
select * from Customers join Orders on Customers.Customer_Id = Orders.Customer_Id;
--2) Display the list of all Customers and orders. (using Natural join)
select * from Customers natural join Orders;

--3) Select CustomerName and the corresponding Order Id and orderdate for all Customers using Equi join.
select Customer_Name,Order_Id,Orders_ from Customers join Orders on Customers.Customer_Id = Orders.Customer_Id;

--4) Perform the above query using concept of Natural join
select Customer_Name,Order_Id,Orders_ from Customers natural join Orders;


--Experiment–2(Non-equi join):
--1) Display CustomerID and the corresponding Order Id and orderdate for all Customers if their order price >1000.
select Customers.Customer_Id,Orders.Order_Id,Orders.Orders_ from Customers join Orders on Customers.Customer_Id=Orders.Customer_Id where Price>1000;

--2) Display CustomerName and the corresponding Order Id and orderdate for all Customers if their order price lies between 500 and 1000.
select Customers.Customer_Id,Orders.Order_Id,Orders.Orders_from Customers join Orders on Customers.Customer_Id=Orders.Customer_Id where Price between 500 and 1000;

--Experiment–3(Outer Joins)
--1) Display the list of all Customers and orders. (Full outer join).
SELECT * FROM Customers FULL JOIN ORDERS ON CUSTOMERS.Customer_id=ORDERS.Customer_id;

SELECT * FROM Customers LEFT JOIN ORDERS ON CUSTOMERS.Customer_id=ORDERS.Customer_id;

--3) Display the list of all customers and their corresponding orders. If there exist any orders without any customers, include details of such orders also. (Right outer join).
select * from Customers right join Orders on Customers.Customer_Id = Orders.Customer_Id;


--Consider the following database schema:
--Employees (empID, eName, Contact, salary, city)Department (empId, deptID, deptName, deptBudget)
CREATE TABLE EMPLOYEES(empID INT , eName VARCHAR(20), Contact INT UNIQUE, salary INT , city VARCHAR(20));
CREATE TABLE DEPARTMENT(empId INT, deptID INT, deptName VARCHAR(20), deptBudget INT);
INSERT INTO EMPLOYEES VALUES(101,'Jessy',1234567890,30000,'VIZAG');
INSERT INTO EMPLOYEES VALUES(102,'Hessy',1134567890,50000,'VIZAG');
INSERT INTO EMPLOYEES VALUES(103,'Ressy',1224567123,60000,'VZM');
INSERT INTO EMPLOYEES VALUES(104,'Tessy',1233567123,47000,'VZM');
INSERT INTO EMPLOYEES VALUES(105,'Messy',1234467890,90000,'VZM');
INSERT INTO DEPARTMENT VALUES(101,1,'CSE',60000);
INSERT INTO DEPARTMENT VALUES(101,2,'CSE',60000);
INSERT INTO DEPARTMENT VALUES(102,1,'ECE',90000);
INSERT INTO DEPARTMENT VALUES(102,2,'MECH',47000);
INSERT INTO DEPARTMENT VALUES(103,1,'ECE',90000);
INSERT INTO DEPARTMENT VALUES(103,3,'EEE',80000);
INSERT INTO DEPARTMENT VALUES(101,4,'IT',50000);
INSERT INTO DEPARTMENT VALUES(104,2,'IT',50000);
INSERT INTO DEPARTMENT VALUES(104,4,'EEE',80000);

--1. Display the names of employees and their corresponding department names. (Equi Join)
SELECT eName,deptName FROM (SELECT * FROM EMPLOYEES JOIN DEPARTMENT ON EMPLOYEES.empID = DEPARTMENT.empID );

--. Display the names of employees and their department budgets. (Equi Join)
SELECT eName,deptBudget FROM (SELECT * FROM EMPLOYEES JOIN DEPARTMENT ON EMPLOYEES.empID = DEPARTMENT.empID );

--3. Display employee names and the department names where their department budget is greater than 50,000. (Equi Join)
SELECT eName,deptName FROM (SELECT * FROM EMPLOYEES JOIN DEPARTMENT ON EMPLOYEES.empID = DEPARTMENT.empID ) WHERE deptBudget>50000;

--4. Display employee names and department names using a natural join. (Natural Join)
SELECT eName,deptName FROM EMPLOYEES NATURAL JOIN DEPARTMENT;


--5. Display all employees along with their departments, including those who do not belong to any department. (Left Outer Join)
SELECT eName,deptName FROM EMPLOYEES LEFT JOIN DEPARTMENT ON EMPLOYEES.empID = DEPARTMENT.empID;

--6. Display employee names and department names where the department budget is not equal to 60,000. (Non-Equi Join)
SELECT eName,deptName FROM (SELECT * FROM EMPLOYEES JOIN DEPARTMENT ON EMPLOYEES.empID > DEPARTMENT.empID ) WHERE deptBudget!=60000;

--7. Display employee names and their department names where the employee's salary is less than the department budget. (Non-Equi Join)
SELECT eName,deptName FROM (SELECT * FROM EMPLOYEES JOIN DEPARTMENT ON EMPLOYEES.empID > DEPARTMENT.empID ) WHERE salary<deptBudget;


--8. Display department names and employees where the employee's salary is not in the range of 40,000 to 70,000. (Non-Equi Join)
SELECT eName,deptName FROM (SELECT * FROM EMPLOYEES JOIN DEPARTMENT ON EMPLOYEES.empID > DEPARTMENT.empID ) WHERE salary NOT BETWEEN 40000 AND 70000;


--9. Display all employees and their department names, including departments without employees. (Left Outer Join)
SELECT eName,deptName FROM EMPLOYEES LEFT JOIN DEPARTMENT ON EMPLOYEES.empID = DEPARTMENT.empID;

--10. Display all departments and their employees, including employees who are not assigned to any department. (Right Outer Join)
SELECT eName,deptName FROM EMPLOYEES RIGHT JOIN DEPARTMENT ON EMPLOYEES.empID = DEPARTMENT.empID;

--11. Display all employees and their department names, including employees and departments where there is no matching record in either table. (Full Outer Join)
SELECT eName,deptName FROM EMPLOYEES FULL JOIN DEPARTMENT ON EMPLOYEES.empID = DEPARTMENT.empID;

--12. Display employees who work in the same city as other employees. (Self Join)
SELECT E1.eName, E2.eName FROM EMPLOYEES E1  JOIN EMPLOYEES E2 ON E1.city = E2.city  WHERE E1.empID < E2.empID;



--13. Display pairs of employees who have the same salary. (Self Join)
SELECT E1.eName, E2.eName FROM EMPLOYEES E1 JOIN EMPLOYEES E2 ON E1.salary = E2.salary WHERE E1.empID < E2.empID;

--14. Display employees and their managers who have the same salary. (Self Join, assuming a manager field exists or you adjust to work with the given schema)
SELECT E1.eName AS Employee, E2.eName AS Manager FROM EMPLOYEES E1 JOIN DEPARTMENT D1 ON E1.empID = D1.empID JOIN DEPARTMENT D2 ON D1.deptID = D2.deptID JOIN EMPLOYEES E2 ON D2.empID = E2.empID WHERE E1.salary = E2.salary AND E1.empID < E2.empID;

--15. Display all departments and their total budget, including departments that have no employees. (LeftOuter Join)
SELECT deptName,deptBudget FROM EMPLOYEES LEFT JOIN DEPARTMENT ON EMPLOYEES.empID = DEPARTMENT.empID;


--16. Display employees and departments where the employee's contact number ends with '123'. (EquiJoin)
SELECT eName,deptName FROM (SELECT * FROM EMPLOYEES JOIN DEPARTMENT ON EMPLOYEES.empID < DEPARTMENT.empID ) WHERE Contact LIKE '%123';


--17. Display employees who do not have a department budget exceeding 40,000. (Non-Equi Join)
SELECT eName,deptName FROM (SELECT * FROM EMPLOYEES JOIN DEPARTMENT ON EMPLOYEES.empID < DEPARTMENT.empID ) WHERE deptBudget<=40000;
