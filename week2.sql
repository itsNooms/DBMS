CREATE TABLE empl_detailss(emp_id int,emp_name varchar(255),dept_no int,salary int);
--DESCRIBE empl_detailss;
INSERT INTO empl_detailss(emp_id, emp_name, dept_no, salary) VALUES (1, 'RENUKA', 5, 2000);
INSERT INTO empl_detailss(emp_id, emp_name, dept_no, salary) VALUES (2, 'PRASHANTI', 4, 2500);
INSERT INTO empl_detailss(emp_id, emp_name, dept_no, salary) VALUES (3, 'CHAITANYA', 5, 1000);
INSERT INTO empl_detailss(emp_id, emp_name, dept_no, salary) VALUES (4, 'BHUVANA', 2, 5000);
INSERT INTO empl_detailss(emp_id, emp_name, dept_no, salary) VALUES (5, 'SAHITHI', 3, 3000);
SELECT * FROM empl_detailss;
--UPDATE empl_detailss
SET salary= salary + (salary * 0.1)
WHERE emp_id = 1;
SELECT * FROM empl_detailss;
ALTER TABLE empl_detailss ADD AnnualSal int ;
UPDATE empl_detailss SET AnnualSal=salary*12 ;
SELECT * FROM empl_detailss;
SELECT * FROM empl_detailss WHERE salary>10000;
UPDATE empl_detailss SET dept_no=4 WHERE emp_id=4;
SELECT * FROM empl_detailss;
SELECT * FROM empl_detailss WHERE dept_no!=4;
DELETE FROM empl_detailss WHERE salary<5000;
SELECT * FROM empl_detailss;
