USE [master]
GO
/****** Object:  Database [LetterManagementDB]    Script Date: 23-Feb-21 11:51:02 AM ******/
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
/****** Object:  Table [dbo].[Designation]    Script Date: 23-Feb-21 11:51:02 AM ******/
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
/****** Object:  Table [dbo].[Employee]    Script Date: 23-Feb-21 11:51:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[DepartmentId] [nvarchar](max) NOT NULL,
	[BranchId] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 23-Feb-21 11:51:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LetterId] [int] NOT NULL,
	[Date] [datetime] NULL,
	[StatusOfLetter] [nvarchar](max) NULL,
	[Responsible] [nvarchar](max) NULL,
	[Assign] [nvarchar](max) NULL,
	[Comment] [nvarchar](max) NULL,
	[DesignationId] [int] NULL,
	[LetterStatusId] [int] NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Letter]    Script Date: 23-Feb-21 11:51:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Letter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Sender] [nvarchar](max) NULL,
	[Responsible] [nvarchar](max) NULL,
	[Subject] [nvarchar](max) NULL,
	[ReferenceNo] [nvarchar](max) NULL,
	[LetterDate] [datetime] NULL,
	[ReceiveDate] [datetime] NULL,
	[Type] [nvarchar](max) NULL,
	[StatusOfLetter] [nvarchar](max) NULL,
	[ScannedImage] [nvarchar](max) NULL,
	[DesignationId] [int] NULL,
	[LetterStatusId] [int] NULL,
	[LetterTypeId] [int] NULL,
	[LetterFromId] [int] NULL,
 CONSTRAINT [PK_Letter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LetterFrom]    Script Date: 23-Feb-21 11:51:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LetterFrom](
	[LetterFromId] [int] IDENTITY(1,1) NOT NULL,
	[LetterSender] [nvarchar](50) NULL,
 CONSTRAINT [PK_LetterFrom] PRIMARY KEY CLUSTERED 
(
	[LetterFromId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LetterStatus]    Script Date: 23-Feb-21 11:51:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LetterStatus](
	[LetterStatusId] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_LetterStatus] PRIMARY KEY CLUSTERED 
(
	[LetterStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LetterType]    Script Date: 23-Feb-21 11:51:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LetterType](
	[LetterTypeId] [int] IDENTITY(1,1) NOT NULL,
	[TypeOfLetter] [nvarchar](50) NULL,
 CONSTRAINT [PK_LetterType] PRIMARY KEY CLUSTERED 
(
	[LetterTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SenderType]    Script Date: 23-Feb-21 11:51:02 AM ******/
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
/****** Object:  Table [dbo].[tb_Role]    Script Date: 23-Feb-21 11:51:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[tb_Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](100) NULL,
 CONSTRAINT [PK_tb_Role_1] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_User]    Script Date: 23-Feb-21 11:51:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](200) NULL,
	[OfficialName] [varchar](300) NULL,
	[UserPassword] [varchar](200) NULL,
	[UserMobile] [varchar](20) NULL,
	[UserEmail] [varchar](200) NULL,
	[BranchCode] [varchar](5) NULL,
	[EmployeeId] [varchar](20) NULL,
	[IsActive] [bit] NULL,
	[SecurityCode] [varchar](max) NULL,
	[DepartmentId] [int] NULL,
	[DepartmentName] [varchar](200) NULL,
	[Designation] [varchar](200) NULL,
	[Signature] [varchar](max) NULL,
	[EmployeeType] [int] NULL,
 CONSTRAINT [PK_tb_User_1] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_UserRole]    Script Date: 23-Feb-21 11:51:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_UserRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[RoleId] [int] NULL,
 CONSTRAINT [PK_tb_UserRole_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Designation] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[Designation] ([DesignationId])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Designation]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_LetterStatus] FOREIGN KEY([LetterStatusId])
REFERENCES [dbo].[LetterStatus] ([LetterStatusId])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_LetterStatus]
GO
ALTER TABLE [dbo].[Letter]  WITH CHECK ADD  CONSTRAINT [FK_Letter_Designation] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[Designation] ([DesignationId])
GO
ALTER TABLE [dbo].[Letter] CHECK CONSTRAINT [FK_Letter_Designation]
GO
ALTER TABLE [dbo].[Letter]  WITH CHECK ADD  CONSTRAINT [FK_Letter_LetterFrom] FOREIGN KEY([LetterFromId])
REFERENCES [dbo].[LetterFrom] ([LetterFromId])
GO
ALTER TABLE [dbo].[Letter] CHECK CONSTRAINT [FK_Letter_LetterFrom]
GO
ALTER TABLE [dbo].[Letter]  WITH CHECK ADD  CONSTRAINT [FK_Letter_LetterStatus] FOREIGN KEY([LetterStatusId])
REFERENCES [dbo].[LetterStatus] ([LetterStatusId])
GO
ALTER TABLE [dbo].[Letter] CHECK CONSTRAINT [FK_Letter_LetterStatus]
GO
ALTER TABLE [dbo].[Letter]  WITH CHECK ADD  CONSTRAINT [FK_Letter_LetterType] FOREIGN KEY([LetterTypeId])
REFERENCES [dbo].[LetterType] ([LetterTypeId])
GO
ALTER TABLE [dbo].[Letter] CHECK CONSTRAINT [FK_Letter_LetterType]
GO
USE [master]
GO
ALTER DATABASE [LetterManagementDB] SET  READ_WRITE 
GO
