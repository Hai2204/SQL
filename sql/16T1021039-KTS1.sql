/*
	BÀI KIỂM TRA SỐ 1

	Họ và tên:	Nguyễn Văn Hải
	Mã sinh viên:	16T1021039
	Lớp học phần:	Ngôn ngữ truy vấn có cấu trúc (SQL)-Nhóm 1 2019-2020.2.TIN3012.001
*/

/***************************************************************
I.TẠO BẢNG,KHÓA NGOẠI
****************************************************************/
IF NOT EXISTS (SELECT * FROM sys.objects WHERE type = 'U' AND name = 'DANGKYCUNGCAP')
BEGIN
------------------------------------------------------------------------
-- Lưu thông đăng kí cung cấp
------------------------------------------------------------------------
Create Table DANGKYCUNGCAP
(
	MaDKCC					nvarchar(30)	Primary Key,
	MaNhaCC					nvarchar(30),
	MaLoaiDV				nvarchar(30),
	DongXe					nvarchar(30),
	MaMP					nvarchar(30),
	NgayBatDauCungCap		date,
	NgayKetThucCungCap		date,
	SoLuongXeDangKy			int			
)
------------------------------------------------------------------------
-- Lưu thông tin các dòng xe
------------------------------------------------------------------------
Create Table DONGXE	
(
	DongXe		nvarchar(30)	PRIMARY KEY,
	HangXe		nvarchar(50), 
	SoChoNgoi	int,
)

------------------------------------------------------------------------
-- Lưu trữ danh sách loại dịch vụ cung cấp
------------------------------------------------------------------------
Create Table LOAIDICHVU 
(
	MaLoaiDV	nvarchar(30)	PRIMARY KEY,
	TenLoaiDV	nvarchar(100) 
)

----------------------------------------------------------------------------------
-- Lưu trữ ma mức phí với các đơn giá khác nhau qua các móc thời gian
----------------------------------------------------------------------------------
Create Table MUCPHI 
(
	MaMP		nvarchar(30)	PRIMARY KEY,
	DonGia		nvarchar(30),
	MoTa		nvarchar(100)	
)
----------------------------------------------------------------------------------
-- Lưu trữ ma mức phí với các đơn giá khác nhau qua các móc thời gian
----------------------------------------------------------------------------------
Create Table NHACUNGCAP 
(
	MaNhaCC		nvarchar(30)	PRIMARY KEY,
	TenNhaCC	nvarchar(100),
	DiaChi		nvarchar(100),
	SoDT 		nvarchar(20),
	MaSoThue	nvarchar(10)
)


------------------------------------------------------------------------
-- liên kết bảng
------------------------------------------------------------------------
	alter table DANGKYCUNGCAP
	add constraint Fk_DKCC_NHACUNGCAP
	FOREIGN KEY (MaNhaCC)
	REFERENCES NHACUNGCAP(MaNhaCC)

	alter table DANGKYCUNGCAP
	add constraint Fk_DKCC_LOAIDICHVU
	FOREIGN KEY (MaLoaiDV)
	REFERENCES LOAIDICHVU(MaLoaiDV)

	alter table DANGKYCUNGCAP
	add constraint Fk_DKCC_MUCPHI
	FOREIGN KEY (MaMP)
	REFERENCES MUCPHI(MaMP)

	alter table DANGKYCUNGCAP
	add constraint Fk_DKCC_DONGXE
	FOREIGN KEY (DongXe)
	REFERENCES DONGXE(DongXe)

END
GO	
/***************************************************************
II.TRUY VẤN 
****************************************************************/
-- Câu 3--
------------------
	select * from DONGXE
	where SoChoNgoi > 5;
-- Câu 4--
------------------
	select distinct DANGKYCUNGCAP.*,NHACUNGCAP.*,DONGXE.HangXe,MUCPHI.DonGia from DANGKYCUNGCAP 
			inner join NHACUNGCAP on NHACUNGCAP.MaNhaCC = DANGKYCUNGCAP.MaNhaCC 
			inner join DONGXE on DANGKYCUNGCAP.DongXe = DONGXE.DongXe
			inner join MUCPHI on DANGKYCUNGCAP.MaMP = MUCPHI.MaMP
	where (DONGXE.HangXe = 'Toyota' and DonGia = 15.000)
	  or (DONGXE.HangXe = 'Kia' and DonGia = 20.000)
-- Câu 5--
------------------
	select * from DONGXE
	where HangXe Like 'T%' and LEN(DONGXE.DongXe) = 5  
-- Câu 6-- 
------------------
select * from NHACUNGCAP
order by TenNhaCC asc,MaSoThue desc
-- Câu 7--
------------------
select COUNT(SoLuongXeDangKy) as solancungcapphuongtien from DANGKYCUNGCAP
where NgayBatDauCungCap >= '2015-11-20'
-- Câu 8--
------------------
select distinct HangXe from DONGXE
-- Câu 9--
------------------
select distinct DANGKYCUNGCAP.MaDKCC,LOAIDICHVU.TenLoaiDV,NHACUNGCAP.TenNhaCC,MUCPHI.DonGia,DONGXE.DongXe,DongXe.HangXe,DANGKYCUNGCAP.NgayBatDauCungCap,DANGKYCUNGCAP.NgayKetThucCungCap,DANGKYCUNGCAP.SoLuongXeDangKy from DANGKYCUNGCAP 
			inner join NHACUNGCAP on NHACUNGCAP.MaNhaCC = DANGKYCUNGCAP.MaNhaCC 
			inner join DONGXE on DANGKYCUNGCAP.DongXe = DONGXE.DongXe
			inner join MUCPHI on DANGKYCUNGCAP.MaMP = MUCPHI.MaMP
			inner join LOAIDICHVU on DANGKYCUNGCAP.MaLoaiDV = LOAIDICHVU.MaLoaiDV

-- Câu 10-- 
------------------
select DANGKYCUNGCAP.MaDKCC,DANGKYCUNGCAP.MaNhaCC,NHACUNGCAP.TenNhaCC,NHACUNGCAP.DiaChi,NHACUNGCAP.MaSoThue,LOAIDICHVU.TenLoaiDV,MUCPHI.DonGia,DongXe.HangXe,DANGKYCUNGCAP.NgayBatDauCungCap,DANGKYCUNGCAP.NgayKetThucCungCap from DANGKYCUNGCAP 
			full join NHACUNGCAP on NHACUNGCAP.MaNhaCC = DANGKYCUNGCAP.MaNhaCC 
			full join DONGXE on DANGKYCUNGCAP.DongXe = DONGXE.DongXe
			full join MUCPHI on DANGKYCUNGCAP.MaMP = MUCPHI.MaMP
			full join LOAIDICHVU on DANGKYCUNGCAP.MaLoaiDV = LOAIDICHVU.MaLoaiDV
order by NHACUNGCAP.MaNhaCC
-- Câu 11--
------------------
select distinct * from NHACUNGCAP inner join DANGKYCUNGCAP on NHACUNGCAP.MaNhaCC = DANGKYCUNGCAP.MaNhaCC
where DANGKYCUNGCAP.DongXe = 'Hiace' or DANGKYCUNGCAP.DongXe = 'Cerato'
-- Câu 12-- 
------------------
select  * from NHACUNGCAP full join DANGKYCUNGCAP on NHACUNGCAP.MaNhaCC = DANGKYCUNGCAP.MaNhaCC
where DANGKYCUNGCAP.MaDKCC is null
-- Câu 13-- Hình Như Chưa Đúng Lắm
------------------
select * from NHACUNGCAP  join DANGKYCUNGCAP on NHACUNGCAP.MaNhaCC = DANGKYCUNGCAP.MaNhaCC
where DANGKYCUNGCAP.DongXe = 'Hiace' and not DANGKYCUNGCAP.DongXe = 'Cerato'
order by DANGKYCUNGCAP.MaNhaCC asc
-------------------------
-- Câu 14--
------------------
select * from DANGKYCUNGCAP join DONGXE on DANGKYCUNGCAP.DongXe = DONGXE.DongXe
where DANGKYCUNGCAP.NgayBatDauCungCap <= '2016-01-01'and DANGKYCUNGCAP.NgayBatDauCungCap between '2016-01-01' and '2016-12-30'
-- Câu 15--
------------------
---- Thông Tin của các dòng xe đăng kí đầu năm 2016 đến hết 2019 có Lần Dk Top(1)
	select top(1) DONGXE.*,DANGKYCUNGCAP.MaNhaCC
	from DANGKYCUNGCAP join DONGXE on DANGKYCUNGCAP.DongXe = DONGXE.DongXe
						join (select MaNhaCC,COUNT(MaNhaCC) as LanDK from DANGKYCUNGCAP
								group by MaNhaCC
								) as B1 on DANGKYCUNGCAP.MaNhaCC = B1.MaNhaCC 
	where DANGKYCUNGCAP.NgayBatDauCungCap >= '2016-01-01' and DANGKYCUNGCAP.NgayKetThucCungCap < '2020-01-01'
	

----- Giá trị lớn nhất của Lần Đăng kí Theo từng MaNhaCC Chưa có điều kiện(Thêm-Test)
		select top(3) MaNhaCC,max(B2.LanDK) as abc from (
			select MaNhaCC,COUNT(MaNhaCC) as LanDK from DANGKYCUNGCAP
			group by MaNhaCC
			) as B2
		group by MaNhaCC
		order by abc desc
------------------------
-- Câu 16--
------------------
select sum(DANGKYCUNGCAP.SoLuongXeDangKy) as SumXeDK from DANGKYCUNGCAP join DONGXE on DANGKYCUNGCAP.DongXe = DONGXE.DongXe
							join MUCPHI on DANGKYCUNGCAP.MaMP = MUCPHI.MaMP
where MUCPHI.DonGia = '20.000'
------------------------
-- Câu 17--
------------------
select DANGKYCUNGCAP.MaNhaCC,DANGKYCUNGCAP.SoLuongXeDangKy from DANGKYCUNGCAP join NHACUNGCAP on DANGKYCUNGCAP.MaNhaCC = NHACUNGCAP.MaNhaCC
where NHACUNGCAP.DiaChi = 'Hai Chau' 
group by DANGKYCUNGCAP.MaNhaCC,DANGKYCUNGCAP.SoLuongXeDangKy
having COUNT(DANGKYCUNGCAP.MaNhaCC) = 1
order by DANGKYCUNGCAP.SoLuongXeDangKy asc
------------------------
-- Câu 18--
------------------
update DANGKYCUNGCAP
set SoLuongXeDangKy = 20
from DANGKYCUNGCAP join DONGXE on DANGKYCUNGCAP.DongXe = DONGXE.DongXe
where DONGXE.HangXe = 'Toyota' and NgayKetThucCungCap < '2016-12-30'

------------------------
-- Câu 19--
------------------
update MUCPHI
set MoTa = N'Được sử dụng nhiều'
from MUCPHI join DANGKYCUNGCAP on MUCPHI.MaMP = DANGKYCUNGCAP.MaMP
			join (select MUCPHI.MaMP,COUNT(MUCPHI.MaMP) as LanDKCC from MUCPHI join DANGKYCUNGCAP on MUCPHI.MaMP = DANGKYCUNGCAP.MaMP
				  group by MUCPHI.MaMP) B on MUCPHI.MaMP = B.MaMP
where DANGKYCUNGCAP.NgayBatDauCungCap >= '2016-01-01' and DANGKYCUNGCAP.NgayKetThucCungCap < '2017-01-01' and B.LanDKCC >= 5
------------------------
-- Câu 20--
------------------
Delete DANGKYCUNGCAP from DANGKYCUNGCAP join DONGXE on DANGKYCUNGCAP.DongXe = DONGXE.DongXe
where DANGKYCUNGCAP.NgayBatDauCungCap > '2015-11-10' and DONGXE.DongXe = 'Vios'