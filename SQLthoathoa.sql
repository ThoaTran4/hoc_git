create database QLNV;
CREATE TABLE DONVI (
MaDV CHAR(4) NOT NULL PRIMARY KEY,
TenDV CHAR(50));

-- bang nhan vien
CREATE TABLE NHANVIEN (
MaNV CHAR(8) NOT NULL PRIMARY KEY,
HoTen NCHAR(30),
Congviec NCHAR(50),
Luong INT,
madv char(4),
FOREIGN KEY (MaDV) REFERENCES DONVI(MaDV));

--bang bac luong
CREATE TABLE BACLUONG(
MaBac CHAR(50),
BacCao INT,
BacThap INT);

-- THEM COT MaTP
ALTER TABLE NHANVIEN ADD MaTP CHAR(4);

--THEM DU LIEU CHO BANG DON VI
INSERT INTO DONVI VALUES ('0001', 'KHTN');
INSERT INTO DONVI VALUES ('0002', 'DHTL');
INSERT INTO DONVI VALUES ('0003', 'DHQG');
DELETE FROM NHANVIEN;

--CHEN DU LIEU BANG NHANVIEN
INSERT INTO NHANVIEN 
VALUES ('NV01',N'Phạm Thị Nhàn', N'Thư ký', 500, '0001',null);
INSERT INTO NHANVIEN 
VALUES ('NV02',N'Hoàng Thanh Vân', N'Giáo viên', 600, '0001','NV01');
INSERT INTO NHANVIEN 
VALUES ('NV03',N'Hoàng Thị Lan', N'Giáo viên', 200, '0002','NV01');
INSERT INTO NHANVIEN 
VALUES ('NV04',N'Đỗ Trung Dũng', N'Thư ký', 700, '0003','NV01');
SELECT * FROM NHANVIEN
-- THEM BAC LUONG
INSERT INTO BACLUONG VALUES ('1', 400, 500);
INSERT INTO BACLUONG VALUES ('2', 501, 600);
INSERT INTO BACLUONG VALUES ('3', 601, 800);
--6 THONG TIN NHANVIEN
SELECT * FROM NHANVIEN;
SELECT * FROM BACLUONG;
SELECT * FROM DONVI;

--7 
SELECT Hoten, Congviec, Luong FROM NHANVIEN;
 -- 8
 select distinct Congviec from NHANVIEN;
 -- 9
 select Hoten, Luong * 3 as LuongQuy from NHANVIEN;
 
 --10
 select Hoten, Luong from NHANVIEN
 order by luong; --tang dan
 
  select Hoten, Luong from NHANVIEN
 order by luong desc; -- giam dan
 
 --11
 select hoten, luong from NHANVIEN
 where Luong > 300; 
 
 --12
  select hoten, luong from NHANVIEN
 where Luong > 300 and Congviec = N'Giáo viên';
 
 --13 dua ra nhan vien co luong 200 300 600
 select * from NHANVIEN
 where Luong in(200, 300, 600);
 
 --14 nhan vien co luong trong khoang 300 den 600
 select * from NHANVIEN
 where Luong > 300 and Luong < 600;
 
 
 --15 dua ra ho ten, cong viec cua cac nhan vien co ho ten bat dau  bang chu Hoang
 select hoten, congviec from NHANVIEN
 where HoTen like N'Hoàng%';
 
 --16 luong tb, max, min cua cac nv trong bang nv
 select AVG(luong) as LuongTB, MAX(luong) as LuongMAX, MIN(luong) as LuongMIN
 from NHANVIEN;
 
 
 --17 dua ra cong viec va luong tb cua tung loai cong viec
 select congviec, AVG(luong) as LuongTB
 from NHANVIEN
 group by Congviec;
 
 --18 dua ra cong viec va luongtb cua nv co luong >200 theo congviev
 select congviec, AVG(luong) as LuongTB
 from NHANVIEN
 where Luong > 200
 group by Congviec;
 
 --19 tong luong cua tung nhom cong viec theo tung don vi
 select madv, congviec, sum(Luong)
 from NHANVIEN 
 group by madv, congviec;
 
 --20 dua ra cong viec va trung binh luong cua cac cong viec co tbluong >= 300
 select congviec, AVG(luong) as tbluong
 from NHANVIEN
 where (select avg(Luong) from NHANVIEN) >= 300
 group by Congviec;  
 
 --21 dua ra cong viec va luongMAX cua cac donvi co maxluong >= 300
 select madv, congviec, max(luong) as MaxLuong
 from NHANVIEN
 where (select max(Luong) from NHANVIEN) >= 300
 group by madv, Congviec;
 
 --22,23 dua ra hoten, congviec, tendv cua tat ca nhan vien
 select nv.hoten, nv.congviec, dv.tendv
 from NHANVIEN nv, DONVI dv
 where nv.madv = dv.MaDV;
 
 --24 dua ra hoten, congviec, tendv cua tat ca nhan vien có luong >= 500
 select  nv.hoten, nv.congviec, dv.tendv
 from NHANVIEN nv, DONVI dv
 where  luong >= 500 and nv.madv = dv.MaDV;
 
 --27 dua ra cong viec trong dv1 co Madv la 0001 va don vi 2 co madv la 0002
 select madv, congviec from NHANVIEN
 where madv in ('0001', '0002');
 

 --28 dua ra hoten, tendv congviec, luong cuar nhuwngx nv co luong lon hon luongtb cua toan bo nv 
 select nv.HoTen, dv.TenDV, nv.Congviec, nv.Luong
 from NHANVIEN nv, DONVI dv
 where nv.Luong > (select AVG(luong) from NHANVIEN )
 and nv.madv = dv.MaDV;

--29 dua ra nv co luong lon hon ng co luong lon nhat ttrong dv co ten la DHTL
select hoten from NHANVIEN 
where Luong > 
(select MAX(luong) from NHANVIEN nv, DONVI dv 
where dv.TenDV = 'DHTL' and nv.madv = dv.MaDV);

--30 dua ra hoten, madv, luong cua cac nv cos luong bang luong thap nhat trong mot donvi cua ho
select hoten, madv, luong from NHANVIEN
where Luong in 
(select min(luong) from NHANVIEN group by madv);

--31 dua ra hoten, madv, luong cua cac nv co luong bang luong thap nhat trong mot donvi nao do
select hoten, madv, luong from NHANVIEN
where Luong in 
(select min(luong) from NHANVIEN);

--32 dua ra hoten, luong cua cac nhanvien co luong lon nhat cua dv co madv la 0002
select hoten, luong from NHANVIEN
where Luong =
(select MAX(luong) from NHANVIEN where madv = '0002');

--33 dua ra madv, avg(luong) cua donvi co luongtb lon hon luong nho nhat cua donvi 0003
 select madv, AVG(luong) as tbluong from NHANVIEN
 where 
 (select AVG(luong) from NHANVIEN) >
 (select MIN(luong) from NHANVIEN where madv = '0001')
 group by madv;

 
  