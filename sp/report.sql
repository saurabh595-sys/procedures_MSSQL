USE [master]
GO
/****** Object:  Database [ReportGenration]    Script Date: 23-04-2022 5.08.31 PM ******/
CREATE DATABASE [ReportGenration]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ReportGenration', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ReportGenration.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ReportGenration_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ReportGenration_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ReportGenration] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ReportGenration].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ReportGenration] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ReportGenration] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ReportGenration] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ReportGenration] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ReportGenration] SET ARITHABORT OFF 
GO
ALTER DATABASE [ReportGenration] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ReportGenration] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ReportGenration] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ReportGenration] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ReportGenration] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ReportGenration] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ReportGenration] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ReportGenration] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ReportGenration] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ReportGenration] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ReportGenration] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ReportGenration] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ReportGenration] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ReportGenration] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ReportGenration] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ReportGenration] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ReportGenration] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ReportGenration] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ReportGenration] SET  MULTI_USER 
GO
ALTER DATABASE [ReportGenration] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ReportGenration] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ReportGenration] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ReportGenration] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ReportGenration] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ReportGenration] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ReportGenration] SET QUERY_STORE = OFF
GO
USE [ReportGenration]
GO
/****** Object:  Table [dbo].[category]    Script Date: 23-04-2022 5.08.32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[categoryId] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [varchar](30) NULL,
	[createdby] [varchar](30) NULL,
 CONSTRAINT [PK__category__23CAF1D8615D998C] PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 23-04-2022 5.08.32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productId] [int] IDENTITY(1,1) NOT NULL,
	[productName] [varchar](30) NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK__Product__2D10D16A6F0B140F] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([categoryId], [categoryName], [createdby]) VALUES (1, N'car', N'Saurabh')
INSERT [dbo].[category] ([categoryId], [categoryName], [createdby]) VALUES (2, N'bike', N'test')
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([productId], [productName], [CategoryId]) VALUES (1, N'demobike', 2)
INSERT [dbo].[Product] ([productId], [productName], [CategoryId]) VALUES (2, N'demobike', 2)
INSERT [dbo].[Product] ([productId], [productName], [CategoryId]) VALUES (3, N'demobike1', 2)
INSERT [dbo].[Product] ([productId], [productName], [CategoryId]) VALUES (4, N'demobike2', 2)
INSERT [dbo].[Product] ([productId], [productName], [CategoryId]) VALUES (5, N'demobike3', 2)
INSERT [dbo].[Product] ([productId], [productName], [CategoryId]) VALUES (6, N'demobike5', 2)
INSERT [dbo].[Product] ([productId], [productName], [CategoryId]) VALUES (7, N'democar', 1)
INSERT [dbo].[Product] ([productId], [productName], [CategoryId]) VALUES (8, N'democar1', 2)
INSERT [dbo].[Product] ([productId], [productName], [CategoryId]) VALUES (12, N'democar1', 1)
INSERT [dbo].[Product] ([productId], [productName], [CategoryId]) VALUES (13, N'democar2', 1)
INSERT [dbo].[Product] ([productId], [productName], [CategoryId]) VALUES (14, N'democar3', 1)
INSERT [dbo].[Product] ([productId], [productName], [CategoryId]) VALUES (15, N'democar5', 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__Categor__267ABA7A] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[category] ([categoryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__Categor__267ABA7A]
GO
/****** Object:  StoredProcedure [dbo].[Report]    Script Date: 23-04-2022 5.08.32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Report]
AS
Begin
select productName, categoryName,createdby
from Product
inner join category on category.categoryId=Product.categoryId
End;
GO
USE [master]
GO
ALTER DATABASE [ReportGenration] SET  READ_WRITE 
GO
