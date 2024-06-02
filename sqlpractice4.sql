create table filmler (
films_id int,
film_name varchar(30), 
category varchar(30) 
);
insert into filmler values (1, 'Eyvah Eyvah', 'Komedi');
insert into filmler values (2, 'Kurtlar Vadisi', 'Aksiyon');
insert into filmler values (3, 'Eltilerin Savasi', 'Komedi');
insert into filmler values (4, 'Aile Arasinda', 'Komedi');
insert into filmler values (5, 'GORA', 'Bilim Kurgu'); 
insert into filmler values (6, 'Organize Isler', 'Komedi');
insert into filmler values (7, 'Babam ve Oglum', 'Dram');
select * from filmler;


create table aktorler (
id int,
actor_name varchar(30),
film_id int
);
insert into aktorler values (1, 'Ata Demirer', 1); 
insert into aktorler values (2, 'Necati Sasmaz', 2);
insert into aktorler values (3, 'Gupse Ozay', 3);
insert into aktorler values (4, 'Engin Gunaydin', 4);
insert into aktorler values (5, 'Cem Yilmaz', 5);
select * from aktorler;


--Soru-1 Tüm film_name leri, kategorilerini ve filmlerde oynayan aktor_name leri listeleyin
select * from filmler left join aktorler on filmler.films_id=aktorler.film_id;
select * from aktorler left join filmler on aktorler.film_id=filmler.films_id;

--Soru-2 tüm actor_name leri ve oynadigi film name leri listeleyiniz
select * from aktorler left join filmler on aktorler.film_id=filmler.film_id;
select * from filmler right join aktorler on aktorler.film_id=filmler.film_id;


create table Customers(
    customer_id int primary key,
    name varchar(50),
    email varchar(50)
);
insert into Customers(customer_id, name ,email)
values(1,'Ali','ali@gmail.com'),
	  (2,'Ayşe','ayse@gmail.com'),
	  (3,'Fatih','fatih@gmail.com');

create table Orders(
	order_id int primary key,
	customer_id int,
	product varchar(50),
	price decimal(8,2),
foreign key (customer_id)references Customers(customer_id)
);
insert into Orders(order_id,customer_id,product,price)
Values(101,1,'Laptop',2500.00),
	  (102,1,'Printer',500.00),
	  (103,2,'Tablet',1200.00),
	  (104,3,'Phone',1500.00),
	  (105,3,'Camera',2000.00);
	  
	  
--soru 1 customer name o isme ait product ve price'i inner join kullanarak birleştiriniz
select name,product,price from customers inner join orders on customers.customer_id=orders.customer_id;
	 	 
	 delete from orders

insert into Orders(order_id,customer_id,product,price)
Values(101,1,'Laptop',2500.00),
	  (102,1,'Printer',500.00),
	  (103,2,'Tablet',1200.00),
	  (104,null,'Phone',1500.00),
	  (105,null,'Camera',2000.00);
	  
--soru 2 : customer name product ve priclerin hepsini getiriniz
select product,price,order_id,customers.customer_id,name from orders full join customers on orders.customer_id=customers.customer_id;


CREATE TABLE Employees (
employee_id INT PRIMARY KEY,
name VARCHAR(50),
department VARCHAR(50),
manager_id INT
);
INSERT INTO Employees (employee_id, name, department, manager_id)
VALUES (1, 'Ali', 'IT', 2),
(2, 'Ayşe', 'IT', NULL),
(3, 'Fatih', 'Marketing', 4),
(4, 'Mehmet', 'Marketing', NULL),
(5, 'Elif', 'DEV', 1);

--Soru: inner join kullanarak employee_name ve manager_name leri gösteriniz
select employees_table.name as employee_name,manager_table.name as manager_name 
from Employees as employees_table 
inner join Employees as manager_table on employees_table.manager_id=manager_table.employee_id;


create table ogrenciler(
id int,
isim varchar(50),
sehir varchar(50),
puan int,
bolum varchar(20));
INSERT INTO ogrenciler VALUES (100, 'Ahmet Ümit', 'İstanbul', 546, 'Bilgisayar');
INSERT INTO ogrenciler VALUES (101, 'R.Nuri Güntekin', 'Antalya', 486, 'İşletme');
INSERT INTO ogrenciler VALUES (102,'S.Faik Abasıyanık', 'Bursa', 554, 'Bilgisayar');
INSERT INTO ogrenciler VALUES (103, 'Yaşar Kemal', 'İstanbul', 501, 'Matematik');
INSERT INTO ogrenciler VALUES (104, 'Halide E. Adıvar', 'İzmir', 473, 'Psikoloji');
INSERT INTO ogrenciler VALUES (105,'Nazan Bekiroğlu', 'İzmir', 432, 'Edebiyat');
INSERT INTO ogrenciler VALUES (106,'Peyami Safa', 'Antalya', 535, 'Bilgisayar');
INSERT INTO ogrenciler VALUES (107, 'Sabahattin Ali', 'İstanbul', 492, 'Matematik');

delete from ogrenciler

--soru 1: isimleri 'A'harfi ile baslayan ogrencilerin bilgilerini getirin
SELECT * FROM ogrenciler WHERE isim LIKE 'A%';

--Soru 2: İsimleri 'i' harfi ile biten öğrencilerin bilgilerini getirin.
SELECT * FROM ogrenciler WHERE isim LIKE '%i';

--Soru 3: İsimleri 'A' harfi ile başlayan ve 'Bilgisayar bölümünde okuyan öğrencilerin bilgilerini getirin.
SELECT * FROM ogrenciler WHERE isim lıke 'A%' AND bolum='Bilgisayar';

--soru 4: isimleri 'n'harfi iceren ogrencileri getirin
SELECT * FROM ogrenciler WHERE isim LIKE '%n%';

--soru 5: isimleri 'A' harfi ile baslamayan ogrencileri getirin
SELECT * FROM ogrenciler WHERE isim NOT LIKE 'A%'

--soru 6 : isimleri 12 karakterden daha uzun olan ogrencileri getirin
SELECT * FROM ogrenciler WHERE LENGTH(isim)>12;

--soru 7 : 4. harfi a olan ogrenci bilgilerini getirin
SELECT * FROM ogrenciler WHERE isim LIKE '___a%'

--soru 8 : isminin icinde z veya k harfi gecen ogrencileri getirin
SELECT * FROM ogrenciler WHERE isim LIKE '%Z%' OR isim LIKE '%k%';
--2. yol REGEXP İLE:
SELECT * FROM ogrenciler WHERE isim ~ '[zk]';

--soru 9 : ismi Y veya N ile baslayan ogrenci bilgilerini getir
SELECT * FROM ogrenciler WHERE isim LIKE 'Y%' OR isim LIKE 'N%';
--2. yolREGEXP İLE:
SELECT * FROM ogrenciler WHERE isim ~'^[YN]';

