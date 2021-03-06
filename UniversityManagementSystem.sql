USE [master]
GO
/****** Object:  Database [UniversityManagement]    Script Date: 1/25/2017 1:09:55 AM ******/
CREATE DATABASE [UniversityManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UniversityManagement', FILENAME = N'C:\Users\MrWEED\UniversityManagement.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UniversityManagement_log', FILENAME = N'C:\Users\MrWEED\UniversityManagement_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UniversityManagement] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniversityManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniversityManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniversityManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniversityManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniversityManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniversityManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniversityManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UniversityManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniversityManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniversityManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniversityManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniversityManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniversityManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniversityManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniversityManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UniversityManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniversityManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniversityManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniversityManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniversityManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniversityManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UniversityManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniversityManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UniversityManagement] SET  MULTI_USER 
GO
ALTER DATABASE [UniversityManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniversityManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UniversityManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UniversityManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [UniversityManagement]
GO
/****** Object:  Table [dbo].[AllocateClassroom]    Script Date: 1/25/2017 1:09:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllocateClassroom](
	[Id] [int] NULL,
	[DepartmentId] [int] NULL,
	[CourseId] [int] NULL,
	[DayId] [int] NULL,
	[FromTime] [datetime] NULL,
	[ToTime] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Course]    Script Date: 1/25/2017 1:09:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Credit] [decimal](4, 2) NOT NULL,
	[Description] [varchar](200) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[SemesterId] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CourseAssign]    Script Date: 1/25/2017 1:09:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CourseAssign](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
	[CreditToBeTaken] [decimal](4, 2) NOT NULL,
	[CourseCodeId] [int] NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Credit] [decimal](4, 2) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Department]    Script Date: 1/25/2017 1:09:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dic_Day]    Script Date: 1/25/2017 1:09:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dic_Day](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_Dic_Day] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dic_Designation]    Script Date: 1/25/2017 1:09:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dic_Designation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dic_Designation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dic_Grade]    Script Date: 1/25/2017 1:09:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dic_Grade](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_Dic_Grade] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dic_Room]    Script Date: 1/25/2017 1:09:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dic_Room](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_Dic_Room] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dic_Semester]    Script Date: 1/25/2017 1:09:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dic_Semester](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dic_Semester] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EnrollCourse]    Script Date: 1/25/2017 1:09:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EnrollCourse](
	[Id] [int] NOT NULL,
	[RegistrationNo] [int] NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[DepartmentId] [int] NULL,
	[CourseId] [int] NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_EnrollCourse] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RegisterStudent]    Script Date: 1/25/2017 1:09:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RegisterStudent](
	[Id] [int] NOT NULL,
	[RegNo] [varchar](50) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[ContactNo] [varchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Address] [varchar](300) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[Email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_RegisterStudent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Result]    Script Date: 1/25/2017 1:09:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result](
	[Id] [int] NOT NULL,
	[RegistrationNoId] [int] NULL,
	[Name] [nchar](10) NULL,
	[Email] [nchar](10) NULL,
	[Department] [nchar](10) NULL,
	[CourseId] [int] NULL,
	[GradeId] [int] NULL,
 CONSTRAINT [PK_Result] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentRegistrationNo]    Script Date: 1/25/2017 1:09:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentRegistrationNo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentReg] [varchar](20) NOT NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_StudentRegistrationNo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 1/25/2017 1:09:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[Address] [varchar](300) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[ContactNo] [varchar](50) NOT NULL,
	[DesignationId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CreditToBeTaken] [decimal](4, 2) NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (1, N'CSE-112', N'Computer Fundamentals', CAST(3.00 AS Decimal(4, 2)), N'Basic about computer system', 1, 1)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (2, N'CSE-124', N'Problem Solving in C', CAST(3.00 AS Decimal(4, 2)), N'Introduction to c language', 1, 2)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (3, N'BBA-125', N'Finance Principles  ', CAST(2.50 AS Decimal(4, 2)), N'Finance in details', 3, 2)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (4, N'BBA-325', N'Advance Accounting ', CAST(2.00 AS Decimal(4, 2)), N'Higher accounting', 3, 6)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (5, N'CSE-111', N'Mathematics-I', CAST(3.00 AS Decimal(4, 2)), N'math', 1, 3)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (6, N'CSE-131', N'Mathematics-III', CAST(3.00 AS Decimal(4, 2)), N'math', 1, 3)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (7, N'CSE-134', N'Data Structure', CAST(3.00 AS Decimal(4, 2)), N'Advance Programming', 1, 3)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (8, N'CSE-231', N'Computer Networking', CAST(3.00 AS Decimal(4, 2)), N'Networking', 1, 6)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (9, N'CSE-412', N'System Analysis', CAST(3.00 AS Decimal(4, 2)), N'Nothig', 1, 7)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (10, N'CSE-413', N'Artificial Intelligence', CAST(3.00 AS Decimal(4, 2)), N'Nothing', 1, 7)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (11, N'CSE-415', N'Artificial Intelligence Lab', CAST(3.00 AS Decimal(4, 2)), N'Nothing', 1, 7)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (1005, N'BBA-221', N'Business Policy', CAST(3.00 AS Decimal(4, 2)), N'Business modeling', 3, 6)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (1006, N'BBA-212', N'Business Study', CAST(3.00 AS Decimal(4, 2)), N'Business modeling', 3, 5)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (1007, N'EEE-213', N'Physics III', CAST(3.00 AS Decimal(4, 2)), N'Theoritical', 2, 2)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (1008, N'CSE-115', N'Physics I', CAST(2.50 AS Decimal(4, 2)), N'Thermodynamics', 1, 1)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (1009, N'CSE-324', N'Data Mining', CAST(3.00 AS Decimal(4, 2)), N'Image processing, natural Language Processing', 1, 6)
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[CourseAssign] ON 

INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CreditToBeTaken], [CourseCodeId], [Name], [Credit]) VALUES (1, 1, 3, CAST(20.00 AS Decimal(4, 2)), 1, N'Computer Fundamentals', CAST(3.00 AS Decimal(4, 2)))
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CreditToBeTaken], [CourseCodeId], [Name], [Credit]) VALUES (2, 3, 5, CAST(20.00 AS Decimal(4, 2)), 4, N'Advance Accounting ', CAST(2.00 AS Decimal(4, 2)))
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CreditToBeTaken], [CourseCodeId], [Name], [Credit]) VALUES (3, 1, 1, CAST(20.00 AS Decimal(4, 2)), 2, N'Problem Solving in C', CAST(3.00 AS Decimal(4, 2)))
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CreditToBeTaken], [CourseCodeId], [Name], [Credit]) VALUES (3003, 1, 1, CAST(20.00 AS Decimal(4, 2)), 6, N'Mathematics-III', CAST(3.00 AS Decimal(4, 2)))
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CreditToBeTaken], [CourseCodeId], [Name], [Credit]) VALUES (3004, 1, 1, CAST(20.00 AS Decimal(4, 2)), 7, N'Data Structure', CAST(3.00 AS Decimal(4, 2)))
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CreditToBeTaken], [CourseCodeId], [Name], [Credit]) VALUES (3006, 1, 1, CAST(20.00 AS Decimal(4, 2)), 9, N'System Analysis', CAST(3.00 AS Decimal(4, 2)))
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CreditToBeTaken], [CourseCodeId], [Name], [Credit]) VALUES (3010, 1, 3, CAST(20.00 AS Decimal(4, 2)), 1008, N'Physics I', CAST(2.50 AS Decimal(4, 2)))
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CreditToBeTaken], [CourseCodeId], [Name], [Credit]) VALUES (3011, 1, 1, CAST(20.00 AS Decimal(4, 2)), 5, N'Mathematics-I', CAST(3.00 AS Decimal(4, 2)))
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CreditToBeTaken], [CourseCodeId], [Name], [Credit]) VALUES (3012, 1, 1, CAST(20.00 AS Decimal(4, 2)), 1009, N'Data Mining', CAST(3.00 AS Decimal(4, 2)))
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CreditToBeTaken], [CourseCodeId], [Name], [Credit]) VALUES (3005, 1, 1, CAST(20.00 AS Decimal(4, 2)), 8, N'Computer Networking', CAST(3.00 AS Decimal(4, 2)))
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CreditToBeTaken], [CourseCodeId], [Name], [Credit]) VALUES (3009, 1, 1, CAST(20.00 AS Decimal(4, 2)), 11, N'Artificial Intelligence Lab', CAST(3.00 AS Decimal(4, 2)))
SET IDENTITY_INSERT [dbo].[CourseAssign] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (1, N'CSE', N'Computer Science & Engineering')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (2, N'EEE', N'Electrical & Electronic Engineering')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (3, N'BBA', N'Bachelor of Business Administration')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (1002, N'ETE', N'Electrical & Telecomunication Engineering')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Dic_Designation] ON 

INSERT [dbo].[Dic_Designation] ([Id], [Name]) VALUES (1, N'Jr. Lecturer')
INSERT [dbo].[Dic_Designation] ([Id], [Name]) VALUES (2, N'Sr. Lecturer')
INSERT [dbo].[Dic_Designation] ([Id], [Name]) VALUES (3, N'Assistant Professor')
INSERT [dbo].[Dic_Designation] ([Id], [Name]) VALUES (4, N'Associate Professor')
INSERT [dbo].[Dic_Designation] ([Id], [Name]) VALUES (5, N'Professor')
SET IDENTITY_INSERT [dbo].[Dic_Designation] OFF
SET IDENTITY_INSERT [dbo].[Dic_Semester] ON 

INSERT [dbo].[Dic_Semester] ([Id], [Name]) VALUES (1, N'Semester-01')
INSERT [dbo].[Dic_Semester] ([Id], [Name]) VALUES (2, N'Semester-02')
INSERT [dbo].[Dic_Semester] ([Id], [Name]) VALUES (3, N'Semester-03')
INSERT [dbo].[Dic_Semester] ([Id], [Name]) VALUES (4, N'Semester-04')
INSERT [dbo].[Dic_Semester] ([Id], [Name]) VALUES (5, N'Semester-05')
INSERT [dbo].[Dic_Semester] ([Id], [Name]) VALUES (6, N'Semester-06')
INSERT [dbo].[Dic_Semester] ([Id], [Name]) VALUES (7, N'Semester-07')
INSERT [dbo].[Dic_Semester] ([Id], [Name]) VALUES (8, N'Semester-08')
SET IDENTITY_INSERT [dbo].[Dic_Semester] OFF
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken]) VALUES (1, N'Sajib Kumar Mitra', N'Barshal', N'sajib.mitra@mail.com', N'01765893555', 1, 1, CAST(20.00 AS Decimal(4, 2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken]) VALUES (3, N'Rezwana Sultana', N'Dhaka', N'rezwanasultana@mail.com', N'01765893555', 2, 1, CAST(20.00 AS Decimal(4, 2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken]) VALUES (4, N'Aminul Islam', N'Khulna', N'aminul.bba@mail.com', N'0176589357875', 4, 3, CAST(12.00 AS Decimal(4, 2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken]) VALUES (5, N'Faridur Rahman', N'Dhaka', N'farid.bba@mail.com', N'01765357875', 2, 3, CAST(20.00 AS Decimal(4, 2)))
SET IDENTITY_INSERT [dbo].[Teacher] OFF
ALTER TABLE [dbo].[EnrollCourse] ADD  CONSTRAINT [DF_EnrollCourse_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[AllocateClassroom]  WITH CHECK ADD  CONSTRAINT [FK_AllocateClassroom_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[AllocateClassroom] CHECK CONSTRAINT [FK_AllocateClassroom_Course]
GO
ALTER TABLE [dbo].[AllocateClassroom]  WITH CHECK ADD  CONSTRAINT [FK_AllocateClassroom_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[AllocateClassroom] CHECK CONSTRAINT [FK_AllocateClassroom_Department]
GO
ALTER TABLE [dbo].[AllocateClassroom]  WITH CHECK ADD  CONSTRAINT [FK_AllocateClassroom_Dic_Day] FOREIGN KEY([DayId])
REFERENCES [dbo].[Dic_Day] ([Id])
GO
ALTER TABLE [dbo].[AllocateClassroom] CHECK CONSTRAINT [FK_AllocateClassroom_Dic_Day]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Department]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Dic_Semester] FOREIGN KEY([SemesterId])
REFERENCES [dbo].[Dic_Semester] ([Id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Dic_Semester]
GO
ALTER TABLE [dbo].[CourseAssign]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssign_Course] FOREIGN KEY([CourseCodeId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[CourseAssign] CHECK CONSTRAINT [FK_CourseAssign_Course]
GO
ALTER TABLE [dbo].[CourseAssign]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssign_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[CourseAssign] CHECK CONSTRAINT [FK_CourseAssign_Teacher]
GO
ALTER TABLE [dbo].[CourseAssign]  WITH CHECK ADD  CONSTRAINT [FK_Table_1_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[CourseAssign] CHECK CONSTRAINT [FK_Table_1_Department]
GO
ALTER TABLE [dbo].[CourseAssign]  WITH CHECK ADD  CONSTRAINT [FK_Table_1_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[CourseAssign] CHECK CONSTRAINT [FK_Table_1_Teacher]
GO
ALTER TABLE [dbo].[EnrollCourse]  WITH CHECK ADD  CONSTRAINT [FK_EnrollCourse_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[EnrollCourse] CHECK CONSTRAINT [FK_EnrollCourse_Course]
GO
ALTER TABLE [dbo].[EnrollCourse]  WITH CHECK ADD  CONSTRAINT [FK_EnrollCourse_RegisterStudent] FOREIGN KEY([RegistrationNo])
REFERENCES [dbo].[RegisterStudent] ([Id])
GO
ALTER TABLE [dbo].[EnrollCourse] CHECK CONSTRAINT [FK_EnrollCourse_RegisterStudent]
GO
ALTER TABLE [dbo].[RegisterStudent]  WITH CHECK ADD  CONSTRAINT [FK_RegisterStudent_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[RegisterStudent] CHECK CONSTRAINT [FK_RegisterStudent_Department]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_Course]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_Dic_Grade] FOREIGN KEY([GradeId])
REFERENCES [dbo].[Dic_Grade] ([Id])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_Dic_Grade]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_RegisterStudent] FOREIGN KEY([RegistrationNoId])
REFERENCES [dbo].[RegisterStudent] ([Id])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_RegisterStudent]
GO
ALTER TABLE [dbo].[StudentRegistrationNo]  WITH CHECK ADD  CONSTRAINT [FK_StudentRegistrationNo_StudentRegistrationNo] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[StudentRegistrationNo] ([Id])
GO
ALTER TABLE [dbo].[StudentRegistrationNo] CHECK CONSTRAINT [FK_StudentRegistrationNo_StudentRegistrationNo]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Department]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Dic_Designation] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[Dic_Designation] ([Id])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Dic_Designation]
GO
USE [master]
GO
ALTER DATABASE [UniversityManagement] SET  READ_WRITE 
GO
