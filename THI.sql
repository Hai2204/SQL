/*
	BÀI KIỂM TRA KẾT THÚC HỌC PHẦN

	Họ và tên:	Nguyễn Văn Hải
	Mã sinh viên:	16T1021039
	Lớp học phần:	Ngôn ngữ truy vấn có cấu trúc (SQL)- 2 tín chỉ -Nhóm 1 2019-2020.2.TIN3012.001
*/

/***************************************************************
I.TẠO BẢNG,KHÓA NGOẠI
****************************************************************/
IF NOT EXISTS (SELECT * FROM sys.objects WHERE type = 'U' AND name = 'DANGKYCUNGCAP')
BEGIN
------------------------------------------------------------------------
-- Lưu 
------------------------------------------------------------------------
Create Table DANGKYCUNGCAP
(
	MaDKCC					nvarchar(50)	Primary Key,
	MaNhaCC					nvarchar(50),
	MaLoaiDV				nvarchar(50),
	DongXe					nvarchar(50),
	MaMP					nvarchar(50),
	NgayBatDauCungCap		date,
	NgayKetThucCungCap		date,
	SoLuongXeDangKy			int			
)
------------------------------------------------------------------------
-- Lưu 
------------------------------------------------------------------------
Create Table DONGXE	
(
	DongXe		nvarchar(50)	PRIMARY KEY,
	HangXe		nvarchar(50), 
	SoChoNgoi	int,
)

------------------------------------------------------------------------
-- Lưu 
------------------------------------------------------------------------
Create Table LOAIDICHVU 
(
	MaLoaiDV	nvarchar(50)	PRIMARY KEY,
	TenLoaiDV	nvarchar(100) 
)

----------------------------------------------------------------------------------
-- Lưu 
----------------------------------------------------------------------------------
Create Table MUCPHI 
(
	MaMP		nvarchar(50)	PRIMARY KEY,
	DonGia		nvarchar(50),
	MoTa		nvarchar(100)	
)
----------------------------------------------------------------------------------
-- Lưu 
----------------------------------------------------------------------------------
Create Table NHACUNGCAP 
(
	MaNhaCC		nvarchar(50)	PRIMARY KEY,
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
	