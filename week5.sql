CREATE TABLE employeeD(id int ,PRIMARY KEY(id),name1 varchar(15) NOT NULL,dob date,sal int DEFAULT '20000',address varchar(20) DEFAULT 'VIZIANAGARAM');
desc employeeD;
INSERT INTO employeeD(id,name1,dob,address) values(1,'RENUKA','20-MAR-04','VIZIANAGARAM');
INSERT INTO employeeD(id,name1,dob,sal,address) values(2,'PRASHANTI','23-MAY-04',5000,'SRIKAKULAM');
INSERT INTO employeeD(id,name1,dob,sal) values(3,'CHAITANYA','20-JUNE-05',9000);
INSERT INTO employeeD(id,name1,dob,sal,address) values(4,'BHUVANA','20-JUN-04',7000,'VIZIANAGARAM');
INSERT INTO employeeD(id,name1,dob,sal,address) values(5,'VARSHINI','12-MAY-04',10000,'VISHAKHAPATNAM');
SELECT * FROM employeeD;
SELECT name1 FROM employeeD where name1 LIKE '%I';
SELECT name1 FROM employeeD where name1 LIKE '_E%';
SELECT name1 FROM employeeD where name1 NOT LIKE 'C%';
SELECT * FROM employeeD where sal BETWEEN 4000 and 9000;
SELECT * FROM employeeD where address in ('SRIKAKULAM','VIZIANAGARAM');
SELECT * FROM employeeD where address NOT in ('SRIKAKULAM','VIZIANAGARAM');
