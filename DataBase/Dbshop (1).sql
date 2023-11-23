CREATE DATABASE QLSHOP

GO
USE QLSHOP

IF OBJECT_ID('ChatLieu') IS NOT NULL
	DROP TABLE ChatLieu
GO
CREATE TABLE ChatLieu
(
	ID INT IDENTITY(1,1) NOT NULL,
	maCL varchar(10) null,
	loai_chat_lieu nvarchar(50) NULL,
	nguoi_tao nvarchar(50) NULL,
	nguoi_sua nvarchar(50) NULL,
	trang_thai nvarchar(50) NULL,
	CONSTRAINT PK_ChatLieu PRIMARY KEY (ID)
)
GO

IF OBJECT_ID('CoAo') IS NOT NULL
	DROP TABLE CoAo
GO
CREATE TABLE CoAo
(
	ID INT IDENTITY(1,1) NOT NULL,
	maCA varchar(10) null,
	loai_co_ao nvarchar(50) NULL,
	nguoi_tao nvarchar(50) NULL,
	nguoi_sua nvarchar(50) NULL,
	trang_thai nvarchar(50) NULL,
	CONSTRAINT PK_CoAo PRIMARY KEY (ID)
)
go

IF OBJECT_ID('KichThuoc') IS NOT NULL
	DROP TABLE KichThuoc
GO
CREATE TABLE KichThuoc
(
	ID INT IDENTITY(1,1) NOT NULL,
	maKichThuoc varchar(10) null,
	loai_kich_thuoc varchar(50) NULL,
	nguoi_tao nvarchar(50) NULL,
	nguoi_sua nvarchar(50) NULL,
	trang_thai nvarchar(50) NULL,
	CONSTRAINT PK_KichThuoc PRIMARY KEY (ID)
)
GO

IF OBJECT_ID('KieuDang') IS NOT NULL
	DROP TABLE KieuDang
GO
CREATE TABLE KieuDang
(
	ID INT IDENTITY(1,1) NOT NULL,
	maKD varchar(10) null,
	loai_kieu_dang varchar(50) NULL,
	nguoi_tao nvarchar(50) NULL,
	nguoi_sua nvarchar(50) NULL,
	trang_thai nvarchar(50) NULL,
	CONSTRAINT PK_KieuDang PRIMARY KEY (ID)
)
Go
IF OBJECT_ID('MauSP') IS NOT NULL
	DROP TABLE MauSP
GO
CREATE TABLE MauSP
(
	ID INT IDENTITY(1,1) NOT NULL,
	maMauSP varchar(10) null,
	ten_mau varchar(50) NULL,
	nguoi_tao nvarchar(50) NULL,
	nguoi_sua nvarchar(50) NULL,
	trang_thai nvarchar(50) NULL,
	CONSTRAINT PK_MauSP PRIMARY KEY (ID)
)
GO

IF OBJECT_ID('TayAo') IS NOT NULL
	DROP TABLE TayAo
GO
CREATE TABLE TayAo
(
	ID INT IDENTITY(1,1) NOT NULL,
	maTA varchar(10) null,
	loai_tay_ao varchar(50) NULL,
	nguoi_tao nvarchar(50) NULL,
	nguoi_sua nvarchar(50) NULL,
	trang_thai nvarchar(50) NULL,
	CONSTRAINT PK_TayAo PRIMARY KEY (ID)
)
GO

IF OBJECT_ID('ThuongHieu') IS NOT NULL
	DROP TABLE ThuongHieu
GO
CREATE TABLE ThuongHieu
(
	ID INT IDENTITY(1,1) NOT NULL,
	maTH varchar(10) null,
	ten_thuong_hieu varchar(50) NULL,
	nguoi_tao nvarchar(50) NULL,
	nguoi_sua nvarchar(50) NULL,
	trang_thai nvarchar(50) NULL,
	CONSTRAINT PK_ThuongHieu PRIMARY KEY (ID)
)
GO

IF OBJECT_ID('Voucher') IS NOT NULL
	DROP TABLE Voucher
GO
CREATE TABLE Voucher
(
	ID INT IDENTITY(1,1) NOT NULL,
	so_luong int NULL,
	ma_voucher nvarchar(50)  NULL,
	ten_voucher nvarchar(50) null,
	ngay_bat_dau date NULL,
	ngay_ket_thuc date NULL,
	giam_gia money null,
	--nếu là % thì lấy tổng hóa đơn nhân với (tổng hóa đơn : % nhập vào)
	nguoi_tao nvarchar(50)  NULL,
	nguoi_sua nvarchar(50)  NULL,
	trang_thai nvarchar(50)  NULL,
	mo_ta nvarchar(50)  null,
	CONSTRAINT PK_Voucher PRIMARY KEY (ID)
)
GO

IF OBJECT_ID('NhanVien') IS NOT NULL
	DROP TABLE NhanVien
GO
CREATE TABLE NhanVien(
	[id] [int] IDENTITY(1,1) NOT NULL,
	maNV varchar(10) null,
	[ho_ten_nv] [nvarchar](50) NULL,
	[gioi_tinh] [nvarchar](3) NULL,
	[sdt_nv] [varchar](30) NULL,
	[dia_chi] [nvarchar](100) NULL,
	[cccd] [int] NULL,
	[mat_khau] [varchar](50) NULL,
	[trang_thai] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY ([id])
)
GO

IF OBJECT_ID('KhachHang') IS NOT NULL
	DROP TABLE KhachHang
CREATE TABLE KhachHang
(
	[id] [int] IDENTITY(1,1) NOT NULL,
	maKH varchar(10) null,
	[ho_ten_kh] [nvarchar](50) NULL,
	[gioi_tinh] [nvarchar](50) NULL,
	[ngay_sinh] [date] NULL,
	[dia_chi] [nvarchar](100) NULL,
	[sdt_kh] [varchar](30) NULL,
	[mat_khau] [varchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY ([id])
)
GO

IF OBJECT_ID('SanPham') IS NOT NULL
	DROP TABLE SanPham
CREATE TABLE SanPham
(
	[id] [int] IDENTITY(1,1) NOT NULL,
	maSP varchar(10) null,
	[ten_sp] [nvarchar](50) NULL,
	[gia_sp] [money] NULL,
	[trang_thai] [nvarchar](50) NULL,
	[nguoi_sua] [nvarchar](50) NULL,
	[nguoi_tao] [nvarchar](50) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY (id)
)
GO

IF OBJECT_ID('ChiTietSP') IS NOT NULL
	DROP TABLE ChiTietSP
CREATE TABLE ChiTietSP
(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_san_pham] [int] NOT NULL,
	[id_co_ao] [int] NOT NULL,
	[id_kich_thuoc] [int] NOT NULL,
	[id_mau] [int] NOT NULL,
	[id_chat_lieu] [int] NOT NULL,
	[id_kieu_dang] [int] NOT NULL,
	[id_tay_ao] [int] NOT NULL,
	maCTSP varchar(10) null,
	[so_luong] [int] NULL,
	[mo_ta] [nvarchar](max) NULL,
	[trang_thai] [nvarchar](50) NULL,
	[gia] [money] NULL,
	[id_thuong_hieu] [int] NOT NULL,
 CONSTRAINT [PK_ChiTietSP] PRIMARY KEY (id),
 CONSTRAINT FK_ChiTietSP_ChatLieu FOREIGN KEY(ID) REFERENCES ChatLieu(ID),
 CONSTRAINT FK_ChiTietSP_CoAo FOREIGN KEY(ID) REFERENCES CoAo(ID),
 CONSTRAINT FK_ChiTietSP_KichThuoc FOREIGN KEY(ID) REFERENCES KichThuoc(ID),
 CONSTRAINT FK_ChiTietSP_KieuDang FOREIGN KEY(ID) REFERENCES KieuDang(ID),
 CONSTRAINT FK_ChiTietSP_MauSP FOREIGN KEY(ID) REFERENCES MauSP(ID),
 CONSTRAINT FK_ChiTietSP_TayAo FOREIGN KEY(ID) REFERENCES TayAo(ID),
 CONSTRAINT FK_ChiTietSP_ThuongHieu FOREIGN KEY(ID) REFERENCES ThuongHieu(ID),
 CONSTRAINT FK_ChiTietSP_SanPham FOREIGN KEY(ID) REFERENCES SanPham(ID)
)
GO

 IF OBJECT_ID('HoaDon') IS NOT NULL
	DROP TABLE HoaDon
CREATE TABLE HoaDon
(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_khach_hang] [int] NULL,
	[id_nhan_vien] [int] NULL,
	[id_phuong_thuc_tt] [int] NOT NULL,
	[id_voucher] [int] NULL,
	maHD varchar(10) null,
	[nguoi_tao] [nvarchar](50) NULL,
	[nguoi_sua] [nvarchar](50) NULL,
	[ho_ten_kh] [nvarchar](50) NULL,
	[sdt_kh] [varchar](30) NULL,
	[dia_chi] [nvarchar](100) NULL,
	[phi_ship] [money] NULL,
	[tong_tien] [money] NULL,
	[ngay_tao] date default getdate(),
	[ngay_dat_hang] date default getdate(),
	[ngay_nhan_hang] [date] NULL,
	[ngay_thanh_toan] [date] NULL,
	[ghi_chu] [nvarchar](50) NULL,
	[trang_thai] [nvarchar](50) NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY (id),
 CONSTRAINT FK_HoaDon_KhachHang FOREIGN KEY(ID) REFERENCES KhachHang(ID),
  CONSTRAINT FK_HoaDon_Voucher FOREIGN KEY(ID) REFERENCES Voucher(ID),
 CONSTRAINT FK_HoaDon_NhanVien FOREIGN KEY(ID) REFERENCES NhanVien(ID)
)


IF OBJECT_ID('ChiTietHoaDon') IS NOT NULL
	DROP TABLE ChiTietHoaDon
CREATE TABLE ChiTietHoaDon
(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_chitiet_sp] [int] NOT NULL,
	[id_hoa_don] [int]  NOT NULL,
	[so_luong] [int] NULL,
	[gia] [money] NULL,
	[trang_thai] [nvarchar](50) NULL,
	[nguoi_tao] [nvarchar](50) NULL,
	[nguoi_sua] [nvarchar](50) NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY (id), 
 CONSTRAINT FK_ChiTietHoaDon_ChiTietSP FOREIGN KEY(ID) REFERENCES ChiTietSP(ID),
 CONSTRAINT FK_ChiTietHoaDon_HoaDon FOREIGN KEY(ID) REFERENCES HoaDon(ID)
)
GO

SELECT * FROM ChatLieu
INSERT INTO ChatLieu (maCL, loai_chat_lieu, nguoi_tao, nguoi_sua, trang_thai)
VALUES 
    ('CL001', 'Chat Lieu 1', 'User1', 'User1', 'Active'),
    ('CL002', 'Chat Lieu 2', 'User2', 'User2', 'Inactive'),
    ('CL003', 'Chat Lieu 3', 'User3', 'User3', 'Active'),
    ('CL004', 'Chat Lieu 4', 'User4', 'User4', 'Inactive'),
    ('CL005', 'Chat Lieu 5', 'User5', 'User5', 'Active'),
    ('CL006', 'Chat Lieu 6', 'User6', 'User6', 'Inactive'),
    ('CL007', 'Chat Lieu 7', 'User7', 'User7', 'Active'),
    ('CL008', 'Chat Lieu 8', 'User8', 'User8', 'Inactive'),
    ('CL009', 'Chat Lieu 9', 'User9', 'User9', 'Active'),
    ('CL010', 'Chat Lieu 10', 'User10', 'User10', 'Inactive');

SELECT * FROM CoAo
-- Insert data into CoAo table
INSERT INTO CoAo (maCA, loai_co_ao, nguoi_tao, nguoi_sua, trang_thai)
VALUES 
    ('CA001', 'Co Ao 1', 'User1', 'User1', 'Active'),
    ('CA002', 'Co Ao 2', 'User2', 'User2', 'Inactive'),
    ('CA003', 'Co Ao 3', 'User3', 'User3', 'Active'),
    ('CA004', 'Co Ao 4', 'User4', 'User4', 'Inactive'),
    ('CA005', 'Co Ao 5', 'User5', 'User5', 'Active'),
    ('CA006', 'Co Ao 6', 'User6', 'User6', 'Inactive'),
    ('CA007', 'Co Ao 7', 'User7', 'User7', 'Active'),
    ('CA008', 'Co Ao 8', 'User8', 'User8', 'Inactive'),
    ('CA009', 'Co Ao 9', 'User9', 'User9', 'Active'),
    ('CA010', 'Co Ao 10', 'User10', 'User10', 'Inactive');
SELECT * FROM KichThuoc
-- Insert data into KichThuoc table
INSERT INTO KichThuoc (maKichThuoc, loai_kich_thuoc, nguoi_tao, nguoi_sua, trang_thai)
VALUES 
    ('KT001', 'Kich Thuoc 1', 'User1', 'User1', 'Active'),
    ('KT002', 'Kich Thuoc 2', 'User2', 'User2', 'Inactive'),
    ('KT003', 'Kich Thuoc 3', 'User3', 'User3', 'Active'),
    ('KT004', 'Kich Thuoc 4', 'User4', 'User4', 'Inactive'),
    ('KT005', 'Kich Thuoc 5', 'User5', 'User5', 'Active'),
    ('KT006', 'Kich Thuoc 6', 'User6', 'User6', 'Inactive'),
    ('KT007', 'Kich Thuoc 7', 'User7', 'User7', 'Active'),
    ('KT008', 'Kich Thuoc 8', 'User8', 'User8', 'Inactive'),
    ('KT009', 'Kich Thuoc 9', 'User9', 'User9', 'Active'),
    ('KT010', 'Kich Thuoc 10', 'User10', 'User10', 'Inactive');
SELECT * FROM KieuDang
-- Insert data into KieuDang table
INSERT INTO KieuDang (maKD, loai_kieu_dang, nguoi_tao, nguoi_sua, trang_thai)
VALUES 
    ('KD001', 'Kieu Dang 1', 'User1', 'User1', 'Active'),
    ('KD002', 'Kieu Dang 2', 'User2', 'User2', 'Inactive'),
    ('KD003', 'Kieu Dang 3', 'User3', 'User3', 'Active'),
    ('KD004', 'Kieu Dang 4', 'User4', 'User4', 'Inactive'),
    ('KD005', 'Kieu Dang 5', 'User5', 'User5', 'Active'),
    ('KD006', 'Kieu Dang 6', 'User6', 'User6', 'Inactive'),
    ('KD007', 'Kieu Dang 7', 'User7', 'User7', 'Active'),
    ('KD008', 'Kieu Dang 8', 'User8', 'User8', 'Inactive'),
    ('KD009', 'Kieu Dang 9', 'User9', 'User9', 'Active'),
    ('KD010', 'Kieu Dang 10', 'User10', 'User10', 'Inactive');
SELECT * FROM MauSP
-- Insert data into MauSP table
INSERT INTO MauSP (maMauSP, ten_mau, nguoi_tao, nguoi_sua, trang_thai)
VALUES 
    ('MSP001', 'Mau SP 1', 'User1', 'User1', 'Active'),
    ('MSP002', 'Mau SP 2', 'User2', 'User2', 'Inactive'),
    ('MSP003', 'Mau SP 3', 'User3', 'User3', 'Active'),
    ('MSP004', 'Mau SP 4', 'User4', 'User4', 'Inactive'),
    ('MSP005', 'Mau SP 5', 'User5', 'User5', 'Active'),
    ('MSP006', 'Mau SP 6', 'User6', 'User6', 'Inactive'),
    ('MSP007', 'Mau SP 7', 'User7', 'User7', 'Active'),
    ('MSP008', 'Mau SP 8', 'User8', 'User8', 'Inactive'),
    ('MSP009', 'Mau SP 9', 'User9', 'User9', 'Active'),
    ('MSP010', 'Mau SP 10', 'User10', 'User10', 'Inactive');
SELECT * FROM TayAo
-- Insert data into TayAo table
INSERT INTO TayAo (maTA, loai_tay_ao, nguoi_tao, nguoi_sua, trang_thai)
VALUES 
    ('TA001', 'Tay Ao 1', 'User1', 'User1', 'Active'),
    ('TA002', 'Tay Ao 2', 'User2', 'User2', 'Inactive'),
    ('TA003', 'Tay Ao 3', 'User3', 'User3', 'Active'),
    ('TA004', 'Tay Ao 4', 'User4', 'User4', 'Inactive'),
    ('TA005', 'Tay Ao 5', 'User5', 'User5', 'Active'),
    ('TA006', 'Tay Ao 6', 'User6', 'User6', 'Inactive'),
    ('TA007', 'Tay Ao 7', 'User7', 'User7', 'Active'),
    ('TA008', 'Tay Ao 8', 'User8', 'User8', 'Inactive'),
    ('TA009', 'Tay Ao 9', 'User9', 'User9', 'Active'),
    ('TA010', 'Tay Ao 10', 'User10', 'User10', 'Inactive');
SELECT * FROM ThuongHieu
-- Insert data into ThuongHieu table
INSERT INTO ThuongHieu (maTH, ten_thuong_hieu, nguoi_tao, nguoi_sua, trang_thai)
VALUES 
    ('TH001', 'Thuong Hieu 1', 'User1', 'User1', 'Active'),
    ('TH002', 'Thuong Hieu 2', 'User2', 'User2', 'Inactive'),
    ('TH003', 'Thuong Hieu 3', 'User3', 'User3', 'Active'),
    ('TH004', 'Thuong Hieu 4', 'User4', 'User4', 'Inactive'),
    ('TH005', 'Thuong Hieu 5', 'User5', 'User5', 'Active'),
    ('TH006', 'Thuong Hieu 6', 'User6', 'User6', 'Inactive'),
    ('TH007', 'Thuong Hieu 7', 'User7', 'User7', 'Active'),
    ('TH008', 'Thuong Hieu 8', 'User8', 'User8', 'Inactive'),
    ('TH009', 'Thuong Hieu 9', 'User9', 'User9', 'Active'),
    ('TH010', 'Thuong Hieu 10', 'User10', 'User10', 'Inactive')


select * from Voucher
insert into Voucher (so_luong, ma_voucher, ten_voucher, ngay_bat_dau, ngay_ket_thuc,hinh_thuc_giam_gia,giam_gia_, nguoi_tao,nguoi_sua,trang_thai, mo_ta) values 
	(2,'VC01',N'sale sap san','12-09-2021','12-12-2021',N'Giảm theo %',N'10%',N'Đệ',N'Đệ',N'Hết hạn',N'Không có mô tả'),
	(1,'VC02',N'sale san Tet','12-09-2022','12-12-2022',N'Giảm theo số lượng',N'20%',N'Đệ',N'Đệ',N'Hết hạn',N'Không có mô tả'),
	(6,'VC03',N'sale giang sinh','16-11-2023','12-12-2023',N'Giảm theo số tiền',N'30%',N'Đệ',N'Đệ',N'Còn hạn',N'Không có mô tả'),
	(15,'VC004',N'Discount 20%', '04-01-2022', '02-10-2023',N'Giảm theo %',N'20%', N'User4', N'User4', N'Hết hạn',N'Không có mô tả'),
    (20,'VC005', 'Free Gift', '16-11-2023', '12-12-2023',N'Giảm theo số tiền',N'50%', N'User5', N'User5', N'Còn hạn', N'Không có mô tả'),
    (12, 'VC006', 'Flash Sale', '06-01-2022', '06-02-2022',N'Giảm theo số lượng',N'15%',N'User6', N'User6', N'Hết hạn',N'Không có mô tả'),
    (7, 'VC007', 'Special Offer', '17-11-2023', '20-12-2023',N'Giảm theo %',N'45%', N'User7', N'User7', N'Còn hạn',N'Không có mô tả'),
    (9, 'VC008', 'Discount 15%', '10-10-2023', '10-11-2023',N'Giảm theo số lượng',N'15%' ,N'User8', N'User8', N'Hết hạn',N'Không có mô tả'),
    (18, 'VC009', 'Free Upgrade', '06-05-2023', '06-06-2023',N'Giảm theo %',N'28%', N'User9', N'User9', N'Hết hạn',N'Không có mô tả'),
    (22, 'VC010', 'Limited Edition', '11-11-2023', '11-12-2023',N'Giảm theo số tiền',N'30%', N'User10', N'User10', N'Còn hạn',N'Không có mô tả')

SELECT * FROM NhanVien
-- Insert data into NhanVien table
INSERT INTO NhanVien (maNV, ho_ten_nv, gioi_tinh, sdt_nv, dia_chi, cccd, mat_khau, trang_thai)
VALUES 
    ('NV001', 'Nhan Vien 1', 'Nam', '123456789', 'Dia Chi 1', 123456789, 'password1', 'Active'),
    ('NV002', 'Nhan Vien 2', 'Nu', '987654321', 'Dia Chi 2', 987654321, 'password2', 'Inactive'),
    ('NV003', 'Nhan Vien 3', 'Nam', '111222333', 'Dia Chi 3', 111222333, 'password3', 'Active'),
    ('NV004', 'Nhan Vien 4', 'Nu', '444555666', 'Dia Chi 4', 444555666, 'password4', 'Inactive'),
    ('NV005', 'Nhan Vien 5', 'Nam', '777888999', 'Dia Chi 5', 777888999, 'password5', 'Active'),
    ('NV006', 'Nhan Vien 6', 'Nu', '000111222', 'Dia Chi 6', 000111222, 'password6', 'Inactive'),
    ('NV007', 'Nhan Vien 7', 'Nam', '333444555', 'Dia Chi 7', 333444555, 'password7', 'Active'),
    ('NV008', 'Nhan Vien 8', 'Nu', '666777888', 'Dia Chi 8', 666777888, 'password8', 'Inactive'),
    ('NV009', 'Nhan Vien 9', 'Nam', '999000111', 'Dia Chi 9', 999000111, 'password9', 'Active'),
    ('NV010', 'Nhan Vien 10', 'Nu', '222333444', 'Dia Chi 10', 222333444, 'password10', 'Inactive');
SELECT * FROM KhachHang
-- Insert data into KhachHang table
INSERT INTO KhachHang (maKH, ho_ten_kh, gioi_tinh, ngay_sinh, dia_chi, sdt_kh, mat_khau)
VALUES 
    ('KH001', 'Khach Hang 1', 'Nam', '1990-01-01', 'Dia Chi KH 1', '987654321', 'passwordKH1'),
    ('KH002', 'Khach Hang 2', 'Nu', '1995-05-05', 'Dia Chi KH 2', '123456789', 'passwordKH2'),
    ('KH003', 'Khach Hang 3', 'Nam', '1985-10-10', 'Dia Chi KH 3', '555666777', 'passwordKH3'),
    ('KH004', 'Khach Hang 4', 'Nu', '1998-08-08', 'Dia Chi KH 4', '333444555', 'passwordKH4'),
    ('KH005', 'Khach Hang 5', 'Nam', '1982-12-25', 'Dia Chi KH 5', '999000111', 'passwordKH5'),
    ('KH006', 'Khach Hang 6', 'Nu', '1993-03-15', 'Dia Chi KH 6', '111222333', 'passwordKH6'),
	('KH007', 'Khach Hang 7', 'Nam', '1991-06-20', 'Dia Chi KH 7', '444555666', 'passwordKH7'),
    ('KH008', 'Khach Hang 8', 'Nu', '1997-09-18', 'Dia Chi KH 8', '666777888', 'passwordKH8'),
    ('KH009', 'Khach Hang 9', 'Nam', '1989-04-05', 'Dia Chi KH 9', '999000111', 'passwordKH9'),
    ('KH010', 'Khach Hang 10', 'Nu', '1996-11-30', 'Dia Chi KH 10', '222333444', 'passwordKH10')
    
SELECT * FROM SanPham
-- Insert data into SanPham table
INSERT INTO SanPham (maSP, ten_sp, gia_sp, trang_thai, nguoi_sua, nguoi_tao)
VALUES 
    ('SP001', 'San Pham 1', 100.00, 'Active', 'User1', 'User1'),
    ('SP002', 'San Pham 2', 150.00, 'Inactive', 'User2', 'User2'),
    ('SP003', 'San Pham 3', 120.00, 'Active', 'User3', 'User3'),
    ('SP004', 'San Pham 4', 180.00, 'Inactive', 'User4', 'User4'),
    ('SP005', 'San Pham 5', 200.00, 'Active', 'User5', 'User5'),
    ('SP006', 'San Pham 6', 160.00, 'Inactive', 'User6', 'User6'),
    ('SP007', 'San Pham 7', 130.00, 'Active', 'User7', 'User7'),
    ('SP008', 'San Pham 8', 170.00, 'Inactive', 'User8', 'User8'),
    ('SP009', 'San Pham 9', 190.00, 'Active', 'User9', 'User9'),
    ('SP010', 'San Pham 10', 140.00, 'Inactive', 'User10', 'User10')
SELECT * FROM ChiTietSP
-- Insert data into ChiTietSP table
INSERT INTO ChiTietSP (id_san_pham, id_co_ao, id_kich_thuoc, id_mau, id_chat_lieu, id_kieu_dang, id_tay_ao, maCTSP, so_luong, mo_ta, trang_thai, gia, id_thuong_hieu)
VALUES 
    (1, 1, 1, 1, 1, 1, 1, 'CTSP001', 5, 'Mo ta 1', 'Active', 100.00, 1),
    (2, 2, 2, 2, 2, 2, 2, 'CTSP002', 10, 'Mo ta 2', 'Inactive', 150.00, 2),
    (3, 3, 3, 3, 3, 3, 3, 'CTSP003', 8, 'Mo ta 3', 'Active', 120.00, 3),
    (4, 4, 4, 4, 4, 4, 4, 'CTSP004', 15, 'Mo ta 4', 'Inactive', 180.00, 4),
    (5, 5, 5, 5, 5, 5, 5, 'CTSP005', 20, 'Mo ta 5', 'Active', 200.00, 5),
    (6, 6, 6, 6, 6, 6, 6, 'CTSP006', 12, 'Mo ta 6', 'Inactive', 160.00, 6),
    (7, 7, 7, 7, 7, 7, 7, 'CTSP007', 7, 'Mo ta 7', 'Active', 130.00, 7),
    (8, 8, 8, 8, 8, 8, 8, 'CTSP008', 9, 'Mo ta 8', 'Inactive', 170.00, 8),
    (9, 9, 9, 9, 9, 9, 9, 'CTSP009', 18, 'Mo ta 9', 'Active', 190.00, 9),
    (10, 10, 10, 10, 10, 10, 10, 'CTSP010', 22, 'Mo ta 10', 'Inactive', 140.00, 10)

SELECT * FROM HoaDon
-- Insert data into HoaDon table
INSERT INTO HoaDon (id_khach_hang, id_nhan_vien, id_phuong_thuc_tt, id_voucher, maHD, nguoi_tao, nguoi_sua, ho_ten_kh, sdt_kh, dia_chi, phi_ship, tong_tien, ngay_dat_hang, ngay_nhan_hang, ngay_thanh_toan, ghi_chu, trang_thai)
VALUES 
    (1, 1, 1, 1, 'HD001', 'User1', 'User1', 'Khach Hang 1', '987654321', 'Dia Chi KH 1', 50.00, 200.00, '2023-01-01', '2023-01-05', '2023-01-10', 'Giao hang som', 'Completed'),
    (2, 2, 2, 2, 'HD002', 'User2', 'User2', 'Khach Hang 2', '123456789', 'Dia Chi KH 2', 30.00, 150.00, '2023-02-01', '2023-02-05', '2023-02-10', 'Giao hang nhanh', 'Processing'),
    (3, 3, 1, 3, 'HD003', 'User3', 'User3', 'Khach Hang 3', '555666777', 'Dia Chi KH 3', 40.00, 180.00, '2023-03-01', '2023-03-05', NULL, 'Khach hang can thanh toan', 'Pending'),
    (4, 4, 2, 4, 'HD004', 'User4', 'User4', 'Khach Hang 4', '333444555', 'Dia Chi KH 4', 25.00, 120.00, '2023-04-01', '2023-04-05', '2023-04-10', NULL, 'Completed'),
    (5, 5, 1, 5, 'HD005', 'User5', 'User5', 'Khach Hang 5', '999000111', 'Dia Chi KH 5', 60.00, 250.00, '2023-05-01', '2023-05-05', NULL, NULL, 'Processing'),
    (6, 6, 2, 6, 'HD006', 'User6', 'User6', 'Khach Hang 6', '111222333', 'Dia Chi KH 6', 35.00, 160.00, '2023-06-01', '2023-06-05', '2023-06-10', 'Giao hang tre', 'Pending'),
    (7, 7, 1, 7, 'HD007', 'User7', 'User7', 'Khach Hang 7', '444555666', 'Dia Chi KH 7', 45.00, 190.00, '2023-07-01', '2023-07-05', '2023-07-10', NULL, 'Completed'),
    (8, 8, 2, 8, 'HD008', 'User8', 'User8', 'Khach Hang 8', '666777888', 'Dia Chi KH 8', 55.00, 220.00, '2023-08-01', '2023-08-05', '2023-08-10', 'Khach hang thanh toan qua chuyen khoan', 'Processing'),
    (9, 9, 1, 9, 'HD009', 'User9', 'User9', 'Khach Hang 9', '999000111', 'Dia Chi KH 9', 70.00, 300.00, '2023-09-01', '2023-09-05', NULL, 'Khach hang can kiem tra don hang', 'Pending'),
    (10, 10, 2, 10, 'HD010', 'User10', 'User10', 'Khach Hang 10', '222333444', 'Dia Chi KH 10', 28.00, 130.00, '2023-10-01', '2023-10-05', '2023-10-10', 'Khach hang da huy don hang', 'Cancelled');


SELECT * FROM ChiTietHoaDon
-- Insert data into ChiTietHoaDon table
INSERT INTO ChiTietHoaDon (id_chitiet_sp, id_hoa_don, so_luong, gia, trang_thai, nguoi_tao, nguoi_sua)
VALUES 
    (1, 1, 5, 100.00, 'Active', 'User1', 'User1'),
    (2, 2, 10, 150.00, 'Inactive', 'User2', 'User2'),
    (3, 3, 8, 120.00, 'Active', 'User3', 'User3'),
    (4, 4, 15, 180.00, 'Inactive', 'User4', 'User4'),
    (5, 5, 20, 200.00, 'Active', 'User5', 'User5'),
    (6, 6, 12, 160.00, 'Inactive', 'User6', 'User6'),
    (7, 7, 7, 130.00, 'Active', 'User7', 'User7'),
    (8, 8, 9, 170.00, 'Inactive', 'User8', 'User8'),
    (9, 9, 18, 190.00, 'Active', 'User9', 'User9'),
    (10, 10, 22, 140.00, 'Inactive', 'User10', 'User10')

Update TayAo
SET trang_thai = N'Đang sử dụng'
use master
select id, maHD, ngay_tao, ngay_thanh_toan, tong_tien, ngay_nhan_hang, trang_thai FROM HoaDon
drop database QLSHOP
select * from Voucher

select maSP,ten_sp, gia_sp , ten_thuong_hieu,loai_chat_lieu,loai_co_ao,loai_kich_thuoc,loai_kieu_dang, ten_mau, loai_tay_ao  from ChiTietSP
				join SanPham on ChiTietSP.id_san_pham = SanPham.id 
				join ThuongHieu on ChiTietSP.id_thuong_hieu = ThuongHieu.id 
				join ChatLieu on ChiTietSP.id_chat_lieu = ChatLieu.id
				join CoAo on ChiTietSP.id_co_ao = CoAo.id
				join KichThuoc on ChiTietSP.id_kich_thuoc = KichThuoc.id
				join KieuDang on ChiTietSP.id_kieu_dang = KieuDang.id
				join MauSP on ChiTietSP.id_mau = MauSP.id
				join TayAo on ChiTietSP.id_tay_ao = TayAo.id;