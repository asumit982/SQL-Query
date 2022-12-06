-- 1.Prepare script to create table1 and table2 with primary key.

create table Department(
DeptCode int primary key,
DeptName varchar(50)
);

insert into Department(DeptCode,DeptName)
values(001,'Science'),
(002,'Maths'),
(003,'English')

-- 2.Prepare script to add foreign key constraint on any one table.

create table Teacher(
TeacherId int primary key,
FName varchar(50),
LName varchar(50),
DeptCode int FOREIGN KEY(TeacherId)
REFERENCES Department (DeptCode)
);

insert into Teacher
values(1,'David', 'Warner',2),
(2,'Sara','Joseph',2),
(3,'Mike','Brunton',1)

-- 3.Prepare script to add unique constraint to any one column.

ALTER TABLE Department
ADD UNIQUE (DeptCode);

-- 4.Prepare script to add index to any column.

CREATE INDEX Serial1 ON department (DeptCode);


-- 5.Create insert queries to add around 4 to 8 rows in both the tables.

insert into Department(DeptCode,DeptName)
values(004,'Hindi'),
(005,'History')

insert into Teacher
values(1,'Kathi', 'Ravan',3),
(2,'Kedar','Prabhu',2),
(3,'Saket','Acharya',1)


-- 6.Prepare a select query using WHERE, 'NOT IN', LIKE and ORDER BY clause

select TeacherId,FName,LName from Teacher
where DeptCode=2
order by TeacherId desc
   
-- Output
-- TeacherId   FName   LName
--    2        Sara    Joseph
--    1        David   Warner

select DeptCode,FName,LName from Teacher
where not DeptCode=2
order by TeacherId 

-- Output
-- DeptCode   FName   LName
--    1	      Mike	  Brunton
--    1	      Kathi	  Ravan
--    3	      Kedar	  Prabhu

select DeptCode,FName,LName from Teacher
where FName like 'K%';

--Output
-- DeptCode   FName   LName
--    1	      Kathi	  Ravan
--    3	      Kedar	  Prabhu


-- 7.Prepare a select query using GROUP BY and HAVING clause, with COUNT, SUM
select DeptCode,count(TeacherId) as NoOfTeacher from Teacher group by DeptCode 

--Output
--  DeptCode   NoOfTeacher
--    1      	2
--    2     	2
--    3     	1

select sum(DeptCode) as DeptTotal from Teacher

--Output
--  DeptTotal
--      9

-- 8.Prepare a INNER JOIN query between table1 and table2
select d.DeptCode,d.DeptName,t.FName,t.LName from Department d
inner join Teacher t
on d.DeptCode = t.TeacherId

--Output
-- DeptCode  DeptName   FName   LName
--   1	     Science	David	Warner
--   2	     Maths	    Sara	Joseph
--   3	     English	Mike	Brunton
--   4	     Hindi	    Kathi	Ravan
--   5	     History	Kedar	Prabhu


--9.Prepare LEFT JOIN query between table1 and table2

select d.DeptName,t.TeacherId,t.FName,t.LName from Department d
left join Teacher t
on d.DeptCode = t.TeacherId

--Output
-- DeptCode  DeptName   FName   LName
--   1	     Science	David	Warner
--   2	     Maths	    Sara	Joseph
--   3	     English	Mike	Brunton
--   4	     Hindi	    Kathi	Ravan
--   5	     History	Kedar	Prabhu

