drop table ogrenciler;

create table ogrenciler(
ogr_no int PRIMARY key, 
ogr_isim VARCHAR(30),
sinif int,
ders_id int
);
insert into ogrenciler values(12,'Enes Erdem', 10, 1);
insert into ogrenciler values(33,'Melek Maden', 9, 3);
insert into ogrenciler values(54,'Burcu Deniz', 10, 8);
insert into ogrenciler values(18,'Polat Yildirim', 11, 2);
insert into ogrenciler values(42,'Defne Gumus', 12, 1);
insert into ogrenciler values(23,'Serpil Ates', 11, 4);
insert into ogrenciler values(45,'Mehmet Gunes', 9, 7);
insert into ogrenciler values(32,'Demet Bulut', 12, 6);
insert into ogrenciler values(68,'Fikret Yavuz', 10, 9);


create table ogretmenler(
ogrt_id int PRIMARY key,
ogrt_isim VARCHAR(30),
ders_id int
);
insert into ogretmenler values(101,'Adem Alan',6);
insert into ogretmenler values(102,'Filiz Denge',2);
insert into ogretmenler values(103,'Gulsen Basar',3);
insert into ogretmenler values(104,'Osman Kok',4);
insert into ogretmenler values(105,'Mustafa Altin',8);
insert into ogretmenler values(106,'Mine Mutlu',1);
insert into ogretmenler values(107,'Hale Haktan',5);

create table dersler(
ders_id int PRIMARY key,
ders_isim VARCHAR(30),
ders_saati INT
);
insert into dersler values(1, 'Matemateik', 8);
insert into dersler values(2, 'Fizik', 6);
insert into dersler values(3, 'Kimya', 6);
insert into dersler values(4, 'Biyoloji', 4);
insert into dersler values(5, 'Edebiyat', 4);
insert into dersler values(6, 'Cografya', 2);
insert into dersler values(7, 'Tarih', 2);


--SORU1: tum dersleri ve varsa bu dersleri alan ogrencilerın isimlerini listeleyiniz
--esas tablomuz ne, dersler , Ders isimleri ve ogr isimleri
SELECT ders_isim,ogr_isim FROM dersler LEFT JOIN ogrenciler ON ogrenciler.ders_id=dersler.ders_id;

--SORU2: tum ogrencileri ve varsa bu ogrencilerin aldıkları dersleri listeleyiniz
--esas tablomuz nedir:
--ogrenciler
SELECT ogr_isim,ders_isim FROM dersler RIGHT JOIN ogrenciler ON ogrenciler.ders_id=dersler.ders_id;

--SORU3: tum ogretmenleri ve varsa bu ogretmenlerin derslerini listeleyiniz
--esas tablomuz nedir:
--ogretmenler
SELECT ogrt_isim,ders_isim FROM ogretmenler AS ogrt LEFT JOIN dersler AS drs ON ogrt.ders_id=drs.ders_id;

--SORU4: tum dersleri ve varsa bu derslerin ogretmenlerini listeleyiniz
--esas tablo dersler
SELECT ders_isim,ogrt_isim FROM dersler AS drs LEFT JOIN ogretmenler AS ogrt ON ogrt.ders_id=drs.ders_id;

--SORU5: tum ogretmenleri ve varsa  bu ogretmenlerin verdiği dersi alan ogrencilerin isimlerini listeleyiniz
--esas tablomuz nedir:
--ogretmenler
SELECT ogrt_isim,ogr_isim FROM ogrenciler RIGHT JOIN ogretmenler ON ogretmenler.ders_id=ogrenciler.ders_id;

--SORU6: ogrenciler tablosundaki ogrencilerden sadece dersler tablosundaki derslerden herhangi birini 
--alan ogrenci isimlerini listeleyiniz

SELECT ogr_isim,ders_isim FROM ogrenciler INNER JOIN dersler ON ogrenciler.ders_id=dersler.ders_id;

--SORU7: tum dersleri ve tum ogrenci isimlerini listeleyiniz
SELECT ogr_isim,ders_isim FROM dersler FULL JOIN ogrenciler ON ogrenciler.ders_id=dersler.ders_id;


create table musteriler(
id int primary key,
isim varchar(50),
sehir varchar(50),
yas int	
);
insert into musteriler values(100, 'Ahmet Umit', 'Istanbul', 54);
insert into musteriler values(101, 'R.Nuri Guntekin', 'Antalya', 18);
insert into musteriler values(102, 'S.Faik Abasiyanik', 'Bursa', 14);
insert into musteriler values(103, 'Yasar Kemal', 'Istanbul', 26);
insert into musteriler values(104, 'Halide E. Adivar', 'Izmir', 35);
insert into musteriler values(105, 'Nazan Bekiroğlu', 'Izmir', 42);
insert into musteriler values(106, 'Peyami Safa', 'Antalya', 33);
insert into musteriler values(107, 'Sabahattin Ali', 'Istanbul', 41);
insert into musteriler values(108, 'Oguz Atay', 'Istanbul', 28);
insert into musteriler values(109, 'Orhan Pamuk', 'Ankara', 30);
insert into musteriler values(110, 'Elif Safak', 'Bursa',27);
insert into musteriler values(111, 'Kemal Tahir', 'Izmir', 29);


create table siparisler(
id int,
musteri_id int,
urun_adi varchar(50),
tutar int);
insert into siparisler values(3002, 101,'roman', 230);
insert into siparisler values(3004, 102,'tukenmez kalem', 80);
insert into siparisler values(3006, 109,'sirt cantasi', 440);
insert into siparisler values(3008, 103,'kursun kalem', 75);
insert into siparisler values(3009, 105,'cizgili defter', 250);
insert into siparisler values(3010, 108,'kol cantasi', 300);
insert into siparisler values(3011, 106,'masal kitabi', 175);
insert into siparisler values(3013, 107,'kareli defter', 145);
insert into siparisler values(3001, 111,'matematik kitabi',500);
insert into siparisler values(3003, 130,'cizgisiz defter', 145);


--SORU1: musteriler tablosunda sehir'i Istanbul olan veriler ya da yasi 30dan buyuk olan
--verilerin isimlerini listeleyiniz
SELECT isim FROM musteriler WHERE sehir='Istanbul' OR yas>30;
--union
SELECT isim FROM musteriler WHERE sehir='Istanbul'sehir='Istanbul'
UNION
SELECT isim FROM musteriler WHERE sehir='Istanbul'yas>30;

--SORU2: musteriler tablosunda id degeri 105ten kucuk olan verilerin isimlerini 
--ve yası 20 ile 30 arasında olan verilerin sehirlerini listeleyiniz
select isim as isim_sehir from musteriler where id <105
union
select sehir from musteriler where yas between 20 and 30;

--SORU3: siparisler tablosundaki k ile baslayan urunlerin urun adi ve musteri_idleri ile
--musteriler tablosundaki ismi O ile baslayan verilerin isim ve id lerini listeleyiniz 
select urun_adi as urunler_yazalar,musteri_id from siparisler where urun_adi like 'k%'
union
select isim,id from musteriler where isim like 'O%';


--SORU4: musteriler tablosundaki verilerden yası en buyuk 3. ve 6. verilerin tum bilgilerini listeleyin
SELECT * FROM musteriler ORDER BY yas DESC;

(SELECT * FROM musteriler ORDER BY yas DESC OFFSET 2 LIMIT 1)
UNION
(SELECT * FROM musteriler ORDER BY yas DESC OFFSET 5 LIMIT 1);

--SORU5: musteriler tablosundan yası 30dan kucuk olan verilerin id ve sehirleri ile
--siparisler tablosundan tutarı 250den buyuk olan verilerin id ve urun_adi'larini listeleyiniz
select id,sehir as sehirler_and_urunler from musteriler where yas<30
union
select id,urun_adi from siparisler where tutar>250;

--SORU6: musteriler tablosundaki sehir ismi I ile baslayan verilerin isimlerini ve 
--yas degeri 30dan cok olan verilerin isimlerini tekrarlı olacak sekilde listeleyiniz 
--tekrarli olacak sekilde kullanmak istiyorsam union all kullanirim
select isim from musteriler where sehir like 'I%'
union all
select isim from musteriler where yas>30;
--union tekrarsiz listeleme yapar, union all tekrarli siralama yapar


--SORU7: musteriler tablosundaki sehir'i Izmır olan verilerin id leri ile
--siparisler tablosundaki urun_adi cizgili defter olan verilerin musteri_idlerinin
--kesişimini(ortak olanları) bulunuz
select id as ortak_id from musteriler where sehir='Izmir'
intersect
select musteri_id from siparisler where urun_adi='cizgili defter';


--SORU8: musteriler tablosundan sehri Istanbul veya Ankara olan verilerin idlerinin
--siparisler tablosundaki id'si 3010dan buyuk olan verilerin 
--musteri_idlerinden farklı olanları listeleyiniz
SELECT id FROM musteriler WHERE sehir IN('Istanbul','Ankara')--100 103 107 108 109
EXCEPT
SELECT musteri_id FROM siparisler WHERE id>3010;--106 107



--except operatoru ilk sorgudan ikinci sorgunun sonucu cıkarir a/b fark kumesini verir
--aynı sorunun sırası degismis hali:
select musteri_id from siparisler where id>3010--106 107
except
select id from musteriler where sehir in('Istanbul','Ankara')--100 103 107 108 109
