USE [master]
GO
/****** Object:  Database [KutuphaneDB]    Script Date: 21.12.2024 14:39:46 ******/
CREATE DATABASE [KutuphaneDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KutuphaneDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\KutuphaneDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KutuphaneDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\KutuphaneDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [KutuphaneDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KutuphaneDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KutuphaneDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KutuphaneDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KutuphaneDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KutuphaneDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KutuphaneDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [KutuphaneDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KutuphaneDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KutuphaneDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KutuphaneDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KutuphaneDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KutuphaneDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KutuphaneDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KutuphaneDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KutuphaneDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KutuphaneDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [KutuphaneDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KutuphaneDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KutuphaneDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KutuphaneDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KutuphaneDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KutuphaneDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KutuphaneDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KutuphaneDB] SET RECOVERY FULL 
GO
ALTER DATABASE [KutuphaneDB] SET  MULTI_USER 
GO
ALTER DATABASE [KutuphaneDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KutuphaneDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KutuphaneDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KutuphaneDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KutuphaneDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KutuphaneDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'KutuphaneDB', N'ON'
GO
ALTER DATABASE [KutuphaneDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [KutuphaneDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [KutuphaneDB]
GO
/****** Object:  Table [dbo].[uye]    Script Date: 21.12.2024 14:39:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uye](
	[UyeID] [int] IDENTITY(1,1) NOT NULL,
	[TCKimlikNo] [nvarchar](11) NOT NULL,
	[Ad] [nvarchar](50) NOT NULL,
	[Soyad] [nvarchar](50) NOT NULL,
	[CepTel] [nvarchar](15) NOT NULL,
	[Eposta] [nvarchar](100) NULL,
	[Meslek] [varchar](100) NULL,
	[Adres] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[UyeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[uye] ON 

INSERT [dbo].[uye] ([UyeID], [TCKimlikNo], [Ad], [Soyad], [CepTel], [Eposta], [Meslek], [Adres]) VALUES (10, N'10106508523', N'Özlem', N'ALTINAY', N'+905311056844', N'ozlem5@gmail.com', N'Yapay Zeka UZMANI', N'Merkez')
INSERT [dbo].[uye] ([UyeID], [TCKimlikNo], [Ad], [Soyad], [CepTel], [Eposta], [Meslek], [Adres]) VALUES (13, N'25042804547', N'Sude', N'Şengül', N'+905224561212', N'sude@gmail.com', N'Animasyon Tasarımcısı', N'Burdur')
SET IDENTITY_INSERT [dbo].[uye] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__uye__7E1935EDB67416F3]    Script Date: 21.12.2024 14:39:46 ******/
ALTER TABLE [dbo].[uye] ADD UNIQUE NONCLUSTERED 
(
	[TCKimlikNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[uye]  WITH CHECK ADD  CONSTRAINT [chk_CepTel] CHECK  (([CepTel] like '+90%' AND len([CepTel])=(13) AND isnumeric(substring([CepTel],(4),len([CepTel])))=(1)))
GO
ALTER TABLE [dbo].[uye] CHECK CONSTRAINT [chk_CepTel]
GO
ALTER TABLE [dbo].[uye]  WITH CHECK ADD  CONSTRAINT [chk_TCKimlikNo] CHECK  ((len([TCKimlikNo])=(11) AND isnumeric([TcKimlikNo])=(1)))
GO
ALTER TABLE [dbo].[uye] CHECK CONSTRAINT [chk_TCKimlikNo]
GO
USE [master]
GO
ALTER DATABASE [KutuphaneDB] SET  READ_WRITE 
GO
