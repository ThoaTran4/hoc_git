create table DONVI (
MaDV char(4) not null primary key,
TenDV char(50));
create table NHANVIEN (
MaNV char(8) not null primary key,
HoTen nchar(30),
Congviec nchar(50),
Luong int,
MaDV char(4)
foreign key (MaDV) references DONVI(MaDV));