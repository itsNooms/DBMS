--Aim: To practically understand and demonstrate the use of Aggregate functions, GROUP BY, HAVING, and
--ORDER BY clauses for retrieving specific information from given relations.

Create table EMPLOYEE (Eno int,primary key (Eno), Ename varchar(50) ,Age int, Email varchar(50) unique, Dept varchar(50), doj date, Salary int , city varchar(50));

INSERT INTO EMPLOYEE values(1,'Zain',29,'zain@gmail.com','CSE','13-FEB-2022',20000,'VIZAG');
INSERT INTO EMPLOYEE values(2,'Nooman',24,'nooman@gmail.com','ECE','17-SEP-2022',23000,'VZM');
INSERT INTO EMPLOYEE values(3,'Dayan',26,'dayan@gmail.com','CE','19-AUG-2022',13000,'SKM');
INSERT INTO EMPLOYEE values(4,'Shayan',28,' shayan@gmail.com','CSE','20-JUN-2022',34000,'KOL');
INSERT INTO EMPLOYEE values(5,'nashat',30,'nashat@gmail.com','MECH','07-JAN-2022',8000,'GAJU');
INSERT INTO EMPLOYEE values(6,'Nooman',32,'nooms@gmail.com','EEE','17-DEC-2022',21000,'VIZAG');
INSERT INTO EMPLOYEE values(7,'RAVI',21,'ravi@gmail.com','EEE','09-MAY-2022',12000,'DIB');

--1) Find the number of employees in the given relation Employee.
select count(Ename) from EMPLOYEE;

--2) Find the number of distinct employee names in the given relation Employee.
select count(distinct Ename) from EMPLOYEE;


--3) Find the number of employees working in the CSE department.
select count (Ename) from EMPLOYEE where Dept='CSE';

--4) Find the sum of all salaries of all employees.
select sum(salary) as sum from EMPLOYEE;

--5) Find the sum of all salaries of all employees.
select sum(salary) as sum from EMPLOYEE where city='VIZAG';

--6) Find the sum of salaries of employees whose names start with 'R' and have 'V' as the third character.
select sum(salary) as sum from EMPLOYEE where Ename like 'R_V%';

--7) Find the average of distinct salaries of all employees.
select avg(salary) as avgsal from (select distinct Salary from EMPLOYEE);

--8) Find the age of the oldest employee in the CSE department.
select max(age) as oldest from EMPLOYEE;

--9) Find the age of the youngest employee in the ECE department.
select min(age) as youngest from EMPLOYEE;

--10) Find the employee number and age of the oldest employee in the CSE department.
select Ename, Age from EMPLOYEE where age=(select max(age) from EMPLOYEE where Dept='CSE');


--11) Find the department name and the department-wise sum of salaries of employees.
select Dept,sum(salary) from EMPLOYEE group by Dept;

--12) Find the department name and the department-wise sum of salaries of employees who are living in Vizag.
select Dept,sum(salary) from EMPLOYEE where city='VIZAG' group by Dept;

--13) Find the city and the city-wise number of employees.
select city,count(Ename)from EMPLOYEE group by City;

--14) Find the department name and the department-wise sum of salaries where each department contains at least two employees.
select Dept,sum(salary) from EMPLOYEE group by Dept having count(Ename)>=2;

--15) Find the department name and the department-wise sum of salaries of employees who are living in Vizag, where the department's average age is greater than 25.
select Dept,sum(salary) from EMPLOYEE where city='VIZAG' group by Dept having avg(age)>25;


--16) Find the department that has a total salary paid to its employees of more than 15,000/-
select Dept,sum(salary) from EMPLOYEE group by Dept having sum(salary)>15000;

--17) Find the names of all employees, sorted by their salary in ascending order.
select Ename,Salary from EMPLOYEE order by Salary asc;


--18) Find the names of all employees, sorted by their salary in descending order.
select Ename,Salary from EMPLOYEE order by Salary desc;

--19) Find the details of the employee with the highest salary.
select*from EMPLOYEE where salary=(select max(salary) from EMPLOYEE);

--20) Find the details of the employee with the second highest salary.
select * from EMPLOYEE where Salary=(select max(Salary) from EMPLOYEE where Salary!=(select max(Salary) from EMPLOYEE));

--21) Find the details of the employee with the least salary.
SELECT * FROM EMPLOYEE WHERE Salary=(SELECT MIN(Salary) FROM EMPLOYEE);


--22) Find the details of the employee with the second least salary.
select * from EMPLOYEE where Salary=(select min(Salary) from EMPLOYEE where Salary!=(select min(Salary) from EMPLOYEE));


--23. Find the details of the top three highest-paid employees.
SELECT * FROM (SELECT * FROM EMPLOYEE ORDER BY Salary DESC) WHERE ROWNUM <= 3;


--24. Find the details of the three employees with the least salaries.
select * from (select * from EMPLOYEE order by Salary) where rownum<=3;


--25. Find the total number of employees in each department.
select Dept,count(Dept) from EMPLOYEE group by Dept;


--26) Find the average salary for each department, and display the departments in descending order of their average salary.
select Dept,avg(Salary) from EMPLOYEE group by Dept order by avg(Salary) Desc;

--27) Find the department names where the total salary exceeds 20,000/-, using the HAVING clause.
select Dept from EMPLOYEE group by Dept having sum(Salary)>=20000;

--28) Find the maximum and minimum salaries in each department.
select Dept,max(Salary),min(Salary) from EMPLOYEE group by Dept;

--29) Find the total number of employees in each city, and display only those cities where the number of employees is greater than 5.
select City,count(City) from EMPLOYEE group by City having count(Eno)>5;

--30) Find the department name and the average salary of employees in each department, sorted by the average salary in ascending order.
select Dept,avg(Salary) from EMPLOYEE group by Dept order by avg(Salary);
