create database QLKH;

create table KHACH(
Makhach char(6) not null primary key ,
Ten_kh nchar(30),
Diachi_kh nchar(30) );

create table HANG(
Mahang char(6) not null primary key ,
Ten_hang nchar(15),
Mota_hang nchar(30),
Don_vi char(10));

create table DONHANG(
Sodon char(6) not null primary key,
Makhach char(6),
foreign key (Makhach) references KHACH(Makhach),
Ngay_don datetime );

create table DONGDON(
Sodon char(6),
Mahang char(6),
primary key(Sodon,Mahang),
So_luongd int) ;

create table PHIEUGIAO(
So_phieu char(6) not null primary key,
Makhach char(6),
foreign key (Makhach) references KHACH(Makhach),
Ngay_giao datetime,
Noi_giao char(30),
Tong_tien float(9) );

create table DONGPHIEU(
So_phieu char(6),
Ma_hang char(6),
primary key (So_phieu,Ma_hang),
Don_gia float(6),
So_luong float(7) );

--câu 2.1
alter table KHACH
add SoThich text;
alter table Hang
add NoiCungCap text;
alter table HANG
add NoiSanXuat text;

--câu 2.2
alter table KHACH
alter column SoThich varchar;
alter table hang
alter column noicungcap varchar;

--câu 2.3
alter table HANG
drop column NoiCungCap;
alter table HANG
drop column NoiSanXuat;
alter table KHACH
drop column SoThich;

--quan tri co so du lieu
--1
insert into KHACH values ('K001',N'Đào Minh Thư',N'Đại Học Quốc Gia');
insert into KHACH values ('K002',N'Nguyễn Liên Dung',N'BNC');
insert into KHACH values ('K003',N'Phạm Hoàng Nhung',N'Đại Học Thủy Lợi');
delete from KHACH; 

insert into DONHANG values ('DH001','K001','3/22/2002');
insert into DONHANG values ('DH002','K001','7/13/2003');
insert into DONHANG values ('DH003','K002','12/24/2002');
insert into DONHANG values ('DH0010','K002','12/24/2002');
delete from DONHANG;

--2
insert into KHACH values ('K004',N'Trịnh Hồng Cường',N' ');
insert into KHACH values ('K005',N'Nguyễn Văn Hải',N'Đại học Thủy Lợi');
insert into HANG values ('H001',N'Hoa loa kèn',N'Hoa trắng,to',N'Bông');
insert into HANG values ('H002',N'Hoa hồng',N'Nhiều màu',N'Bông');
insert into HANG values ('H003',N'Hoa lan',' ',N'Cành');
delete from HANG;

--3 xóa hàng
delete from HANG where Mahang like 'H001';
delete from KHACH where Diachi_kh like N'Đại học Thủy Lợi%';
delete from KHACH where Ten_kh like N'Trịnh Hồng Cường%';

-- 4 sửa đổi
update KHACH 
set Diachi_kh = N'Đại học Quốc Gia'
where Makhach = 'K002';

update HANG
set Ten_hang = N'Hoa phong lan', Mota_hang = N'Nhập khẩu từ Đà Lạt'
where Ten_hang = N'Hoa lan';

--lệnh truy vấn dữ liệu
--1 2 3
select * from khach;
select * from HANG;
select * from DONHANG;

--4
select ten_kh, diachi_kh
from KHACH;

--5
select ten_hang, mota_hang,don_vi
from HANG;

--6
select don_vi
from HANG;

--7
select ten_hang
from HANG;

--8
select diaChi_kh
from KHACH;

--9
select sophieu, mahang, don_gia, soluong










--
alter table donhang
alter column ngay_don date;

thoahtohaothaohshdoiasdioas