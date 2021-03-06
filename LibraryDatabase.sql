create database library_demo;
use library_demo;

//To Create a READERS Table
create table READERS(
reader_id varchar(6),
fname varchar(30),
mname varchar(30),
lname varchar(30),
city varchar(15),
mobileno varchar(10),
occupation varchar(10),
ob date,
constraint readers_pk primary key(reader_id)
);

// To insert values into the readers table
insert into READERS values('C0001','Ram','parv','kapoor','Delhi','987654321','finance','1973-02-05');
insert into READERS values('C0002','nishanth',null,'kapoor','Chennai','987654321','finance','1978-11-20');
insert into READERS values('C0003','prem','garg','reddy','mumbai','987654321','finance','1999-01-11');
insert into READERS values('C0004','kavitha',null,'sharma','shimla','987654321','finance','1995-05-05');
insert into READERS values('C0005','rajini','moni','roy','puni','987654321','finance','1985-12-22');
insert into READERS values('C0006','bairi','kas','khan','Kolkata','987654321','finance','1987-09-28');
insert into READERS values('C0007','meera','bintha','lila','koor','987654321','It','1978-09-28');

 // To view the values in the readers table
select * from readers;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//To create a book table
create table Book(
bid varchar(6),
bname varchar(30),
bdomain varchar(30),
constraint book_bid_pk primary key(bid)
);

//To insert values into the book table
insert into book values('B0001','Fault in our star','Story');
insert into book values('B0002','Marry me','Story');
insert into book values('B0003','All is Well','Story');
insert into book values('B0004','Fast and Furious','Story');

select * from book;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// To create active_readers table
create table active_readers(
account_id varchar(6),
reader_id varchar(30),
bid varchar(30),
atype varchar(30),
astatus varchar(15),
constraint activereaders_acnumber_pk primary key(account_id),
constraint account_readers_fk foreign key(reader_id) references readers(reader_id),
constraint account_bid_fk foreign key(bid) references book(bid)
);

//To insert values into the active_readers table
insert into active_readers values('A0001','C0001','B0001','Premium','Active');
insert into active_readers values('A0002','C0002','B0002','Regular','Active');
insert into active_readers values('A0003','C0003','B0002','Premium','Active');
insert into active_readers values('A0004','C0002','B0003','Regular','Suspened');
insert into active_readers values('A0005','C0007','B0001','Premium','Active');
insert into active_readers values('A0006','C0004','B0003','Premium','Active');
insert into active_readers values('A0007','C0001','B0001','Premium','Active');
insert into active_readers values('A0008','C0003','B0002','Regular','Active');
insert into active_readers values('A0009','C0007','B0003','Premium','Active');
insert into active_readers values('A0010','C0006','B0002','Regular','Active');


select * from active_readers;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//To create a bookissue_details table
create table bookissue_details
(
issuenumber varchar(6),
account_id varchar(7),
bid varchar(20),
bookname varchar(50),
numbers_of_book_issued int(9),
constraint transdetails_tnumber_pk primary key (issuenumber),
constraint transdetails_acnumbr_fk foreign key (account_id) references active_readers(account_id)
);

//To insert value into the table
insert into bookissue_details values('T0001','A0001','B0001','Fault in our star',1);
insert into bookissue_details values('T0002','A0001','B0002','Marry me',1);

select * from bookissue_details;
select * from active_readers where astatus='Active';
