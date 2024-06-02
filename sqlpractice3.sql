drop table memurlar;
create table memurlar(
memur_id int PRIMARY key,
memur_isim VARCHAR(50),
memur_maas int
);
Insert into memurlar VALUES(1,'çiğdem',100000);
INSERT into memurlar VALUES(2,'Duygu',150000);
Insert into memurlar values(3,'Aykut',110000);
INSERT into memurlar values(4,'Sıla');
select * from memurlar;

--sila hanima maas degeri atamasi yapalim
UPDATE memurlar SET memur_maas=125000 WHERE memur_isim='Sıla';

--En dusuk veya en yuksek maas degerlerinin oldugu kayıtları listeleyin
SELECT * FROM memurlar WHERE memur_maas=(select max(memur_maas) from memurlar) or memur_maas=(select min(memur_maas)from memurlar);

--aykut bey'in maasini en yuksek maasa esitleyelim
UPDATE memurlar SET memur_maas=(SELECT MAX(memur_maas)FROM memurlar)
WHERE memur_isim='Aykut';

