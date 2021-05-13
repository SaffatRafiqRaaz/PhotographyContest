drop database ProjectDB
create database ProjectDB;
use ProjectDB;
create table TADMIN(
A_ID int identity(1001,1)not null primary key,
A_Name varchar(50) not null,
A_Password varchar(50) not null
);
--insert admin
insert into tadmin values ('Raaz','160204041')
insert into tadmin values ('Tipu','160204031')

create table PHOTOGRAPHER(
P_ID int identity(2001,1) not null primary key,
P_Name varchar(50) not null,
P_Mobile varchar(15) not null,
P_Address varchar(100) not null,
P_DOB date not null,
P_Email varchar(50),
P_Password varchar(50) not null
);
--insert photographer
insert into photographer values ('p1','0133331','road 1','2015-03-04','p1@gmail.com','p1')
insert into photographer values ('p2','0133332','road 2','2015-03-05','p2@gmail.com','p2')
insert into photographer values ('p3','0133333','road 3','2015-03-06','p3@gmail.com','p3')
insert into photographer values ('p4','0133334','road 4','2015-03-07','p4@gmail.com','p4')
insert into photographer values ('p5','0133335','road 5','2015-03-08','p5@gmail.com','p5')
insert into photographer values ('p6','0133336','road 6','2015-03-09','p6@gmail.com','p6')
insert into photographer values ('p7','0133337','road 7','2015-03-10','p7@gmail.com','p7')
insert into photographer values ('p8','0133338','road 8','2015-03-11','p8@gmail.com','p8')
insert into photographer values ('p9','0133339','road 9','2015-03-12','p9@gmail.com','p9')
insert into photographer values ('p10','01333310','road 10','2015-03-13','p10@gmail.com','p10')
select * from PHOTOGRAPHER


create table ENTRIES(
E_ID int identity(3001,1) not null primary key,
Title varchar(50) not null,
URL varchar(200) not null Unique,
Category varchar(50) not null,
Height decimal(5,2) not null,
Width decimal(5,2) not null,
P_ID int not null foreign key references PHOTOGRAPHER(P_ID),
Camera_Model varchar(50) not null,
Room_No varchar(50)
);
--insert entries
insert into ENTRIES values('Sunset','D:\Photos\1.jpg','Nature',6.03,15.15,2001,'Nikon','7A01')
insert into ENTRIES values('War','D:\Photos\2.jpg','Concept',4.03,12.15,2001,'Canon','7A03')
insert into ENTRIES values('Valley','D:\Photos\3.jpg','Nature',6.10,15.03,2002,'Nikon','7A02')
insert into ENTRIES values('Grasshopper','D:\Photos\4.jpg','Animals',7.23,17.15,2002,'Sony','7A01')
insert into ENTRIES values('Beauty','D:\Photos\5.jpg','People',2.03,8.15,2003,'Olympus','7A04')
insert into ENTRIES values('Shadow','D:\Photos\6.jpg','Abstract',6.23,12.65,2003,'Nikon','7A03')
insert into ENTRIES values('Car','D:\Photos\7.jpg','Abstract',7.33,14.35,2004,'Sony','7A05')
insert into ENTRIES values('Leisure','D:\Photos\8.jpg','People',6.03,15.15,2004,'Canon','7A01')
insert into ENTRIES values('Work','D:\Photos\9.jpg','People',6.42,13.15,2005,'Canon','7A02')
insert into ENTRIES values('Mountain','D:\Photos\10.jpg','Nature',10.03,25.15,2005,'Sony','7A03')
insert into ENTRIES values('Dog','D:\Photos\11.jpg','Animal',8.03,17.15,2006,'Nikon','7A04')
insert into ENTRIES values('Passage','D:\Photos\12.jpg','Abstract',7.03,15.65,2006,'Fujifilm','7A05')
insert into ENTRIES values('Comment','D:\Photos\13.jpg','Concept',5.03,10.15,2007,'Sony','7A05')
insert into ENTRIES values('Balloons','D:\Photos\14.jpg','Abstract',8.03,13.15,2007,'Canon','7A04')
insert into ENTRIES values('Field','D:\Photos\15.jpg','Nature',2.03,5.53,2008,'Fujifilm','7A02')
insert into ENTRIES values('Clothes','D:\Photos\16.jpg','Abstract',4.03,15.15,2008,'Fujifilm','7A06')
insert into ENTRIES values('Metro','D:\Photos\17.jpg','People',6.03,11.15,2009,'Olympus','7A03')
insert into ENTRIES values('Security','D:\Photos\18.jpg','Concept',7.03,13.15,2009,'Nikon','7A06')
insert into ENTRIES values('Lights','D:\Photos\19.jpg','Abstract',3.03,7.15,2010,'Olympus','7A06')
insert into ENTRIES values('Aurora','D:\Photos\20.jpg','Nature',9.03,15.15,2010,'Fujifilm','7A02')
select* from ENTRIES




create table JUDGE(
J_ID int identity(4001,1) not null primary key,
J_Name varchar(50) not null,
J_Mobile varchar(15) not null,
J_Email varchar(50),
J_Password varchar(50) not null
);
--insert judge
insert into judge values('j1','0144441','j1@gmail.com','j1')
insert into judge values('j2','0144442','j2@gmail.com','j2')
insert into judge values('j3','0144443','j3@gmail.com','j3')
insert into judge values('j4','0144444','j4@gmail.com','j4')
insert into judge values('j5','0144445','j5@gmail.com','j5')


create table SCORES(
J_ID int not null foreign key references JUDGE(J_ID),
E_ID int not null foreign key references ENTRIES(E_ID),
Score int not null check(Score<=100) default 0,
constraint pk_score primary key (J_ID,E_ID) 
);
--insert score
insert into SCORES values (4001,3001,60)
insert into SCORES values (4002,3001,70)
insert into SCORES values (4003,3001,65)
insert into SCORES values (4001,3002,67)
insert into SCORES values (4003,3002,90)
insert into SCORES values (4004,3002,82)
insert into SCORES values (4005,3003,69)
insert into SCORES values (4003,3003,76)
insert into SCORES values (4002,3003,85)
insert into SCORES values (4001,3004,77)
insert into SCORES values (4005,3004,54)
insert into SCORES values (4002,3004,92)
insert into SCORES values (4003,3005,73)
insert into SCORES values (4004,3005,80)
insert into SCORES values (4005,3005,50)
--select entries
select E_ID from entries where P_ID=2002
select *,height*width as 'Size' from entries where E_ID=3003
--show score
select J_ID,score from scores where E_ID=3003
--average score
select avg(score) as 'Average score',sum(score) as 'Sum' from scores where E_ID=3003 group by E_ID
--select photographer
select * from PHOTOGRAPHER where P_ID=2002
--update photographer
update PHOTOGRAPHER set P_Name='p2',P_Mobile='0133332',P_Address='road 2',P_DOB='2015-03-05',P_Email='p2@gmail.com',P_Password='p2' where P_ID=2002
--select entry to score
select E_ID,P_ID from ENTRIES except select E_ID,P_ID from ENTRIES where E_ID in(select E_ID from scores where J_ID=4001)
--top entries
select Entries.E_ID,Category,avg(score) as 'Average Score' from ENTRIES inner join Scores on Entries.E_ID=SCORES.E_ID group by ENTRIES.E_ID,ENTRIES.Category order by avg(score) DESC
--delete entries
delete from entries where E_ID=3020
delete from photographer where P_ID=2001
delete from judge where J_ID=4001
delete from scores where E_ID=3001 and J_ID=4001
--select all id for login
select P_name,P_Password,P_ID from PHOTOGRAPHER
union
select J_name,J_Password,J_ID from JUDGE
union
select A_name,A_Password,A_ID from TADMIN
