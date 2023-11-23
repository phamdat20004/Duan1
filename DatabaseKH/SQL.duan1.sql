CREATE DATABASE QLSHOPAO
USE QLSHOPAO
GO
USE QLSHOPAO

IF OBJECT_ID('ChatLieu') IS NOT NULL
	DROP TABLE ChatLieu
GO
CREATE TABLE ChatLieu
(
	ID INT IDENTITY(1,1) NOT NULL,
	maCL varchar(10) null,
	loai_chat_lieu nvarchar(50) NULL,
	ngay_tao datetime default getdate(), 
	trang_thai int default 1 NULL,
	CONSTRAINT PK_ChatLieu PRIMARY KEY (ID)
)
GO
-- Sample data for ChatLieu table
INSERT INTO ChatLieu (maCL, loai_chat_lieu)
VALUES 
('CL001', 'Cotton'),
('CL002', 'Polyester'),
('CL003', 'Linen'),
('CL004', 'Silk'),
('CL005', 'Wool'),
('CL006', 'Nylon'),
('CL007', 'Rayon'),
('CL008', 'Denim'),
('CL009', 'Spandex'),
('CL010', 'Leather');

IF OBJECT_ID('CoAo') IS NOT NULL
	DROP TABLE CoAo
GO
CREATE TABLE CoAo
(
	ID INT IDENTITY(1,1) NOT NULL,
	maCA varchar(10) null,
	loai_co_ao nvarchar(50) NULL,
	ngay_tao datetime default getdate(), 
	trang_thai int default 1 NULL,
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
	ngay_tao datetime default getdate(), 
	trang_thai int default 1 NULL,
	CONSTRAINT PK_KichThuoc PRIMARY KEY (ID)
)
GO

-- Sample data for CoAo table
INSERT INTO CoAo (maCA, loai_co_ao)
VALUES 
('CA001', 'Áo thun'),
('CA002', 'Áo khoác'),
('CA003', 'Áo sơ mi'),
('CA004', 'Áo polo'),
('CA005', 'Áo hoodie'),
('CA006', 'Áo len'),
('CA007', 'Áo khoác jean'),
('CA008', 'Áo dài trắng'),
('CA009', 'Áo thun đen'),
('CA010', 'Áo khoác bomber');

-- Sample data for KichThuoc table
INSERT INTO KichThuoc (maKichThuoc, loai_kich_thuoc)
VALUES 
('KT001', 'S'),
('KT002', 'M'),
('KT003', 'L'),
('KT004', 'XL'),
('KT005', 'XXL'),
('KT006', 'XS'),
('KT007', 'Free size'),
('KT008', 'Plus size'),
('KT009', 'Petite'),
('KT010', 'Tall');


Go
IF OBJECT_ID('MauSP') IS NOT NULL
	DROP TABLE MauSP
GO
CREATE TABLE MauSP
(
	ID INT IDENTITY(1,1) NOT NULL,
	maMauSP varchar(10) null,
	ten_mau varchar(50) NULL,
	ngay_tao datetime default getdate(), 
	trang_thai int default 1 NULL,
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
	ngay_tao datetime default getdate(), 
	trang_thai int default 1 ,
	CONSTRAINT PK_TayAo PRIMARY KEY (ID)
)
GO
-- Sample data for MauSP table
INSERT INTO MauSP (maMauSP, ten_mau)
VALUES 
('M001', 'Đen'),
('M002', 'Trắng'),
('M003', 'Đỏ'),
('M004', 'Xanh lá cây'),
('M005', 'Xanh dương'),
('M006', 'Vàng'),
('M007', 'Hồng'),
('M008', 'Nâu'),
('M009', 'Xám'),
('M010', 'Cam');

-- Sample data for TayAo table
INSERT INTO TayAo (maTA, loai_tay_ao)
VALUES 
('TA001', 'Tay dài'),
('TA002', 'Tay ngắn'),
('TA003', 'Tay lỡ'),
('TA004', 'Tay ống'),
('TA005', 'Tay cánh dơi'),
('TA006', 'Tay rớt'),
('TA007', 'Tay bồng'),
('TA008', 'Tay chuông'),
('TA009', 'Tay phồng'),
('TA010', 'Tay chụp vai');


IF OBJECT_ID('ThuongHieu') IS NOT NULL
	DROP TABLE ThuongHieu
GO
CREATE TABLE ThuongHieu
(
	ID INT IDENTITY(1,1) NOT NULL,
	maTH varchar(10) null,
	ten_thuong_hieu varchar(50) NULL,
	ngay_tao datetime default getdate(), 
	trang_thai int default 1 ,
	CONSTRAINT PK_ThuongHieu PRIMARY KEY (ID)
)
GO
-- Sample data for ThuongHieu table
INSERT INTO ThuongHieu (maTH, ten_thuong_hieu)
VALUES 
('TH001', 'Nike'),
('TH002', 'Adidas'),
('TH003', 'Puma'),
('TH004', 'Converse'),
('TH005', 'Vans'),
('TH006', 'Reebok'),
('TH007', 'New Balance'),
('TH008', 'Under Armour'),
('TH009', 'Fila'),
('TH010', 'Balenciaga');

IF OBJECT_ID('Voucher') IS NOT NULL
	DROP TABLE Voucher
GO
CREATE TABLE Voucher
(
	ID INT IDENTITY(1,1) NOT NULL,
	ma_voucher varchar(50) NULL,
	so_luong int default 0  NULL,
	hinh_thuc int  NULL,
	don_toiThiue float null,
	ngay_bat_dau datetime  NULL,
	ngay_ket_thuc datetime NULL,
	mo_ta nvarchar(150) NULL ,
	ngay_tao datetime default getdate(), 
	trang_thai int default 1 ,
	CONSTRAINT PK_Voucher PRIMARY KEY (ID)
)
GO


-- Sample data for Voucher table
INSERT INTO Voucher (ma_voucher, so_luong, hinh_thuc, don_toiThiue, ngay_bat_dau, ngay_ket_thuc)
VALUES 
('VOUCHER001', 50, 1, 100000, '2023-01-01', '2023-12-31'),
('VOUCHER002', 30, 2, 50000, '2023-02-01', '2023-11-30'),
('VOUCHER003', 20, 3, 200000, '2023-03-01', '2023-10-31'),
('VOUCHER004', 40, 1, 150000, '2023-04-01', '2023-09-30'),
('VOUCHER005', 15, 2, 120000, '2023-05-01', '2023-08-31'),
('VOUCHER006', 25, 3, 180000, '2023-06-01', '2023-07-31'),
('VOUCHER007', 35, 1, 90000, '2023-07-01', '2023-06-30'),
('VOUCHER008', 45, 2, 130000, '2023-08-01', '2023-05-31'),
('VOUCHER009', 10, 3, 250000, '2023-09-01', '2023-04-30'),
('VOUCHER010', 60, 1, 80000, '2023-10-01', '2023-03-31');
update Voucher
set mo_ta = 'Mô tả ....'



IF OBJECT_ID('NhanVien') IS NOT NULL
	DROP TABLE NhanVien
GO
CREATE TABLE NhanVien(
	[id] [int] IDENTITY(1,1) NOT NULL,
	maNV varchar(10) null,
	[ho_ten_nv] [nvarchar](50) NULL,
	[gioi_tinh] BIT  NULL,
	[sdt_nv] [varchar](30) NULL,
	[dia_chi] [nvarchar](100) NULL,
	[cccd] varchar (20) NULL,
	[mat_khau] [varchar](50) NULL,
	[ngay_sinh] [date] NULL,
	vaitro bit null,
	ngay_tao datetime default getdate(), 
	trang_thai int default 1 ,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY ([id])
)



GO
-- Sample data for NhanVien table
INSERT INTO NhanVien (maNV, ho_ten_nv, gioi_tinh, sdt_nv, dia_chi, cccd, mat_khau, ngay_sinh, vaitro)
VALUES 
('NV001', 'Nguyen Van A', 1, '0123456789', '123 Street, City', '123456789', 'password1', '1990-01-15', 1),
('NV002', 'Tran Thi B', 0, '0987654321', '456 Street, City', '123456789', 'password2', '1995-03-20', 0),
('NV003', 'Le Van C', 1, '0123456789', '789 Street, City', '123456789', 'password3', '1985-05-25', 1),
('NV004', 'Pham Thi D', 0, '0987654321', '101 Street, City', '123456789', 'password4', '1992-07-10', 0),
('NV005', 'Hoang Van E', 1, '0123456789', '202 Street, City', '123456789', 'password5', '1988-09-15', 1),
('NV006', 'Vo Thi F', 0, '0987654321', '303 Street, City', '123456789', 'password6', '1997-11-30', 0),
('NV007', 'Dinh Van G', 1, '0123456789', '404 Street, City', '123456789', 'password7', '1980-02-05', 1),
('NV008', 'Nguyen Thi H', 0, '0987654321', '505 Street, City', '123456789', 'password8', '1994-04-10', 0),
('NV009', 'Tran Van I', 1, '0123456789', '606 Street, City', '123456789', 'password9', '1983-06-20', 1),
('NV010', 'Le Thi K', 0, '0987654321', '707 Street, City', '123456789', 'password10', '1999-08-25', 0);

IF OBJECT_ID('KhachHang') IS NOT NULL
	DROP TABLE KhachHang
CREATE TABLE KhachHang
(
	ID INT IDENTITY (1,1) NOT NULL,
	IdNV BIGINT NOT NULL,
	MaKhachHang VARCHAR(20) NULL,
	TenKhachHang NVARCHAR(50) NULL,
	SDT VARCHAR(15) NOT NULL,
	NgaySinh DATE NULL,
	GioiTinh BIT NULL , --- 0  NU , 1 NAM
	Email VARCHAR(50) NULL,
	DiaChi NVARCHAR(100) NULL,
	CapBac INT DEFAULT 0 , -- O DONG 1 BAC 2 VANG 
	NgayTao DATE DEFAULT GETDATE(),
	TrangThai BIT DEFAULT 1 , --- 1 CÒN HOẠT ĐỘNG 0 DÙNG HOẶT ĐỌNG
 CONSTRAINT [PK_KhachHang] PRIMARY KEY ([id])
)
GO
-- Sample data for KhachHang table
INSERT INTO KhachHang (IdNV, MaKhachHang, TenKhachHang, SDT, NgaySinh, GioiTinh, Email, DiaChi, CapBac, TrangThai)
VALUES 
(1, 'KH001', 'Nguyen Thi C', '0123456789', '1992-03-15', 0, 'nguyenthic@example.com', '123 Street, City', 1, 1),
(2, 'KH002', 'Tran Van D', '0987654321', '1995-05-20', 1, 'tranvand@example.com', '456 Street, City', 2, 1),
(3, 'KH003', 'Le Thi E', '0123456789', '1988-07-25', 0, 'lethie@example.com', '789 Street, City', 0, 1),
(4, 'KH004', 'Pham Van F', '0987654321', '1991-09-10', 1, 'phamvanf@example.com', '101 Street, City', 1, 1),
(5, 'KH005', 'Hoang Van G', '0123456789', '1994-11-15', 1, 'hoangvang@example.com', '202 Street, City', 2, 1),
(6, 'KH006', 'Vo Thi H', '0987654321', '1987-01-30', 0, 'vothih@example.com', '303 Street, City', 0, 1),
(7, 'KH007', 'Dinh Van I', '0123456789', '1980-04-05', 1, 'dinhvani@example.com', '404 Street, City', 1, 1),
(8, 'KH008', 'Nguyen Van K', '0987654321', '1993-06-10', 1, 'nguyenvank@example.com', '505 Street, City', 2, 1),
(9, 'KH009', 'Tran Thi L', '0123456789', '1986-08-20', 0, 'tranthil@example.com', '606 Street, City', 0, 1),
(10, 'KH010', 'Le Van M', '0987654321', '1999-10-25', 1, 'levanm@example.com', '707 Street, City', 1, 1);

IF OBJECT_ID('SanPham') IS NOT NULL
	DROP TABLE SanPham
CREATE TABLE SanPham
(
	ID int IDENTITY (1,1) NOT NULL,
	MaSP VARCHAR(15)  NOT NULL ,
	TenSP NVARCHAR(50) NOT NULL,
	NgayTao DATE DEFAULT GETDATE(),
	TrangThai INT DEFAULT 0 NOT NULL
 CONSTRAINT [PK_SanPham] PRIMARY KEY (id)
)
GO
-- Sample data for SanPham table
INSERT INTO SanPham (MaSP, TenSP, NgayTao, TrangThai)
VALUES 
('SP001', 'Áo thun nam', '2023-01-01', 1),
('SP002', 'Áo thun nữ', '2023-02-01', 1),
('SP003', 'Áo polo nam', '2023-03-01', 1),
('SP004', 'Áo sơ mi nam', '2023-04-01', 1),
('SP005', 'Áo hoodie unisex', '2023-05-01', 1),
('SP006', 'Áo len nữ', '2023-06-01', 1),
('SP007', 'Áo khoác jean nam', '2023-07-01', 1),
('SP008', 'Áo dài trắng nữ', '2023-08-01', 1),
('SP009', 'Áo thun đen nam', '2023-09-01', 1),
('SP010', 'Áo khoác bomber nữ', '2023-10-01', 1);

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
	[id_thuong_hieu] [int] NOT NULL,
	maCTSP varchar(10) null,
	[so_luong] [int] default 0 ,
	gia float default 0,
	NgayTao DATE DEFAULT GETDATE(),
	[mo_ta] [nvarchar](max) NULL,
	TrangThai INT NOT NULL DEFAULT 0 ,
 CONSTRAINT [PK_ChiTietSP] PRIMARY KEY (id),
 CONSTRAINT FK_ChiTietSP_ChatLieu FOREIGN KEY([id_chat_lieu]) REFERENCES ChatLieu(ID),
 CONSTRAINT FK_ChiTietSP_CoAo FOREIGN KEY([id_co_ao]) REFERENCES CoAo(ID),
 CONSTRAINT FK_ChiTietSP_KichThuoc FOREIGN KEY([id_kich_thuoc]) REFERENCES KichThuoc(ID),
 CONSTRAINT FK_ChiTietSP_MauSP FOREIGN KEY([id_mau]) REFERENCES MauSP(ID),
 CONSTRAINT FK_ChiTietSP_ThuongHieu FOREIGN KEY([id_thuong_hieu]) REFERENCES ThuongHieu(ID),
 CONSTRAINT FK_ChiTietSP_SanPham FOREIGN KEY([id_san_pham]) REFERENCES SanPham(ID)
)
GO


-- Sample data for ChiTietSP table
INSERT INTO ChiTietSP (id_san_pham, id_co_ao, id_kich_thuoc, id_mau, id_chat_lieu, id_thuong_hieu, maCTSP, so_luong, gia, NgayTao, mo_ta, TrangThai)
VALUES 
(1, 1, 1, 1, 1, 1, 'CTSP001', 100, 250000, '2023-01-01', 'Áo thun nam màu đen, size M', 1),
(2, 2, 2, 2, 2, 2, 'CTSP002', 80, 300000, '2023-02-01', 'Áo thun nữ màu trắng, size S', 1),
(3, 3, 3, 3, 3, 3, 'CTSP003', 120, 350000, '2023-03-01', 'Áo polo nam màu đỏ, size L', 1),
(4, 4, 4, 4, 4, 4, 'CTSP004', 90, 400000, '2023-04-01', 'Áo sơ mi nam màu xanh, size XL', 1),
(5, 5, 5, 5, 5, 5, 'CTSP005', 60, 450000, '2023-05-01', 'Áo hoodie unisex màu xanh dương, size XXL', 1),
(6, 6, 6, 6, 6, 6, 'CTSP006', 70, 500000, '2023-06-01', 'Áo len nữ màu vàng, size XS', 1),
(7, 7, 7, 7, 7, 7, 'CTSP007', 110, 550000, '2023-07-01', 'Áo khoác jean nam màu hồng, size Free size', 1),
(8, 8, 8, 8, 8, 8, 'CTSP008', 95, 600000, '2023-08-01', 'Áo dài trắng nữ màu nâu, size Plus size', 1),
(9, 9, 9, 9, 9, 9, 'CTSP009', 75, 650000, '2023-09-01', 'Áo thun đen nam màu xám, size Petite', 1),
(10, 10, 10, 10, 10, 10, 'CTSP010', 85, 700000, '2023-10-01', 'Áo khoác bomber nữ màu cam, size Tall', 1);



 IF OBJECT_ID('HoaDon') IS NOT NULL
	DROP TABLE HoaDon
CREATE TABLE HoaDon
(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_khach_hang] [int] not  NULL,
	[id_nhan_vien] [int] not NULL,
	[id_voucher] [int] NULL,
	maHD varchar(10) null,
	[ho_ten_kh] [nvarchar](50) NULL,
	[sdt_kh] [varchar](30) NULL,
	loai_hoa_don int NULL,--- 1 tại quầy 2 ship
	[dia_chi] [nvarchar](100) NULL,
	[phi_ship] float NULL,
	TienKhDua FLOAT DEFAULT 0,
	TienKhChuyenKhoan FLOAT DEFAULT 0 ,
	TienThua FLOAT DEFAULT 0,
	[tong_tien] float NULL,
	[ngay_dat_hang] datetime null,
	[ngay_nhan_hang] [date] NULL,
	[ngay_thanh_toan] datetime NULL,
	[ghi_chu] [nvarchar](50) NULL,
	hinh_thuc_thanh_toan int default 1 ,
	[ngay_tao] date default getdate(),
	capbac int null , --- cấp bậc tại thời điểm mua hàng
	[trang_thai] int default 0 ,---- 0 chưa chưa tt , 1 đã tt 
 CONSTRAINT [PK_HoaDon] PRIMARY KEY (id),
 CONSTRAINT FK_HoaDon_KhachHang FOREIGN KEY([id_khach_hang]) REFERENCES KhachHang(ID),
  CONSTRAINT FK_HoaDon_Voucher FOREIGN KEY([id_voucher]) REFERENCES Voucher(ID),
 CONSTRAINT FK_HoaDon_NhanVien FOREIGN KEY([id_nhan_vien]) REFERENCES NhanVien(ID)
)

-- Sample data for HoaDon table
INSERT INTO HoaDon (id_khach_hang, id_nhan_vien, id_voucher, maHD, ho_ten_kh, sdt_kh, loai_hoa_don, dia_chi, phi_ship, TienKhDua, TienKhChuyenKhoan, TienThua, tong_tien, ngay_dat_hang, ngay_nhan_hang, ngay_thanh_toan, ghi_chu, ngay_tao, capbac, trang_thai)
VALUES 
(1, 1, 1, 'HD001', 'Nguyen Thi C', '0123456789', 1, '123 Street, City', 20000, 250000, 0, 0, 275000, '2023-01-01 08:00:00', '2023-01-02', '2023-01-02 10:30:00', 'Giao hàng nhanh', '2023-01-01', 1, 1),
(2, 2, 2, 'HD002', 'Tran Van D', '0987654321', 2, '456 Street, City', 25000, 300000, 0, 0, 325000, '2023-02-01 10:30:00', '2023-02-02', '2023-02-02 14:45:00', 'Giao hàng sau 12h', '2023-02-01', 2, 1),
(3, 3, 3, 'HD003', 'Le Thi E', '0123456789', 1, '789 Street, City', 30000, 350000, 0, 0, 380000, '2023-03-01 12:45:00', '2023-03-02', '2023-03-02 16:30:00', 'Giao hàng giờ hành chính', '2023-03-01', 1, 1),
(4, 4, 4, 'HD004', 'Pham Van F', '0987654321', 2, '101 Street, City', 35000, 400000, 0, 0, 435000, '2023-04-01 14:30:00', '2023-04-02', '2023-04-02 18:15:00', 'Giao hàng trong ngày', '2023-04-01', 2, 1),
(5, 5, 5, 'HD005', 'Hoang Van G', '0123456789', 1, '202 Street, City', 40000, 450000, 0, 0, 485000, '2023-05-01 16:15:00', '2023-05-02', '2023-05-02 20:00:00', 'Giao hàng nhanh', '2023-05-01', 1, 1),
(6, 6, 6, 'HD006', 'Vo Thi H', '0987654321', 2, '303 Street, City', 45000, 500000, 0, 0, 535000, '2023-06-01 18:00:00', '2023-06-02', '2023-06-02 22:30:00', 'Giao hàng sau 12h', '2023-06-01', 2, 1),
(7, 7, 7, 'HD007', 'Dinh Van I', '0123456789', 1, '404 Street, City', 50000, 550000, 0, 0, 585000, '2023-07-01 20:30:00', '2023-07-02', '2023-07-02 01:00:00', 'Giao hàng giờ hành chính', '2023-07-01', 1, 1),
(8, 8, 8, 'HD008', 'Nguyen Van K', '0987654321', 2, '505 Street, City', 55000, 600000, 0, 0, 635000, '2023-08-01 22:15:00', '2023-08-02', '2023-08-02 03:30:00', 'Giao hàng trong ngày', '2023-08-01', 2, 1),
(9, 9, 9, 'HD009', 'Tran Thi L', '0123456789', 1, '606 Street, City', 60000, 650000, 0, 0, 685000, '2023-09-01 01:00:00', '2023-09-02', '2023-09-02 07:15:00', 'Giao hàng nhanh', '2023-09-01', 1, 1),
(10, 10, 10, 'HD010', 'Le Van M', '0987654321', 2, '707 Street, City', 65000, 700000, 0, 0, 735000, '2023-10-01 03:45:00', '2023-10-02', '2023-10-02 09:00:00', 'Giao hàng sau 12h', '2023-10-01',1,1);

  


IF OBJECT_ID('ChiTietHoaDon') IS NOT NULL
	DROP TABLE ChiTietHoaDon
CREATE TABLE ChiTietHoaDon
(
    [id] [int] IDENTITY(1,1) NOT NULL,
    [id_chitiet_sp] [int] NOT NULL,
    [id_hoa_don] [int] NOT NULL,
    [so_luong] [int] NULL,
    [gia] float NULL,
    [ngay_tao] date default getdate(),
    CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY ([id]),
    CONSTRAINT [FK_ChiTietHoaDon_ChiTietSP] FOREIGN KEY([id_chitiet_sp]) REFERENCES ChiTietSP([id]),
    CONSTRAINT [FK_ChiTietHoaDon_HoaDon] FOREIGN KEY([id_hoa_don]) REFERENCES HoaDon([id])
);

select * from ChiTietHoaDon
GO
INSERT INTO ChiTietHoaDon (id_chitiet_sp, id_hoa_don, so_luong, gia, ngay_tao)
VALUES 
(1, 1, 2, 50000, '2023-01-02'),
(2, 2, 1, 60000, '2023-02-02'),
(3, 3, 3, 70000, '2023-03-02'),
(4, 4, 2, 80000, '2023-04-02'),
(5, 5, 1, 90000, '2023-05-02'),
(6, 6, 3, 100000, '2023-06-02'),
(7, 7, 2, 110000, '2023-07-02'),
(8, 8, 1, 120000, '2023-08-02'),
(9, 9, 3, 130000, '2023-09-02'),
(10, 10, 2, 140000, '2023-10-02');


SELECT * FROM Voucher 
INSERT INTO KHACHHANG ( IdNV ,  MaKhachHang , TenKhachHang, SDT, NgaySinh , GioiTinh, Email , DiaChi ) \n"
                    + "	VALUES (?,  ? , ? , ?, ? , ?, ? , ?)

SELECT id ,maNV , ho_ten_nv , sdt_nv  , gioi_tinh ,ngay_sinh , mat_khau , ngay_sinh , dia_chi , cccd , vaitro , trang_thai FROM NhanVien
order by ID OFFSET 2 ROWS FETCH NEXT 2 ROWS ONLY

SELECT HD.ID AS ID , HD.maHD AS MaHoaDon , hd.ngay_thanh_toan AS NgayThanhToan , 
                  	HD.tong_tien AS ThanhTien , HD.trang_thai AS TrangThai ,
                  	 HD.CapBac AS CapBac   FROM HOADON AS HD
                    	JOIN KHACHHANG ON KHACHHANG.ID = HD.id
                    	WHERE MaKhachHang = 'KH001'

						Í
INSERT INTO NhanVien (maNV , ho_ten_nv , gioi_tinh , sdt_nv, dia_chi ,cccd , ngay_sinh , vaitro , trang_thai)
VALUES (? , ? , ? , ?, ? ,? , ? , ? , ?)
UPDATE NhanVien 
SET  ho_ten_nv = ? , gioi_tinh = ?, sdt_nv = ?, dia_chi = ?,cccd = ?, ngay_sinh = ?, vaitro = ?, trang_thai = ?
WHERE maNV LIKE ?


SELECT id ,maNV , ho_ten_nv , sdt_nv  , gioi_tinh ,ngay_sinh , mat_khau , ngay_sinh , dia_chi , cccd , vaitro , trang_thai FROM NhanVien
where maNV like '%%' or ho_ten_nv like '%%' or sdt_nv like '0987654321'
	order by ID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY

	select ID , ma_voucher , hinh_thuc , so_luong ,  don_toiThiue , ngay_bat_dau , ngay_ket_thuc , ngay_tao , mo_ta , trang_thai from Voucher

	SELECT ID, ma_voucher, hinh_thuc, so_luong, don_toiThiue, ngay_bat_dau, ngay_ket_thuc, ngay_tao, mo_ta, trang_thai
FROM Voucher
WHERE ngay_bat_dau >= '2023-01-01' AND ngay_ket_thuc <= '2023-10-20';

	INSERT INTO Voucher ( ma_voucher ,hinh_thuc , so_luong , don_toiThiue , ngay_bat_dau , ngay_ket_thuc , mo_ta , trang_thai) VALUES
	 ( ? ,? , ? , ? , ? , ? , ? , ?)
---------
	 SELECT HD.maHD , maNV , ho_ten_kh , sdt_kh , HD.ngay_tao , HD.ngay_thanh_toan , HD.loai_hoa_don , HD.tong_tien AS tong_tienHD , HD.ghi_chu , HD.trang_thai AS trang_thaiHD   FROM HoaDon AS HD
	LEFT JOIN ChiTietHoaDon AS CTHD ON CTHD.id = HD.id
	LEFT JOIN KhachHang AS KH ON KH.ID = HD.id_khach_hang 
	LEFT JOIN NhanVien AS NV ON NV.id = HD.id
	LEFT JOIN ChiTietSP AS CTSP ON CTSP.id = CTHD.id
	LEFT JOIN SanPham AS SP ON SP.ID = CTHD.id_chitiet_sp
	LEFT JOIN ThuongHieu AS TH ON TH.ID = CTSP.id_thuong_hieu
	LEFT JOIN CoAo AS CA ON CA.ID = CTSP.id_co_ao
	LEFT JOIN KichThuoc AS KT ON KT.ID = CTSP.id_kich_thuoc
	LEFT JOIN MauSP AS M ON M.ID = CTSP.id_mau
	LEFT JOIN ChatLieu AS CL ON CL.ID = CTSP.id_chat_lieu
	LEFT JOIN Voucher AS VC ON VC.ID = HD.id_voucher
	WHERE hd.loai_hoa_don =1 and  hd.hinh_thuc_thanh_toan = 1
-------------
SELECT 
    maCTSP, 
    sp.TenSP as ten_Sp, 
    ten_thuong_hieu, 
    ten_mau, 
    loai_kich_thuoc, 
    CTSP.gia AS giaBanCTSP,
    CTHD.so_luong,
    CTHD.gia ,
	vc.hinh_thuc ,
	tong_tien
FROM HoaDon AS HD
    LEFT JOIN ChiTietHoaDon AS CTHD ON CTHD.id_hoa_don = HD.id
    LEFT JOIN KhachHang AS KH ON KH.ID = HD.id_khach_hang 
    LEFT JOIN NhanVien AS NV ON NV.id = HD.id
    LEFT JOIN ChiTietSP AS CTSP ON CTSP.id = CTHD.id_chitiet_sp
    LEFT JOIN SanPham AS SP ON SP.ID = CTHD.id_chitiet_sp
    LEFT JOIN ThuongHieu AS TH ON TH.ID = CTSP.id_thuong_hieu
    LEFT JOIN CoAo AS CA ON CA.ID = CTSP.id_co_ao
    LEFT JOIN KichThuoc AS KT ON KT.ID = CTSP.id_kich_thuoc
    LEFT JOIN MauSP AS M ON M.ID = CTSP.id_mau
    LEFT JOIN ChatLieu AS CL ON CL.ID = CTSP.id_chat_lieu
    LEFT JOIN Voucher AS VC ON VC.ID = HD.id_voucher 
	WHERE CAST(ngay_thanh_toan AS DATE) >= ? AND CAST(ngay_thanh_toan AS DATE) <= ? 
---------
update 
	 SELECT * FROM HoaDon  90OP

	 UPDATE HoaDon
SET tong_tien =  * gia;
ALTER TABLE HoaDon
ADD hinh_thuc_thanh_toan INT NULL;
update HoaDon
set hinh_thuc_thanh_toan = 1  -- 1 tại quầy 2 ck
