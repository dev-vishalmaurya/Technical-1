USE [master]
GO
/****** Object:  Database [TechnicalRound]    Script Date: 15-08-2023 11:18:31 ******/
CREATE DATABASE [TechnicalRound]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TechnicalRound', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TechnicalRound.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TechnicalRound_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TechnicalRound_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TechnicalRound] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TechnicalRound].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TechnicalRound] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TechnicalRound] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TechnicalRound] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TechnicalRound] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TechnicalRound] SET ARITHABORT OFF 
GO
ALTER DATABASE [TechnicalRound] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TechnicalRound] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TechnicalRound] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TechnicalRound] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TechnicalRound] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TechnicalRound] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TechnicalRound] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TechnicalRound] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TechnicalRound] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TechnicalRound] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TechnicalRound] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TechnicalRound] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TechnicalRound] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TechnicalRound] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TechnicalRound] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TechnicalRound] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TechnicalRound] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TechnicalRound] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TechnicalRound] SET  MULTI_USER 
GO
ALTER DATABASE [TechnicalRound] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TechnicalRound] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TechnicalRound] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TechnicalRound] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TechnicalRound] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TechnicalRound] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TechnicalRound] SET QUERY_STORE = OFF
GO
USE [TechnicalRound]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 15-08-2023 11:18:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [int] NULL,
	[FirstName] [varchar](80) NULL,
	[LastName] [varchar](80) NULL,
	[DateOfBirth] [date] NULL,
	[Gender] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 15-08-2023 11:18:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[Id] [int] IDENTITY(101,1) NOT NULL,
	[FirstName] [varchar](80) NULL,
	[LastName] [varchar](80) NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Id], [TeacherId], [FirstName], [LastName], [DateOfBirth], [Gender]) VALUES (2004, 101, N' utsav', N'tiwari', CAST(N'2022-09-05' AS Date), N'Male')
INSERT [dbo].[Student] ([Id], [TeacherId], [FirstName], [LastName], [DateOfBirth], [Gender]) VALUES (2010, 103, N' utsav', N'tiwari', CAST(N'2022-05-09' AS Date), N'Male')
INSERT [dbo].[Student] ([Id], [TeacherId], [FirstName], [LastName], [DateOfBirth], [Gender]) VALUES (2011, 103, N' utsav', N'tiwari', CAST(N'2022-09-05' AS Date), N'Male')
INSERT [dbo].[Student] ([Id], [TeacherId], [FirstName], [LastName], [DateOfBirth], [Gender]) VALUES (2009, 102, N' utsav', N'tiwari', CAST(N'2022-05-09' AS Date), N'Male')
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([Id], [FirstName], [LastName]) VALUES (101, N'Rahul', N'Soni')
INSERT [dbo].[Teacher] ([Id], [FirstName], [LastName]) VALUES (102, N'Divya', N'Rai')
INSERT [dbo].[Teacher] ([Id], [FirstName], [LastName]) VALUES (103, N'Vijay', N'Maurya')
SET IDENTITY_INSERT [dbo].[Teacher] OFF
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([Id])
GO
/****** Object:  StoredProcedure [dbo].[sp_student]    Script Date: 15-08-2023 11:18:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_student]
@Id int=0,
@TeacherId int=0,
@FirstName varchar(80)=null,
@LastName varchar(80)=null,
@DateOfBirth date=null ,
@Gender varchar(20)=null,
@action int=0
as
begin
if @action=1
begin
insert into Student(TeacherId,FirstName,LastName,DateOfBirth,Gender) values(@TeacherId,@FirstName,@LastName,@DateOfBirth,@Gender)
end
if @action=2
begin
select Student.Id,(Student.FirstName+' '+Student.LastName) as StudentName,Student.DateOfBirth,Student.Gender,(Teacher.FirstName+' '+Teacher.LastName) as TeacherName from Student left join Teacher on Student.TeacherId= Teacher.Id
end
if @action=3
begin
select Id,(FirstName+' '+LastName) as "TeacherName" from Teacher
end
if @action=4
begin
delete from Student where Id=@id
end
if @action=5
begin
update Student set TeacherId=@TeacherId,FirstName=@FirstName,LastName=@LastName,DateOfBirth=@DateOfBirth,Gender=@Gender where Id=@Id
end
if @action=6
begin
select * from Student where Id=@Id
end
end
GO
USE [master]
GO
ALTER DATABASE [TechnicalRound] SET  READ_WRITE 
GO
