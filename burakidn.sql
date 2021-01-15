USE [master]
GO
/****** Object:  Database [BURAKIDN]    Script Date: 15.01.2021 23:50:38 ******/
CREATE DATABASE [BURAKIDN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BURAKIDN', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BURAKIDN.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BURAKIDN_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BURAKIDN_log.ldf' , SIZE = 1792KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BURAKIDN] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BURAKIDN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BURAKIDN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BURAKIDN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BURAKIDN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BURAKIDN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BURAKIDN] SET ARITHABORT OFF 
GO
ALTER DATABASE [BURAKIDN] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BURAKIDN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BURAKIDN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BURAKIDN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BURAKIDN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BURAKIDN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BURAKIDN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BURAKIDN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BURAKIDN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BURAKIDN] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BURAKIDN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BURAKIDN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BURAKIDN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BURAKIDN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BURAKIDN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BURAKIDN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BURAKIDN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BURAKIDN] SET RECOVERY FULL 
GO
ALTER DATABASE [BURAKIDN] SET  MULTI_USER 
GO
ALTER DATABASE [BURAKIDN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BURAKIDN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BURAKIDN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BURAKIDN] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BURAKIDN] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BURAKIDN] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BURAKIDN', N'ON'
GO
ALTER DATABASE [BURAKIDN] SET QUERY_STORE = OFF
GO
USE [BURAKIDN]
GO
/****** Object:  Table [dbo].[Certificates]    Script Date: 15.01.2021 23:50:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Certificates](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Certificate] [nvarchar](150) NULL,
 CONSTRAINT [PK_Certificates] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Connections]    Script Date: 15.01.2021 23:50:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Connections](
	[User1-ID] [int] NOT NULL,
	[User2-ID] [int] NOT NULL,
 CONSTRAINT [PK_Connections] PRIMARY KEY CLUSTERED 
(
	[User1-ID] ASC,
	[User2-ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Education]    Script Date: 15.01.2021 23:50:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Education](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Primary_School] [nvarchar](150) NULL,
	[Secondry_School] [nvarchar](150) NULL,
	[High_School] [nvarchar](150) NULL,
	[University] [nvarchar](150) NULL,
	[Extra] [nvarchar](max) NULL,
 CONSTRAINT [PK_Education] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 15.01.2021 23:50:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Employee-ID] [int] IDENTITY(1,1) NOT NULL,
	[GraduateYear] [date] NULL,
	[GradePointAverage] [float] NULL,
	[Experience] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Employee-ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Graduated]    Script Date: 15.01.2021 23:50:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Graduated](
	[Graduated-ID] [int] IDENTITY(1,1) NOT NULL,
	[GraduateYear] [date] NULL,
	[GradePointAverage] [float] NULL,
 CONSTRAINT [PK_Graduated] PRIMARY KEY CLUSTERED 
(
	[Graduated-ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Languages]    Script Date: 15.01.2021 23:50:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Language] [nvarchar](50) NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LookingForEmployee]    Script Date: 15.01.2021 23:50:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LookingForEmployee](
	[LookingForEmployee-ID] [int] IDENTITY(1,1) NOT NULL,
	[GraduateYear] [date] NULL,
	[GradePointAverage] [float] NULL,
	[Experience] [int] NULL,
 CONSTRAINT [PK_LookingForEmployee] PRIMARY KEY CLUSTERED 
(
	[LookingForEmployee-ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LookingForJob]    Script Date: 15.01.2021 23:50:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LookingForJob](
	[LookingForJob-ID] [int] IDENTITY(1,1) NOT NULL,
	[GraduateYear] [date] NULL,
	[GradePointAverage] [float] NULL,
	[Experience] [int] NULL,
 CONSTRAINT [PK_LookingForJob] PRIMARY KEY CLUSTERED 
(
	[LookingForJob-ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 15.01.2021 23:50:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[User-ID] [int] NOT NULL,
	[Text] [text] NOT NULL,
	[date] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 15.01.2021 23:50:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Student-ID] [int] IDENTITY(1,1) NOT NULL,
	[GraduateYear] [date] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Student-ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unemployed]    Script Date: 15.01.2021 23:50:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unemployed](
	[Unemployed-ID] [int] IDENTITY(1,1) NOT NULL,
	[GraduateYear] [date] NULL,
	[GradePointAverage] [float] NULL,
 CONSTRAINT [PK_Unemployed] PRIMARY KEY CLUSTERED 
(
	[Unemployed-ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 15.01.2021 23:50:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[User-ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Surname] [nvarchar](50) NULL,
	[Age] [int] NULL,
	[Mail] [varchar](500) NULL,
	[Password] [nvarchar](50) NULL,
	[SigninDate] [date] NULL,
	[User] [bit] NOT NULL,
	[Student] [bit] NOT NULL,
	[Graduated] [bit] NOT NULL,
	[Employee] [bit] NOT NULL,
	[Unemployed] [bit] NOT NULL,
	[LookingForJob] [bit] NOT NULL,
	[LookingForEmployee] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[User-ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Unique_Mail] UNIQUE NONCLUSTERED 
(
	[Mail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User-Certificate]    Script Date: 15.01.2021 23:50:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User-Certificate](
	[User-ID] [int] NOT NULL,
	[Certificate-ID] [int] NOT NULL,
 CONSTRAINT [PK_User-Certificate] PRIMARY KEY CLUSTERED 
(
	[User-ID] ASC,
	[Certificate-ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User-Education]    Script Date: 15.01.2021 23:50:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User-Education](
	[User-ID] [int] NOT NULL,
	[Education-ID] [int] NOT NULL,
 CONSTRAINT [PK_User-Education] PRIMARY KEY CLUSTERED 
(
	[User-ID] ASC,
	[Education-ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User-Employee]    Script Date: 15.01.2021 23:50:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User-Employee](
	[User-ID] [int] NOT NULL,
	[Employee-ID] [int] NOT NULL,
 CONSTRAINT [PK_User-Employee] PRIMARY KEY CLUSTERED 
(
	[User-ID] ASC,
	[Employee-ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User-Graduated]    Script Date: 15.01.2021 23:50:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User-Graduated](
	[User-ID] [int] NOT NULL,
	[Graduated-ID] [int] NOT NULL,
 CONSTRAINT [PK_User-Graduated] PRIMARY KEY CLUSTERED 
(
	[User-ID] ASC,
	[Graduated-ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User-Languages]    Script Date: 15.01.2021 23:50:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User-Languages](
	[User-ID] [int] NOT NULL,
	[Language-ID] [int] NOT NULL,
 CONSTRAINT [PK_User-Languages] PRIMARY KEY CLUSTERED 
(
	[User-ID] ASC,
	[Language-ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User-LookingForEmployee]    Script Date: 15.01.2021 23:50:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User-LookingForEmployee](
	[User-ID] [int] NOT NULL,
	[LookingForEmployee-ID] [int] NOT NULL,
 CONSTRAINT [PK_User-LookingForEmployee] PRIMARY KEY CLUSTERED 
(
	[User-ID] ASC,
	[LookingForEmployee-ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User-LookingForJob]    Script Date: 15.01.2021 23:50:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User-LookingForJob](
	[User-ID] [int] NOT NULL,
	[LookingForJob-ID] [int] NOT NULL,
 CONSTRAINT [PK_User-LookingForJob] PRIMARY KEY CLUSTERED 
(
	[User-ID] ASC,
	[LookingForJob-ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User-Student]    Script Date: 15.01.2021 23:50:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User-Student](
	[User-ID] [int] NOT NULL,
	[Student-ID] [int] NOT NULL,
 CONSTRAINT [PK_User-Student] PRIMARY KEY CLUSTERED 
(
	[User-ID] ASC,
	[Student-ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User-Unemployed]    Script Date: 15.01.2021 23:50:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User-Unemployed](
	[User-ID] [int] NOT NULL,
	[Unemployed-ID] [int] NOT NULL,
 CONSTRAINT [PK_User-Unemployed] PRIMARY KEY CLUSTERED 
(
	[User-ID] ASC,
	[Unemployed-ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_User]  DEFAULT ((0)) FOR [User]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Student]  DEFAULT ((0)) FOR [Student]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Graduated]  DEFAULT ((0)) FOR [Graduated]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Employee]  DEFAULT ((0)) FOR [Employee]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Unemployed]  DEFAULT ((0)) FOR [Unemployed]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_LookingForJob]  DEFAULT ((0)) FOR [LookingForJob]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_LookingForEmployee]  DEFAULT ((0)) FOR [LookingForEmployee]
GO
ALTER TABLE [dbo].[Connections]  WITH CHECK ADD  CONSTRAINT [FK_Connections_User] FOREIGN KEY([User1-ID])
REFERENCES [dbo].[User] ([User-ID])
GO
ALTER TABLE [dbo].[Connections] CHECK CONSTRAINT [FK_Connections_User]
GO
ALTER TABLE [dbo].[Connections]  WITH CHECK ADD  CONSTRAINT [FK_Connections_User1] FOREIGN KEY([User2-ID])
REFERENCES [dbo].[User] ([User-ID])
GO
ALTER TABLE [dbo].[Connections] CHECK CONSTRAINT [FK_Connections_User1]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_User] FOREIGN KEY([User-ID])
REFERENCES [dbo].[User] ([User-ID])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_User]
GO
ALTER TABLE [dbo].[User-Certificate]  WITH CHECK ADD  CONSTRAINT [FK_User-Certificate_Certificates] FOREIGN KEY([Certificate-ID])
REFERENCES [dbo].[Certificates] ([id])
GO
ALTER TABLE [dbo].[User-Certificate] CHECK CONSTRAINT [FK_User-Certificate_Certificates]
GO
ALTER TABLE [dbo].[User-Certificate]  WITH CHECK ADD  CONSTRAINT [FK_User-Certificate_User] FOREIGN KEY([User-ID])
REFERENCES [dbo].[User] ([User-ID])
GO
ALTER TABLE [dbo].[User-Certificate] CHECK CONSTRAINT [FK_User-Certificate_User]
GO
ALTER TABLE [dbo].[User-Education]  WITH CHECK ADD  CONSTRAINT [FK_User-Education_Education] FOREIGN KEY([Education-ID])
REFERENCES [dbo].[Education] ([id])
GO
ALTER TABLE [dbo].[User-Education] CHECK CONSTRAINT [FK_User-Education_Education]
GO
ALTER TABLE [dbo].[User-Education]  WITH CHECK ADD  CONSTRAINT [FK_User-Education_User] FOREIGN KEY([User-ID])
REFERENCES [dbo].[User] ([User-ID])
GO
ALTER TABLE [dbo].[User-Education] CHECK CONSTRAINT [FK_User-Education_User]
GO
ALTER TABLE [dbo].[User-Employee]  WITH CHECK ADD  CONSTRAINT [FK_User-Employee_Employee] FOREIGN KEY([Employee-ID])
REFERENCES [dbo].[Employee] ([Employee-ID])
GO
ALTER TABLE [dbo].[User-Employee] CHECK CONSTRAINT [FK_User-Employee_Employee]
GO
ALTER TABLE [dbo].[User-Employee]  WITH CHECK ADD  CONSTRAINT [FK_User-Employee_User] FOREIGN KEY([User-ID])
REFERENCES [dbo].[User] ([User-ID])
GO
ALTER TABLE [dbo].[User-Employee] CHECK CONSTRAINT [FK_User-Employee_User]
GO
ALTER TABLE [dbo].[User-Graduated]  WITH CHECK ADD  CONSTRAINT [FK_User-Graduated_Graduated] FOREIGN KEY([Graduated-ID])
REFERENCES [dbo].[Graduated] ([Graduated-ID])
GO
ALTER TABLE [dbo].[User-Graduated] CHECK CONSTRAINT [FK_User-Graduated_Graduated]
GO
ALTER TABLE [dbo].[User-Graduated]  WITH CHECK ADD  CONSTRAINT [FK_User-Graduated_User] FOREIGN KEY([User-ID])
REFERENCES [dbo].[User] ([User-ID])
GO
ALTER TABLE [dbo].[User-Graduated] CHECK CONSTRAINT [FK_User-Graduated_User]
GO
ALTER TABLE [dbo].[User-Languages]  WITH CHECK ADD  CONSTRAINT [FK_User-Languages_Languages] FOREIGN KEY([Language-ID])
REFERENCES [dbo].[Languages] ([id])
GO
ALTER TABLE [dbo].[User-Languages] CHECK CONSTRAINT [FK_User-Languages_Languages]
GO
ALTER TABLE [dbo].[User-Languages]  WITH CHECK ADD  CONSTRAINT [FK_User-Languages_User] FOREIGN KEY([User-ID])
REFERENCES [dbo].[User] ([User-ID])
GO
ALTER TABLE [dbo].[User-Languages] CHECK CONSTRAINT [FK_User-Languages_User]
GO
ALTER TABLE [dbo].[User-LookingForEmployee]  WITH CHECK ADD  CONSTRAINT [FK_User-LookingForEmployee_LookingForEmployee] FOREIGN KEY([LookingForEmployee-ID])
REFERENCES [dbo].[LookingForEmployee] ([LookingForEmployee-ID])
GO
ALTER TABLE [dbo].[User-LookingForEmployee] CHECK CONSTRAINT [FK_User-LookingForEmployee_LookingForEmployee]
GO
ALTER TABLE [dbo].[User-LookingForEmployee]  WITH CHECK ADD  CONSTRAINT [FK_User-LookingForEmployee_User] FOREIGN KEY([User-ID])
REFERENCES [dbo].[User] ([User-ID])
GO
ALTER TABLE [dbo].[User-LookingForEmployee] CHECK CONSTRAINT [FK_User-LookingForEmployee_User]
GO
ALTER TABLE [dbo].[User-LookingForJob]  WITH CHECK ADD  CONSTRAINT [FK_User-LookingForJob_LookingForJob] FOREIGN KEY([LookingForJob-ID])
REFERENCES [dbo].[LookingForJob] ([LookingForJob-ID])
GO
ALTER TABLE [dbo].[User-LookingForJob] CHECK CONSTRAINT [FK_User-LookingForJob_LookingForJob]
GO
ALTER TABLE [dbo].[User-LookingForJob]  WITH CHECK ADD  CONSTRAINT [FK_User-LookingForJob_User] FOREIGN KEY([User-ID])
REFERENCES [dbo].[User] ([User-ID])
GO
ALTER TABLE [dbo].[User-LookingForJob] CHECK CONSTRAINT [FK_User-LookingForJob_User]
GO
ALTER TABLE [dbo].[User-Student]  WITH CHECK ADD  CONSTRAINT [FK_User-Student_Student1] FOREIGN KEY([Student-ID])
REFERENCES [dbo].[Student] ([Student-ID])
GO
ALTER TABLE [dbo].[User-Student] CHECK CONSTRAINT [FK_User-Student_Student1]
GO
ALTER TABLE [dbo].[User-Student]  WITH CHECK ADD  CONSTRAINT [FK_User-Student_User1] FOREIGN KEY([User-ID])
REFERENCES [dbo].[User] ([User-ID])
GO
ALTER TABLE [dbo].[User-Student] CHECK CONSTRAINT [FK_User-Student_User1]
GO
ALTER TABLE [dbo].[User-Unemployed]  WITH CHECK ADD  CONSTRAINT [FK_User-Unemployed_Unemployed] FOREIGN KEY([Unemployed-ID])
REFERENCES [dbo].[Unemployed] ([Unemployed-ID])
GO
ALTER TABLE [dbo].[User-Unemployed] CHECK CONSTRAINT [FK_User-Unemployed_Unemployed]
GO
ALTER TABLE [dbo].[User-Unemployed]  WITH CHECK ADD  CONSTRAINT [FK_User-Unemployed_User] FOREIGN KEY([User-ID])
REFERENCES [dbo].[User] ([User-ID])
GO
ALTER TABLE [dbo].[User-Unemployed] CHECK CONSTRAINT [FK_User-Unemployed_User]
GO
USE [master]
GO
ALTER DATABASE [BURAKIDN] SET  READ_WRITE 
GO
