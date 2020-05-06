/*
	BÀI THỰC HÀNH SỐ 2

	Họ và tên:	Nguyễn Văn Hải
	Mã sinh viên:	16T1021039
	Lớp học phần:	Ngôn ngữ truy vấn có cấu trúc (SQL)-Nhóm 1 2019-2020.2.TIN3012.001
*/

/***************************************************************
I.TẠO BẢNG,KHÓA NGOẠI
****************************************************************/
IF NOT EXISTS (SELECT * FROM sys.objects WHERE type = 'U' AND name = 'CAUHOI')
BEGIN
------------------------------------------------------------------------
-- Lưu thông các câu hỏi và đáp án
------------------------------------------------------------------------
Create Table CAUHOI	
(
	MaCauHoi					nvarchar(30),
	MaKhoi						nvarchar(30),
	NoiDung						nvarchar(30) NOT NULL,
	DapAnA						nvarchar(10) NOT NULL,
	DapAnB						nvarchar(10) NOT NULL,
	DapAnC						nvarchar(10) NOT NULL,
	DapAnD						nvarchar(10) NOT NULL,
	DapAnDung					nvarchar(10) NOT NULL
	CONSTRAINT cauhoi_pk PRIMARY KEY (MaCauHoi)			
)

------------------------------------------------------------------------
-- Lưu thông tin kết quả thi
------------------------------------------------------------------------
Create Table KETQUA	
(
	MaHocSinh		nvarchar(30),
	MaDeThi			nvarchar(30), 
	MaCauHoi		nvarchar(30),
	DapAn			nvarchar(10)
	CONSTRAINT ketqua_pk PRIMARY KEY (MaHocSinh,MaDeThi,MaCauHoi)	
)

------------------------------------------------------------------------
-- Lưu trữ thông tin của học sinh
------------------------------------------------------------------------
Create Table HOCSINH 
(
	MaHocSinh	nvarchar(30),
	TenHocSinh	nvarchar(50)		NOT NULL,
	NamSinh		nvarchar(10)		NOT NULL,
	GioiTinh	nvarchar(10)		NOT NULL,
	TenLop		nvarchar(10)		NOT NULL
	CONSTRAINT hocsinh_pk PRIMARY KEY (MaHocSinh)
)

----------------------------------------------------------------------------------
-- Lưu trữ thông tin các khối lớp học
----------------------------------------------------------------------------------
Create Table KHOI 
(
	MaKhoi		nvarchar(30),
	TenKhoi		nvarchar(50) NOT NULL,
	CONSTRAINT khoi_pk PRIMARY KEY (MaKhoi)	
)
----------------------------------------------------------------------------------
-- Lưu trữ thông tin các đề thi
----------------------------------------------------------------------------------
Create Table DETHI 
(
	MaDeThi			nvarchar(30),
	TenDeThi		nvarchar(50)	NOT NULL,
	ThoiGianThi		date			NOT NULL,
	SoCauHoi 		int				NOT NULL,
	TrangThai		nvarchar(50)
	CONSTRAINT dethi_pk PRIMARY KEY (MaDeThi)
)
----------------------------------------------------------------------------------
-- Lưu trữ thông tin đề thi và câu hỏi
----------------------------------------------------------------------------------
Create Table DETHI_CAUHOI 
(
	MaDeThi		nvarchar(30),
	MaCauHoi	nvarchar(30),
	CONSTRAINT dethi_cauhoi_pk PRIMARY KEY (MaDeThi,MaCauHoi)	
)
------------------------------------------------------------------------
-- chèn dữ liệu
------------------------------------------------------------------------
--- CAU HOI--
	INSERT INTO CAUHOI(MaCauHoi,MaKhoi,NoiDung,DapAnA,DapAnB,DapAnC,DapAnD,DapAnDung)
	VALUES(N'CH0001','K2','ABC','DAA','DAB','DAC','DAD','A'),
	(N'CH0002','K2','ABC','DAA','DAB','DAC','DAD','B'),
	(N'CH0003','K1','ABC','DAA','DAB','DAC','DAD','A'),
	(N'CH0004','K3','ABC','DAA','DAB','DAC','DAD','C')
-- KET QUA --
	 INSERT INTO KETQUA(MaHocSinh,MaDeThi,MaCauHoi,DapAn)
	 VALUES(N'HS0001',N'DTA001',N'CH0001','A'),
	 (N'HS0001',N'DTA001',N'CH0002','B'),
	 (N'HS0001',N'DTA002',N'CH0003','C'),
	 (N'HS0002',N'DTA001',N'CH0001','D'),
	 (N'HS0002',N'DTA001',N'CH0002','C'),
	 (N'HS0002',N'DTA002',N'CH0003','B'),
	 (N'HS0003',N'DTB002',N'CH0004','A'),
	 (N'HS0004',N'DTA001',N'CH0001','A'),
	 (N'HS0004',N'DTA001',N'CH0002','B')
-- HOC SINH ---
INSERT INTO HOCSINH(MaHocSinh,TenHocSinh, NamSinh,GioiTinh,TenLop)
VALUES	('HS0001','HOC SINH A','2013','NAM','1/1'),
		('HS0002','HOC SINH B','2012','NU','2/2'),
		('HS0003','HOC SINH C','2013','NAM','1/4'),
		('HS0004','HOC SINH D','2012','NAM','5/3'),
		('HS0005','HOC SINH A','2013','NU','3/2'),
		('HS0006','HOC SINH B','2013','NAM','1/1');
-- KHOI -- 
INSERT INTO KHOI(MaKhoi,TenKhoi)
VALUES  ('K1','KHOI LOP 1'),
		('K2','KHOI LOP 2'),
		('K3','KHOI LOP 3'),
		('K4','KHOI LOP 4'),
		('K5','KHOI LOP 5');
-- DE THI --
INSERT INTO DETHI(MaDeThi,TenDeThi,ThoiGianThi,SoCauHoi,TrangThai)
VALUES	('DTA001','DE THI 1','2017-11-12','30','DA PHAT HANH'),
		('DTA002','DE THI 2','2018-11-11','30','CHUA PHAT HANH'),
		('DTB003','DE THI 4','2016-10-12','27','DA PHAT HANH'),
		('DTB001','DE THI 3','2019-09-12','29','CHUA PHAT HANH'),
		('DTC002','DE THI 7','2017-11-10','27','DA PHAT HANH'),
		('DTC003','DE THI 5','2018-10-11','15','CHUA PHAT HANH'),
		('DTD002','DE THI 8','2017-12-09','3','DA PHAT HANH'),
		('DTD001','DE THI 9','2016-10-10','2','DA PHAT HANH');
-- DE THI - CAU HOI ---
	 INSERT INTO DETHI_CAUHOI(MaDeThi,MaCauHoi)
	 VALUES(N'DTA001',N'CH0001'),
	 (N'DTA001',N'CH0002'),
	 (N'DTA002',N'CH0003'),
	 (N'DTB002',N'CH0004'),
	 (N'DTD001',N'CH0001'),
	 (N'DTD001',N'CH0002')

END
GO	
/***************************************************************
II.TRUY VẤN 
****************************************************************/
