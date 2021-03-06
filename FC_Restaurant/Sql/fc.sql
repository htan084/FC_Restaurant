USE [master]
GO
/****** Object:  Database [FT Restaurant]    Script Date: 21/07/2017 3:21:39 PM ******/
CREATE DATABASE [FT Restaurant]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FT Restaurant', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\FT Restaurant.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FT Restaurant_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\FT Restaurant_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FT Restaurant] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FT Restaurant].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FT Restaurant] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FT Restaurant] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FT Restaurant] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FT Restaurant] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FT Restaurant] SET ARITHABORT OFF 
GO
ALTER DATABASE [FT Restaurant] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FT Restaurant] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FT Restaurant] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FT Restaurant] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FT Restaurant] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FT Restaurant] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FT Restaurant] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FT Restaurant] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FT Restaurant] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FT Restaurant] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FT Restaurant] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FT Restaurant] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FT Restaurant] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FT Restaurant] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FT Restaurant] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FT Restaurant] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FT Restaurant] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FT Restaurant] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FT Restaurant] SET  MULTI_USER 
GO
ALTER DATABASE [FT Restaurant] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FT Restaurant] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FT Restaurant] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FT Restaurant] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FT Restaurant] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FT Restaurant] SET QUERY_STORE = OFF
GO
USE [FT Restaurant]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [FT Restaurant]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 21/07/2017 3:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] NOT NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customer_1] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DishType]    Script Date: 21/07/2017 3:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DishType](
	[DishCatagoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DishType] PRIMARY KEY CLUSTERED 
(
	[DishCatagoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 21/07/2017 3:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[StaffId] [int] NOT NULL,
	[EmployeeTypeId] [int] NOT NULL,
	[Salary] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeType]    Script Date: 21/07/2017 3:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeType](
	[EmployeeTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](10) NOT NULL,
 CONSTRAINT [PK_PersonType] PRIMARY KEY CLUSTERED 
(
	[EmployeeTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 21/07/2017 3:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[MaterialId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[CatagoryId] [int] NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[MaterialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialCatagory]    Script Date: 21/07/2017 3:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialCatagory](
	[CatagoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_MaterialCatagory] PRIMARY KEY CLUSTERED 
(
	[CatagoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialOrder]    Script Date: 21/07/2017 3:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialOrder](
	[MaterialOrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[MaterialId] [int] NULL,
	[SupplierId] [int] NULL,
 CONSTRAINT [PK_MaterialOrder] PRIMARY KEY CLUSTERED 
(
	[MaterialOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialOrderDetail]    Script Date: 21/07/2017 3:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialOrderDetail](
	[MaterialOrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[MaterialId] [int] NOT NULL,
	[MaterialQuantity] [int] NOT NULL,
	[MaterialOrderId] [int] NOT NULL,
 CONSTRAINT [PK_MaterialOrderDetail] PRIMARY KEY CLUSTERED 
(
	[MaterialOrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 21/07/2017 3:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[DishId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[DishCatagoryId] [int] NOT NULL,
	[Descripition] [nvarchar](max) NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[DishId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 21/07/2017 3:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[StaffId] [int] NOT NULL,
	[OrderNumber] [int] NOT NULL,
	[CustomerId] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderMenuDetial]    Script Date: 21/07/2017 3:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderMenuDetial](
	[OrderMenuDetialId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[DishId] [int] NOT NULL,
	[Description] [nvarchar](50) NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderMenuDetial] PRIMARY KEY CLUSTERED 
(
	[OrderMenuDetialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 21/07/2017 3:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonId] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nchar](10) NULL,
	[Address] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 21/07/2017 3:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierPerson]    Script Date: 21/07/2017 3:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierPerson](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[SupplierId] [int] NOT NULL,
 CONSTRAINT [PK_SupplierPerson] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table]    Script Date: 21/07/2017 3:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table](
	[TableId] [int] IDENTITY(1,1) NOT NULL,
	[TableNumber] [int] NOT NULL,
	[TableSize] [int] NOT NULL,
	[BookTime] [datetime] NULL,
	[TableAvaibility] [bit] NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Table] PRIMARY KEY CLUSTERED 
(
	[TableId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TableOrder]    Script Date: 21/07/2017 3:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableOrder](
	[TableOrderId] [int] IDENTITY(1,1) NOT NULL,
	[TableId] [int] NOT NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[OrderId] [int] NOT NULL,
 CONSTRAINT [PK_TableOrder] PRIMARY KEY CLUSTERED 
(
	[TableOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Person] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Person]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Person] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Person]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_PersonType] FOREIGN KEY([EmployeeTypeId])
REFERENCES [dbo].[EmployeeType] ([EmployeeTypeId])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_PersonType]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_MaterialCatagory] FOREIGN KEY([CatagoryId])
REFERENCES [dbo].[MaterialCatagory] ([CatagoryId])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_MaterialCatagory]
GO
ALTER TABLE [dbo].[MaterialOrder]  WITH CHECK ADD  CONSTRAINT [FK_MaterialOrder_Supplier] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Supplier] ([SupplierId])
GO
ALTER TABLE [dbo].[MaterialOrder] CHECK CONSTRAINT [FK_MaterialOrder_Supplier]
GO
ALTER TABLE [dbo].[MaterialOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_MaterialOrderDetail_Material] FOREIGN KEY([MaterialId])
REFERENCES [dbo].[Material] ([MaterialId])
GO
ALTER TABLE [dbo].[MaterialOrderDetail] CHECK CONSTRAINT [FK_MaterialOrderDetail_Material]
GO
ALTER TABLE [dbo].[MaterialOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_MaterialOrderDetail_MaterialOrder] FOREIGN KEY([MaterialOrderId])
REFERENCES [dbo].[MaterialOrder] ([MaterialOrderId])
GO
ALTER TABLE [dbo].[MaterialOrderDetail] CHECK CONSTRAINT [FK_MaterialOrderDetail_MaterialOrder]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_DishType] FOREIGN KEY([DishCatagoryId])
REFERENCES [dbo].[DishType] ([DishCatagoryId])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_DishType]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Employee] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Employee] ([StaffId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Employee]
GO
ALTER TABLE [dbo].[OrderMenuDetial]  WITH CHECK ADD  CONSTRAINT [FK_OrderMenuDetial_Menu] FOREIGN KEY([DishId])
REFERENCES [dbo].[Menu] ([DishId])
GO
ALTER TABLE [dbo].[OrderMenuDetial] CHECK CONSTRAINT [FK_OrderMenuDetial_Menu]
GO
ALTER TABLE [dbo].[OrderMenuDetial]  WITH CHECK ADD  CONSTRAINT [FK_OrderMenuDetial_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderMenuDetial] CHECK CONSTRAINT [FK_OrderMenuDetial_Order]
GO
ALTER TABLE [dbo].[SupplierPerson]  WITH CHECK ADD  CONSTRAINT [FK_SupplierPerson_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[SupplierPerson] CHECK CONSTRAINT [FK_SupplierPerson_Person]
GO
ALTER TABLE [dbo].[SupplierPerson]  WITH CHECK ADD  CONSTRAINT [FK_SupplierPerson_Supplier] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Supplier] ([SupplierId])
GO
ALTER TABLE [dbo].[SupplierPerson] CHECK CONSTRAINT [FK_SupplierPerson_Supplier]
GO
ALTER TABLE [dbo].[TableOrder]  WITH CHECK ADD  CONSTRAINT [FK_TableOrder_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[TableOrder] CHECK CONSTRAINT [FK_TableOrder_Order]
GO
ALTER TABLE [dbo].[TableOrder]  WITH CHECK ADD  CONSTRAINT [FK_TableOrder_Table] FOREIGN KEY([TableId])
REFERENCES [dbo].[Table] ([TableId])
GO
ALTER TABLE [dbo].[TableOrder] CHECK CONSTRAINT [FK_TableOrder_Table]
GO
USE [master]
GO
ALTER DATABASE [FT Restaurant] SET  READ_WRITE 
GO
