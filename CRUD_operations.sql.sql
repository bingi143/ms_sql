

----------creating data base

create database Employee;


---------use the data base or work start with mentioned data base

use Employee;


---------creating table

--table name course
create table Course(CID int primary key,Course_name varchar(30) Not Null,Fees int check(Fees>2000));

--table name student
create table Student(SID int primary key,Student_name varchar(34) unique,Age int Not Null, DOB date,CID int References Course(CID));

--table name department
create table dept(DEPTNO int primary key,DNAME varchar(24) Not Null,LOC varchar(25));

--table name employee
create table emp(EMPNO int primary key, ENAME varchar(23) Not Null, JOB varchar(23) Not Null,MGR int, HIREDATE date Not Null,SAl int ,COMM int ,DEPTNO int References dept(DEPTNO)); 

--table name sample
create table sample(id int,name varchar(23),age int);



------inserting data into table


insert into Student values(10,'Teja',18,'18-Feb-03',114);


insert into Student values(10,'Teja',18,'18-Feb-03',114);


insert into dept values(40,'OPERATIONS','CHENNAI');


 insert into emp (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
 values(7934,'MILLER','CLERK',7782,'23-JAN-82',1300,NULL,10);

 insert into emp values(7902,'FORD','ANALYST',7566,'03-DEC-81',3000,NULL,20);

 insert into emp values(7900,'JAMES','CLERK',7698,'03-DEC-81',950,NULL,30);

 insert into emp values(7876,'ADAMS','CLERK',7788,'23-MAY-87',1100,NULL,20);

 insert into emp values(7844,'TURNER','SALESMAN',7698,'08-SEP-81',1500,0,30);

 insert into emp values(7839,'KING','PRESIDENT',NULL,'17-NOV-81',5000,NULL,10);

 insert into emp values(7788,'SCOTT','ANALYST',7566,'19-APR-87',3000,NULL,20);

 insert into emp values(7782,'CLARK','MANAGER',7839,'09-JUN-81',2450,NULL,10);

 insert into emp values(7698,'BLACK','MANAGER',7782,'01-MAY-81',2850,NULL,30);

 insert into emp values(7654,'MARTIN','SALESMAN',7698,'28-SEP-81',1250,1400,30);

 insert into emp values(7566,'JONES','MANAGER',7839,'02-APR-81',2975,NULL,20);

 insert into emp values(7521,'WARD','SALESMAN',7698,'22-FEB-81',1250,500,30);

 insert into emp values(7499,'ALLEN','SALESMAN',7698,'20-JAN-81',1600,300,30);

 insert into emp values(7369,'SMITH','CLERK',7902,'17-DEC-80',800,NULL,20);

--inserting data into table
insert into sample values(1,'venky',23);
insert into sample values(2,'rahul',21);
insert into sample values(3,'vijay',24);


 update emp set COMM=NULL where EMPNO=7369;



----------reading data from the data bsase



--displaying all data in emp table
 select * from emp;

--displaying all data in course table
select * from Course;


select * from Student;

select Course_name from Course where CID in (select CID from Student where Student_name='Venkatesh');

select Student_name,Age from Student where CID in (select CID from Course Where Fees>30000);

select * from Student where CID in (select CID from Course where Course_name='Java');

select Student_name,Age,DOB from Student where CID in (select CID from Course where Fees=32999);


select * from emp;

select ename,sal from emp;


select * from dept;

select * from emp;


--selecting required columns

select ename,sal from emp;

select hiredate from emp;

select * from emp;

--where class to giving conditions

select * from emp where ename='smith';

select ename,sal from emp where job='salesman';

select dname from dept where loc='chennai';

--Reading data from data base


select ename from emp where ename like 's%';

select * from emp where deptno in (10,20) and job in('analyst','cleark');

select * from emp where ename like '%ll%' and sal between 1200 and 28000 and deptno=30;

select * from emp where sal+comm>2000;

select * from emp where not sal%2=1;

select ename from emp where ename like '__a__' or ename like '__e__' or ename like '__i__' or ename like '__o__' or ename like '__u__';

select * from emp where mgr is not null and empno like '%8';

select * from emp where hiredate between '01-jan-81' and '30-dec-81';

select * from emp where hiredate like '%feb%';

select * from emp where job like '%man';

--multirow functions

select max(sal) from emp;

select max(sal) from emp where job='salesman';

select max(hiredate) from emp;

select min(sal) from emp;

select min(hiredate) from emp;

select min(sal) from emp where deptno in (10,20);

select sum(sal) from emp;

select sum(sal) from emp where ename like 's%';

select avg(sal) from emp;

select avg(comm) from emp where deptno=30;

select count(sal) from emp;

select count(comm) from emp;

select count(*) from emp where deptno in (10,20);

--sub queries

select dname from dept where deptno in (select deptno from emp where ename='smith');

select ename,sal from emp where deptno in (select deptno from dept where loc='paries');

select dname from dept where deptno in (select deptno from emp where job='salesman');

select * from dept where deptno in (select deptno from emp where job='clerk');

select empno,sal*12,comm from emp where deptno in (select deptno from dept where dname='accounting');

select * from dept where deptno in (select deptno from emp where ename like 's__t%');

select dname from dept where deptno in (select deptno from emp where sal between 1000 and 3000);

select * from emp where deptno in (select deptno from dept where dname in ('research','sales'));

select sal*12,empno,comm from emp where deptno in (select deptno from dept where dname like '%cc%');

--heighest salry
select * from emp where sal in (select max(sal) from emp);
--least salary
select ename,job from emp where sal in (select min(sal) from emp);
--second heighest salary
select max(sal) from emp where sal<(select max(sal) from emp);
--second least salary
select min(sal) from emp where sal>(select min(sal) from emp);

--5th heighest salary
select max(sal) from emp where sal<(select max(sal) from emp where sal<(select max(sal) from emp where sal<(select max(sal) from emp where sal<(select max(sal) from emp where sal<(select max(sal) from emp)))));


--to get unique values
select distinct job from emp;
--ordered ascendind and descending
select ename from emp order by ename asc;

select ename from emp order by ename desc;

--joints

--cross joint
select emp.ename,dept.dname from emp cross join dept;

--Equi join
select emp.ename,dept.dname from emp,dept where emp.deptno=dept.deptno;

--stored procedure
create procedure allemp 
AS
select * from emp
GO;

exec allemp;

--stored procedures

create procedure alldata1 @job varchar(24)
AS
select * from emp where job=@job;


exec alldata1 @job='salesman';



-----------update data in database



--adding new column

alter table emp 
add age int;


--removing column

alter table emp
drop column age;

--updating paricular value

update emp set sal=30000 where ename='smith';

--multiple values
update emp set sal=89000,job='DATA ENGINEER',ename='VENKATESH' where ename='black';

--updating without where
update emp set sal=sal*1.10 from emp;

--update column name

exec sp_rename 'emp.sal','SALARY','COLUMN';
 
--updating particular value

 update dept set DNAME='RESEARCH' where DEPTNO=20;

--adding column existing table

 alter table emp
 add age int;


EXEC sp_rename 'emp.SAl', 'SAL', 'COLUMN';

update emp set sal=25000 where ename='scott';






------deleting data from database


---delete the column from table alter drop the column
alter table sample
drop column age;

--delete particular row from table

delete from sample where id=2;

---delte the entite table but delete all rows

delete sample;

--entire table will delete
drop table sample;



---to get server name

SELECT @@SERVERNAME AS 'Server Name';


--to get user name

SELECT SYSTEM_USER AS 'User Name';


