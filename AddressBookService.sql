-----UC1-----

create database AddressBookService;
show databases;
use AddressBookService;
select database();

-----UC2-----

create table AddressBook 
(first_name varchar(50) not null, last_name varchar(50), address varchar(150), city varchar(50)
not null, state varchar(50) not null, zip int unsigned not null, 
phone_number double unsigned not null, email varchar(150) not null);

-----UC3-----

insert into AddressBook values 
( 'Annie','Ruth','Shivmandir','Siliguri','WB',789456,8945612223,'abc@gmail.com'),
('Flora','Ghosh','NBU','Bangalore','Karnataka',325689,7894561236,'flora@gmail.com'), 
('Mickey','Kundu','Gurunpally','Shimla','HP',894561,8745963214,'mickey@gmail.com'), 
('Avi','Biswas','Dimond Road','Kolkata','WB',654789,9874589632,'avi@gmail.com'), 
('Deb','Clare','Bidhanpally','Kolkata','WB',45678,8338885555,'clare@gmail.com');
('Brian','Ghosh','Shanti Nagar','Jaipur','Rajasthan',234564,7894888562,'brian@gmail.com');

-----UC4-----

update AddressBook set address = 'Uttarayon' where first_name = 'Flora';
update AddressBook set zip = 745555 where first_name = 'Avi';

-----UC5-----

delete from AddressBook where first_name = 'annie';

-----UC6-----

select first_name, last_name from AddressBook where city = 'Jaipur';
select first_name, last_name from AddressBook where state = 'Rajasthan';

-----UC7-----

select count(city) from AddressBook group by city;
select state, count(city) from AddressBook group by state;
select count(state) from AddressBook group by state;

-----UC8-----

select first_name, last_name from AddressBook where city = 'Kolkata' order by first_name;

-----UC9-----

alter table AddressBook add book_name varchar(50) not null;
alter table AddressBook add type varchar(50) not null;
update AddressBook set book_name = 'book1' where name = 'Flora';
update AddressBook set book_name = 'book1' where first_name = 'Brian';
update AddressBook set book_name = 'book1' where first_name = 'Avi';
update AddressBook set book_name = 'book1' where first_name = 'Rounak';
update AddressBook set book_name = 'book2' where first_name = 'Mickey';
update AddressBook set type = 'professional' where book_name = 'book2';
update AddressBook set type = 'family' where book_name = 'book1';

-----UC10-----

select type, count(type) from AddressBook group by type;

-----UC11-----

insert into AddressBook values ('Raj','Karmakar','Bidhanpally','Bangalore','Karnataka'234569,987456987,'raj@gmail.com','book2','professional');
insert into AddressBook values ('Raj','Karmakar','Bidhanpally','Bangalore','Karnataka',234569,987456987,'raj@gmail.com','book1','family');

-----UC12-----

create table book ( book_id int auto_increment primary key, book_name varchar(150), type varchar(150) );
insert into book(book_name, type) values('book1','family');
insert into book(book_name, type) values('book2','professional');
insert into book(book_name, type) values('book3','friends');

create table person(person_id int auto_increment primary key, book_id int, name varchar(150), phone long, email varchar(150) );
alter table person add foreign key (book_id) references book(book_id);
insert into person values  (1, 1, 'Brian',8945612223,'abc@gmail.com'), (2, 1, 'Mickey', 8966678944,'mickey@gmail.com'), (3, 1, 'Dev', 7894562581,'dev@gmail.com'), (4, 3, 'Kiran', 8569822223,'kiran@gmail.com'), (5, 3, 'Flora', 866622113,'flora@gmail.com');
insert into person values (6,1,'Kiran',8569822223,'kiran@gmail.com');

create table adress (person_id int, state varchar(150), city varchar(150), zip varchar(150));
alter table adress add foreign key (person_id) references person(person_id);
insert into adress values (1, 'Karnataka','Bangalore',325689), (2, 'WB', 'Kolkata', 258963), (3, 'Jaipur', 'Rajasthan', 897456), (4, 'Karnataka','Bangalore',325899), (5,'Shimla','HP',794566), (6, 'Karnataka', 'Bangalore', 325899);

-----UC13-----

select p.name from person p natural join adress a where a.state = 'Karnataka';
select p.name from person p natural join adress a where a.city = 'Kolkata';
select city, count(city) from adress group by city;
select state, count(state) from adress group by state;
select distinct p.name from person p natural join adress a where a.city = "Bangalore" order by p.name;
select b.type, count(b.type) from book b natural join person p group by b.type;

