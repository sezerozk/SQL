CREATE TABLE sirketler(
sirket_id INT PRIMARY KEY,
sirket_ismi VARCHAR(50),
memur_sayisi INT
);

INSERT INTO sirketler(sirket_id,sirket_ismi,memur_sayisi)
VALUES(100,'Nokia',1000),
(101,'Iphone',900),
(102,'Samsung',1200),
(103,'xiaomi',1500);

select * from sirketler;


--soru 1 :Samsungun memurlar sayisini en yüksek memurlar sayisi değerine esitleyin
--subquery'si select max(memur_sayisi) from sirketler
UPDATE sirketler SET memur_sayisi=(SELECT MAX(memur_sayisi) FROM sirketler)
WHERE sirket_ismi='Samsung';


--soru 2 :nokia sirketinin memurlar sayisi değerini en düşük memurlar sayisi değerinin 1.5 katına esitleyin
--subquery'si select min(memur_sayisi) from sirketler
UPDATE sirketler SET memur_sayisi=(SELECT MIN(memur_sayisi)*1.5 FROM sirketler)
WHERE sirket_ismi='Nokia';

--soru 3 :Iphonenin memurlar sayisini nokia ve xiaomi sirketlerinin memurlar sayisinin toplamına esıtleyın
--subquery'si select sum(memur_sayisi) from sirketler where sirket_ismi in('Nokia','xiaomi')
UPDATE sirketler SET memur_sayisi=(SELECT SUM(memur_sayisi) FROM sirketler WHERE sirket_ismi IN('Nokia','xiaomi'))
WHERE sirket_ismi='Iphone';

--soru 4 :Ortalama memurlar sayisi değerinden düşük olan memurlarin memur_sayisi değerlerini 400 artırın.
--subquery'si select avg(memur_sayisi)from sirketler 1800
UPDATE sirketler SET memur_sayisi=memur_sayisi+400
WHERE memur_sayisi<(SELECT AVG(memur_sayisi) FROM sirketler); 


CREATE TABLE memurlar (
    memurlar_id Int PRIMARY Key,
    ad VARCHAR(100),
    sehir VARCHAR(50),
    sirket_ismi VARCHAR(100),
    calisma_performanslari VARCHAR(255)
);
INSERT INTO memurlar (memurlar_id,ad, sehir, sirket_ismi, calisma_performanslari)
VALUES
    (100,'Ali Yılmaz', 'Ankara', 'Samsung', 'Ortalama 67'),
    (101,'Ayşe Demir', 'İstanbul', 'Iphone', 'Ortalama 72'),
    (102,'Mehmet Kaya', 'İzmir', 'xiaomi', 'Ortalama 55'),
	(103,'Ahmet Kısacık', 'Bursa' ,'Nokia', 'Ortalama 98'),
	(104,'Ahmet Kadir'	,'Ankara',	'Nokia'	,'Ortalama 92.5'),
	(105,'Fatma Güzel'	,'Giresun',	'Samsung'	,'Ortalama 92.5'),
	(106,'Furkan Yılmaz', 'İzmir', 'xiaomi', 'Ortalama 99');
select * from memurlar;

-- SORU5: memurlar sayisi 2200’den cok olan sirketlerin ve bu sirkette calisanlarin isimlerini 
--ve calisma performanslarini listeleyin.
SELECT ad,calisma_performanslari FROM memurlar
WHERE sirket_ismi in(SELECT sirket_ismi FROM sirketler WHERE memur_sayisi>2200);
	
-- SORU6: Ankara'da memurlari olan sirketlerin sirket id'lerini ve memurlar sayilarini listeleyiniz
SELECT sirket_ismi,sirket_id,memur_sayisi FROM sirketler 
WHERE sirket_ismi in(SELECT sirket_ismi FROM memurlar WHERE sehir='Ankara');
	
--Soru 7: eger giresunda bir tane bile memur varsa tum sirketleri yazdirin
SELECT * FROM sirketler WHERE EXISTS(SELECT sirket_ismi FROM memurlar WHERE sehir='Giresun');