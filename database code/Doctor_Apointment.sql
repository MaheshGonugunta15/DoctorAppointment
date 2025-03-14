drop database DoctorAppointmentBooking;


create database DoctorAppointmentBooking;
use DoctorAppointmentBooking;


create table Hospital(
hospital_id int auto_increment primary key,
hospital_name varchar(255) not null,
email varchar(255) not null,
phone varchar(255) not null,
picture varchar(255) not null,
password varchar(255) not null,
speciality varchar(255) not null,
address varchar(255) not null	
);


create table Doctor(
doctor_id int auto_increment primary key,
doctor_name varchar(255) not null,
email varchar(255) not null,
phone varchar(255) not null,
picture varchar(255) not null,
password varchar(255) not null,
speciality varchar(255) not null,
qualification varchar(255) not null,
designation varchar(255) not null,
about varchar(255) not null
);



create table User(
user_id int auto_increment primary key,
name varchar(255) not null,
email varchar(255) not null unique,
phone varchar(255) not null unique,
bloodGroup varchar(255) not null,
password varchar(255) not null,
gender varchar(255) not null,
age varchar(255) not null,
address varchar(255) not null
);


create table DoctorRequests(
doctorRequest_id int auto_increment primary key,
day varchar(255) not null,
fromTime varchar(255) not null,
toTime varchar(255) not null,
status varchar(255) not null,
hospital_id int,
doctor_id int,
consultant_fee varchar(255),
foreign key (hospital_id) references Hospital(hospital_id),
foreign key (doctor_id) references Doctor(doctor_id)
);




create table Slots(
slot_id int auto_increment primary key,
fromTime varchar(255) not null,
toTime varchar(255) not null,
slot_number varchar(255) not null,
day varchar(255) not null,
doctorRequest_id int,
foreign key (doctorRequest_id) references DoctorRequests(doctorRequest_id)
);



create table Bookings(
booking_id int auto_increment primary key,
cause varchar(255),
booking_date varchar(255),
status varchar(255),
slot_id int,
user_id int,
prescription varchar(255),
foreign key (slot_id) references Slots(slot_id),
foreign key (user_id) references User(user_id)
);



create table Reviews(
review_id int auto_increment primary key,
rating varchar(255) not null,
review varchar(255),
review_for varchar(255),
booking_id int,
date datetime not null default current_timestamp,
foreign key (booking_id) references Bookings(booking_id)
);



