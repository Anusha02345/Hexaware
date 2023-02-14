--welcome to sql server--
use anusha
create proc tab
as
begin
print 'welcome to sql server'
end
exec tab
create  table tbldepartment
(
id int primary key identity,
departmentname varchar(50),
location varchar(100),
departmenthead varchar(50)
)
insert into tbldepartment values
('rolls','america','sam'),
('cashier','chennai','ram'),
('technical','hyderabad','jimmy')
create table tblemployee
(
id int primary key identity,
name varchar(50),
gender varchar(50),
salary int,
departmentid int foreign key references tbldepartment(id)
)
insert into tblemployee values
('raju','male',2500,1),
('anu','female',3600,2),
('Nandu','female',1000,3),
('akash','male',3000,2)
select * from tblemployee

-----2nd question--
create proc customer2(@gender varchar(50),@departmentid int)
as
begin
select name,gender,salary from tblemployee 
where @gender=gender and @departmentid=departmentid
end
exec customer2 'male',2
drop proc customer2

---3rd question---

create proc cust(@gender varchar(10),@departmentid int,@totalcount int output )
as 
begin
select name,gender,salary from tblemployee
where @gender=gender and @departmentid=departmentid
select @totalcount=@@rowcount
end
declare @count int;
exec cust @gender='male',@departmentid=2,@totalcount=@count output
select @count as'number of employees'
select * from tblemployee

----4th question---

create proc cust2(@gender varchar(50))
as 
begin
select count(gender) from tblemployee
where @gender=gender
end
 
 exec cust2 'male'
 drop proc adding_numbers

 ---5th question---
 create proc adding_numbers(@num1 int=0,@num2 int=0 ,@num3 int=0)
 as
 begin
 declare @result int
 set @result=@num1+@num2+@num3
 select @result as [sum]
 end

 exec adding_numbers 10,11