--1) Write a pl/sql program to display hello world.
DECLARE 
     var varchar2(40) := 'Hello World' ; 
  BEGIN 
     dbms_output.put_line(var); 
  END;

--2) Write a pl/sql procedure or function to display hello world.
create or replace procedure displayMSG is 
BEGIN
    dbms_output.put_line('Hello World!');  
END;

BEGIN
displayMSG; 
END;

--3) Write a pl/sql program to add two integers.
DECLARE  
x int := 2; 
y int := 3; 
z int := x+y; 
BEGIN 
dbms_output.put_line(z); 
END;

--4) Write a pl/sql program to divide a float and a n integer.
DECLARE 
x float := 5.5; 
y int := 2; 
BEGIN 
dbms_output.put_line(x/y); 
END;

--5)Write a pl/sql program to check whether a number is even or odd.
DECLARE 
x int := 5; 
y int := 8; 
BEGIN 
IF mod(x,2) = 0 THEN dbms_output.Put_line('Even');  
ELSE 
dbms_output.Put_line('Odd');  
END IF;  
IF mod(y,2) = 0 THEN dbms_output.Put_line('Even');  
ELSE 
dbms_output.Put_line('Odd');  
END IF; 
END;


--6) Write a pl/sql program to display the largest of 3 numbers.
DECLARE 
x int := 5; 
y int := 8; 
z int := 6; 
BEGIN 
IF x>y and x>z THEN 
dbms_output.Put_line(x);  
ELSIF y>x and y>z THEN 
dbms_output.Put_line(y);  
ELSE 
dbms_output.Put_line(z); 
END IF; 
END;

--7)Write a pl/sql program to print student grade and performance using case statement with the following condition If grade=A then print excellent,if grade=B then print good,id grade=C then print average,else print poor.
DECLARE 
student_grade CHAR(1); 
performance VARCHAR2(20); 
BEGIN 
student_grade := 'C'; 
performance := CASE student_grade 
WHEN 'A' THEN 'Excellent' 
WHEN 'B' THEN 'Good' 
WHEN 'C' THEN 'Average' 
ELSE 'Poor' 
END; 
DBMS_OUTPUT.PUT_LINE('Student Grade: ' || student_grade); 
DBMS_OUTPUT.PUT_LINE('Performance: ' || performance); 
END;
