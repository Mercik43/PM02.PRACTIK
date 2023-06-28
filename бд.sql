USE [master]
GO
/****** Object:  Database [MagazinOdejda]    Script Date: 27.06.2023 13:20:13 ******/
CREATE DATABASE [MagazinOdejda]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MagazinOdejda', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\MagazinOdejda.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MagazinOdejda_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\MagazinOdejda_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MagazinOdejda] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MagazinOdejda].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MagazinOdejda] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MagazinOdejda] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MagazinOdejda] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MagazinOdejda] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MagazinOdejda] SET ARITHABORT OFF 
GO
ALTER DATABASE [MagazinOdejda] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MagazinOdejda] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MagazinOdejda] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MagazinOdejda] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MagazinOdejda] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MagazinOdejda] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MagazinOdejda] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MagazinOdejda] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MagazinOdejda] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MagazinOdejda] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MagazinOdejda] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MagazinOdejda] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MagazinOdejda] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MagazinOdejda] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MagazinOdejda] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MagazinOdejda] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MagazinOdejda] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MagazinOdejda] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MagazinOdejda] SET  MULTI_USER 
GO
ALTER DATABASE [MagazinOdejda] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MagazinOdejda] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MagazinOdejda] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MagazinOdejda] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MagazinOdejda] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MagazinOdejda] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MagazinOdejda] SET QUERY_STORE = OFF
GO
USE [MagazinOdejda]
GO
/****** Object:  User [Merc]    Script Date: 27.06.2023 13:20:13 ******/
CREATE USER [Merc] FOR LOGIN [Merc] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Должности]    Script Date: 27.06.2023 13:20:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Должности](
	[Id_Должности] [int] IDENTITY(1,1) NOT NULL,
	[Наименовние] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Должности] PRIMARY KEY CLUSTERED 
(
	[Id_Должности] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудники]    Script Date: 27.06.2023 13:20:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудники](
	[ID_Сотрудника] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Фамилия] [nvarchar](50) NOT NULL,
	[Имя] [nvarchar](50) NOT NULL,
	[Отчество] [nvarchar](50) NOT NULL,
	[Должность] [int] NOT NULL,
 CONSTRAINT [PK_Сотрудники] PRIMARY KEY CLUSTERED 
(
	[ID_Сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Товар]    Script Date: 27.06.2023 13:20:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Товар](
	[Id_Товра] [int] IDENTITY(1,1) NOT NULL,
	[Описание] [nvarchar](max) NOT NULL,
	[Наименование] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Товар] PRIMARY KEY CLUSTERED 
(
	[Id_Товра] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Цена товара]    Script Date: 27.06.2023 13:20:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Цена товара](
	[Id_Изменения] [int] IDENTITY(1,1) NOT NULL,
	[Id_Товара] [int] NOT NULL,
	[Дата] [date] NOT NULL,
	[Цена] [money] NOT NULL,
 CONSTRAINT [PK_Цена товара] PRIMARY KEY CLUSTERED 
(
	[Id_Изменения] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Должности] ON 

INSERT [dbo].[Должности] ([Id_Должности], [Наименовние]) VALUES (1, N'Сотрудник')
INSERT [dbo].[Должности] ([Id_Должности], [Наименовние]) VALUES (2, N'Администратор')
SET IDENTITY_INSERT [dbo].[Должности] OFF
GO
SET IDENTITY_INSERT [dbo].[Сотрудники] ON 

INSERT [dbo].[Сотрудники] ([ID_Сотрудника], [Login], [Password], [Фамилия], [Имя], [Отчество], [Должность]) VALUES (1, N'Merc123', N'Merc123', N'Катаргин', N'Никита', N'Андреевич', 1)
INSERT [dbo].[Сотрудники] ([ID_Сотрудника], [Login], [Password], [Фамилия], [Имя], [Отчество], [Должность]) VALUES (2, N'MR66', N'MR66', N'Кашин', N'Тимофей', N'Иванович', 2)
SET IDENTITY_INSERT [dbo].[Сотрудники] OFF
GO
SET IDENTITY_INSERT [dbo].[Товар] ON 

INSERT [dbo].[Товар] ([Id_Товра], [Описание], [Наименование]) VALUES (1, N'Влажные Салфетки', N'Салфетки')
INSERT [dbo].[Товар] ([Id_Товра], [Описание], [Наименование]) VALUES (2, N'Лекарство для Носа', N'Снуп')
INSERT [dbo].[Товар] ([Id_Товра], [Описание], [Наименование]) VALUES (3, N'Чёные Носки 42', N'Носки')
INSERT [dbo].[Товар] ([Id_Товра], [Описание], [Наименование]) VALUES (4, N'Вешалка', N'Вешалка')
SET IDENTITY_INSERT [dbo].[Товар] OFF
GO
SET IDENTITY_INSERT [dbo].[Цена товара] ON 

INSERT [dbo].[Цена товара] ([Id_Изменения], [Id_Товара], [Дата], [Цена]) VALUES (1, 1, CAST(N'2023-06-26' AS Date), 500.0000)
INSERT [dbo].[Цена товара] ([Id_Изменения], [Id_Товара], [Дата], [Цена]) VALUES (2, 2, CAST(N'2023-06-26' AS Date), 8000.0000)
INSERT [dbo].[Цена товара] ([Id_Изменения], [Id_Товара], [Дата], [Цена]) VALUES (3, 3, CAST(N'2023-06-26' AS Date), 90000.0000)
INSERT [dbo].[Цена товара] ([Id_Изменения], [Id_Товара], [Дата], [Цена]) VALUES (4, 4, CAST(N'2023-05-26' AS Date), 1.0000)
INSERT [dbo].[Цена товара] ([Id_Изменения], [Id_Товара], [Дата], [Цена]) VALUES (1008, 4, CAST(N'2023-06-27' AS Date), 3223.0000)
INSERT [dbo].[Цена товара] ([Id_Изменения], [Id_Товара], [Дата], [Цена]) VALUES (1009, 2, CAST(N'2023-06-27' AS Date), 213.0000)
SET IDENTITY_INSERT [dbo].[Цена товара] OFF
GO
ALTER TABLE [dbo].[Сотрудники]  WITH CHECK ADD  CONSTRAINT [FK_Сотрудники_Должности] FOREIGN KEY([Должность])
REFERENCES [dbo].[Должности] ([Id_Должности])
GO
ALTER TABLE [dbo].[Сотрудники] CHECK CONSTRAINT [FK_Сотрудники_Должности]
GO
ALTER TABLE [dbo].[Цена товара]  WITH CHECK ADD  CONSTRAINT [FK_Цена товара_Товар] FOREIGN KEY([Id_Товара])
REFERENCES [dbo].[Товар] ([Id_Товра])
GO
ALTER TABLE [dbo].[Цена товара] CHECK CONSTRAINT [FK_Цена товара_Товар]
GO
USE [master]
GO
ALTER DATABASE [MagazinOdejda] SET  READ_WRITE 
GO
