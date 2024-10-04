create database volunteer;
use volunteer;
 create table users(id int primary key auto_increment ,uname varchar(50),upwd varchar(50),uemail varchar(50),umobile varchar(20));
 desc users;
select *from users;
CREATE TABLE IF NOT EXISTS volunteers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    contact_no VARCHAR(20) NOT NULL,
    email VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    gender VARCHAR(10) NOT NULL,
    dob DATE NOT NULL,
    skills VARCHAR(255) NOT NULL,
    working_days VARCHAR(255) NOT NULL
);
select *from volunteers;

CREATE TABLE EventData (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    event_name VARCHAR(255),
    event_description TEXT,
    image_url VARCHAR(255)
);
INSERT INTO EventData (event_name, event_description, image_url) VALUES ("Charity Food Drive",  "Help us fight hunger in our community! This event is a food drive to collect non-perishable food items for donation to local food banks and shelters. Let's come together to make a difference and support those in need.", "https://media.istockphoto.com/id/1457979959/photo/snack-junk-fast-food-on-table-in-restaurant-soup-sauce-ornament-grill-hamburger-french-fries.webp?b=1&s=170667a&w=0&k=20&c=A_MdmsSdkTspk9Mum_bDVB2ko0RKoyjB7ZXQUnSOHl0=");
insert into EventData (event_name, event_description, image_url) values('Health & Wellness Workshop','Invest in your health with our Health & Wellness Workshop! Join us for informative sessions on nutrition, fitness, and mental well-being.Take proactive steps towards a healthier lifestyle','https://cdn.pixabay.com/photo/2016/11/08/05/29/surgery-1807541_1280.jpg');

insert into EventData (event_name, event_description, image_url) values('Artisan Market & Craft Fair','Support local artisans and crafters at our Artisan Market & Craft Fair! Explore unique handmade goods, including jewelry, pottery, textiles, and artwork. Shop for one-of-a-kind treasures while enjoying live music and delicious food','https://c8.alamy.com/comp/WABHDG/craft-fair-stalls-and-tent-sedlescombe-east-sussex-uk-WABHDG.jpg');

insert into EventData (event_name, event_description, image_url) values('Free Education',' Support poor children for Education by providing free education in ruler area indian education system are poor and if education is good then education cast will very high our ngo will support poor people by providing free Education','https://img.freepik.com/free-photo/book-with-green-board-background_1150-3836.jpg');
insert into EventData (event_name, event_description, image_url) values('Save Enviorment',' People release toxic chemicals into the air and alter the climate by raising the atmospheric concentration of greenhouse gases, such as carbon dioxide and methane, through industrialized agriculture','https://thumbs.dreamstime.com/b/environment-earth-day-hands-trees-growing-seedlings-bokeh-green-background-female-hand-holding-tree-nature-field-118143566.jpg');


select *from EventData;

CREATE TABLE VolunteerData (
    id INT AUTO_INCREMENT PRIMARY KEY,
    EventName VARCHAR(255),
    vName VARCHAR(255),
    vEmail VARCHAR(255),
    vContactNo VARCHAR(20),
    experience VARCHAR(255),
    skills VARCHAR(255)
);

select *from volunteerData;

 create table Adminregistration(id int primary key auto_increment ,Aname varchar(50),Apwd varchar(50),Aemail varchar(50),Amobile varchar(20));
 INSERT INTO Adminregistration (Aname, Apwd, Aemail, Amobile) 
VALUES 
('Admin1', 'adminpassword1', 'admin1@example.com', '1234567890'),
('Admin2', 'adminpassword2', 'admin2@example.com', '9876543210'),
('Admin3', 'adminpassword3', 'admin3@example.com', '5678901234');

insert into Adminregistration(Aname, Apwd,Aemail,Amobile) values('Sandeep','patel@123','patel123@gmail.com','1234567890');
select *from Adminregistration;



