
use sys;
CREATE TABLE student 
(   
    id VARCHAR(4)  ,
    name VARCHAR(20),
    age int
);
/* ========================================================= 
                     VERİ GİRİSİ 
===========================================================*/
INSERT INTO student VALUES( null,'MEHMET ALİ', 25);
INSERT INTO student VALUES('1002', 'AYSE YILMAZ', 34);
INSERT INTO student VALUES('1003', 'JOHN SNOW', 56);
INSERT INTO student VALUES('1004', 'MARY BROWN', 17);

/* ========================================================= 
                    PARCALI VERİ GİRİSİ 
===========================================================*/
INSERT INTO student(id,name,age) VALUES('1001','samet ay',24);

select*from student


/* ========================================================= 
                   TABLO SILME(CRUD- Drop)
===========================================================*/



