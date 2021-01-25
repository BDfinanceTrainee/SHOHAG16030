USE [master]
GO
/****** Object:  Database [LetterManagementDB]    Script Date: 24-Jan-21 10:38:54 AM ******/
CREATE DATABASE [LetterManagementDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LetterManagementDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SOHAG16030\MSSQL\DATA\LetterManagementDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LetterManagementDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SOHAG16030\MSSQL\DATA\LetterManagementDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LetterManagementDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LetterManagementDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LetterManagementDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LetterManagementDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LetterManagementDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LetterManagementDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LetterManagementDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [LetterManagementDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LetterManagementDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LetterManagementDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LetterManagementDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LetterManagementDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LetterManagementDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LetterManagementDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LetterManagementDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LetterManagementDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LetterManagementDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LetterManagementDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LetterManagementDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LetterManagementDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LetterManagementDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LetterManagementDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LetterManagementDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LetterManagementDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LetterManagementDB] SET RECOVERY FULL 
GO
ALTER DATABASE [LetterManagementDB] SET  MULTI_USER 
GO
ALTER DATABASE [LetterManagementDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LetterManagementDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LetterManagementDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LetterManagementDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [LetterManagementDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'LetterManagementDB', N'ON'
GO
USE [LetterManagementDB]
GO
/****** Object:  Table [dbo].[Assignment]    Script Date: 24-Jan-21 10:38:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assignment](
	[AssignmentId] [int] NOT NULL,
	[LetterId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[FeedBack] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Branch]    Script Date: 24-Jan-21 10:38:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[BranchId] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 24-Jan-21 10:38:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentId] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Designation]    Script Date: 24-Jan-21 10:38:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Designation](
	[DesignationId] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Designation] PRIMARY KEY CLUSTERED 
(
	[DesignationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 24-Jan-21 10:38:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeId] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[BranchId] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Letter]    Script Date: 24-Jan-21 10:38:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Letter](
	[LetterId] [int] NOT NULL,
	[ReferenceNo] [nvarchar](50) NOT NULL,
	[SenderId] [int] NOT NULL,
	[BranchId] [int] NOT NULL,
	[LetterDate] [datetime] NOT NULL,
	[ReceiveDate] [datetime] NOT NULL,
	[Subject] [nvarchar](50) NOT NULL,
	[RecipientId] [int] NOT NULL,
	[SacnnedImage] [bit] NOT NULL,
	[LetterType] [nvarchar](max) NOT NULL,
	[LetterStatusId] [int] NOT NULL,
 CONSTRAINT [PK_Letter] PRIMARY KEY CLUSTERED 
(
	[LetterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LetterStatus]    Script Date: 24-Jan-21 10:38:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LetterStatus](
	[LetterStatusId] [int] NOT NULL,
	[LetterStatus] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_LetterStatus] PRIMARY KEY CLUSTERED 
(
	[LetterStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Recipient]    Script Date: 24-Jan-21 10:38:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recipient](
	[RecipientId] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Recipient] PRIMARY KEY CLUSTERED 
(
	[RecipientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sender]    Script Date: 24-Jan-21 10:38:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sender](
	[SenderId] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SenderType]    Script Date: 24-Jan-21 10:38:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SenderType](
	[SederTypeId] [int] NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SenderType] PRIMARY KEY CLUSTERED 
(
	[SederTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 24-Jan-21 10:38:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [LetterManagementDB] SET  READ_WRITE 
GO
