create database keepnotes

use keepnotes

Create Table User_records 
(
User_Id int primary key,
User_Name varchar(30),
User_added_date Date,
User_Password varchar(20),
User_mobile varchar(10),
)

Insert into User_records values(112233,'Maya','2019-01-02','Maya1214','8012345679'),
(112244,'Nair','2019-01-11','Welcome','9023778467')

select * from User_records

Create Table Notes_Records
(
Note_Id int primary key,
Note_Title varchar(50),
Note_Content varchar(100),
Note_Status varchar(20),
note_creation_date Date,
--UserId_ int references Users(User_Id)
UserId int,
constraint FK_NOTE_RECORDS foreign key(UserId) references User_records(User_Id)
)

Insert into Notes_Records values(1, 'Today Tasks', '1.Chech emails and reply to them  2.Start the pro....','InProgress', '2019-01-21',112233),
(2,'Training to plan', '1.Application related  2.Technical related', 'Yet to Start','2019-01-31',112244),
(3,'Things to havetoday','1.Fruits 2.Morewater','InProgress','2019-01-25',112244)

Select * from Notes_Records

Create Table  Category_Records
(
Category_Id int primary key,
Category_Name varchar(25),
Category_descr varchar(100),
Category_creation_date Date,
Category_creator  int,
constraint FK_category_RECORDS foreign key(Category_creator) references User_records(User_Id)
)

Insert into Category_Records values(1,'Official','Office related notes','2019-01-21',112233),
(2,'Diet','Health related notes','2019-01-24',112244)

Select * from Category_Records

Create Table Reminder_Records
(
reminder_id int primary key,
reminder_Name varchar(50),
reminder_descr varchar(100),
reminder_type varchar(30),
reminder_Creation_date Date,
reminder_creator int,
constraint FK_Reminder_RECORDS foreign key(reminder_creator) references User_records(User_Id)
)
Insert into Reminder_Records values(1, 'KT remainder','Session on technical queries', 'Office Remainders','2019-02-12',112233),
(2, 'Personal remainder','Pick children','Personal Remainders', '2019-02-14',112244)

Select *  from Reminder_Records

Create Table NoteCategory
(
NoteCategoryid  int primary key,
note_id int,
category_id int,
constraint FKNotecategory1 foreign key(Note_id) references Notes_Records(Note_Id),
constraint FKNotecategory2 foreign key(Category_id) references category_records(category_Id)
)
Insert into Notecategory values(1,1,1),(2,2,1),(3,3,2)
select * from NoteCategory


Create Table NoteReminder
(
NoteRemainder_id  int primary key,
note_id int,
Remainder_id int,
constraint FKNoteRemainder1 foreign key(Note_id) references Notes_Records(Note_Id),
constraint FKNoteRemainder2 foreign key(Remainder_id) references Reminder_Records(Reminder_Id)
)
Insert into NoteReminder values(1,3,2),(2,2,1)
select * from NoteReminder

select * from User_records
Select * from Notes_Records
Select * from Category_Records
Select *  from Reminder_Records
select * from NoteCategory
select * from NoteReminder

--------QUERY 1: 1Fetch the row from User table with Id=112233 and Password=’Maya1214’.
select *from User_records where User_id=112233 and User_Password='Maya1214'
---------Query2: Fetch all the rows from Note table with note_creation_date=’01/31/2019’.
select *from Notes_Records where note_creation_date ='01/31/2019'
--------Query3: Fetch all the Categories created after ‘01/22/2019’.
select * from Category_Records where Category_creation_date > '01/22/2019'
---------Query4: Fetch all category details which belongs to note with note id=1.
select* from Category_Records where Category_creator =(select userid from Notes_Records where note_id=1)
---------query5: Fetch all the Notes from the Note table with userId=112244.
select *from Notes_Records where userid=112244
--------query6: Fetch all the Notes from the Note table for category_id=1.
select *from Notes_Records where userid= (select category_creator from category_records where category_id = 1)
--------query7: Fetch all the reminder details for note id=2.
select *from Reminder_Records where reminder_creator  =(select UserId from Notes_Records where Note_Id=2)
-------query8: Write a query to change the note_status to ‘Completed’ with note Id=3.
update Notes_Records set Note_Status = 'completed' where Note_Id=3
select*from Notes_Records
--------query 9: Write a query to set a reminder of type ‘Personal Reminders’ for Note with note id=1. [Find reminder id based upon reminder_type]
Update reminder_records Set reminder_type = 'Personal Reminders' Where reminder_creator = (Select userid from Notes_Records where note_id = 1)
select*from reminder_records
---------query10 :Write a query to remove all reminders from Note with note_id=2.
Delete from NoteReminder where note_id = 2
select*from NoteReminder


