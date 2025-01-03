--Aim: To practically understand and demonstrate the use of Nested Queries, Correlated Nested Queries,
--Set Operations, and Set Comparison Operators for retrieving specific information from given relations.
--Tables used:
--Sailors(sid: integer, sname: string, rating: integer, age: real);
--Boats(bid: integer, bname: string, color: string);
--Reserves(sid: integer, bid: integer, day: date).

--1. Create the Tables:
create table Sailors(sid int primary key,sname varchar2(20),rating int,age int);
create table Boats(bid int primary key,bname varchar2(20),color varchar2(20));
create table Reserves(sid int,bid int,day date,primary key (sid,bid,day),foreign key (sid) references Sailors(sid)ON DELETE CASCADE,foreign key (bid) references Boats(bid)ON DELETE CASCADE);

--2. Insert Data Sailors:
insert into Sailors (sid,sname,rating,age) values(22,'Dustin',7,45);
insert into Sailors (sid,sname,rating,age) values(29,'Brutus',1,33);
insert into Sailors (sid,sname,rating,age) values(31,'Lubber',8,55);
insert into Sailors (sid,sname,rating,age) values(32,'Andy',8,25);
insert into Sailors (sid,sname,rating,age) values(58,'Rusty',10,35);
insert into Sailors (sid,sname,rating,age) values(64,'Horataio',7,35);
insert into Sailors (sid,sname,rating,age) values(71,'Zorba',10,16);
insert into Sailors (sid,sname,rating,age) values(74,'Horataio',9,35);
insert into Sailors (sid,sname,rating,age) values(85,'Art',3,25);
insert into Sailors (sid,sname,rating,age) values(95,'Bob',3,63);


--Boats:
insert into Boats (bid,bname,color) values(101,'Interlake','blue');
insert into Boats (bid,bname,color) values(102,'Interlake','red');
insert into Boats (bid,bname,color) values(103,'Clipper','green');
insert into Boats (bid,bname,color) values(104,'Marine','red');


--Reserves
insert into Reserves(sid,bid,day) values(22,101,'10-OCT-98');
insert into Reserves(sid,bid,day) values(22,102,'10-OCT-98');
insert into Reserves(sid,bid,day) values(22,103,'8-OCT-98'); 
insert into Reserves(sid,bid,day) values(22,104,'7-OCT-98');
insert into Reserves(sid,bid,day) values(31,102,'10-Nov-98');
insert into Reserves(sid,bid,day) values(31,103,'6-NOV-98');
insert into Reserves(sid,bid,day) values(31,104,'12-NOV-98');
insert into Reserves(sid,bid,day) values(64,101,'5-SEP-98');
insert into Reserves(sid,bid,day) values(64,102,'8-SEP-98');
insert into Reserves(sid,bid,day) values(74,103,'8-SEP-98');


--1) Find the names of sailors who have reserved boat number 103"
SELECT S.sname FROM Sailors S, Reserves R WHERE S.sid = R.Sid AND R.bid = 103;

--2) Find the names of sailors who have reserved a red boat
SELECT S.sname FROM Sailors S, Reserves R, Boats B WHERE S.sid = R.sid AND R.bid = B.bid AND B.color = 'red';

--3) Find the colours of boats reserved by Lubber
SELECT B.color FROM Sailors S, Reserves R, Boats B WHERE S.sid = R.sid AND R.bid = B.bid AND S.sname ='Lubber';


--UNION:
--4) "Find the names of sailors who have reserved a red or a green boat"
SELECT S.sname FROM Sailors S, Reserves R, Boats B WHERE S.sid = R.sid AND R.bid=B.bid AND (B.color='red' OR B.color='green');


--INTERSECT

--5) "Find the names of sailors who have reserved both a red and a green boat"
SELECT S.sname FROM Sailors S, Reserves R1, Boats B1, Reserves R2, Boats B2
WHERE S.sid = R1.sid AND R1.bid = B1.bid AND S.sid = R2.sid AND R2.bid = B2.bid AND B1.color = 'red' AND B2.color = 'green';


--MINUS or EXCEPT
--Q6 "Find the names of sailors who have reserved a red but not a gree boat"
--• Oracle does not have EXCEPT but use keyword MINUS.
--• When we run the examples in our textbook, we should change EXCEPT to MINUS.
SELECT S.sname FROM Sailors S, Reserves R, Boats B WHERE S.sid = R.sid AND R.bid = B.bid AND B.color = 'red' MINUS SELECT S2.sname FROM Sailors S2, Boats B2, Reserves R2 WHERE S2.sid = R2.sid AND R2.bid = B2.bid AND B2.color= 'green';


--7) "Find the names of sailors who have reserved all boats"
SELECT S.sname FROM Sailors S WHERE NOT EXISTS (( SELECT B.bid FROM Boats B ) MINUS (SELECT R.bid FROM Reserves R WHERE R.sid = S.sid));


--8) " Find the names of sailors who have reserved at least one boat.
select s.sname from Sailors s , Reserves r where s.sid=r.sid;


--9)
--i.Find the ages of sailors whose name begins with B
SELECT S.age FROM Sailors S WHERE S.sname LIKE 'B%';


--ii.Find the ages of sailors whose name begins and ends with B and has at least three characters
SELECT S.age FROM Sailors S WHERE S.sname LIKE 'B_%B';

--Q10 "Find all sids of sailors who have a rating of 10 or have reserved boat 104"
SELECT S.sid FROM Sailors S WHERE S.rating = 10 UNION SELECT R.sid FROM Reserves R WHERE R.bid = 104;

--Q11 "Find the names of sailors who have not reserved a red boat"
SELECT S.sname FROM Sailors S WHERE S.sid NOT IN (SELECT R.sid FROM Reserves R WHERE R.bid IN (SELECT B.bid FROM Boats B WHERE B.color='red'));

--SET comparison operators 12,13,14
--Q12 "Find sailors whose rating is better than some sailor called Horatio"
SELECT S.sid FROM Sailors S WHERE S.rating > ANY(SELECT S2.rating FROM Sailors S2 WHERE S2.sname = 'Horatio');

--Q13 "Find sailors whose rating is better than every sailor called Horatio"
SELECT S.sid FROM Sailors S WHERE S.rating > ALL(SELECT S2.rating FROM Sailors S2 WHERE S2.sname = 'Horatio');

--Q14 "Find the sailors sids with the highest rating"
SELECT S.sid FROM Sailors S WHERE S.rating >= ALL(SELECT S2.rating FROM Sailors S2);

--Q15 "Find the average age of sailors with a rating of 10"
SELECT AVG(S.age) FROM Sailors S WHERE S.rating = 10;

--Q16 "Count the number of different sailor names"
SELECT COUNT (DISTINCT S.sname) FROM Sailors S;

--Q17 "Find the age of the youngest sailor for each rating level"
SELECT S.rating, MIN(S.age) FROM Sailors S GROUP BY S.rating ;

--Q18 "Find the age of the youngest sailor who is eligible to vote(i.e., is at least 18 years old) for each rating level with at least two such sailors"
SELECT S.rating, MIN(S.age) AS minage FROM Sailors S WHERE S.age >=18 GROUP BY S.rating HAVING COUNT(*) > 1;

--Q19 Find all sailor details whose age is between 20 and 30.
select * from Sailors s where s.age between 20 and 30;

--Q20. Find the names of sailors who have reserved at least two different boats.
SELECT sname FROM sailors s, reserves r1, reserves r2 WHERE s.sid=r1.sid AND r1.sid=r2.sid AND r1.bid<>r2.bid;

--Q21. Find the names of sailors who have reserved at least 3 different boats.
SELECT sname FROM sailors s, reserves r1, reserves r2, reserves r3 WHERE s.sid=r1.sid AND r1.sid=r2.sid AND r2.sid=r3.sid AND r1.bid<>r2.bid AND r2.bid<>r3.bid;

--Q22. “Compute increments for the ratings of persons who have sailed two different boats on the same day"
SELECT S.sname, S.rating +1 AS rating FROM Sailors S, Reserves R1, Reserves R2 WHERE S.sid = R1.sid AND S.sid = R2.sid AND R1.day = R2.day AND R1.bid <> R2.bid;
