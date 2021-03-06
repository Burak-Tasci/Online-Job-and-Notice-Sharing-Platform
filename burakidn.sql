USE [master]
GO
/****** Object:  Database [BURAKIDN]    Script Date: 16.01.2021 23:49:59 ******/
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
/****** Object:  Table [dbo].[Certificates]    Script Date: 16.01.2021 23:50:00 ******/
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
/****** Object:  Table [dbo].[Connections]    Script Date: 16.01.2021 23:50:00 ******/
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
/****** Object:  Table [dbo].[Education]    Script Date: 16.01.2021 23:50:00 ******/
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
/****** Object:  Table [dbo].[Employee]    Script Date: 16.01.2021 23:50:00 ******/
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
/****** Object:  Table [dbo].[Graduated]    Script Date: 16.01.2021 23:50:00 ******/
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
/****** Object:  Table [dbo].[Languages]    Script Date: 16.01.2021 23:50:00 ******/
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
/****** Object:  Table [dbo].[LookingForEmployee]    Script Date: 16.01.2021 23:50:00 ******/
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
/****** Object:  Table [dbo].[LookingForJob]    Script Date: 16.01.2021 23:50:00 ******/
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
/****** Object:  Table [dbo].[Posts]    Script Date: 16.01.2021 23:50:00 ******/
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
/****** Object:  Table [dbo].[Student]    Script Date: 16.01.2021 23:50:00 ******/
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
/****** Object:  Table [dbo].[Unemployed]    Script Date: 16.01.2021 23:50:00 ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 16.01.2021 23:50:00 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User-Certificate]    Script Date: 16.01.2021 23:50:00 ******/
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
/****** Object:  Table [dbo].[User-Education]    Script Date: 16.01.2021 23:50:00 ******/
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
/****** Object:  Table [dbo].[User-Employee]    Script Date: 16.01.2021 23:50:00 ******/
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
/****** Object:  Table [dbo].[User-Graduated]    Script Date: 16.01.2021 23:50:00 ******/
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
/****** Object:  Table [dbo].[User-Languages]    Script Date: 16.01.2021 23:50:00 ******/
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
/****** Object:  Table [dbo].[User-LookingForEmployee]    Script Date: 16.01.2021 23:50:00 ******/
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
/****** Object:  Table [dbo].[User-LookingForJob]    Script Date: 16.01.2021 23:50:00 ******/
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
/****** Object:  Table [dbo].[User-Student]    Script Date: 16.01.2021 23:50:00 ******/
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
/****** Object:  Table [dbo].[User-Unemployed]    Script Date: 16.01.2021 23:50:00 ******/
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
SET IDENTITY_INSERT [dbo].[Education] ON 

INSERT [dbo].[Education] ([id], [Primary_School], [Secondry_School], [High_School], [University], [Extra]) VALUES (2, N'Macka', N'Macka', N'Cengizhan', N'Marmara', N'ITU')
INSERT [dbo].[Education] ([id], [Primary_School], [Secondry_School], [High_School], [University], [Extra]) VALUES (3, N'Kumport ortaokul', N'Kumport ortaokul', N'Bahçelievler anadolu', N'Marmara', N'')
INSERT [dbo].[Education] ([id], [Primary_School], [Secondry_School], [High_School], [University], [Extra]) VALUES (4, N'Bursa ilkokul', N'Canakkale', N'Cengizhan', N'DBU', N'')
INSERT [dbo].[Education] ([id], [Primary_School], [Secondry_School], [High_School], [University], [Extra]) VALUES (5, N'Yahya Kemal Ilkokulu', N'Nisantasi Ortaokulu', N'Cengizhan Anadolu Lisesi', N'Cambridge University', N'Kocaeli Üniversitesi Doktora')
SET IDENTITY_INSERT [dbo].[Education] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Employee-ID], [GraduateYear], [GradePointAverage], [Experience]) VALUES (1, CAST(N'2020-01-10' AS Date), 2.5, 2)
INSERT [dbo].[Employee] ([Employee-ID], [GraduateYear], [GradePointAverage], [Experience]) VALUES (2, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([Employee-ID], [GraduateYear], [GradePointAverage], [Experience]) VALUES (3, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([Employee-ID], [GraduateYear], [GradePointAverage], [Experience]) VALUES (4, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([Employee-ID], [GraduateYear], [GradePointAverage], [Experience]) VALUES (5, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Languages] ON 

INSERT [dbo].[Languages] ([id], [Language]) VALUES (2, N'English')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (3, N'Afar')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (4, N'Abkhazian')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (5, N'Afrikaans')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (6, N'Amharic')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (7, N'Arabic')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (8, N'Assamese')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (9, N'Aymara')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (10, N'Azerbaijani')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (11, N'Bashkir')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (12, N'Belarusian')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (13, N'Bulgarian')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (14, N'Bihari')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (15, N'Bislama')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (16, N'Bengali/Bangla')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (17, N'Tibetan')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (18, N'Breton')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (19, N'Catalan')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (20, N'Corsican')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (21, N'Czech')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (22, N'Welsh')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (23, N'Danish')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (24, N'German')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (25, N'Bhutani')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (26, N'Greek')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (27, N'Esperanto')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (28, N'Spanish')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (29, N'Estonian')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (30, N'Basque')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (31, N'Persian')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (32, N'Finnish')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (33, N'Fiji')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (34, N'Faeroese')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (35, N'French')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (36, N'Frisian')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (37, N'Irish')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (38, N'Scots/Gaelic')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (39, N'Galician')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (40, N'Guarani')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (41, N'Gujarati')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (42, N'Hausa')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (43, N'Hindi')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (44, N'Croatian')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (45, N'Hungarian')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (46, N'Armenian')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (47, N'Interlingua')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (48, N'Interlingue')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (49, N'Inupiak')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (50, N'Indonesian')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (51, N'Icelandic')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (52, N'Italian')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (53, N'Hebrew')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (54, N'Japanese')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (55, N'Yiddish')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (56, N'Javanese')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (57, N'Georgian')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (58, N'Kazakh')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (59, N'Greenlandic')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (60, N'Cambodian')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (61, N'Kannada')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (62, N'Korean')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (63, N'Kashmiri')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (64, N'Kurdish')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (65, N'Kirghiz')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (66, N'Latin')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (67, N'Lingala')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (68, N'Laothian')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (69, N'Lithuanian')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (70, N'Latvian/Lettish')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (71, N'Malagasy')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (72, N'Maori')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (73, N'Macedonian')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (74, N'Malayalam')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (75, N'Mongolian')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (76, N'Moldavian')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (77, N'Marathi')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (78, N'Malay')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (79, N'Maltese')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (80, N'Burmese')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (81, N'Nauru')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (82, N'Nepali')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (83, N'Dutch')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (84, N'Norwegian')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (85, N'Occitan')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (86, N'(Afan)/Oromoor/Oriya')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (87, N'Punjabi')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (88, N'Polish')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (89, N'Pashto/Pushto')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (90, N'Portuguese')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (91, N'Quechua')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (92, N'Rhaeto-Romance')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (93, N'Kirundi')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (94, N'Romanian')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (95, N'Russian')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (96, N'Kinyarwanda')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (97, N'Sanskrit')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (98, N'Sindhi')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (99, N'Sangro')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (100, N'Serbo-Croatian')
GO
INSERT [dbo].[Languages] ([id], [Language]) VALUES (101, N'Singhalese')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (102, N'Slovak')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (103, N'Slovenian')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (104, N'Samoan')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (105, N'Shona')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (106, N'Somali')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (107, N'Albanian')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (108, N'Serbian')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (109, N'Siswati')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (110, N'Sesotho')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (111, N'Sundanese')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (112, N'Swedish')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (113, N'Swahili')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (114, N'Tamil')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (115, N'Telugu')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (116, N'Tajik')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (117, N'Thai')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (118, N'Tigrinya')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (119, N'Turkmen')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (120, N'Tagalog')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (121, N'Setswana')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (122, N'Tonga')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (123, N'Turkish')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (124, N'Tsonga')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (125, N'Tatar')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (126, N'Twi')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (127, N'Ukrainian')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (128, N'Urdu')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (129, N'Uzbek')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (130, N'Vietnamese')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (131, N'Volapuk')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (132, N'Wolof')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (133, N'Xhosa')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (134, N'Yoruba')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (135, N'Chinese')
INSERT [dbo].[Languages] ([id], [Language]) VALUES (136, N'Zulu')
SET IDENTITY_INSERT [dbo].[Languages] OFF
GO
SET IDENTITY_INSERT [dbo].[LookingForEmployee] ON 

INSERT [dbo].[LookingForEmployee] ([LookingForEmployee-ID], [GraduateYear], [GradePointAverage], [Experience]) VALUES (1, CAST(N'2023-02-02' AS Date), 2.5, 2)
INSERT [dbo].[LookingForEmployee] ([LookingForEmployee-ID], [GraduateYear], [GradePointAverage], [Experience]) VALUES (2, NULL, NULL, NULL)
INSERT [dbo].[LookingForEmployee] ([LookingForEmployee-ID], [GraduateYear], [GradePointAverage], [Experience]) VALUES (3, CAST(N'2025-08-08' AS Date), 3.9, 3)
SET IDENTITY_INSERT [dbo].[LookingForEmployee] OFF
GO
SET IDENTITY_INSERT [dbo].[LookingForJob] ON 

INSERT [dbo].[LookingForJob] ([LookingForJob-ID], [GraduateYear], [GradePointAverage], [Experience]) VALUES (1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[LookingForJob] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Student-ID], [GraduateYear]) VALUES (12, NULL)
INSERT [dbo].[Student] ([Student-ID], [GraduateYear]) VALUES (13, NULL)
INSERT [dbo].[Student] ([Student-ID], [GraduateYear]) VALUES (14, NULL)
INSERT [dbo].[Student] ([Student-ID], [GraduateYear]) VALUES (15, NULL)
INSERT [dbo].[Student] ([Student-ID], [GraduateYear]) VALUES (16, NULL)
INSERT [dbo].[Student] ([Student-ID], [GraduateYear]) VALUES (17, NULL)
INSERT [dbo].[Student] ([Student-ID], [GraduateYear]) VALUES (18, NULL)
INSERT [dbo].[Student] ([Student-ID], [GraduateYear]) VALUES (19, NULL)
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[Unemployed] ON 

INSERT [dbo].[Unemployed] ([Unemployed-ID], [GraduateYear], [GradePointAverage]) VALUES (1, CAST(N'2024-02-02' AS Date), 2.5)
SET IDENTITY_INSERT [dbo].[Unemployed] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([User-ID], [Name], [Surname], [Age], [Mail], [Password], [SigninDate], [User], [Student], [Graduated], [Employee], [Unemployed], [LookingForJob], [LookingForEmployee]) VALUES (42, N'Burak', N'Tasci', 21, N'burak@mail.com', N'1234', CAST(N'2021-01-16' AS Date), 0, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[User] ([User-ID], [Name], [Surname], [Age], [Mail], [Password], [SigninDate], [User], [Student], [Graduated], [Employee], [Unemployed], [LookingForJob], [LookingForEmployee]) VALUES (43, N'Eyüp Emre', N'Ülkü', 35, N'emre.ulku@marmara.edu.tr', N'111222', CAST(N'2021-01-16' AS Date), 0, 0, 0, 1, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
INSERT [dbo].[User-Employee] ([User-ID], [Employee-ID]) VALUES (43, 3)
INSERT [dbo].[User-Employee] ([User-ID], [Employee-ID]) VALUES (43, 4)
INSERT [dbo].[User-Employee] ([User-ID], [Employee-ID]) VALUES (43, 5)
GO
INSERT [dbo].[User-Student] ([User-ID], [Student-ID]) VALUES (42, 19)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Unique_Mail]    Script Date: 16.01.2021 23:50:00 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [Unique_Mail] UNIQUE NONCLUSTERED 
(
	[Mail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
