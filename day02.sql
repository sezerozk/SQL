---- DAY 2 NT -----
-- TEKRAR --

CREATE TABLE IF NOT EXISTS sairler(	--böyle bir tablo yoksa olustur demis olduk
id INTEGER,
name VARCHAR(30),
email VARCHAR(50)
);

INSERT INTO sairler VALUES (1001,'Necip Fazıl','sair@email.com');
INSERT INTO sairler VALUES (1001,'Nazım Hikmet','sair@email.com');
INSERT INTO sairler (name) VALUES ('Atilla İlhan');
SELECT * FROM sairler;

--9 - tabloya UNIQUE constraint 'i ekleme
CREATE TABLE programmers(
id SERIAL,	--1 den baslasin ve her seferinde 1 arttirilsin. unique olmasini garanti etmez
name VARCHAR(30),
email VARCHAR (50) UNIQUE,	--email degerlerini unique yapmak icin UNIQUE keyword'u ekledik
salary REAL,
prog_lang VARCHAR (20)
);
SELECT * FROM programmers;

INSERT INTO programmers (name, email, salary,prog_lang) VALUES ('Tom','mail@mail.com',5000, 'Java');
INSERT INTO programmers (name, email, salary,prog_lang) VALUES ('Jerry','mail2@mail.com',6000, 'Java');
--usste id eklemedigimiz halde tablpda id geldi. cunku id SERIAL tipinde.
INSERT INTO programmers (email, salary,prog_lang) VALUES ('mail3@mail.com',5000, 'Python');

--10 tabloda bir sutuna NOT NULL constraint'i ekleme:
CREATE TABLE doctors(
id SERIAL,
name VARCHAR (30) NOT NULL,
salary REAL,
email VARCHAR (50) UNIQUE
);

INSERT INTO doctors (name, salary, email) VALUES ('Dr. Gregory House',6000,'dr@mail.com');
INSERT INTO doctors (name,salary, email) VALUES ('',6000,'doc@mail.com');--name null olamaz
SELECT * FROM doctors;	--empty, not null degildir


--11 tabloya PK constraint'i ekleme
CREATE TABLE students2(
id INTEGER PRIMARY KEY,	--artik id sutunu null alamaz ve unique olmalıdır
name VARCHAR(50),
grade REAL,
register_date DATE
);
SELECT * FROM students2;


CREATE TABLE students3(
id INTEGER,--not null,unique,başka bir tablo ile ilişkilendirmek için kullanılır
name VARCHAR(50),
grade REAL,
register_date DATE,
CONSTRAINT std_pk PRIMARY KEY(id)--CONSTRAINT ile kısıtlamaya özel isim verilebilir, zorunlu değildir
);

SELECT * FROM students3;

-- composite key:her degiskene tek tek PK veremeyiz. cunku bir tabloda bir PK olur. Sistem birden cok PK tanimladigimizi dusunerek izin vermez. Bu nedenle en sonra tek satirda composite key olarak veririz.
CREATE TABLE students4(
id INTEGER,	--PK		
name VARCHAR(50),	--PK
grade REAL,
register_date DATE,
CONSTRAINT std4_pk PRIMARY KEY(id,name)--composite key oluşsturmak icin; tek satirda iki degiskene PK veriririz.
);--burada cons lari birlestirmiyoruz, karistirma. sadece ikisini birlikte const olarak isaretlemis oluyoruz.

SELECT * FROM students4;


--tabloya Foreign Key constrainti ekleme
CREATE TABLE address3(
address_id INTEGER,
street VARCHAR (50),
city VARCHAR (20),
student_id INTEGER,
CONSTRAINT add_fk FOREIGN KEY (student_id) REFERENCES students3(id)--parent tabloyu referans verdik. 
);
SELECT * FROM address3;


CREATE TABLE address2(
address_id INTEGER,
street VARCHAR (50),
city VARCHAR (20),
student_id INTEGER,
FOREIGN KEY (student_id) REFERENCES students3(id)--parent tabloyu referans verdik. 
);
SELECT * FROM address3;


--13 tabloya CHECH constrainti eklemek
CREATE TABLE person(
id INTEGER,
name VARCHAR (50),
salary REAL CHECK (salary>5000),
age INTEGER CHECK(age>0)	--yas degeri 0'dan buyuk olmalı diye check koyuyoruz.
);

INSERT INTO person VALUES (11,'Ali Can',6000, 23)
SELECT * FROM person;
















