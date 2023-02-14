create table student(id int primary key identity,name varchar(20),branchid int,gender varchar(20),branch varchar(20))
insert into student values('anusha',2,'female','ece'),('pavan',1,'male','eee'),('akram',3,'male','cse'),('riyaz',2,'male','ece'),('ramya',3,'female','cse')
select *from student
drop table student
-----------------------Assignment:Info by Branchid-----------------
create function branchidfunc(@bid int)
returns table
as 
return(select * from student where branchid=@bid)
select * from dbo.branchidfunc(2)
-------------- Assignment:Info by gender------------
create function genderfunc(@gender varchar(10))
returns table
as 
return(select * from student where gender=@gender)
select * from dbo.genderfunc('female')
drop function genderfunc
-----------------netcount--------------

------------Assignment:Triggers------------
create table tablemplyee(id int,name varchar(40),gender varchar(40),salary int,deptid int )
insert into tablemplyee values(1,'desk','male',7000,1),(2,'dark','male',75000,3),(3,'darkish','female',76000,2),(4,'dharani','female',74000,1),(5,'dhana','female',7000,3)
select * from tablemplyee
drop table tablemplyee
create table tablemplyeeaudit(id int identity(1,1) primary key,auditdata nvarchar(1000))
create trigger tr_tblemployee_fordelete
on tablemplyee
for delete

as
begin 
declare @id int
select @id=id from deleted
delete from tablemplyee where id=4
insert into tablemplyeeaudit values ('new employee'+cast(@id as varchar (10))+'is insrted'+cast(getdate() as varchar(30)))
end
select *from tablemplyee
select *from tablemplyeeaudit
insert into tablemplyee values (4,'sushant','male',630489,4)
delete from tablemplyee where id=3
drop trigger tr_tblemployee_fordelete
---------------------------------------------Assignment:Subquery---------------------------------------
create table tblproducts(id int primary key identity,name varchar(20),decsrption varchar(100)) 
create table prodcutssales(id int primary key identity,productid int foreign key references tblproducts(id),unitprice int,quantitysoled int)
insert into tblproducts values('3g','it is one of the good one'),('4g','this one is updated version'),('5g','6g is the best one')
insert into prodcutssales values(9,150,4),(3,250,5),(6,350,4),(7,450,9)
select * from tblproducts where id in(select Distinct productid from prodcutssales where quantitysoled =0)
