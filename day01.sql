-----------------DAY 1 NT ----------
-- yorum satiri
/*
coklu yorum satiri
*/

-- SQL komutlarindakucuk / buyuk harf duyarliligi yoktur


--1	-database olusturma	--DDL
CREATE DATABASE deneme;	-- ; isareti zorunlulugu yok, ancak okuma kolayligi icin koyuyoruz

create database test2;	-- calistirilacak sorguyu secili yapip Run ediyoruz.


--2	-database silme	--DDL
DROP DATABASE deneme;	--silinecek database yan tarafta active olmamali.

--3 -tablo olusturma	--DDL
CREATE TABLE students(
id CHAR(4),
name VARCHAR(20),
grade REAL,
register_date DATE		--snake_case kullaniyoruz
);


--4	mevcut tablodan yeni bir tablo olusturma	--DDL
CREATE TABLE grades AS SELECT name,grade FROM students;	
--name ve grade sutunlarini students tablosundan sec ve bunlarla grades isimli tablo olustur


--5	tabloyu silme	--DDL
DROP TABLE grades;


--6 tabloya tum field'lari ile dat ekleme
INSERT INTO students VALUES('1001','Sherlock Holmes',99.8,'2023-12-11');
INSERT INTO students VALUES('1002','Harry Potter',99,now());


--7	-data okuma/cekme
--a	-tablodaki tum kayitlari tum field'lariyle okuma
SELECT * FROM students;

--b	-tablodaki tum kayitlari bazi field'lariyle okuma
SELECT name,grade FROM students;

--8	-tabloya bazi field'lariyla data ekleme
INSERT INTO students(name,grade) VALUES('Jack Sparrow',99.7);


































