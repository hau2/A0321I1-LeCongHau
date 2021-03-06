create database furama;
use furama;
create table ViTri(
IDViTri int,
TenViTri varchar(45),
primary key (IDViTri)
);
create table TrinhDo(
IDTrinhDo int,
TrinhDo varchar(45),
primary key(IDTrinhDo)
);
create table BoPhan(
IDBoPhan int,
TenBoPhan varchar(45),
primary key(IDBoPhan)
);
create table NhanVien(
IDNhanVien int,
HoTen varchar(45),
IDViTri int,
IDTrinhDo int,
IDBoPhan int,
NgaySinh date,
SoCMND varchar(45),
Luong varchar(45),
SDT varchar(45),
Email varchar(45),
DiaChi varchar(45),
primary key(IDNhanVien),
foreign key(IDViTri) references ViTri(IDViTri) on update cascade on delete cascade,
foreign key(IDTrinhDo) references TrinhDo(IDTrinhDo) on update cascade on delete cascade,
foreign key(IDBoPhan) references BoPhan(IDBoPhan) on update cascade on delete cascade
);
create table DichVuDiKem(
IDDichVuDiKem int,
TenDichVuDiKem varchar(45),
Gia int,
DonVi varchar(45),
TrangThaiKhaDung varchar(45),
primary key(IDDichVuDiKem)
);
create table LoaiKhach(
IDLoaiKhach int,
TenLoaiKhach varchar(45),
primary key(IDLoaiKhach)
);
create table KhachHang(
IDKhachHang int,
IDLoaiKhach int,
HoTen varchar(45),
NgaySinh date,
SoCMND varchar(45),
SDT varchar(45),
Email varchar(45),
DiaChi varchar(45),
primary key(IDKhachHang),
foreign key(IDLoaiKhach) references LoaiKhach(IDLoaiKhach) on update cascade on delete cascade
);
create table KieuThue(
IDKieuThue int,
TenKieuThue varchar(45),
Gia int,
primary key(IDKieuThue)
);
create table LoaiDichVu(
IDLoaiDichVu int,
TenLoaiDichVu varchar(45),
primary key(IDLoaiDichVu)
);
create table DichVu(
IDDichVu int,
TenDichVu varchar(45),
DienTich int,
SoTang int,
SoNguoiToiDa varchar(45),
ChiPhiThue varchar(45),
IDKieuThue int,
IDLoaiDichVu int,
TrangThai varchar(45),
primary key(IDDichVu),
foreign key(IDKieuThue) references KieuThue(IDKieuThue) on update cascade on delete cascade,
foreign key(IDLoaiDichVu) references LoaiDichVu(IDLoaiDichVu) on update cascade on delete cascade
);
create table HopDong(
IDHopDong int,
IDNhanVien int,
IDKhachHang int,
IDDichVu int,
NgayLamHopDong date,
NgayKetThuc date,
TienDatCoc int,
TongTien int,
primary key(IDHopDong),
foreign key(IDNhanVien) references NhanVien(IDNhanVien) on update cascade on delete cascade,
foreign key(IDKhachHang) references KhachHang(IDKhachHang) on update cascade on delete cascade,
foreign key(IDDichVu) references DichVu(IDDichVu) on update cascade on delete cascade
);
create table HopDongChiTiet(
IDHopDongChiTiet int,
IDHopDong int,
IDDichVuDiKem int,
SoLuong int,
primary key(IDHopDongChiTiet),
foreign key(IDDichVuDiKem) references DichVuDiKem(IDDichVuDiKem) on update cascade on delete cascade,
foreign key(IDHopDong) references HopDong(IDHopDong) on update cascade on delete cascade
);

-- 1.	Th??m m???i th??ng tin cho t???t c??? c??c b???ng c?? trong CSDL ????? c?? th??? th??a m??n c??c y??u c???u b??n d?????i. 
insert into ViTri values
(1, 'L??? T??n'),
(2, 'Ph???c V???'),
(3, 'Chuy??n Vi??n'),
(4, 'Gi??m S??t'),
(5, 'Qu???n L??'),
(6, 'Gi??m ?????c');
insert into TrinhDo values
(1,'Trung C???p'),
(2,'Cao ?????ng'),
(3,'?????i H???c'),
(4,'Sau ?????i H???c');
insert into BoPhan values
(1,'Sale ??? Marketing'),
(2,'H??nh Ch??nh'),
(3,'Ph???c v???'),
(4,'Qu???n l??');
insert into NhanVien values
(1,'L?? C??ng H???u',1,3,1,'2001-10-31','024876654','1000000','088856254','hau@gmail.com','Qu???ng Nam'),
(2,'Ho??ng Thanh T??ng',5,4,1,'1995-9-2','066647654','2000000','085766654','tung@gmail.com','???? N???ng'),
(3,'L?? V??n To??n',3,4,2,'1996-2-2','004847777','3000000','085756333','toan@gmail.com','Qu???ng Nam'),
(4,'Nguy???n V??n D??ng',6,1,2,'1999-4-4','004833354','7000000','085333254','dung@gmail.com','Qu???ng Tr???'),
(5,'B??i Th??? Ly',2,2,3,'2002-5-5','007777654','4000000','085758884','ly@gmail.com','Hu???'),
(6,'H??? Kh??nh Huy???n',4,2,1,'2000-7-7','067847654','2000000','083456254','huyen@gmail.com','H?? N???i'),
(7,'Tr???n Thanh Nam',4,1,4,'1999-1-1','008887654','8000000','085759994','nam@gmail.com','H???i Ph??ng'),
(8,'V?? Th??? ??nh',1,3,3,'2001-10-10','004899954','5000000','085750004','anh@gmail.com','C???n Th??'),
(9,'K Th??? Th???o',1,3,3,'1998-7-6','004222654','6000000','085711154','thao@gmail.com','Thanh Ho??');
insert into LoaiKhach values
(1,'Diamond'),
(2,'Platinium'),
(3,'Gold'),
(4,'Silver'),
(5,'Member');
insert into KieuThue values
(1,'Theo Gi???',150),
(2, 'Theo Ng??y',500),
(3,'Theo Th??ng',10000),
(4,'Theo N??m',90000);
insert into LoaiDichVu values
(1,'Villa'),
(2,'Room'),
(3,'House');
insert into DichVu values
(1,'Villa 1',100,3,14,200,3,1,'Kh??? D???ng'),
(2,'Villa 2',200,4,14,300,2,1,'Kh??? D???ng'),
(3,'Room 1',50,5,5,200,4,2,'Kh??? D???ng'),
(4,'Room 2',40,4,7,250,1,2,'Kh??ng Kh??? D???ng'),
(5,'Room 3',80,6,8,280,3,2,'Kh??? D???ng'),
(6,'House 1',40,1,3,120,2,3,'Kh??? D???ng'),
(7,'House 2',50,2,5,150,2,3,'Kh??ng Kh??? D???ng');
insert into DichVuDiKem values
(1,'massage',50,'VND','Kh??? d???ng'),
(2,'karaoke',40,'VND','Kh??? d???ng'),
(3,'th???c ??n',60,'VND','Kh??? d???ng'),
(4,'n?????c u???ng',10,'VND','Kh??? d???ng'),
(5,'thu?? xe di chuy???n tham quan resort',150,'VND','Kh??? d???ng');
insert into KhachHang values
(1,2,'Nguy???n V??n M???nh','2002-10-10','565554535','088787767','manh@gmail.com','Qu???ng Nam'),
(2,5,'L?? Th??? V??n','1999-10-10','565646665','086667767','van@gmail.com', 'Qu???ng B??nh'),
(3,4,'Ng?? V??n C?????ng','1990-10-10','567774535','088787888','cuong@gmail.com','Qu???ng Ng??i'),
(4,3,'????? V??n Huy','1998-10-10','565648895','088782227','huy@gmail.com','???? N???ng'),
(5,2,'Tr???n Duy S??n','1997-10-10','565777535','088111767','son@gmail.com','L??o Cai'),
(6,1,'L?? Thanh Long','1999-10-10','564444535','084557767','long@gmail.com','Cao B???ng'),
(7,4,'Hu???nh Th??? Thu Trang','200-10-10','511144535','086667767','trang@gmail.com','Qu???ng Tr???'),
(8,3,'Cao V??n T??','2002-10-10','565642225','088789997','tu@gmail.com','Hu???');
insert into HopDong values
(1,1,2,7,'2020-10-10','2021-3-3',500,12744440),
(2,6,3,1,'2020-10-11','2021-3-4',400,16222700),
(3,7,4,2,'2020-10-12','2021-3-5',500,5551300),
(4,8,5,3,'2020-10-13','2021-3-6',600,96866500),
(5,9,6,4,'2020-10-14','2021-3-7',800,18776600),
(6,3,7,6,'2020-10-15','2021-3-8',700,7850007),
(7,2,8,5,'2020-10-16','2021-3-9',400,110087),
(8,5,1,2,'2020-10-17','2021-3-10',14500,1408560),
(9,1,1,2,'2018-10-17','2019-3-10',1005,14003),
(10,2,1,2,'2018-10-17','2019-3-10',10430,14030),
(11,3,1,2,'2018-10-17','2019-3-10',1030,1444040),
(12,4,1,2,'2018-10-17','2019-3-10',1060,1408850),
(13,1,1,2,'2018-10-17','2019-3-10',1060,14040),
(14,2,1,2,'2018-10-17','2019-3-10',1008,14050),
(15,7,1,2,'2018-10-17','2019-3-10',1005,1499040),
(16,4,1,2,'2018-10-17','2019-3-10',1003,140540);
insert into hopdongchitiet values
(1,8,5,3),
(2,7,5,2),
(3,6,3,4),
(4,5,2,5),
(5,4,1,1),
(6,3,2,5),
(7,2,3,2),
(8,1,4,2);
-- 2.	Hi???n th??? th??ng tin c???a t???t c??? nh??n vi??n c?? trong h??? th???ng c?? t??n b???t ?????u l?? m???t trong c??c k?? t??? ???H???, ???T??? ho???c ???K??? v?? c?? t???i ??a 15 k?? t???.
select NhanVien.*, ViTri.TenViTri, TrinhDo.TrinhDo, BoPhan.TenBoPhan from NhanVien
inner join ViTri on NhanVien.IDViTri = ViTri.IDViTri
inner join TrinhDo on NhanVien.IDTrinhDo = TrinhDo.IDTrinhDo
inner join BoPhan on NhanVien.IDBoPhan = BoPhan.IDBoPhan
where ((HoTen like 'H%') or (HoTen like 'K%') or (HoTen like 'T%')) and length(HoTen) <= 15;
 
-- 3.	Hi???n th??? th??ng tin c???a t???t c??? kh??ch h??ng c?? ????? tu???i t??? 18 ?????n 50 tu???i v?? c?? ?????a ch??? ??? ??????? N???ng??? ho???c ???Qu???ng Tr??????.
select NhanVien.* from NhanVien where curdate()-NgaySinh>=(18*30*365) and curdate()-NgaySinh>=(50*30*365) and DiaChi in ('???? N???ng','Qu???ng Tr???');

-- 4.	?????m xem t????ng ???ng v???i m???i kh??ch h??ng ???? t???ng ?????t ph??ng bao nhi??u l???n.
-- K???t qu??? hi???n th??? ???????c s???p x???p t??ng d???n theo s??? l???n ?????t ph??ng c???a kh??ch h??ng 
-- Ch??? ?????m nh???ng kh??ch h??ng n??o c?? T??n lo???i kh??ch h??ng l?? ???Diamond???.
select khachhang.HoTen, hopdongchitiet.SoLuong from khachhang
inner join loaikhach on khachhang.IDLoaiKhach = loaikhach.IDLoaiKhach
inner join hopdong on  khachhang.IDKhachHang = hopdong.IDHopDong
inner join hopdongchitiet on hopdong.IDHopDong = hopdongchitiet.IDHopDong
where loaikhach.TenLoaiKhach like 'Diamond'
order by hopdongchitiet.SoLuong desc;

-- 5. 5.	Hi???n th??? IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc,
-- TongTien (V???i TongTien ???????c t??nh theo c??ng th???c nh?? sau: ChiPhiThue + SoLuong*Gia
-- v???i SoLuong v?? Gi?? l?? t??? b???ng DichVuDiKem) cho t???t c??? c??c Kh??ch h??ng ???? t???ng ?????t ph???ng.
-- (Nh???ng Kh??ch h??ng n??o ch??a t???ng ?????t ph??ng c??ng ph???i hi???n th??? ra).
select khachhang.IDKhachHang, khachhang.HoTen, loaikhach.TenLoaiKhach, hopdong.IDHopDong, dichvu.TenDichVu, hopdong.NgayLamHopDong, hopdong.NgayKetThuc,
(dichvu.ChiPhiThue + hopdongchitiet.SoLuong * kieuthue.Gia) as 'TongTien' from khachhang
left join hopdong on khachhang.IDKhachHang = hopdong.IDKhachHang
left join dichvu on hopdong.IDDichVu = dichvu.IDDichVu
left join kieuthue on dichvu.IDKieuThue = kieuthue.IDKieuThue
left join hopdongchitiet on hopdong.IDHopDong = hopdongchitiet.IDHopDong
left join loaikhach on khachhang.IDLoaiKhach =  loaikhach.IDLoaiKhach;

-- 6.	Hi???n th??? IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu c???a t???t c??? c??c lo???i D???ch v??? ch??a t???ng ???????c Kh??ch h??ng th???c hi???n ?????t t??? qu?? 1 c???a n??m 2019 (Qu?? 1 l?? th??ng 1, 2, 3).
select dichvu.IDLoaiDichVu, dichVu.TenDichVu, dichvu.DienTich, dichvu.ChiPhiThue, loaidichvu.TenLoaiDichVu from dichvu
inner join loaidichvu on dichvu.IDLoaiDichVu = loaidichvu.IDLoaiDichVu
where not exists (select hopdong.IDDichVu from hopdong where (hopdong.NgayLamHopDong between '2019-01-01' and '2019-03-31')
and hopdong.IDDichVu = dichvu.IDDichVu);
-- Y??u c???u 7
select dichvu.IDDichVu, dichvu.TenDichVu, dichvu.DienTich, dichvu.SoNguoiToiDa , dichvu.ChiPhiThue, loaidichvu.TenLoaiDichVu from dichvu
inner join loaidichvu on dichvu.IDLoaiDichVu = loaidichvu.IDLoaiDichVu
where exists (select hopdong.IDHopDong from hopdong where year(hopdong.NgayLamHopDong) = '2018' and hopdong.IDDichVu = dichvu.IDDichVu)
and not exists (select hopdong.IDHopDong from hopdong where year(hopdong.NgayLamHopDong) = '2019' and hopdong.IDDichVu = dichvu.IDDichVu);
-- y??u c???u 8
-- c??ch 1
select distinct khachhang.HoTen from khachhang;
-- c??ch 2
select khachhang.HoTen from khachhang group by khachhang.HoTen;
-- c??ch 3
select khachhang.HoTen from khachhang
union select khachhang.HoTen from khachhang;

-- y??u c???u 9
select temp.month, count(month(hopdong.NgayLamHopDong)) as soKhachHangDangKy, sum(hopdong.TongTien) as TongTien from
(select 1 as month
union select 2 as month
union select 3 as month
union select 4 as month
union select 5 as month
union select 6 as month
union select 7 as month
union select 8 as month
union select 9 as month
union select 10 as month
union select 11 as month
union select 12 as month) as temp
left join hopdong on month(hopdong.NgayLamHopDong) = temp.month
left join khachhang on khachhang.IDKhachHang = hopdong.IDKhachHang
where year(hopdong.NgayLamHopDong) = '2019' or year(hopdong.NgayLamHopDong) is null or month(hopdong.NgayLamHopDong) is null
group by temp.month
order by temp.month;

-- y??u c???u 10
select hopdong.IDHopDong, hopdong.NgayLamHopDong, hopdong.NgayKetThuc, hopdong.TongTien, hopdong.TienDatCoc, count(hopdongchitiet.IDDichVuDiKem) as soLuongDVDikem from hopdong
inner join hopdongchitiet on hopdong.IDHopDong = hopdongchitiet.IDHopDong group by hopdong.IDHopDong;

-- y??u c???u 13
select dichvudikem.TenDichVuDiKem, count(TenDichVuDiKem) as 'so_lan_sd' from hopdongchitiet
join dichvudikem on hopdongchitiet.IDDichVuDiKem = dichvudikem.IDDichVuDiKem
group by TenDichVuDiKem
order by count(so_lan_sd) desc;

-- y??u c???u 14
select hopdong.IDHopDong, loaidichvu.TenLoaiDichVu, dichvudikem.TenDichVuDiKem,
count(TenLoaiDichVu) as 'So_lan_sd' from hopdong
inner join dichvu on hopdong.IDDichVu = dichvu.IDDichVu
inner join loaidichvu on dichvu.IDLoaiDichVu = loaidichvu.IDLoaiDichVu
inner join hopdongchitiet on hopdong.IDHopDong = hopdongchitiet.IDHopDong
inner join dichvudikem on hopdongchitiet.IDDichVuDiKem = dichvudikem.IDDichVuDiKem
group by TenLoaiDichVu having count(So_lan_Sd) = 1;

-- y??u c???u 15A
select nhanvien.IDNhanVien, nhanvien.HoTen, trinhdo.TrinhDo, bophan.TenBoPhan,
nhanvien.SDT, nhanvien.DiaChi, hopdong.IDHopDong, hopdong.NgayLamHopDong, count(IDHopDong) from nhanvien
left join bophan on nhanvien.IDBoPhan = bophan.IDBoPhan
left join trinhdo on nhanvien.IDTrinhDo = trinhdo.IDTrinhDo
left join hopdong on nhanvien.IDNhanVien = hopdong.IDNhanVien
where (hopdong.NgayLamHopDong between '2018-01-01' and '2019-12-31')
group by nhanvien.IDNhanvien having count(IDHopDong) < 3;

-- y??u c???u 16
-- delete from nhanvien where not exists(
-- select year(hopdong.NgayLamHopDong) from hopdong
-- left join nhanvien on nhanvien.IDNhanVien = hopdong.IDNhanVien
-- where year(hopdong.NgayLamHopDong) not in (2019, 2018, 2017));

SET SQL_SAFE_UPDATES = 0;
delete nhanvien from nhanvien 
inner join hopdong on hopdong.IDNhanVien = nhanvien.IDNhanVien
where year(hopdong.NgayLamHopDong) not in (2019, 2018, 2017);

-- y??u c???u 17
create temporary table temp 
(select khachhang.IDKhachHang, khachhang.HoTen, NgayLamHopDong, khachhang.IDLoaiKhach, loaikhach.TenLoaiKhach, sum(tongtien) as tt from hopdong
inner join khachhang on khachhang.IDKhachHang = hopdong.IDKhachHang
inner join loaikhach on khachhang.IDLoaiKhach = loaikhach.IDLoaiKhach
where year(hopdong.NgayLamHopDong) = 2020 group by khachhang.HoTen 
having tt > 10000000 and loaikhach.TenLoaiKhach = 'Platinium');
update khachhang
set IDLoaiKhach = 1
where khachhang.IDKhachHang in (select temp.IDKhachHang from temp);
-- inner join loaikhach on khachhang.IDLoaiKhach = loaikhach.IDLoaiKhach
-- inner join
-- (select khachhang.IDKhachHang, khachhang.HoTen, NgayLamHopDong, khachhang.IDLoaiKhach, loaikhach.TenLoaiKhach, sum(tongtien) as tt from hopdong
-- inner join khachhang on khachhang.IDKhachHang = hopdong.IDKhachHang
-- inner join loaikhach on khachhang.IDLoaiKhach = loaikhach.IDLoaiKhach
-- where year(hopdong.NgayLamHopDong) = 2020 group by khachhang.HoTen 
-- having tt > 10000000 and loaikhach.TenLoaiKhach = 'Platinium') as temp
-- on temp(khachhang.IDKhachHang) = loaikhach.IDKhachHang
-- set loaikhach.IDLoaiKhach = 1;

-- y??u c???u 18
SET SQL_SAFE_UPDATES = 0;
delete from khachhang
where khachhang.IDKhachHang in (select hopdong.IDKhachHang from hopdong where year(hopdong.NgayTaoHopDong)<"2016");
-- y??u c???u 19
create temporary table temp
(select dichvudikem.IDDichVuDiKem from dichvudikem
inner join hopdongchitiet on dichvudikem.IDDichVuDiKem = hopdongchitiet.IDDichVuDiKem
group by IDDichVuDiKem
having count(hopdongchitiet.IDHopDongChiTiet) > 10);
update dichvudikem
set dichvudikem.gia = dichvudikem.gia*2
where dichvudikem.IDDichVuDiKem in (select * from temp);


drop database furama;
