--1)Write a pl/sql program to implement isnull() function.
DECLARE 
a int ; 
b int := 20; 
BEGIN 
if a is not NULL then DBMS_OUTPUT.PUT_LINE(a); 
elsif b is not null then DBMS_OUTPUT.PUT_LINE(b); 
else DBMS_OUTPUT.PUT_LINE('NULL'); 
end if; 
END;


--2) Write a plsql program to implement coalesce() function.
DECLARE 
a int; 
b int := 23; 
c varchar(10) := 'bhuvana'; 
BEGIN 
IF a is  null THEN DBMS_OUTPUT.PUT_LINE(b); DBMS_OUTPUT.PUT_LINE(c); 
ELSIF b is  null THEN DBMS_OUTPUT.PUT_LINE(a); DBMS_OUTPUT.PUT_LINE(c); 
ELSIF c is  null THEN DBMS_OUTPUT.PUT_LINE(a); DBMS_OUTPUT.PUT_LINE(b); 
ELSE DBMS_OUTPUT.PUT_LINE('NULL'); 
END IF; 
END;


--3) Write a pl/sql program to implement nullif() function.
DECLARE
a varchar(20);  
b varchar(20) := 'nooman';  
result1 varchar(20);
BEGIN
IF a = b THEN result1 := NULL; 
ELSE
IF a IS NULL THEN result1 := b;
ELSE
result1 := a;
END IF;  
END IF;
IF result1 IS NULL THEN dbms_output.put_line('result is null');
ELSE
dbms_output.put_line('result is: ' || result1);
END IF;
END;



--4) Write a pl/sql program to print 1 to 10 numbers using a simple loop.
DECLARE
a number(5):=1;
BEGIN
LOOP
dbms_output.put_line(a);
a := a + 1;
EXIT WHEN a > 10;
END LOOP;
END;


--5) Write a pl/sql program to print 1 to 10 numbers using a while loop.
DECLARE
a number(5):=1;
BEGIN
WHILE a<=10 LOOP
dbms_output.put_line(a);
a:= a+1;
END LOOP;
END;


--6) Write a pl/sql program to print 1 to 10 numbers using a for loop.
BEGIN
FOR a IN 1..10 LOOP
dbms_output.put_line(a);
END LOOP;
END;


--7)Write a pl/sql program to print 10 to 1 numbers using a simple loop.
DECLARE
a number(5):=10;
BEGIN
LOOP
dbms_output.put_line(a);
a := a-1;
EXIT WHEN a<1;
END LOOP;
END;


--8)Write a pl/sql program to print 10 to 1 numbers using a while loop.
DECLARE
a number(5):=10;
BEGIN
WHILE a>0 LOOP
dbms_output.put_line(a);
a := a-1;
END LOOP;
END;


--9)Write a pl/sql program to print 10 to 1 numbers using a for loop.
BEGIN
FOR a IN REVERSE 1..10 LOOP
dbms_output.put_line(a);
END  LOOP;
END;

--10) Write a program to check if a number is palindrome or not using while loop.
DECLARE
num number; 
original number; 
k number:=0; 
rem number; 
BEGIN
num:=2002; 
original:=num; 
while num>0 
LOOP
rem:=mod(num,10); 
k:=(k*10)+rem; 
num:=trunc(num/10); 
END LOOP;    
IF original=k THEN
dbms_output.put_line('it’s a palindrome'); 
ELSE
dbms_output.put_line('not a palindrome'); 
END IF; 
END; 
