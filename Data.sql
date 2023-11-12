--CREATE DATABASE QLSHOP2
GO
USE QLSHOP2

IF OBJECT_ID('ChatLieu') IS NOT NULL
	DROP TABLE ChatLieu
GO
CREATE TABLE ChatLieu
(
	ID INT IDENTITY(1,1) NOT NULL,
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
	ma_voucher varchar(50) NULL,
	ngay_bat_dau date NULL,
	ngay_ket_thuc date NULL,
	nguoi_tao nvarchar(50) NULL,
	nguoi_sua nvarchar(50) NULL,
	trang_thai nvarchar(50) NULL,
	CONSTRAINT PK_Voucher PRIMARY KEY (ID)
)
GO

IF OBJECT_ID('NhanVien') IS NOT NULL
	DROP TABLE NhanVien
GO
CREATE TABLE NhanVien(
	[id] [int] IDENTITY(1,1) NOT NULL,
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
	[nguoi_tao] [nvarchar](50) NULL,
	[nguoi_sua] [nvarchar](50) NULL,
	[ho_ten_kh] [nvarchar](50) NULL,
	[sdt_kh] [varchar](30) NULL,
	[dia_chi] [nvarchar](100) NULL,
	[phi_ship] [money] NULL,
	[tong_tien] [money] NULL,
	[ngay_dat_hang] [date] NULL,
	[ngay_nhan_hang] [date] NULL,
	[ngay_thanh_toan] [date] NULL,
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
INSERT INTO ChatLieu values 
(N'Vải', N'Chiến', N'Chiến', N'Còn hàng'),
(N'Cotton', N'Chiến', N'Chiến', N'Hết hàng'),
(N'Kaki', N'Chiến', N'Chiến', N'Còn hàng'),
(N'Jean', N'Chiến', N'Chiến', N'Hết hàng'),
(N'Modal', N'Chiến', N'Chiến', N'Sắp hết hàng')

SELECT * FROM CoAo

INSERT INTO CoAo values
(N'Lá sen', N'Chiến', N'Chiến', N'Còn hàng'),
(N'Cao', N'Chiến', N'Chiến', N'Hết hàng'),
(N'Vest', N'Chiến', N'Chiến', N'Sắp hết hàng'),
(N'Chữ V', N'Chiến', N'Chiến', N'Còn hàng'),
(N'Chữ A', N'Chiến', N'Chiến', N'Còn hàng')

SELECT * FROM KichThuoc
Insert into KichThuoc values
('S', N'Chiến', N'Chiến', N'Còn hàng'),
('M', N'Chiến', N'Chiến', N'Hết hàng'),
('L', N'Chiến', N'Chiến', N'Còn hàng'),
('XL', N'Chiến', N'Chiến', N'Sắp hết hàng'),
('XXL', N'Chiến', N'Chiến', N'Còn hàng')


SELECT * FROM MauSP
Insert into MauSP values
(N'Vàng', N'Chiến', N'Chiến', N'Còn hàng'),
(N'Đen', N'Chiến', N'Chiến', N'Hết hàng'),
(N'Trắng', N'Chiến', N'Chiến', N'Còn hàng'),
(N'Hồng', N'Chiến', N'Chiến', N'Sắp hết hàng'),
(N'Xanh da trời', N'Chiến', N'Chiến', N'Còn hàng')
SELECT * FROM TayAo
Insert into TayAo values
(N'Lỡ', N'Chiến', N'Chiến', N'Còn hàng'),
(N'Ngắn', N'Chiến', N'Chiến', N'Hết hàng'),
(N'Xòe', N'Chiến', N'Chiến', N'Còn hàng'),
(N'Loe', N'Chiến', N'Chiến', N'Sắp hết hàng'),
(N'Chuông', N'Chiến', N'Chiến', N'Còn hàng')
SELECT * FROM ThuongHieu
Insert into ThuongHieu values
(N'ClownZ', N'Chiến', N'Chiến', N'Còn hàng'),
(N'SWE', N'Chiến', N'Chiến', N'Hết hàng'),
(N'Tommy', N'Chiến', N'Chiến', N'Còn hàng'),
(N'LV', N'Chiến', N'Chiến', N'Sắp hết hàng'),
(N'H&M', N'Chiến', N'Chiến', N'Còn hàng')

Insert into SanPham values 
(N'Áo phông thời thượng', 300000, N'Còn hàng', N'Chiến', N'Chiến'),
(N'Áo phông basic', 200000, N'Hết hàng', N'Chiến', N'Chiến'),
(N'Áo phông hot', 250000, N'Còn hàng', N'Chiến', N'Chiến'),
(N'Áo phông ABC', 220000, N'Sắp hết hàng', N'Chiến', N'Chiến'),
(N'Áo phông CLC', 210000, N'Còn hàng', N'Chiến', N'Chiến')

insert into KieuDang values
(N'Croptop', N'Chiến', N'Chiến', N'Còn hàng'),
(N'Oversize', N'Chiến', N'Chiến', N'Hết hàng'),
(N'Aline', N'Chiến', N'Chiến', N'Còn hàng'),
(N'Slim', N'Chiến', N'Chiến', N'Sắp hết hàng'),
(N'Regular', N'Chiến', N'Chiến', N'Còn hàng')

Insert into ChiTietSP ([id_san_pham] ,[id_co_ao] ,[id_kich_thuoc], [id_mau], [id_chat_lieu] , [id_kieu_dang],[id_tay_ao],[so_luong],[mo_ta] , [trang_thai] , [gia] ,[id_thuong_hieu]) values
(1, 1, 2, 3, 4, 1, 5,  '200', N'Sản phẩm bán chạy', N'Còn hàng',300000, 2),
(2, 2, 1, 2, 4, 3, 1, '1', N'Sản phẩm hot nhất', N'Sắp hết hàng', 200000,3),
(3, 3, 4, 1, 2, 4, 2, '20', N'Sản phẩm bán chạy', N'Còn hàng', 250000,1),
(4, 4, 5, 5, 1, 5, 3,'100', N'Sản phẩm bán chạy', N'Còn hàng', 220000,5),
(5, 4, 3, 4, 3, 2, 4,'50', N'Sản phẩm bán chạy', N'Còn hàng', 210000,4)
SELECT *FROM ChiTietSP

INSERT INTO KhachHang VALUES
	(N'Phạm Văn Chung', N'nam', '09/12/1997', N'Nam Định', '0483659462', N'abc'),
	(N'Nguyễn Văn Mạnh', N'nam', '12/11/2000', N'Hà nội', '0295867463', N'abc'),
	(N'Nguyễn Thị Linh', N'nữ', '09/03/1995', N'Thái Bình', '0395748365', N'abc')

INSERT INTO NhanVien VALUES
	(N'Đậu Thế Thành', N'Nam', '0339907946', N'Nghệ An', null, '123', N'Đang làm việc'),
	(N'Phạm Văn Đạt', N'Nam', '0987654321', N'Hà Nội', null, 'dat123', N'Đang làm việc'),
	(N'Phạm Quang Chiến', N'Nam', '0334567856', N'Hà Nội', null, 'chienpham', N'Đang làm việc')

insert into Voucher values 
	(2,'ma01','12/09/2021','12/12/2021',N'Đệ',N'Thành',N'Còn'),
	(1,'ma02','11/11/2022','11/15/2022',N'VanDe',N'DauThanh',N'Hết'),
	(4,'ma03','09/09/2023','09/12/2023',N'Đạt',N'Đạt',N'Hết'),
	(3,'ma04','04/05/2022','04/20/2023',N'Thảo',N'Thảo',N'Hết')

--insert into PhuongThucTT values
--(N'ATM', N'Đã thanh toán'),
--(N'Tiền mặt', N'Đã thanh toán'),
--(N'ATM', N'Đã thanh toán'),
--(N'ATM', N'Chưa thanh toán')

insert into HoaDon values
(2, 2, 3, 1, N'Chiến', N'Chiến', N'Nguyễn Văn Mạnh', '0295867463', N'Hà Nội', 20000, 320000, '11/10/2023', '11/12/2023', '12/12/2023', N'Đã thành công'),
(1, 1, 4, 1, N'Chiến', N'Chiến', N'Phạm Văn Chung', '0483659462', N'Nam Định', 10000, 250000, '11/10/2023', '11/12/2023', '12/12/2023', N'Thất bại'),
(3, 3, 3, 1, N'Chiến', N'Chiến', N'Nguyễn Thị Linh', '0395748365', N'Thái Bình', 0, 200000, '11/10/2023', '11/12/2023', '12/12/2023', N'Đã thành công')

insert into ChiTietHoaDon values
(1, 1, 2, 640000, N'Thanh toán thành công', N'Chiến', N'Chiến'),
(2, 2, 1, 250000, N'Thanh toán thành công', N'Chiến', N'Chiến'),
(3, 3, 2, 400000, N'Thanh toán thành công', N'Chiến', N'Chiến')


SELECT * FROm SanPham
SELECT * FROm ChiTietSP
SELECT * FROm CoAo

