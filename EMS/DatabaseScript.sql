USE [master]
GO
/****** Object:  Database [db_test]    Script Date: 16-Jan-21 9:46:06 PM ******/
CREATE DATABASE [db_test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_test', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SOHAG16030\MSSQL\DATA\db_test.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'db_test_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SOHAG16030\MSSQL\DATA\db_test_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [db_test] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_test] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_test] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_test] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_test] SET RECOVERY FULL 
GO
ALTER DATABASE [db_test] SET  MULTI_USER 
GO
ALTER DATABASE [db_test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_test] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [db_test] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'db_test', N'ON'
GO
USE [db_test]
GO
/****** Object:  Table [dbo].[Employee Info]    Script Date: 16-Jan-21 9:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee Info](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [nvarchar](50) NULL,
	[BranchName] [nvarchar](50) NULL,
	[DepartmentName] [nvarchar](50) NULL,
	[EmployeeType] [nvarchar](50) NULL,
	[SupervisorName] [nvarchar](50) NULL,
	[SupervisorDesignation] [nvarchar](50) NULL,
 CONSTRAINT [PK_Employee Info] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VisitDetails]    Script Date: 16-Jan-21 9:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VisitDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateOfVisit] [datetime] NULL,
	[NextVistDate] [datetime] NULL,
	[VisitType] [nvarchar](50) NULL,
	[Lead_Conversion] [nvarchar](50) NULL,
	[DuscussedProduct] [nvarchar](50) NULL,
	[DepositeAmount] [nvarchar](50) NULL,
	[Comments] [nvarchar](50) NULL,
	[TypeOfClient] [nvarchar](50) NULL,
	[BusinessType] [nvarchar](50) NULL,
	[ClientsName] [nvarchar](50) NULL,
	[ClientsOrganization] [nvarchar](50) NULL,
	[ConcernedPerson] [nvarchar](50) NULL,
	[ClientsDesignation] [nvarchar](50) NULL,
	[TelephoneNo] [nvarchar](50) NULL,
	[MobileNo] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
 CONSTRAINT [PK_VisitDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [db_test] SET  READ_WRITE 
GO
