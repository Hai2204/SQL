CREATE TABLE KHOI(
MaKhoi nvarchar(255) NOT NULL PRIMARY KEY,
TenKhoi nvarchar(255) NULL
)
GO
CREATE TABLE DETHI(
MaDeThi nvarchar(255) NOT NULL PRIMARY KEY,
TenDeThi nvarchar(255) NULL,
ThoiGianThi date,
SoCauHoi int,
TrangThai nvarchar(255) NULL
)
GO
CREATE TABLE HOCSINH(
MaHocSinh nvarchar(255) NOT NULL PRIMARY KEY,
TenHocSinh nvarchar(255) NULL,
NamSinh int,
GioiTinh nvarchar(255) NOT NULL,
TenLop nvarchar(255) NULL
)
GO
CREATE TABLE CAUHOI(
MaCauHoi nvarchar(255) NOT NULL PRIMARY KEY,
MaKhoi nvarchar(255) NULL,
NoiDung nvarchar(255) NULL,
DapAnA nvarchar(255) NOT NULL,
DapAnB nvarchar(255) NOT NULL,
DapAnC nvarchar(255) NOT NULL,
DapAnD nvarchar(255) NOT NULL,
DapAnDung nvarchar(255) NOT NULL,
CONSTRAINT FK_CAUHOI_KHOI FOREIGN KEY (MaKhoi) REFERENCES KHOI(MaKhoi)
)
GO
CREATE TABLE KETQUA(
MaHocSinh nvarchar(255) NOT NULL,
MaDeThi nvarchar(255) NOT NULL ,
MaCauHoi nvarchar(255) NOT NULL,
DapAn nvarchar(255) NULL,
CONSTRAINT FK_KETQUA_DETHI FOREIGN KEY (MaDeThi) REFERENCES DETHI(MaDeThi),
CONSTRAINT FK_KETQUA_HOCSINH FOREIGN KEY (MaHocSinh) REFERENCES HOCSINH(MaHocSinh),
CONSTRAINT FK_KETQUA_CAUHOI FOREIGN KEY (MaCauHoi) REFERENCES CAUHOI(MaCauHoi)
)
GO
CREATE TABLE DETHI_CAUHOI(
MaDeThi nvarchar(255) NOT NULL ,
MaCauHoi nvarchar(255) NOT NULL,
CONSTRAINT FK_DETHI_CAUHOI_DETHI FOREIGN KEY (MaDeThi) REFERENCES DETHI(MaDeThi),
CONSTRAINT FK_DETHI_CAUHOI_CAUHOI FOREIGN KEY (MaCauHoi) REFERENCES CAUHOI(MaCauHoi)
)
GO
INSERT INTO KHOI(MaKhoi,TenKhoi)
 VALUES('K1',N'Khoi lop 1'),
 ('K2',N'Khoi lop 2'),
 ('K3',N'Khoi lop 3'),
 ('K4',N'Khoi lop 4'),
 ('K5',N'Khoi lop 5')
 GO
 INSERT INTO DETHI(MaDeThi,TenDeThi,ThoiGianThi,SoCauHoi,TrangThai)
 VALUES
 (N'DTA001',N'DeThi 1','2017-11-20','30',N'Da Phat Hanh'),
 (N'DTA002',N'DeThi 2','2017-12-21','20',N'Chua Phat Hanh'),
 (N'DTB001',N'DeThi 3','2017-12-22','30',N'Da Phat Hanh'),
 (N'DTB002',N'DeThi 4','2016-09-10','20',N'Da Phat Hanh'),
 (N'DTC001',N'DeThi 5','2010-05-01','25',N'Da Phat Hanh'),
 (N'DTD001',N'DeThi 7','2017-12-21','3',N'Da Phat Hanh')
 GO
 INSERT INTO HOCSINH(MaHocSinh,TenHocSinh,NamSinh,GioiTinh,TenLop)
 VALUES ('HS0001',N'Hoc Sinh A','2013','Nam','1/1'),
 ('HS0002',N'Hoc Sinh B','2012','Nu','2/2'),
 ('HS0003',N'Hoc Sinh A','2012','Nu','1/4'),
 ('HS0004',N'Hoc Sinh C','2010','Nam','5/3'),
 ('HS0005',N'Hoc Sinh B','2013','Nu','3/2'),
 ('HS0006',N'Hoc Sinh D','2010','Nu','1/4')
 GO
INSERT INTO CAUHOI(MaCauHoi,MaKhoi,NoiDung,DapAnA,DapAnB,DapAnC,DapAnD,DapAnDung)
VALUES(N'CH0001','K2','ABC','DAA','DAB','DAC','DAD','A'),
(N'CH0002','K2','ABC','DAA','DAB','DAC','DAD','B'),
(N'CH0003','K1','ABC','DAA','DAB','DAC','DAD','A'),
(N'CH0004','K3','ABC','DAA','DAB','DAC','DAD','C')
 GO
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
GO
 INSERT INTO DETHI_CAUHOI(MaDeThi,MaCauHoi)
 VALUES(N'DTA001',N'CH0001'),
 (N'DTA001',N'CH0002'),
 (N'DTA002',N'CH0003'),
 (N'DTB002',N'CH0004'),
 (N'DTD001',N'CH0001'),
 (N'DTD001',N'CH0002')