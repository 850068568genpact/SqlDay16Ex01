Use ExerciseDb
Create table Student
(
Sid int primary key,
SName nvarchar(50),
SEmail nvarchar(50),
SContact nvarchar(20)
)

Insert into Student values
(101, 'Rajesh', 'rajesh@mail.com', '8393403324'),
(102, 'Harshita', 'harshita@mail.com', '9343434673'), 
(103, 'Juhi', 'juhi@mail.com', '8765879623')
Insert into Student values
(104, 'Shireesha', 'shireesha@mail.com', '8393463324')

Create table Fee
(Sid int foreign key references Student(Sid),
SFee nvarchar(50),
SMonth int,
SYear int,
primary key (Sid, SMonth, SYear)
)

Create table PayConfirmation
(Sid int,
Name nvarchar(50),
Email nvarchar(50),
Fee float,
PaidOnDate date)

--create trigger that fill information in above table 'PayConfirmation'
create trigger trgFeePayConfirmation
on Fee
after insert 
As
declare @sid int
declare @name nvarchar(50)
declare @email nvarchar(50)
declare @fee float
Select @sid = SId from inserted
Select @fee = SFee from inserted
Begin
Select @name = SName, @email = SEmail from Student where SId = @sid
Insert into PayConfirmation(Sid, Name, Email, Fee, PaidOnDate)
Values(@sid, @name, @email, @fee, getdate())
print 'Payment Confirmation, Values Updated in PayConfirmation table!!!'
end

Insert into Fee Values
(103, 10545.50, 7, 2018),
(102, 11345.50, 4, 2017),
(101, 12445.50, 10, 2020),
(104, 13245.50, 1, 2022)