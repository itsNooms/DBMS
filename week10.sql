--Aim: to demonstrate various SQL operations including the creation of tables, inserting data, creating views, updating data, and deleting data.
--Description: A view in SQL is a virtual table created from a query, allowing users to access specific data without directly interacting with the underlying tables. Views simplify complex queries and enhance security by limiting data access. Key operations on views include creating a view with a SQL query, selecting data from a view like a regular table, updating data if the view is updatable, inserting data through the view if it supports insertion, and deleting data if the view allows it. Views are powerful tools for organising and securing data in a database.
CREATE TABLE StudentDetails (sid int primary key, sname varchar2(10), place varchar(10));
CREATE TABLE StudentMarks (sid int , sname varchar2(10), marks int, age int);
INSERT INTO StudentDetails (sid,sname,place) VALUES (1,'Nooman','VZM');
INSERT INTO StudentDetails (sid,sname,place) VALUES (2,'Leela','BOBBILI');
INSERT INTO StudentDetails (sid,sname,place) VALUES (3,'Jahnavi','VZM');
INSERT INTO StudentDetails (sid,sname,place) VALUES (4,'Gowtham','VSK');
INSERT INTO StudentDetails (sid,sname,place) VALUES (5,'Praveen','AKP');

INSERT INTO StudentMarks (sid,sname,marks,age) VALUES (1,'Nooman',82,20);
INSERT INTO StudentMarks (sid,sname,marks,age) VALUES (2,'Leela',80,20);
INSERT INTO StudentMarks (sid,sname,marks,age) VALUES (3,'Jahnavi',81,20);
INSERT INTO StudentMarks (sid,sname,marks,age) VALUES (4,'Gowtham',83,20);
INSERT INTO StudentMarks (sid,sname,marks,age) VALUES (5,'Praveen',86,20);

select * from Studentdetails;

select * from StudentMarks;

--1) Write a query to create ‘studentd’ as a view.
create view studentd as select sname, place from StudentDetails where sid < 5; 
select * from studentd;

--2)Write a query to create ‘StudentNames’ as view.

create view StudentNames as select sname, place from StudentDetails order by sname; 
select * from StudentNames;

--3)Write a query to create view ‘viewmarks’ using multiple tables.
create view viewmarks as select StudentDetails.sname, StudentDetails.place, StudentMarks.marks from StudentDetails, StudentMarks where StudentDetails.sid = StudentMarks.sid;
select * from viewmarks;

--4) Write a query to drop a view.
drop view studentd;



--5) Write a query to update a view.
update StudentNames set place = 'VZM'  where sname = 'Praveen'; 
select * from StudentNames;
