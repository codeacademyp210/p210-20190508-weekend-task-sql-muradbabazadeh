USE [master]
GO
/****** Object:  Database [product order]    Script Date: 5/12/2019 8:52:43 PM ******/
CREATE DATABASE [product order]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'product order', FILENAME = N'C:\Users\Ekber\Desktop\MSSQL14.MSSQLSERVER\MSSQL\DATA\product order.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'product order_log', FILENAME = N'C:\Users\Ekber\Desktop\MSSQL14.MSSQLSERVER\MSSQL\DATA\product order_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [product order] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [product order].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [product order] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [product order] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [product order] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [product order] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [product order] SET ARITHABORT OFF 
GO
ALTER DATABASE [product order] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [product order] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [product order] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [product order] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [product order] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [product order] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [product order] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [product order] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [product order] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [product order] SET  DISABLE_BROKER 
GO
ALTER DATABASE [product order] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [product order] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [product order] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [product order] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [product order] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [product order] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [product order] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [product order] SET RECOVERY FULL 
GO
ALTER DATABASE [product order] SET  MULTI_USER 
GO
ALTER DATABASE [product order] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [product order] SET DB_CHAINING OFF 
GO
ALTER DATABASE [product order] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [product order] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [product order] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'product order', N'ON'
GO
ALTER DATABASE [product order] SET QUERY_STORE = OFF
GO
USE [product order]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 5/12/2019 8:52:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NULL,
	[CategoryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 5/12/2019 8:52:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oreders]    Script Date: 5/12/2019 8:52:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oreders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[User ID] [int] NULL,
	[Product ID] [int] NULL,
	[product Count] [int] NOT NULL,
	[Oreder Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/12/2019 8:52:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[Price] [int] NULL,
	[Category_ID] [int] NULL,
	[Brand_ID] [int] NULL,
	[Color] [varchar](100) NULL,
	[Barcode] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 5/12/2019 8:52:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[Count] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/12/2019 8:52:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[Surname] [varchar](250) NOT NULL,
	[Username] [varchar](250) NOT NULL,
	[Email] [varchar](250) NULL,
	[Password] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([ID], [Name], [CategoryID]) VALUES (1, N'Nutella', 5)
INSERT [dbo].[Brands] ([ID], [Name], [CategoryID]) VALUES (2, N'Snickers', 6)
INSERT [dbo].[Brands] ([ID], [Name], [CategoryID]) VALUES (3, N'Doymak', 8)
INSERT [dbo].[Brands] ([ID], [Name], [CategoryID]) VALUES (4, N'Bismak', 3)
INSERT [dbo].[Brands] ([ID], [Name], [CategoryID]) VALUES (5, N'Xirdalan', 4)
INSERT [dbo].[Brands] ([ID], [Name], [CategoryID]) VALUES (6, N'Plombir', 1)
INSERT [dbo].[Brands] ([ID], [Name], [CategoryID]) VALUES (7, N'Beta', 9)
INSERT [dbo].[Brands] ([ID], [Name], [CategoryID]) VALUES (8, N'Kit-Kat', 1)
SET IDENTITY_INSERT [dbo].[Brands] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([ID], [Name]) VALUES (1, N'spirtsiz ickiler')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (2, N'dondurmalar')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (3, N'siriniyyat')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (4, N'spirtli ickiler')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (5, N'meyve-terevez')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (6, N'sud mehsullari')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (7, N'et mehsullari')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (8, N'un memulatlari')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (9, N'cay')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Oreders] ON 

INSERT [dbo].[Oreders] ([ID], [User ID], [Product ID], [product Count], [Oreder Date]) VALUES (2, 1, 3, 2, CAST(N'2019-05-11' AS Date))
INSERT [dbo].[Oreders] ([ID], [User ID], [Product ID], [product Count], [Oreder Date]) VALUES (3, 2, 4, 3, CAST(N'2019-05-08' AS Date))
INSERT [dbo].[Oreders] ([ID], [User ID], [Product ID], [product Count], [Oreder Date]) VALUES (4, 1, 5, 22, CAST(N'2018-10-24' AS Date))
INSERT [dbo].[Oreders] ([ID], [User ID], [Product ID], [product Count], [Oreder Date]) VALUES (5, 3, 2, 6, CAST(N'2019-01-23' AS Date))
INSERT [dbo].[Oreders] ([ID], [User ID], [Product ID], [product Count], [Oreder Date]) VALUES (6, 4, 1, 41, CAST(N'2019-02-13' AS Date))
INSERT [dbo].[Oreders] ([ID], [User ID], [Product ID], [product Count], [Oreder Date]) VALUES (7, 4, 2, 1, CAST(N'2019-05-13' AS Date))
SET IDENTITY_INSERT [dbo].[Oreders] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ID], [Name], [Price], [Category_ID], [Brand_ID], [Color], [Barcode]) VALUES (1, N'chay', 3, 9, 7, N'black', 22345)
INSERT [dbo].[Products] ([ID], [Name], [Price], [Category_ID], [Brand_ID], [Color], [Barcode]) VALUES (2, N'Sheker', 2, 3, NULL, N'white', 3435)
INSERT [dbo].[Products] ([ID], [Name], [Price], [Category_ID], [Brand_ID], [Color], [Barcode]) VALUES (3, N'IceTea', 1, 1, 8, N'orenge', 3452)
INSERT [dbo].[Products] ([ID], [Name], [Price], [Category_ID], [Brand_ID], [Color], [Barcode]) VALUES (4, N'Snickers', 5, 3, 3, N'black', 435576473)
INSERT [dbo].[Products] ([ID], [Name], [Price], [Category_ID], [Brand_ID], [Color], [Barcode]) VALUES (5, N'Dondurma', 1, 2, 3, N'white', 1133)
INSERT [dbo].[Products] ([ID], [Name], [Price], [Category_ID], [Brand_ID], [Color], [Barcode]) VALUES (6, N'Chorek', 1, 8, 8, N'black', 99004466)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Stock] ON 

INSERT [dbo].[Stock] ([ID], [ProductID], [Count]) VALUES (1, 1, 1)
INSERT [dbo].[Stock] ([ID], [ProductID], [Count]) VALUES (2, 4, 3)
INSERT [dbo].[Stock] ([ID], [ProductID], [Count]) VALUES (3, 5, 5)
INSERT [dbo].[Stock] ([ID], [ProductID], [Count]) VALUES (4, 3, 6)
INSERT [dbo].[Stock] ([ID], [ProductID], [Count]) VALUES (5, 2, 3)
INSERT [dbo].[Stock] ([ID], [ProductID], [Count]) VALUES (6, 4, 2)
INSERT [dbo].[Stock] ([ID], [ProductID], [Count]) VALUES (7, 5, 5)
INSERT [dbo].[Stock] ([ID], [ProductID], [Count]) VALUES (8, 6, 6)
INSERT [dbo].[Stock] ([ID], [ProductID], [Count]) VALUES (9, 5, 2)
SET IDENTITY_INSERT [dbo].[Stock] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [Name], [Surname], [Username], [Email], [Password]) VALUES (1, N'Ekber', N'Amanov', N'Ekber.A', N'eko.amanov@gmail.com', 11111)
INSERT [dbo].[Users] ([ID], [Name], [Surname], [Username], [Email], [Password]) VALUES (2, N'Togrul', N'Rzayev', N'Togrul.R', N'togrul.@gmail.com', 2345)
INSERT [dbo].[Users] ([ID], [Name], [Surname], [Username], [Email], [Password]) VALUES (3, N'Murad ', N'Babazade', N'MuradZB', N'murad@gmail.com', 234234)
INSERT [dbo].[Users] ([ID], [Name], [Surname], [Username], [Email], [Password]) VALUES (4, N'Hesen', N'Eliyev', N'hasanALi', N'hasan@gmail.com', 2320343)
INSERT [dbo].[Users] ([ID], [Name], [Surname], [Username], [Email], [Password]) VALUES (5, N'', N'', N'', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Brands]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Brands]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Brands]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Brands]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Brands]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Brands]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Oreders]  WITH CHECK ADD FOREIGN KEY([Product ID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[Oreders]  WITH CHECK ADD FOREIGN KEY([Product ID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[Oreders]  WITH CHECK ADD FOREIGN KEY([Product ID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[Oreders]  WITH CHECK ADD FOREIGN KEY([Product ID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[Oreders]  WITH CHECK ADD FOREIGN KEY([Product ID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[Oreders]  WITH CHECK ADD FOREIGN KEY([Product ID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[Oreders]  WITH CHECK ADD FOREIGN KEY([Product ID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[Oreders]  WITH CHECK ADD FOREIGN KEY([User ID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Oreders]  WITH CHECK ADD FOREIGN KEY([User ID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Oreders]  WITH CHECK ADD FOREIGN KEY([User ID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Oreders]  WITH CHECK ADD FOREIGN KEY([User ID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Oreders]  WITH CHECK ADD FOREIGN KEY([User ID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Oreders]  WITH CHECK ADD FOREIGN KEY([User ID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Oreders]  WITH CHECK ADD FOREIGN KEY([User ID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([Brand_ID])
REFERENCES [dbo].[Brands] ([ID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([Brand_ID])
REFERENCES [dbo].[Brands] ([ID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([Brand_ID])
REFERENCES [dbo].[Brands] ([ID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([Brand_ID])
REFERENCES [dbo].[Brands] ([ID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([Brand_ID])
REFERENCES [dbo].[Brands] ([ID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([Brand_ID])
REFERENCES [dbo].[Brands] ([ID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([Category_ID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([Category_ID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([Category_ID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([Category_ID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([Category_ID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([Category_ID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
USE [master]
GO
ALTER DATABASE [product order] SET  READ_WRITE 
GO
