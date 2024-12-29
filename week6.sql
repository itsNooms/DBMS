Create table EMPLOYEE (Eno int,primary key (Eno), Ename varchar(50) not null, Email varchar(50) unique, Dept varchar(50), doj date, Salary int check(salary >5000), city varchar(50) default 'VZM');
desc EMPLOYEE;
--1) Alter table with changes in columns data (add, modify).
ALTER TABLE EMPLOYEE add(dob int);
ALTER TABLE EMPLOYEE modify(dob varchar(20));

--2) Insert at least 5 rows in the table based on constraints.
INSERT INTO EMPLOYEE(Eno,Ename,Email,Dept,doj,Salary,city,dob) values(1,'Nooman','nooman@gmail.com','CSE','17-SEP-2022',20000,'VIZAG','2004');

INSERT INTO EMPLOYEE(Eno,Ename,Email,Dept,doj,Salary,city,dob) 
values(2,'Leela','leela@gmail.com','ECE','21-AUG-2022',22000,'2004');

INSERT INTO EMPLOYEE(Eno,Ename,Email,Dept,doj,Salary,city,dob) values(3,'Gowtham','gowtham@gmail.com','CSE','01-AUG-2022',9000,'SKLM','2004');

INSERT INTO EMPLOYEE(Eno,Ename,Email,Dept,doj,Salary,city,dob) values(4,'Jahnavi','jahnavi@gmail.com','CSE','06-JUN-2022',50000,'VIZAG','2006');

INSERT INTO EMPLOYEE(Eno,Ename,Email,Dept,doj,Salary,city,dob) values(5,'Sampath','sampath@gmail.com','CSE','16-DEC-2022',50000,'VIZAG','2004');

SELECT * FROM EMPLOYEE;

--3) Attempt to insert multiple records with duplicate values for Eno, Email and observe the results
INSERT INTO EMPLOYEE(Eno,Ename,Email,Dept,doj,Salary,dob) values(5,'Praveen','sampath@gmail.com','mech','25-JUL-2022',26000,'2001');
INSERT INTO EMPLOYEE(Eno,Ename,Email,Dept,doj,Salary,dob) values(3,'Upendra','leela@gmail.com','civ','26-JUL-2022',27000,'2007');

--4) Attempt to insert multiple records with NULL values for ename and observe the results
INSERT INTO EMPLOYEE(Eno,Ename,Email,Dept,doj,Salary,city,dob) values(6,NULL,'mohan@gmail.com','ECE','2-JUL-2022',20000,'Vizag','2000');
INSERT INTO EMPLOYEE(Eno,Ename,Email,Dept,doj,Salary,city,dob) values(7,NULL,'praveen@gmail.com','CSE','3-JUL-2022',20000,'SRIKAKULAM','2002');

--5) Attempt to insert multiple records with less than 5000 salary and observe the results
INSERT INTO EMPLOYEE(Eno,Ename,Email,Dept,doj,Salary,city,dob) values(8,'poornima','poor@gmail.com','mech','20-JUL-2022',2000,'VZM','2004');

--6) Attempt to insert multiple records except city and display the table (default ‘VZM’)
INSERT INTO EMPLOYEE(Eno,Ename,Email,Dept,doj,Salary,dob) values(9,'ZAIN','zain@gmail.com','ECE','5-JUL-2022',22000,'2005');
SELECT * FROM EMPLOYEE;

--7) Insert values into table except ename and display the table
INSERT INTO EMPLOYEE(Eno,Ename,Email,doj,Salary,city,dob) values(10,'MOUNIKA','mouni@gmail.com','20-JUL-2022',20000,'VIZAG','2004');
SELECT * FROM EMPLOYEE;


--8) Now insert the Dept using update command and display the table
UPDATE EMPLOYEE SET Dept = 'CSE' WHERE Eno=10;
SELECT * FROM EMPLOYEE;

--9) Delete some records and display the table
DELETE FROM EMPLOYEE WHERE Eno<3;
SELECT * FROM EMPLOYEE;

--10) Display the record of each employee who works in CSE and ECE.
SELECT * FROM EMPLOYEE WHERE (Dept='CSE' AND Dept='ECE');

--11) Display the record of each employee who works in CSE or ECE.
SELECT * FROM EMPLOYEE WHERE (Dept='CSE' OR Dept='ECE');

--12) Update the city of Emp no. 112 with the current city as Silchar.
INSERT INTO EMPLOYEE(Eno,Ename,Email,Dept,doj,Salary,city,dob) values(112,'Vignesh','vignesh@gmail.com','CSE','20-JUL-2022',20000,'VIZAG','2004');
UPDATE EMPLOYEE SET City= 'SILCHAR' WHERE Eno=112;
SELECT * FROM EMPLOYEE;

--13) Display the details of Employee who did not work in department MECH.
SELECT * FROM EMPLOYEE WHERE Dept!='MECH';

--14) Delete the email_id of employee Jhonny.
INSERT INTO EMPLOYEE(Eno,Ename,Email,Dept,doj,Salary,city,dob) values(11,'jhonny','jhonny@gmail.com','CSE','15-JUL-2022',20000,'VIZAG','2001');


UPDATE EMPLOYEE SET Email= NULL WHERE Ename ='JHONNY';

--Part-2: Implement the following queries using number functions, string functions and date functions

--1) Select employee Name with first letter in capital
SELECT INITCAP(Ename) AS Ename FROM EMPLOYEE;

--2) Select employee Name with all small letters
SELECT* FROM EMPLOYEE WHERE Ename LIKE (SELECT LOWER(Ename) FROM DUAL);

--3) Select employee Name with all capital letters
SELECT* FROM EMPLOYEE WHERE Ename LIKE (SELECT UPPER(Ename) FROM DUAL);

--4) Select all employees whose name starts with ‘S’
SELECT * FROM EMPLOYEE WHERE Ename LIKE 'S%';

--5) Select employees whose name ends with ‘I’
SELECT * FROM EMPLOYEE WHERE Ename LIKE '%I';

--6)Select employees whose third character in their Name is ‘a’
SELECT * FROM EMPLOYEE WHERE Ename LIKE '__a%';


--7)Select employees whose third character in their Name is ‘_’(underscore)
SELECT * FROM EMPLOYEE WHERE Ename LIKE '__\_%' ESCAPE '\';

--8)Select employees who are living in a city name contains exactly 5 characters and starts with “v’ 
SELECT * FROM EMPLOYEE WHERE LENGTH(CITY) = 5 AND UPPER(SUBSTR(CITY, 1, 1)) = 'V';


--9) Select the salary and additional HRA (7.5% of the salary) for each employee in the employee table rounded to a whole number.
select ename,salary,round(salary+(7.5/100)*salary) as "HRA" from EMPLOYEE;

--10) Display the numeric position of ‘a’ in employee Name for all employees who have joined after ‘01-jun-2015’.
select ename,instr(ename,'a') from employee where DOJ>'01-jun-2015';

--11) Calculate the remainder of a salary after it is divided by 500 for all employees who are living in vizag.
select mod(salary,500) "reminder" from employee where city='vizag';

--12) Pad employee Name to left with ‘#’ to a maximum length of 15 for all employees who belong to mechanical department.
select lpad(ename,15,'#') from employee;

--13) Pad employee Name to right with ‘*’ to a maximum length of 10 for the employee whose salary above 50000
select rpad(ename,10,'*') from employee where salary>50000;

--14) Select employees whose salary is between 5000 and 9000
select * from EMPLOYEE where salary between 5000 and 9000;

--15) Select employees whose salary is exactly 5000 or 6000 or 7000 or 8000
select * from employee where salary=5000 or salary=6000 or salary=7000 or salary=8000;

--16) Select first 5 employee records from employee table in salary ascending order
select * from (select * from EMPLOYEE order by salary asc )where rownum <= 5;

--17) Select first 5 employee records from employee table in salary ascending order
select * from (select * from EMPLOYEE order by salary desc )where rownum <= 5;

--18) Display the six-month joining date for all the employees who belong to ‘CSE’ department.
select Eno,Ename,DOJ,add_months(DOJ, 6) as six_month_anniversary from employee where dept = 'CSE';


--19) Display the first Monday after joining date for all employees whose salary above 6000.
select Ename,next_day(DOJ,'Monday') from EMPLOYEE where salary > 6000;

--20) Display eno, ename and number of months employed for all the employees who have employed for less than 24 months.
select Eno,Ename from EMPLOYEE where months_between(sysdate,DOJ) < 24;

--21) Display the empno, joining date and start day of month using the ROUND and TRUNC functions who are joined or started in 1985.
select Eno,DOJ,TO_CHAR(DOJ, 'DD') as start_day_of_month from EMPLOYEE where TRUNC(DOJ, 'YEAR') = TO_DATE('01-JAN-1985', 'DD-MON-YYYY');

--22) Display empno and empname joined together, length of empname for all employees who are working in ECE dept
select Eno,Ename,LENGTH(Ename) as Ename_length from EMPLOYEE where dept = 'ECE';

--23) Increment the salary of all employees by announcing a bonus of 1000 who have a service experience of more than 36 months.
update EMPLOYEE set salary = salary + 1000  where MONTHS_BETWEEN(SYSDATE, DOJ) > 36;
select * from EMPLOYEE;


