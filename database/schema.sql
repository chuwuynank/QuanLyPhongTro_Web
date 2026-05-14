
-- =============================================
-- HE THONG QUAN LY TIM KIEM PHONG TRO TRUC TUYEN
-- Nhom 02 - Lop INT13130-20252-02 - PTIT 2026
-- Giang vien: Do Quang Hung
-- Chay tren: SQL Server (SSMS / T-SQL)
-- =============================================

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'phongtro_db')
BEGIN
    CREATE DATABASE phongtro_db;
END
GO

USE phongtro_db;
GO

-- =============================================
-- BANG 1: VaiTro
-- =============================================
CREATE TABLE VaiTro (
    ma_vaitro  INT           NOT NULL,
    ten_vaitro NVARCHAR(50)  NOT NULL UNIQUE,
    PRIMARY KEY (ma_vaitro)
);
GO

-- =============================================
-- BANG 2: QuyenHan
-- =============================================
CREATE TABLE QuyenHan (
    ma_quyen  INT            NOT NULL,
    ten_quyen NVARCHAR(100)  NOT NULL UNIQUE,
    mo_ta     NVARCHAR(255)  NULL,
    PRIMARY KEY (ma_quyen)
);
GO

-- =============================================
-- BANG 3: VaiTro_QuyenHan (bảng trung gian n-n)
-- =============================================
CREATE TABLE VaiTro_QuyenHan (
    ma_vaitro INT NOT NULL,
    ma_quyen  INT NOT NULL,
    PRIMARY KEY (ma_vaitro, ma_quyen),
    FOREIGN KEY (ma_vaitro) REFERENCES VaiTro(ma_vaitro),
    FOREIGN KEY (ma_quyen)  REFERENCES QuyenHan(ma_quyen)
);
GO

-- =============================================
-- BANG 4: NguoiDung
-- =============================================
CREATE TABLE NguoiDung (
    ma_nguoidung  INT            NOT NULL,
    ma_vaitro     INT            NOT NULL,
    tai_khoan     VARCHAR(50)    NOT NULL UNIQUE,
    mat_khau      VARCHAR(255)   NOT NULL,
    ho_ten        NVARCHAR(100)  NOT NULL,
    so_dien_thoai VARCHAR(15)    NOT NULL UNIQUE,
    PRIMARY KEY (ma_nguoidung),
    FOREIGN KEY (ma_vaitro) REFERENCES VaiTro(ma_vaitro)
);
GO

-- =============================================
-- BANG 5: LoaiPhong
-- =============================================
CREATE TABLE LoaiPhong (
    ma_loaiphong  INT            NOT NULL IDENTITY(1,1),
    ten_loaiphong NVARCHAR(100)  NOT NULL UNIQUE,
    mo_ta         TEXT           NULL,
    created_at    DATETIME       DEFAULT GETDATE(),
    updated_at    DATETIME       DEFAULT GETDATE(),
    PRIMARY KEY (ma_loaiphong)
);
GO

-- =============================================
-- BANG 6: DiaChi
-- =============================================
CREATE TABLE DiaChi (
    ma_diachi     INT            NOT NULL IDENTITY(1,1),
    tinh_thanhpho NVARCHAR(100)  NOT NULL,
    quan_huyen    NVARCHAR(100)  NOT NULL,
    phuong_xa     NVARCHAR(100)  NOT NULL,
    duong_pho     NVARCHAR(255)  NULL,
    created_at    DATETIME       DEFAULT GETDATE(),
    updated_at    DATETIME       DEFAULT GETDATE(),
    PRIMARY KEY (ma_diachi)
);
GO

-- =============================================
-- BANG 7: PhongTro
-- =============================================
CREATE TABLE PhongTro (
    ma_phong     INT            NOT NULL IDENTITY(1,1),
    tieu_de      NVARCHAR(255)  NOT NULL,
    mo_ta        TEXT           NULL,
    gia_thue     DECIMAL(12,2)  NOT NULL CHECK (gia_thue > 0),
    dien_tich    FLOAT          NOT NULL CHECK (dien_tich > 0),
    ma_nguoidung INT            NOT NULL,
    ma_loaiphong INT            NOT NULL,
    ma_diachi    INT            NOT NULL,
    trang_thai   VARCHAR(20)    DEFAULT 'con_trong' CHECK (trang_thai IN ('con_trong', 'da_thue', 'da_xoa')),
    ngay_dang    DATETIME       DEFAULT GETDATE(),
    ngay_capnhat DATETIME       DEFAULT GETDATE(),
    PRIMARY KEY (ma_phong),
    FOREIGN KEY (ma_nguoidung) REFERENCES NguoiDung(ma_nguoidung),
    FOREIGN KEY (ma_loaiphong) REFERENCES LoaiPhong(ma_loaiphong),
    FOREIGN KEY (ma_diachi)    REFERENCES DiaChi(ma_diachi)
);
GO

-- =============================================
-- BANG 8: TienIch
-- =============================================
CREATE TABLE TienIch (
    ma_tienich  INT            NOT NULL IDENTITY(1,1),
    ten_tienich NVARCHAR(100)  NOT NULL UNIQUE,
    mo_ta       TEXT           NULL,
    icon        VARCHAR(255)   NULL,
    PRIMARY KEY (ma_tienich)
);
GO

-- =============================================
-- BANG 9: Phong_TienIch (bảng trung gian n-n)
-- =============================================
CREATE TABLE Phong_TienIch (
    ma_phong   INT NOT NULL,
    ma_tienich INT NOT NULL,
    PRIMARY KEY (ma_phong, ma_tienich),
    FOREIGN KEY (ma_phong)   REFERENCES PhongTro(ma_phong),
    FOREIGN KEY (ma_tienich) REFERENCES TienIch(ma_tienich)
);
GO

-- =============================================
-- BANG 10: HinhAnh
-- =============================================
CREATE TABLE HinhAnh (
    ma_hinhanh    INT           NOT NULL IDENTITY(1,1),
    ma_phong      INT           NOT NULL,
    duong_dan     VARCHAR(500)  NOT NULL,
    thu_tu        INT           DEFAULT 1,
    la_hinh_chinh BIT           DEFAULT 0,
    created_at    DATETIME      DEFAULT GETDATE(),
    PRIMARY KEY (ma_hinhanh),
    FOREIGN KEY (ma_phong) REFERENCES PhongTro(ma_phong)
);
GO

-- =============================================
-- TRIGGERS XỬ LÝ ON UPDATE CURRENT_TIMESTAMP
-- =============================================

CREATE TRIGGER trg_LoaiPhong_Update
ON LoaiPhong
AFTER UPDATE
AS
BEGIN
    UPDATE LoaiPhong
    SET updated_at = GETDATE()
    WHERE ma_loaiphong IN (SELECT DISTINCT ma_loaiphong FROM Inserted);
END;
GO

CREATE TRIGGER trg_DiaChi_Update
ON DiaChi
AFTER UPDATE
AS
BEGIN
    UPDATE DiaChi
    SET updated_at = GETDATE()
    WHERE ma_diachi IN (SELECT DISTINCT ma_diachi FROM Inserted);
END;
GO

CREATE TRIGGER trg_PhongTro_Update
ON PhongTro
AFTER UPDATE
AS
BEGIN
    UPDATE PhongTro
    SET ngay_capnhat = GETDATE()
    WHERE ma_phong IN (SELECT DISTINCT ma_phong FROM Inserted);
END;
GO
