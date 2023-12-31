USE [master]
GO
/****** Object:  Database [SachOnline]    Script Date: 10/31/2023 8:53:20 PM ******/
CREATE DATABASE [SachOnline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SachOnline', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SachOnline.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SachOnline_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SachOnline_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SachOnline] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SachOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SachOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SachOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SachOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SachOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SachOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [SachOnline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SachOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SachOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SachOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SachOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SachOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SachOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SachOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SachOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SachOnline] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SachOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SachOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SachOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SachOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SachOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SachOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SachOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SachOnline] SET RECOVERY FULL 
GO
ALTER DATABASE [SachOnline] SET  MULTI_USER 
GO
ALTER DATABASE [SachOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SachOnline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SachOnline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SachOnline] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SachOnline] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SachOnline] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SachOnline', N'ON'
GO
ALTER DATABASE [SachOnline] SET QUERY_STORE = ON
GO
ALTER DATABASE [SachOnline] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SachOnline]
GO
/****** Object:  Table [dbo].[ADMIN]    Script Date: 10/31/2023 8:53:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADMIN](
	[MaAdmin] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](max) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[DienThoai] [nvarchar](50) NULL,
	[TenDN] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[NgaySinh] [datetime] NULL,
	[Email] [nvarchar](50) NULL,
	[Quyen] [int] NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[MaAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 10/31/2023 8:53:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[AuthorID] [int] IDENTITY(1,1) NOT NULL,
	[AuthorName] [nvarchar](50) NOT NULL,
	[AuthorEmail] [nvarchar](50) NULL,
	[AuthorAddress] [nvarchar](150) NULL,
	[Tieusu] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[AuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 10/31/2023 8:53:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[AuthorID] [int] NULL,
	[Price] [decimal](18, 0) NULL,
	[Images] [varchar](200) NULL,
	[CategoryID] [int] NOT NULL,
	[Description] [ntext] NULL,
	[Published] [datetime] NULL,
	[ViewCount] [int] NULL,
	[NhaXuatBanID] [int] NOT NULL,
 CONSTRAINT [PK__Book__3DE0C227FA6DEE7F] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/31/2023 8:53:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHITIETDATHANG]    Script Date: 10/31/2023 8:53:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETDATHANG](
	[MaDonHang] [int] NOT NULL,
	[BookID] [int] NOT NULL,
	[Soluong] [int] NULL,
	[Dongia] [decimal](9, 2) NULL,
 CONSTRAINT [PK_CHITIETDATHANG] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC,
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DONDATHANG]    Script Date: 10/31/2023 8:53:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DONDATHANG](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[Dathanhtoan] [bit] NULL,
	[Tinhtranggiaohang] [int] NULL,
	[Ngaydat] [smalldatetime] NULL,
	[Ngaygiao] [smalldatetime] NULL,
	[MaKH] [int] NULL,
 CONSTRAINT [PK_DONDATHANG] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 10/31/2023 8:53:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[Taikhoan] [nvarchar](50) NULL,
	[Matkhau] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[DiachiKH] [nvarchar](max) NULL,
	[DienThoaiKH] [nvarchar](50) NULL,
	[Ngaysinh] [datetime] NULL,
 CONSTRAINT [PK_KHACHHANG] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaXuatBan]    Script Date: 10/31/2023 8:53:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaXuatBan](
	[NhaXuatBanID] [int] IDENTITY(1,1) NOT NULL,
	[NhaXuatBanName] [nvarchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NhaXuatBanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VIETSACH]    Script Date: 10/31/2023 8:53:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VIETSACH](
	[AuthorID] [int] NOT NULL,
	[BookID] [int] NOT NULL,
	[Vaitro] [nvarchar](50) NULL,
	[Vitri] [nvarchar](50) NULL,
 CONSTRAINT [PK_VIETSACH] PRIMARY KEY CLUSTERED 
(
	[AuthorID] ASC,
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ADMIN] ON 

INSERT [dbo].[ADMIN] ([MaAdmin], [HoTen], [DiaChi], [DienThoai], [TenDN], [MatKhau], [NgaySinh], [Email], [Quyen]) VALUES (1, N'Nguyễn Thị Kim Quyên', N'TP HCM', N'0965326872', N'kimquyen', N'123', CAST(N'2003-12-27T00:00:00.000' AS DateTime), N'kimquyen@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[ADMIN] OFF
GO
SET IDENTITY_INSERT [dbo].[Author] ON 

INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorEmail], [AuthorAddress], [Tieusu]) VALUES (2, N'Phạm Công Anh', N'vinh@gmailc.om', N'197 Trần Hưng Đạo', NULL)
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorEmail], [AuthorAddress], [Tieusu]) VALUES (3, N'Nguyễn Thế Giang', N'giangnt@gmail.com', N'179 Chánh hưng - F.4 - Q.8 Tp.HCM', NULL)
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorEmail], [AuthorAddress], [Tieusu]) VALUES (4, N'Lê Việt Nhân', N'nhanvl@gmail.com', N'45 Lý Thái Tổ-F2.Q.3 Tp.HCM', NULL)
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorEmail], [AuthorAddress], [Tieusu]) VALUES (5, N'Hồng Phúc', N'hong@gmail.com', N'46 Lý Thái Tổ-F2.Q.3 Tp.HCM', NULL)
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorEmail], [AuthorAddress], [Tieusu]) VALUES (6, N'Ks.Phạm Quang Huy', N'huyq@gmail.com', N'47 Lý Thái Tổ-F2.Q.3 Tp.HCM', NULL)
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorEmail], [AuthorAddress], [Tieusu]) VALUES (9, N'Quách Tuấn Ngọc', N'ngocqt@gmail.com', N'48 Lý Thái Tổ-F2.Q.3 Tp.HCM', NULL)
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [AuthorEmail], [AuthorAddress], [Tieusu]) VALUES (10, N'Lê Văn Hùng', N'vanhung@gmailc.om', N'Hà Nội', NULL)
SET IDENTITY_INSERT [dbo].[Author] OFF
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([BookID], [Title], [AuthorID], [Price], [Images], [CategoryID], [Description], [Published], [ViewCount], [NhaXuatBanID]) VALUES (1, N'Tin học cơ bản', 2, CAST(26000 AS Decimal(18, 0)), N'tinhoccoban.png', 2, N'Nội dung của cuốn: Tin Học Cơ Bản Windows XP gồm có 7 chương:
Chương 1: Một số vấn đề cơ bản. 
Chương 2: Sử dụng nhanh thanh công cụ và thanh thực đơn trong My Computer và Windows Explorer. 
Chương 3: Các thao tác trong windows XP. 
Chương 4: Các thiết lập trong Windows XP. 
Chương 5: Bảo trì máy tính. 
Chương 6: Các phím tắt 
Chương 7: Hỏi và đáp các thắc mắc.
Xin trân trọng giới thiệu cuốn sách cùng bạn', CAST(N'2023-09-25T00:00:00.000' AS DateTime), 0, 8)
INSERT [dbo].[Book] ([BookID], [Title], [AuthorID], [Price], [Images], [CategoryID], [Description], [Published], [ViewCount], [NhaXuatBanID]) VALUES (2, N'Tự học nhanh Microsoft Office', 2, CAST(12000 AS Decimal(18, 0)), N'tuhocmicrosoft.png', 2, N'Cuốn sách này gồm 3 phần sau:
Phần 1: Xử lý văn bản trong Microsoft Office Word 2007. 
Phần 2: Xử lý bảng tính trong Microsoft Office Excel 2007. 
Phần 3: Quản lý cơ sở dữ liệu trong Microsoft Office Access 2007.
Xin trân trọng giới thiệu cùng các bạn.', CAST(N'2023-09-24T00:00:00.000' AS DateTime), 25, 8)
INSERT [dbo].[Book] ([BookID], [Title], [AuthorID], [Price], [Images], [CategoryID], [Description], [Published], [ViewCount], [NhaXuatBanID]) VALUES (3, N'Lập Trình Cơ Sở Dữ Liệu Với Visual Basic 2005 Và ADO.NET 2.0', 3, CAST(11500 AS Decimal(18, 0)), N'laptrinhcsdl.png', 2, N'Cuốn sách "Lập Trình Cơ Sở Dữ Liệu Với Visual Basic 2005 Và ADO.NET 2.0" này giới thiệu các nội dung sau:
Chương 1: Căn bản về cơ sở dữ liệu.
Chương 2: Các bộ kết nối và tương tác dữ liệu.
Chương 3: Bộ chứa dữ liệu DataSet.
Chương 4: Bộ điều hợp dữ liệu DataAdapter.
Chương 5: Sử dụng các điều khiển ràng buộc dữ liệu.
Chương 6: Tạo báo cáo với Crystal Report.
Chương 7: ADO.NET và XML.
Xin trân trọng giới thiệu cùng các bạn.', CAST(N'2023-09-23T00:00:00.000' AS DateTime), 23, 8)
INSERT [dbo].[Book] ([BookID], [Title], [AuthorID], [Price], [Images], [CategoryID], [Description], [Published], [ViewCount], [NhaXuatBanID]) VALUES (4, N'Visual Basic 2005', 4, CAST(20000 AS Decimal(18, 0)), N'VisualBasic2005.png', 2, N'"Visual Basic 2005 Tập 3, Quyển 2: Lập Trình Web Với Cơ Sở Dữ Liệu" sẽ cung cấp kỹ thuật và hướng dẫn bạn:
Tự học xây dựng ứng dụng Web quản lý CSDL toàn diện với ADO.NET 2.0 và ASP.NET. 
Khai thác các đối tượng và nguồn dữ liệu dành cho WebForm. 
Sử dụng các điều khiển dữ liệu đặc thù dành riêng cho ASP.NET và Web. 
Làm quen với những khái niệm xử lý dữ liệu hoàn toàn mới. 
Ràng buộc dữ liệu với các thành phần giao diện Web Forms. 
Thiết kế ứng dụng Web "Quản lý CD Shop" trực quan và thực tế. 
Cung cấp một kiến thức hoàn chỉnh về Web cho các bạn yêu thích ngôn ngữ Visual Basic và .NET Framework.
Sách có kèm theo CD-ROM bài tập.
Xin trân trọng giới thiệu cùng các bạn.', CAST(N'2023-09-22T00:00:00.000' AS DateTime), 0, 8)
INSERT [dbo].[Book] ([BookID], [Title], [AuthorID], [Price], [Images], [CategoryID], [Description], [Published], [ViewCount], [NhaXuatBanID]) VALUES (5, N'Mạng Máy Tính Và Hệ Thống Bảo Mật', 2, CAST(21000 AS Decimal(18, 0)), N'mangmaytinh.png', 2, N'Mạng Máy Tính Và Hệ Thống Bảo Mật gồm 7 chương:
Chương I: Tổng quan về công nghệ mạng máy tính và mạng cục bộ.
Chương II: Các thiết bị mạng thông dụng và các chuẩn kết nối vật lý.
Chương III: TCP/IP và mạng Internet.
Chương IV: Hệ điều hành mạng đặc điểm của hệ điều hành mạng.
Chương V: Một số vấn đề an toàn và bảo mật thông tin trên mạng máy tính.
Chương VI: Giới thiệu hệ điều hành Windows NT.
Chương VII: Giới thiệu hệ điều hành UNIX.
Trân trọng giới thiệu.', CAST(N'2023-09-21T00:00:00.000' AS DateTime), 16, 4)
INSERT [dbo].[Book] ([BookID], [Title], [AuthorID], [Price], [Images], [CategoryID], [Description], [Published], [ViewCount], [NhaXuatBanID]) VALUES (6, N'Lập Trình Cơ Sở Dữ Liệu', 4, CAST(21000 AS Decimal(18, 0)), N'csdl.png', 2, N'Mục đích của bộ sách này giúp bạn trở nên thành thạo cơ sở dữ liệu (CSDL) Oracle9i, đề cập đến tất cả những kiến thức cần thiết từ mô hình dữ liệu, quản trị CSDL, sao lưu phục hồi, mạng và xử lý sự cố cũng như hiệu chỉnh hiệu suất thực thi..., với sự kết hợp lý thuyết và thực hành về điều mà Nhà quản trị CSDL Oracle9i cần biết để sử dụng CSDL Oracle9i một cách hiệu quả từ chính bộ sách này.
Bộ sách được chia làm 2 tập, tập 1 đề cập các kiến thức cơ bản về CSDL, mô hình dữ liệu. Bạn sẽ được biết về hệ quản trị CSDL Oracle9i, tạo CSDL, kết nối và quản lý người dùng. Tập 2 hướng dẫn bạn cách nạp, sao lưu và phục hồi dữ liệu, quản lý hoạt động CSDL Oracle9i, thực hiện hiệu chỉnh hiệu suất thực thi và xử lý sự cố cho CSDL.
Xin trân trọng giới thiệu Tập 1 cùng các bạn.', CAST(N'2023-09-20T00:00:00.000' AS DateTime), 65, 8)
INSERT [dbo].[Book] ([BookID], [Title], [AuthorID], [Price], [Images], [CategoryID], [Description], [Published], [ViewCount], [NhaXuatBanID]) VALUES (7, N'MIND MAP ENGLISH PHRASAL VERBS', 10, CAST(142800 AS Decimal(18, 0)), N'ngoaingu1.png', 1, N'Cuốn sách Cụm động từ, cụm từ và thành ngữ tiếng Anh qua sơ đồ tư duy sẽ giúp bạn:
 
- Đạt được những bước đột phá trong việc cải thiện vốn từ vựng (phrasal verbs, collocations và idioms) tiếng Anh.

- Nâng cao toàn diện kỹ 4 năng tiếng Anh khi lượng từ được trau dồi.

- Tăng cường công suất sử dụng cả hai bán cầu não trong việc ghi nhớ.

- Kích thích trí tưởng tượng và óc sáng tạo.

Nội dung cuốn sách:

- Tổng hợp đầy đủ kiến thức liên quan đến cụm động từ, cụm từ và thành ngữ trong tiếng Anh với giải thích, ví dụ, giải nghĩa chi tiết, dễ hiểu.

- Bài tập dưới mỗi sơ đồ tư duy sẽ có các câu hỏi luyện tập, giúp ghi nhớ nhanh các cụm trong sơ đồ tư duy.

Điểm đặc biệt của cuốn sách

- Tất cả kiến thức được trình bày dưới dạng sơ đồ tư duy với màu sắc sinh động.

Kiến thức đạt được sau lộ trình học với bộ sách:

- Hơn 300 Phrasal verbs thông dụng nhất.

- Hơn 250 Collocations phổ biến nhất.

- Hơn 250 Idioms thường gặp nhất.', CAST(N'2023-10-23T00:00:00.000' AS DateTime), 0, 4)
INSERT [dbo].[Book] ([BookID], [Title], [AuthorID], [Price], [Images], [CategoryID], [Description], [Published], [ViewCount], [NhaXuatBanID]) VALUES (9, N'Giáo trình Hán ngữ', 2, CAST(165050 AS Decimal(18, 0)), N'giaotrinhhanngu.png', 1, N'Giáo trình hán ngữ Boya sơ cấp tập 1 là cuốn đầu tiên trong bộ Giáo trình hán ngữ Boya 8 cuốn - Bộ sách giúp người học thành thạo Nghe - Nói - Đọc - Viết Tiếng trung nhanh chóng, dễ dàng
Ưu điểm của sách
●Chất lượng in ấn đẹp, rõ nét,
●Bố cục bài học rõ ràng, phù hợp với đối tượng mới học tiếng Trung
●Sách được bọc túi chống sốc và hộp giấy cẩn thận để tránh nhàu quăn sách.
●Lưu ý: Chỉ có sách chính hãng của MCBooks mới có thể quét được mã QR-code cho khóa học online và các file nghe đi kèm với sách.
Đối tượng sử dụng sách
Đây là cuốn sách dành cho những đối tượng mới bắt đầu học Tiếng Trung và muốn luyện thành thạo Tiếng Trung
Đặc điểm nổi bật của sách
Cấu trúc bài học
●Bài khóa (2 đoạn hội thoại) 
●Từ mới 
●Ngữ pháp trọng điểm -
●Luyện tập
Trình bày khoa học, chi tiết phù hợp cho việc tự học, tự ôn tập sau những giờ học trên lớp
Luyện tập nhiều cấu trúc ngữ pháp và từ vựng từ đó tăng khả năng đọc, viết của người học
Cung cấp các bài tập luyện viết bám sát từng bài học', CAST(N'2023-10-23T00:00:00.000' AS DateTime), 0, 4)
INSERT [dbo].[Book] ([BookID], [Title], [AuthorID], [Price], [Images], [CategoryID], [Description], [Published], [ViewCount], [NhaXuatBanID]) VALUES (10, N'Combo truyền thuyết về cội nguồn các dân tộc 2', 2, CAST(132000 AS Decimal(18, 0)), N'combotruyenthuyet.png', 3, N'Combo Truyền Thuyết Về Cội Nguồn Các Dân Tộc 2 (Bộ 5 Cuốn) 

- Truyền Thuyết Về Cội Nguồn Các Dân Tộc: Chuỗi Truyền Thuyết Sơn Tinh
- Truyền Thuyết Về Cội Nguồn Các Dân Tộc: Truyện Kể Về Tên Đất
- Truyền Thuyết Về Cội Nguồn Các Dân Tộc: Kể Chuyện Núi Sông
- Truyền Thuyết Về Cội Nguồn Các Dân Tộc: Những Nữ Tướng Anh Hùng
- Truyền Thuyết Về Cội Nguồn Các Dân Tộc: Nguồn Gốc Các Dân Tộc Anh Em
 
Truyền thuyết là những câu chuyện được truyền miệng trong dân gian mang đậm tính lịch sử nhưng không khô khan vì có thêm yếu tố tưởng tượng kì ảo. Trong trí tưởng tượng dân gian bất kể ở miền xuôi hay miền ngược, nguồn gốc của các dân tộc, của đất đai làng bản, của những đồ vật gắn liền với cuộc sống sinh hoạt của người dân và đặc biệt, công lao, hành trạng của những người anh hùng có công trong cuộc chiến giành đất và giữ đất luôn luôn vừa gần gũi chân thực vừa lấp lánh chất hư cấu. Những câu chuyện ấy cho ta thêm yêu con người, yêu những nét văn hóa đẹp đẽ mang đặc trưng riêng của từng dân tộc anh em, đồng thời cho ta hiểu thêm về những tháng ngày ông cha đã khó nhọc dựng xây để ngày nay cháu con có được đất đai trù phú. Những câu chuyện ấy một lần nữa cho ta được tự hào về di sản vô giá mà ngày nay 54 dân tộc Việt Nam còn gìn giữ được.', CAST(N'2023-10-23T00:00:00.000' AS DateTime), 0, 3)
INSERT [dbo].[Book] ([BookID], [Title], [AuthorID], [Price], [Images], [CategoryID], [Description], [Published], [ViewCount], [NhaXuatBanID]) VALUES (11, N'Thương nhau đến ngày sau', 2, CAST(100300 AS Decimal(18, 0)), N'thuongnhaudenngaysau.png', 3, N'Nhà văn Tống Phước Bảo – đại diện Ban Giám khảo của cuộc thi “Thương nhau đến ngày sau” – người đã chọn lọc từng tác phẩm cho cuốn sách xuất bản “Thương nhau đến ngày sau” đã có những cảm nghĩ:

“Bước ra từ cuộc thi “Thương nhau đến ngày sau”, các tác phẩm đã lắng lại trên trang sách này như một điều tất yếu bởi những câu chữ đong đầy cảm xúc luôn cần lưu lại và chuyển tải đến bạn đọc. Thời gian phôi phai lên nỗi đời nhiều vệt kí ức, nhưng có những thứ sẽ là miên trường vĩnh cửu trong chúng ta. Đôi khi chỉ vụn vặt như chuyện uống trà của tác giả Kim Loan mà sự nhớ thương cứ rưng rức mãi miết. Hay như trong tác phẩm “Cúc ơi” của Lê Văn Nhân. Chàng trai trẻ đem đến cho bạn đọc một câu chuyện gần gũi và chân phương thể như sóng nước phù sa miệt chín nhánh vỗ thắt dạ người đọc. Thứ còn lại sau những dâu bể phận người đó là tình thương. Tình thương nắm níu chúng ta gần gũi và tử tế với nhau. Chữ thương miên mải không chỉ từ chuyện đời, chuyện quê, chuyện tình mà còn là chuyện mình. Tất thảy những câu chuyện trong tập sách này, quyện vào chữ thương để bày tỏ một thông điệp đầy tính nhân văn. 

Chúng ta đọc một Chung Tiến Lực thâm trầm với giọng văn mang nhiều trải nghiệm; một Hà My kể chuyện nhẹ tênh thể như đang thủ thỉ tỉ tê lòng mình; hay Ngô Thành Đạo với một tác phẩm sống động và dạt dào xúc cảm… Nhiều lắm những tác phẩm mà tin chắc nếu bạn đọc hữu duyên cầm được tập sách này, đôi khi sẽ lại quấn quyến lòng mình bởi những câu chữ quá đỗi thương luyến. Nỗi thương ấy tôi tin, nó sẽ âm vang trong lòng bạn đọc cho đến những ngày sau của hành trình 
sống dặm dài mà mình đang trải”.', CAST(N'2023-10-23T00:00:00.000' AS DateTime), 0, 1)
INSERT [dbo].[Book] ([BookID], [Title], [AuthorID], [Price], [Images], [CategoryID], [Description], [Published], [ViewCount], [NhaXuatBanID]) VALUES (12, N'Kỹ Thuật trồng nho', 2, CAST(33200 AS Decimal(18, 0)), N'kythuattrongnho.png', 5, N'Bí Quyết Thành Công Kĩ Thuật Trồng Nho Hiệu Quả

Cuốn sách giới thiệu đầy đủ những bệnh hại, những loài sâu bọ gây hại đối với nho. Đồng thời, cuốn sách còn giới thiệu những biện pháp cụ thể, tỉ mỉ để phòng và trị sâu, bệnh. Nắm bắt được nội dung trong sách, không chỉ với riêng nho, 
chúng ta có thể áp dụng đối với các loại cây ăn quả kh', CAST(N'2023-10-23T00:00:00.000' AS DateTime), 0, 2)
INSERT [dbo].[Book] ([BookID], [Title], [AuthorID], [Price], [Images], [CategoryID], [Description], [Published], [ViewCount], [NhaXuatBanID]) VALUES (13, N'Combo Luật Đầu Tư + Luật Xây Dựng - Luật Kiến Trúc + Luật Doanh Nghiệp', 2, CAST(438300 AS Decimal(18, 0)), N'comboluat.png', 7, N'Combo Luật Đầu Tư - Đầu Tư Theo Phương Thức Đối Tác Công Tư + Luật Xây Dựng - Luật Kiến Trúc + Luật Doanh Nghiệp (Song Ngữ Anh-Việt) (Bộ 3 Cuốn)
 
1. Luật Đầu Tư - Đầu Tư Theo Phương Thức Đối Tác Công Tư (Song Ngữ Anh-Việt)

*Luật số 61/2020/QH14 được Quốc Hội thông qua ngày 17/06/2020 có hiệu lực thi hành từ ngày 01/01/2021

*Luật số 64/2020/QH14 được Quóc hội thông qua ngày 18/06/2020 có hiệu lực thi hành từ ngày 01/01/2021

Sách mang đến luật ở dạng song ngữ giúp bạn tiện tra cứu luật bằng cả hai ngôn ngữ.

2. Luật Xây Dựng - Luật Kiến Trúc (Song Ngữ Anh-Việt)

* Luật Xây Dựng (Sửa Đổi Bổ Sung Năm 2016, 2018, 2019, 2020)
 
Chương 1: Những Quy Định Chung (điều 1 – Điều 12)

Chương 2: Quy Hoạch Xây Dựng (điều 13 – Điều 48)

Chương 3: Dự Án Đầu Tư Xây Dựng Công Trình (điều 49 – Điều 72)

Chương 4: Khảo Sát Xây Dựng Và Thiết Kế Xây Dựng (điều 73 – Điều 88)

Chương 5: Giấy Phép Xây Dựng (điều 89 – Điều 106)

Chương 6: Xây Dựng Công Trình (điều 107 – Điều 131)

Chương 7: Chi Phí Đầu Tư Xây Dựng Và Hợp Đồng Xây Dựng (điều 132 – Điều 147)

Chương 8: Điều Kiện Năng Lực Hoạt Động Xây Dựng (điều 148 – Điều 159)

Chương 9: Trách Nhiệm Quản Lý Hoạt Động Đầu Tư Xây Dựng Của Các Cơ Quan Nhà Nước (điều 160 – Điều 165)

Chương 10: Điều Khoản Thi Hành (điều 166 – Điều 167)

* Luật Kiến Trúc (Song Ngữ Anh –việt)

Luật Số 40/2019/qh14 Được Quốc Hội Thông Qua Ngày 13/6/2019

Chương 1: Những Quy Định Chung (điều 1 – Điều 9)

Chương 2: Quản Lý Kiến Trúc (điều 10 – Điều 18)

Chương 3: Hành Nghề Kiến Trúc (điều 19 – Điều 35)

Chương 4: Quản Lý Nhà Nước Về Kiến Trúc (điều 36 – Điều 38)

Chương 5: Điều Khoản Thi Hành (điều 39 – Điều 41)

3. Luật Doanh Nghiệp (Song Ngữ Anh-Việt)

Luật Doanh Nghiệp số 59/2020/QH14 thông qua ngày 17/06/2020, có hiệu lực thi hành từ ngày 01/01/2021. Sách mang đến luật ở dạng song ngữ giúp bạn tiện tra 
cứu luật bằng cả hai ngôn ngữ.', CAST(N'2023-10-23T00:00:00.000' AS DateTime), 0, 7)
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'Ngoại ngữ ')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2, N'Công nghệ thông tin')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3, N'Văn học')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (4, N'Khoa học kỹ thuật')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (5, N'Nông nghiệp')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (6, N'Triết học-Chính trị')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (7, N'Luật')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (8, N'Lịch sử, địa lý')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (9, N'Kinh tế')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (10, N'Sách giáo khoa')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (11, N'Nghệ thuật sống')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [BookID], [Soluong], [Dongia]) VALUES (1, 1, 1, CAST(26000.00 AS Decimal(9, 2)))
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [BookID], [Soluong], [Dongia]) VALUES (1, 3, 2, CAST(11500.00 AS Decimal(9, 2)))
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [BookID], [Soluong], [Dongia]) VALUES (2, 2, 1, CAST(12000.00 AS Decimal(9, 2)))
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [BookID], [Soluong], [Dongia]) VALUES (1002, 2, 2, CAST(12000.00 AS Decimal(9, 2)))
GO
SET IDENTITY_INSERT [dbo].[DONDATHANG] ON 

INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH]) VALUES (1, 0, 1, CAST(N'2023-10-17T14:37:00' AS SmallDateTime), CAST(N'2023-10-19T00:00:00' AS SmallDateTime), 1002)
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH]) VALUES (2, 0, 1, CAST(N'2023-10-17T16:06:00' AS SmallDateTime), CAST(N'2023-10-26T00:00:00' AS SmallDateTime), 1002)
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH]) VALUES (1002, 0, 1, CAST(N'2023-10-31T20:22:00' AS SmallDateTime), CAST(N'2023-11-02T00:00:00' AS SmallDateTime), 1002)
SET IDENTITY_INSERT [dbo].[DONDATHANG] OFF
GO
SET IDENTITY_INSERT [dbo].[KHACHHANG] ON 

INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienThoaiKH], [Ngaysinh]) VALUES (3, N'Thái Gia Hân', N'Giahan', N'123', N'Thaigiahan2120@gmail.com', N'xã Tân Thạnh Tây, Củ Chi, TPHCM', N'0968124579', CAST(N'2003-10-01T00:00:00.000' AS DateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienThoaiKH], [Ngaysinh]) VALUES (1002, N'Nguyễn Thị Kim Quyên', N'kimquyen', N'123', N'2124802010@student.tdmu.edu.vn', N'xã Tân Thạnh Đông, Củ Chi, TPHCM', N'0965326000', CAST(N'2003-12-27T00:00:00.000' AS DateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienThoaiKH], [Ngaysinh]) VALUES (1003, N'Rose', N'Ro', N'123', N'Rose@gmail.com', N'TPHCM', N'0123456', CAST(N'1997-02-11T00:00:00.000' AS DateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienThoaiKH], [Ngaysinh]) VALUES (1004, N'meo', N'meo', N'123', N'asdf', N'afa', N'1234', CAST(N'2023-09-25T00:00:00.000' AS DateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienThoaiKH], [Ngaysinh]) VALUES (1005, N'kimquyen', N'quin', N'123', N'asdf', N'TPHCM', N'0123456', CAST(N'2023-09-25T00:00:00.000' AS DateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienThoaiKH], [Ngaysinh]) VALUES (1006, N'Quyen', N'quinn', N'123', N'quinn', N'tphcm', N'0968124156', CAST(N'2023-10-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[KHACHHANG] OFF
GO
SET IDENTITY_INSERT [dbo].[NhaXuatBan] ON 

INSERT [dbo].[NhaXuatBan] ([NhaXuatBanID], [NhaXuatBanName]) VALUES (1, N'Nhà xuất bản Trẻ')
INSERT [dbo].[NhaXuatBan] ([NhaXuatBanID], [NhaXuatBanName]) VALUES (2, N'NXB Thống kê')
INSERT [dbo].[NhaXuatBan] ([NhaXuatBanID], [NhaXuatBanName]) VALUES (3, N'Kim Đồng')
INSERT [dbo].[NhaXuatBan] ([NhaXuatBanID], [NhaXuatBanName]) VALUES (4, N'Đại học Quốc Gia')
INSERT [dbo].[NhaXuatBan] ([NhaXuatBanID], [NhaXuatBanName]) VALUES (5, N'Văn hóa nghệ thuật')
INSERT [dbo].[NhaXuatBan] ([NhaXuatBanID], [NhaXuatBanName]) VALUES (6, N'Văn hóa')
INSERT [dbo].[NhaXuatBan] ([NhaXuatBanID], [NhaXuatBanName]) VALUES (7, N'Lao động - xã hội')
INSERT [dbo].[NhaXuatBan] ([NhaXuatBanID], [NhaXuatBanName]) VALUES (8, N'Khoa học & Kỹ thuật')
SET IDENTITY_INSERT [dbo].[NhaXuatBan] OFF
GO
ALTER TABLE [dbo].[Book] ADD  CONSTRAINT [DF__Book__Published__3B75D760]  DEFAULT (getdate()) FOR [Published]
GO
ALTER TABLE [dbo].[Book] ADD  CONSTRAINT [DF__Book__ViewCount__3C69FB99]  DEFAULT ((0)) FOR [ViewCount]
GO
ALTER TABLE [dbo].[CHITIETDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETDATHANG_Book] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[CHITIETDATHANG] CHECK CONSTRAINT [FK_CHITIETDATHANG_Book]
GO
ALTER TABLE [dbo].[CHITIETDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETDATHANG_DONDATHANG] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DONDATHANG] ([MaDonHang])
GO
ALTER TABLE [dbo].[CHITIETDATHANG] CHECK CONSTRAINT [FK_CHITIETDATHANG_DONDATHANG]
GO
ALTER TABLE [dbo].[DONDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_DONDATHANG_KHACHHANG] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[DONDATHANG] CHECK CONSTRAINT [FK_DONDATHANG_KHACHHANG]
GO
ALTER TABLE [dbo].[VIETSACH]  WITH CHECK ADD  CONSTRAINT [FK_VIETSACH_Author] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Author] ([AuthorID])
GO
ALTER TABLE [dbo].[VIETSACH] CHECK CONSTRAINT [FK_VIETSACH_Author]
GO
ALTER TABLE [dbo].[VIETSACH]  WITH CHECK ADD  CONSTRAINT [FK_VIETSACH_Book] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[VIETSACH] CHECK CONSTRAINT [FK_VIETSACH_Book]
GO
USE [master]
GO
ALTER DATABASE [SachOnline] SET  READ_WRITE 
GO
