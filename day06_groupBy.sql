/*============================= GROUP BY =====================================
    
    GROUP BY cümleciği bir SELECT ifadesinde satırları, sutunların değerlerine 
    göre özet olarak gruplamak için kullanılır. 
   
    GROUP BY cümleceği her grup başına bir satır döndürür. 
    
    GROUP BY genelde, AVG(),COUNT(),MAX(),MIN() ve SUM() gibi aggregate 
    fonksiyonları ile birlikte kullanılır.
    
==============================================================================*/ 
      
    CREATE TABLE manav 
    (
        isim varchar(50), 
        urun_adi varchar(50), 
        urun_miktari int 
    );
    
    INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
    INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
    INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
    INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
    INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
    INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
    INSERT INTO manav VALUES( 'Veli', 'Uzum', 4);
    INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
    INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
    INSERT INTO manav VALUES( 'Ayse', 'Uzum', 4);
    INSERT INTO manav VALUES( 'Ali', null, 2);
    
    
    /* -----------------------------------------------------------------------------
  ORNEK1: kisi ismine göre satılan toplam meyve miktarlarını gösteren sorguyu 
  yazınız.
------------------------------------------------------------------------------*/
SELECT 
    isim, SUM(urun_miktari)
FROM
    manav
GROUP BY isim;

/* ----------------------------------------------------------------------------
  ORNEK2: satılan meyve türüne (urun_adi) göre urun alan kişi sayısını gösteren
  sorguyu yazınız. NULL olarak girilen meyveyi listelemesin.
-----------------------------------------------------------------------------*/ 
SELECT 
    urun_adi, COUNT(isim)
FROM
    manav
WHERE
    urun_adi IS NOT NULL
GROUP BY urun_adi;

select urun_adi, min(urun_miktari), max(urun_miktari) from manav
	group by urun_adi
    order by max(urun_miktari);

 select urun_adi, min(urun_miktari) min, max(urun_miktari) max from manav
    where urun_adi is not null
    group by urun_adi
    order by max;
    
    
    /* ----------------------------------------------------------------------------
  ORNEK4: kisi ismine ve urun adına göre satılan ürünlerin toplamını 
  gruplandıran ve isime göre ters sırasıda listeyen sorguyu yazınız.
 -----------------------------------------------------------------------------*/ 
 
 select isim, urun_adi, sum(urun_miktari) from manav
 group by isim, urun_adi;
 

    
    
    select isim, urun_adi, sum(urun_miktari) toplam_miktar
    from manav
    group by isim, urun_adi
    order by isim ;
    
	/*============================= GROUP BY =====================================
    
    GROUP BY cümleciği bir SELECT ifadesinde satırları, sutunların değerlerine 
    göre özet olarak gruplamak için kullanılır. 
   
    GROUP BY cümleceği her grup başına bir satır döndürür. 
    
    GROUP BY genelde, AVG(),COUNT(),MAX(),MIN() ve SUM() gibi aggregate 
    fonksiyonları ile birlikte kullanılır.
    
==============================================================================*/ 
      
    CREATE TABLE manav 
    (
        isim varchar(50), 
        urun_adi varchar(50), 
        urun_miktari int 
    );
    
    INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
    INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
    INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
    INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
    INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
    INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
    INSERT INTO manav VALUES( 'Veli', 'Uzum', 4);
    INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
    INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
    INSERT INTO manav VALUES( 'Ayse', 'Uzum', 4);
    INSERT INTO manav VALUES( 'Ali', null, 2);
    
    
    /* -----------------------------------------------------------------------------
  ORNEK1: kisi ismine göre satılan toplam meyve miktarlarını gösteren sorguyu 
  yazınız.
------------------------------------------------------------------------------*/  
    select isim, sum(urun_miktari) toplam_urun from manav
    group by isim;
    
    /* ----------------------------------------------------------------------------
  ORNEK2: satılan meyve türüne (urun_adi) göre urun alan kişi sayısını gösteren
  sorguyu yazınız. NULL olarak girilen meyveyi listelemesin.
-----------------------------------------------------------------------------*/ 
select urun_adi, count(isim) kisi_sayisi
from manav
where urun_adi is not null
group by urun_adi;
-- group by ile birlikte where cümleciği kullanilabilir

/* ----------------------------------------------------------------------------
  ORNEK3: satılan meyve türüne (urun_adi) göre satılan (urun_miktari )MIN ve 
  MAX urun miktarlarini, MAX urun miktarina göre sıralayarak listeyen sorguyu 
  yazınız.
-----------------------------------------------------------------------------*/ 
SELECT 
    urun_adi, MIN(urun_miktari) min, MAX(urun_miktari) maks
FROM
    manav
WHERE
    urun_adi IS NOT NULL
GROUP BY urun_adi
ORDER BY maks;

/* ----------------------------------------------------------------------------
  ORNEK4: kisi ismine ve urun adına göre satılan ürünlerin toplamını 
  gruplandıran ve isime göre ters sırasıda listeyen sorguyu yazınız.
 -----------------------------------------------------------------------------*/ 
SELECT 
    isim, urun_adi, SUM(urun_miktari) toplam_miktar
FROM
    manav
GROUP BY isim , urun_adi
ORDER BY isim DESC;

/* ----------------------------------------------------------------------------
  ORNEK5: kisi ismine ve urun adına göre (gruplayarak) satılan ürünlerin toplamını bulan ve
  ve bu toplam değeri 3 ve fazlası olan kayıtları toplam urun miktarlarina göre
  ters siralayarak listeyen sorguyu yazınız.
 -----------------------------------------------------------------------------*/  
 
 SELECT 
    isim, urun_adi, SUM(urun_miktari)
FROM
    manav
GROUP BY isim , urun_adi
HAVING SUM(urun_miktari) >= 3
ORDER BY SUM(urun_miktari) DESC;
 
 
 
 /*============================= DISTINCT =====================================
    
    DISTINCT cümleciği bir SORGU ifadesinde benzer olan satırları filtrelemek
    için kullanılır. Dolayısıyla seçilen sutun yada sutunlar için benzersiz veri
    içeren satırlar oluşturmaya yarar.
   
    SYNTAX
    -------
    SELECT DISTINCT sutun_adi1, sutun_adi2, sutun_adi3
    FROM  tablo_adı;
==============================================================================*/
/* ----------------------------------------------------------------------------
  ORNEK1: satılan farklı meyve türlerinin sayısını listeleyen sorguyu yazınız.
-----------------------------------------------------------------------------*/  
 select count(distinct(urun_adi)) say from manav;
 /* -----------------------------------------------------------------------------
  ORNEK2: satılan meyve + isimlerin farklı olanlarını listeyen sorguyu yazınız.
------------------------------------------------------------------------------*/

select distinct urun_adi,
 isim from manav;


/* ----------------------------------------------------------------------------
  ORNEK3: satılan meyvelerin urun_mikarlarinin benzersiz  olanlarının 
  toplamlarini listeyen sorguyu yazınız.
-----------------------------------------------------------------------------*/  

select -- urun_adi 
 sum(distinct urun_miktari) toplam_miktar
from manav;



 
 
 
 
 
 
 
 
 
 
