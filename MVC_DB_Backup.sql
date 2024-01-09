USE [master]
GO
/****** Object:  Database [RuchikaMVCDapperDB]    Script Date: 1/8/2024 7:43:36 PM ******/
CREATE DATABASE [RuchikaMVCDapperDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RuchikaMVCDapperDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\RuchikaMVCDapperDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RuchikaMVCDapperDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\RuchikaMVCDapperDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [RuchikaMVCDapperDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RuchikaMVCDapperDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RuchikaMVCDapperDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RuchikaMVCDapperDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RuchikaMVCDapperDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RuchikaMVCDapperDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RuchikaMVCDapperDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [RuchikaMVCDapperDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RuchikaMVCDapperDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RuchikaMVCDapperDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RuchikaMVCDapperDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RuchikaMVCDapperDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RuchikaMVCDapperDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RuchikaMVCDapperDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RuchikaMVCDapperDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RuchikaMVCDapperDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RuchikaMVCDapperDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RuchikaMVCDapperDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RuchikaMVCDapperDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RuchikaMVCDapperDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RuchikaMVCDapperDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RuchikaMVCDapperDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RuchikaMVCDapperDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RuchikaMVCDapperDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RuchikaMVCDapperDB] SET RECOVERY FULL 
GO
ALTER DATABASE [RuchikaMVCDapperDB] SET  MULTI_USER 
GO
ALTER DATABASE [RuchikaMVCDapperDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RuchikaMVCDapperDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RuchikaMVCDapperDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RuchikaMVCDapperDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RuchikaMVCDapperDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RuchikaMVCDapperDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'RuchikaMVCDapperDB', N'ON'
GO
ALTER DATABASE [RuchikaMVCDapperDB] SET QUERY_STORE = OFF
GO
USE [RuchikaMVCDapperDB]
GO
/****** Object:  Table [dbo].[StudTable]    Script Date: 1/8/2024 7:43:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudTable](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Age] [int] NULL,
	[Fees] [int] NOT NULL,
	[Gender] [varchar](50) NULL,
	[IsDeleted] [bit] NOT NULL,
	[EmailID] [nvarchar](255) NULL,
	[Skills] [varchar](255) NULL,
 CONSTRAINT [PK_StudTable] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[StudTable] ON 

INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (1, N'Ruchika', 21, 78990, N'Female', 0, N'abc@gmail.com', NULL)
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (2, N'Sneha', 34, 700000, N'Female', 0, N'snehavete11@gmail.com', NULL)
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (3, N'Supriya', 78, 9000, N'Female', 0, N'sup@gmail.com', NULL)
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (4, N'Aakash', 22, 6705, N'Male', 0, N'aakash123@gmail.com', N'Python,HTML,CSS')
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (5, N'Shalini', 34, 5600, N'Female', 0, N'sha@gmail.com', NULL)
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (6, N'Roshan', 32, 9000, N'Male', 0, N'rosha@gmail.com', NULL)
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (7, N'Edel', 34, 6000, N'Male', 0, N'ede@gmail.com', NULL)
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (8, N'John', 23, 5000, N'Male', 0, N'jo123@gmail.com', NULL)
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (9, N'Jessica', 23, 7000, N'Female', 0, N'jess567@gmail.com', NULL)
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (10, N'Shardha', 19, 5000, N'Female', 0, N'sha@gmail.com', NULL)
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (11, N'Sakshi', 23, 4000, N'Female', 0, N'sak@gmail.com', NULL)
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (12, N'Supriya', 23, 9000, N'Female', 1, N'sup@gmail.com', NULL)
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (13, N'Supriya', 34, 9000, N'Female', 1, N'sup@gmail.com', NULL)
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (14, N'Supriya', 27, 9000, N'Female', 1, N'sup@gmail.com', NULL)
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (15, N'Supriya', 67, 9000, N'Female', 1, N'sup@gmail.com', NULL)
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (16, N'Supriyaa', 78, 9000, N'Female', 1, N'sup@gmail.com', NULL)
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (17, N'Supriya', 34, 9000, N'Female', 1, N'sup@gmail.com', NULL)
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (18, N'Snehaa', 34, 7000006, N'Female', 1, N'snehavete11@gmail.com', NULL)
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (19, N'Ruchika', 22, 78990, N'Female', 1, N'abc@gmail.com', NULL)
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (20, N'Abhinav', 26, 2000, N'Male', 0, N'abhi@gmail.com', NULL)
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (21, N'Sakshi', 29, 4000, N'Female', 1, N'sak@gmail.com', NULL)
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (22, N'Zainab', 34, 500, N'Female', 0, N'za786@gmail.com', NULL)
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (23, N'Purnima', 23, 6000, N'Female', 0, N'pur@gmail.com', NULL)
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (24, N'Aarushi', 22, 3900, N'Female', 0, N'aaru@gmail.com', N'C#')
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (25, N'Shubam', 14, 2000, N'Male', 0, N'shu@gmail.com', NULL)
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (26, N'Sagar', 33, 45, N'Male', 0, N'sagar@gmail.com', NULL)
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (27, N'Satvik', 23, 4000, N'Male', 0, N'sat@gmail.com', NULL)
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (28, N'Rashi', 34, 34, N'Female', 0, N'rashiK@gmail.com', NULL)
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (29, N'Rohan', 23, 34, N'Male', 0, N'rohan@gmail.com', NULL)
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (30, N'Shubham', 15, 67000, N'Male', 0, N'shu@gmail.com', NULL)
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (31, N'Tina', 34, 5000, N'Male', 0, N'tinu@gmail.com', NULL)
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (32, N'Diksha', 18, 45000, N'Female', 0, N'dik2432@gmail.com', NULL)
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (33, N'Farin', 23, 4500, N'Female', 0, N'fari@gmail.com', NULL)
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (34, N'Eliza', 34, 45000, N'Female', 0, N'eliza32@gmail.com', NULL)
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (35, N'Radha', 34, 3000, N'Female', 0, N'radha@gmail.com', NULL)
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (1001, N'Aarush', 23, 5666, N'Male', 0, N'aaruk@gmail.com', N'C#,Python,CSS')
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (1002, N'Aarush', 23, 5666, N'Male', 0, N'aaruk@gmail.com', N'C#,CSS')
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (1003, N'Mahesh', 33, 4500, N'Male', 0, N'mah@gmail.com', N'C#')
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (1004, N'Mukesh', 33, 4500, N'Male', 0, N'muh@gmail.com', N'JAVA')
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (1005, N'Ekesh', 33, 4500, N'Male', 0, N'muh@gmail.com', N'HTML,CSS')
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (1006, N'Krishna', 34, 4577, N'Male', 0, N'krishna@gmail.com', N'Python')
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (1007, N'Krishna', 34, 4577, N'Male', 0, N'krishna@gmail.com', N'C#,Python')
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (1008, N'Krishna', 45, 3000, N'Male', 0, N'krishna12@gmail.com', N'false')
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (1009, N'Krishna', 45, 3000, N'Male', 0, N'krishna12@gmail.com', N'C#,HTML')
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (1010, N'Krishna', 45, 3000, N'Male', 0, N'krishna12@gmail.com', N'false')
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (1011, N'Rakhi', 34, 5600, N'Female', 0, N'rak@gmail.com', N'false')
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (1012, N'Rakhi', 34, 5600, N'Female', 0, N'rak@gmail.com', N'false')
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (1013, N'Ruby', 45, 8000, N'Female', 0, N'ru@gmail.com', N'false')
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (1014, N'Sundari', 34, 8000, N'Female', 0, N'sun@gmail.com', N'')
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (1015, N'Sundari', 34, 8000, N'Female', 0, N'sun@gmail.com', N'JAVA')
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (1016, N'Sundari', 45, 600, N'Female', 0, N'sun@gmail.com', N'C#')
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (1017, N'Dikshit', 45, 500, N'Male', 0, N'sik@gmail.com', N'C#')
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (1018, N'Krishna', 45, 700, N'Male', 0, N'krishna@gmail.com', N'C#')
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (1019, N'Krishna', 45, 900, N'Male', 0, N'krishna@gmail.com', N'C#,Python,CSS')
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (1020, N'Ganesh', 34, 56000, N'Male', 0, N'gan@gmail.com', N'C#,Python,CSS')
INSERT [dbo].[StudTable] ([StudentID], [Name], [Age], [Fees], [Gender], [IsDeleted], [EmailID], [Skills]) VALUES (1021, N'abc', 34, 56000, N'Female', 0, N'abc@gmail.com', N'C#,Python,CSS')
SET IDENTITY_INSERT [dbo].[StudTable] OFF
GO
ALTER TABLE [dbo].[StudTable] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  StoredProcedure [dbo].[DeleteStud]    Script Date: 1/8/2024 7:43:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create stored procedure for soft delete
CREATE PROCEDURE [dbo].[DeleteStud]
    @StudentID INT
AS
BEGIN
    UPDATE StudTable
    SET IsDeleted = 1  -- Assuming there is a column named IsDeleted to mark soft-deleted records
    WHERE StudentID = @StudentID;
END
GO
/****** Object:  StoredProcedure [dbo].[Retrive]    Script Date: 1/8/2024 7:43:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Retrive]
    @StudentID INT
AS
BEGIN
    UPDATE StudTable
    SET IsDeleted = 0
    WHERE StudentID = @StudentID;
END
GO
/****** Object:  StoredProcedure [dbo].[SoftDeletedStudView]    Script Date: 1/8/2024 7:43:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SoftDeletedStudView]
AS
BEGIN
    SELECT * FROM StudTable
    WHERE IsDeleted = 1; -- Include only soft-deleted records
END
GO
/****** Object:  StoredProcedure [dbo].[SoftDeleteStud]    Script Date: 1/8/2024 7:43:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create stored procedure for soft delete
CREATE PROCEDURE [dbo].[SoftDeleteStud]
    @StudentID INT
AS
BEGIN
    UPDATE StudTable
    SET IsDeleted = 1  -- Assuming there is a column named IsDeleted to mark soft-deleted records
    WHERE StudentID = @StudentID;
END
GO
/****** Object:  StoredProcedure [dbo].[StudAddDelete]    Script Date: 1/8/2024 7:43:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[StudAddDelete]
@StudentID int,
@Name varchar(50),
@EmailID nvarchar(255),
@Age int,
@Skills NVARCHAR(MAX),
@Gender varchar(50),
@Fees int

AS

IF(@StudentID=0)
	Insert into
	StudTable (Name,EmailID,Age,Gender,Skills,Fees)
	Values(@Name,@EmailID,@Age,@Gender,@Skills,@Fees)
Else
	update StudTable
	set
	Name = @Name,
	EmailID=@EmailID,
	Age = @Age,
	Gender=@Gender,
	Skills=@Skills,
	Fees = @Fees
	where StudentID=@StudentID



GO
/****** Object:  StoredProcedure [dbo].[StudDeleteById]    Script Date: 1/8/2024 7:43:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[StudDeleteById]
@StudentId int
as

Delete from
StudTable
where StudentID=@StudentId
GO
/****** Object:  StoredProcedure [dbo].[StudView]    Script Date: 1/8/2024 7:43:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[StudView]

as
select * from StudTable
WHERE IsDeleted = 0;
GO
/****** Object:  StoredProcedure [dbo].[StudViewById]    Script Date: 1/8/2024 7:43:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[StudViewById]
@StudentId int
as

Select * from
StudTable
where StudentID=@StudentId
GO
/****** Object:  StoredProcedure [dbo].[StudViewWithPageSize]    Script Date: 1/8/2024 7:43:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[StudViewWithPageSize]
    @PageSize INT
AS
BEGIN
    -- Your existing query with the additional WHERE condition
    SELECT StudentID, Name, EmailID, Age, Gender,Skills, Fees
    FROM StudTable
    WHERE IsDeleted = 0
    -- Additional conditions and ordering as needed
    ORDER BY StudentID
    OFFSET 0 ROWS FETCH NEXT @PageSize ROWS ONLY;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateStudent]    Script Date: 1/8/2024 7:43:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateStudent]
    @StudentID INT,
    @Name NVARCHAR(255),
    @EmailID NVARCHAR(255),
    @Age INT,
	@Skills NVARCHAR(MAX),
    @Fees INT,
    @Gender NVARCHAR(10)
AS
BEGIN
    UPDATE StudTable
    SET
        Name = @Name,
        EmailID = @EmailID,
        Age = @Age,
        Fees = @Fees,
		Skills=@Skills,
        Gender = @Gender
    WHERE
        StudentID = @StudentID;
END;
GO
USE [master]
GO
ALTER DATABASE [RuchikaMVCDapperDB] SET  READ_WRITE 
GO
