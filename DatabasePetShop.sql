USE [master]
GO
/****** Object:  Database [pet_shop]    Script Date: 8/30/2023 9:01:06 PM ******/
CREATE DATABASE [pet_shop]
GO
ALTER DATABASE [pet_shop] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pet_shop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pet_shop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pet_shop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pet_shop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pet_shop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pet_shop] SET ARITHABORT OFF 
GO
ALTER DATABASE [pet_shop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [pet_shop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [pet_shop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pet_shop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pet_shop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [pet_shop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pet_shop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pet_shop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pet_shop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pet_shop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [pet_shop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [pet_shop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [pet_shop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [pet_shop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [pet_shop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pet_shop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [pet_shop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [pet_shop] SET RECOVERY FULL 
GO
ALTER DATABASE [pet_shop] SET  MULTI_USER 
GO
ALTER DATABASE [pet_shop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [pet_shop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [pet_shop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [pet_shop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [pet_shop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [pet_shop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'pet_shop', N'ON'
GO
ALTER DATABASE [pet_shop] SET QUERY_STORE = ON
GO
ALTER DATABASE [pet_shop] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [pet_shop]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 8/30/2023 9:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnimalCategories]    Script Date: 8/30/2023 9:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnimalCategories](
	[CategoryId] [int] NOT NULL,
	[AnimalId] [int] NOT NULL,
 CONSTRAINT [PK_AnimalCategories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC,
	[AnimalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Animals]    Script Date: 8/30/2023 9:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animals](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Animals] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 8/30/2023 9:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[CartId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_CartItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 8/30/2023 9:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TotalValue] [decimal](18, 2) NULL,
	[UserId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[Status] [nvarchar](30) NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 8/30/2023 9:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[ParentId] [int] NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategorySpecifications]    Script Date: 8/30/2023 9:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategorySpecifications](
	[CategoryId] [int] NOT NULL,
	[SpecificationId] [int] NOT NULL,
 CONSTRAINT [PK_CategorySpecifications] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC,
	[SpecificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 8/30/2023 9:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CommentText] [nvarchar](300) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 8/30/2023 9:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Path] [nvarchar](200) NOT NULL,
	[ProductId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prices]    Script Date: 8/30/2023 9:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [decimal](18, 2) NOT NULL,
	[StartedAt] [datetime2](7) NOT NULL,
	[EndedAt] [datetime2](7) NOT NULL,
	[ProductId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Prices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 8/30/2023 9:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](70) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specifications]    Script Date: 8/30/2023 9:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specifications](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Specifications] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpecificationValues]    Script Date: 8/30/2023 9:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecificationValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[SpecificationId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_SpecificationValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/30/2023 9:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[Username] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserUseCaseLogs]    Script Date: 8/30/2023 9:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUseCaseLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UseCaseName] [nvarchar](450) NOT NULL,
	[UserId] [int] NOT NULL,
	[Username] [nvarchar](450) NOT NULL,
	[Data] [nvarchar](max) NOT NULL,
	[IsAuthorized] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserUseCaseLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserUseCases]    Script Date: 8/30/2023 9:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUseCases](
	[UserId] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
 CONSTRAINT [PK_UserUseCases] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[UseCaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230724195309_CreatingDatabase', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230724230328_ChangeUserTable', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230725222754_UseCaseMigration', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230731213809_CorrectPassword', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230807230003_AddingsForLogs', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230826211449_UserUseCaseLogs', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230826213643_UserLogEntry', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230826220647_AddTableUserUseCaseLog', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230830001114_CartStatus', N'5.0.17')
GO
INSERT [dbo].[AnimalCategories] ([CategoryId], [AnimalId]) VALUES (1, 18)
INSERT [dbo].[AnimalCategories] ([CategoryId], [AnimalId]) VALUES (2, 18)
INSERT [dbo].[AnimalCategories] ([CategoryId], [AnimalId]) VALUES (3, 18)
GO
SET IDENTITY_INSERT [dbo].[Animals] ON 

INSERT [dbo].[Animals] ([Id], [Name], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (1, N'Pas', CAST(N'2023-08-08T18:40:16.0002528' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Animals] ([Id], [Name], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (16, N'Macke', CAST(N'2023-08-08T21:44:17.5034608' AS DateTime2), 1, NULL, NULL, CAST(N'2023-08-09T15:42:32.8618858' AS DateTime2), NULL)
INSERT [dbo].[Animals] ([Id], [Name], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (17, N'Hrcak', CAST(N'2023-08-29T15:08:18.9946480' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Animals] ([Id], [Name], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (18, N'Ptice', CAST(N'2023-08-29T15:09:32.2221553' AS DateTime2), 1, NULL, NULL, CAST(N'2023-08-29T19:29:04.6568906' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Animals] OFF
GO
SET IDENTITY_INSERT [dbo].[CartItems] ON 

INSERT [dbo].[CartItems] ([Id], [Quantity], [ProductId], [CartId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (13, 1, 2, 9, CAST(N'2023-08-30T17:13:58.7124386' AS DateTime2), 0, CAST(N'2023-08-30T17:33:21.3183146' AS DateTime2), NULL, CAST(N'2023-08-30T17:32:25.5128827' AS DateTime2), NULL)
INSERT [dbo].[CartItems] ([Id], [Quantity], [ProductId], [CartId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (14, 1, 3, 9, CAST(N'2023-08-30T17:14:05.8299224' AS DateTime2), 0, CAST(N'2023-08-30T17:33:21.3184146' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[CartItems] ([Id], [Quantity], [ProductId], [CartId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (15, 2, 3, 10, CAST(N'2023-08-30T17:33:59.4256631' AS DateTime2), 1, NULL, NULL, CAST(N'2023-08-30T17:35:06.1699992' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[CartItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Carts] ON 

INSERT [dbo].[Carts] ([Id], [TotalValue], [UserId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy], [Status]) VALUES (9, CAST(0.00 AS Decimal(18, 2)), 6, CAST(N'2023-08-30T17:13:58.7124366' AS DateTime2), 0, CAST(N'2023-08-30T17:33:21.3184212' AS DateTime2), NULL, CAST(N'2023-08-30T17:32:25.5125629' AS DateTime2), NULL, NULL)
INSERT [dbo].[Carts] ([Id], [TotalValue], [UserId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy], [Status]) VALUES (10, CAST(3000.00 AS Decimal(18, 2)), 6, CAST(N'2023-08-30T17:33:59.4256606' AS DateTime2), 1, NULL, NULL, CAST(N'2023-08-30T17:35:06.1699979' AS DateTime2), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Carts] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [ParentId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (1, N'Hrana', NULL, CAST(N'2023-07-29T14:27:47.5324379' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (2, N'Igracke', NULL, CAST(N'2023-07-29T15:07:58.2418943' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (3, N'Granule za pse', NULL, CAST(N'2023-08-08T23:01:58.0552297' AS DateTime2), 1, NULL, NULL, CAST(N'2023-08-26T22:21:08.8157211' AS DateTime2), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (4, N'Loptice', NULL, CAST(N'2023-08-08T23:02:48.4771660' AS DateTime2), 0, CAST(N'2023-08-30T16:02:56.4155883' AS DateTime2), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
INSERT [dbo].[CategorySpecifications] ([CategoryId], [SpecificationId]) VALUES (4, 2)
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [CommentText], [UserId], [ProductId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (1, N'Jako zanimljivi plisani misevi, macka ih obozava!', 6, 2, CAST(N'2023-08-30T18:00:59.5460045' AS DateTime2), 0, CAST(N'2023-08-30T18:35:51.7031141' AS DateTime2), NULL, CAST(N'2023-08-30T18:22:06.6593255' AS DateTime2), NULL)
INSERT [dbo].[Comments] ([Id], [CommentText], [UserId], [ProductId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (2, N'Super igracka za hrcke', 6, 3, CAST(N'2023-08-30T18:37:15.3877938' AS DateTime2), 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([Id], [Path], [ProductId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (1, N'2023698b-a687-4ae1-bc12-359e70ac9460.jpg', 2, CAST(N'2023-08-28T22:37:12.4809715' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Images] ([Id], [Path], [ProductId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (2, N'cdd8e0e1-b986-4ba2-aa96-743ceadc5cb4.jpg', 2, CAST(N'2023-08-28T23:57:31.8699920' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Images] ([Id], [Path], [ProductId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (3, N'c65b34c0-db84-4d56-9fea-16cc2e534293.jpg', 2, CAST(N'2023-08-28T23:58:50.8277838' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Images] ([Id], [Path], [ProductId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (4, N'146b3c25-75de-4121-8cdf-9a9de6279fbc.jpg', 2, CAST(N'2023-08-29T00:02:44.5569546' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Images] ([Id], [Path], [ProductId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (5, N'131f57e6-9399-4a0e-85a0-3e1cfcaa5d34.jpg', 2, CAST(N'2023-08-29T00:06:28.9437738' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Images] ([Id], [Path], [ProductId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (6, N'bb18ddcd-b6ba-47d9-b776-7c905dabf44a.jpg', 2, CAST(N'2023-08-29T00:07:32.1633246' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Images] ([Id], [Path], [ProductId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (8, N'60a35d4b-c405-40a8-9435-554d60e61630.jpg', 2, CAST(N'2023-08-29T00:11:30.7389197' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Images] ([Id], [Path], [ProductId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (9, N'0bca81c7-3361-4c5d-891d-b8cc1b32d633.jpg', 3, CAST(N'2023-08-29T20:05:16.4114700' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Images] ([Id], [Path], [ProductId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (11, N'722c7075-b70a-490a-bd5c-cb91903ba902.jpg', 5, CAST(N'2023-08-29T20:08:38.2866503' AS DateTime2), 0, CAST(N'2023-08-29T22:21:06.9975881' AS DateTime2), N'pera.peric@gmail.com', CAST(N'2023-08-29T20:21:07.0166230' AS DateTime2), NULL)
INSERT [dbo].[Images] ([Id], [Path], [ProductId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (13, N'aa5feaaa-21fb-490d-b1bd-05a92b70586f.jpg', 7, CAST(N'2023-08-29T20:51:45.3811032' AS DateTime2), 0, CAST(N'2023-08-29T22:52:40.8716877' AS DateTime2), N'pera.peric@gmail.com', CAST(N'2023-08-29T20:52:40.8726809' AS DateTime2), NULL)
INSERT [dbo].[Images] ([Id], [Path], [ProductId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (14, N'a52cef6c-20b3-48dc-a5dc-89a40a91a8db.jpg', 8, CAST(N'2023-08-29T20:54:12.7340025' AS DateTime2), 0, CAST(N'2023-08-29T22:54:21.1587688' AS DateTime2), N'pera.peric@gmail.com', CAST(N'2023-08-29T20:54:21.1599185' AS DateTime2), NULL)
INSERT [dbo].[Images] ([Id], [Path], [ProductId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (15, N'7159901e-b99b-4825-aef9-281dad09f538.jpg', 9, CAST(N'2023-08-29T21:26:20.4655493' AS DateTime2), 0, CAST(N'2023-08-29T21:26:47.1148674' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Images] ([Id], [Path], [ProductId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (16, N'db735ec6-fbea-48e1-af1b-8518ecf9e0c4.jpg', 10, CAST(N'2023-08-29T21:27:43.8793928' AS DateTime2), 0, CAST(N'2023-08-29T21:27:49.3955235' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Images] ([Id], [Path], [ProductId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (17, N'0d15388d-15f3-41e5-9d18-f024bf9576e2.jpg', 11, CAST(N'2023-08-29T21:29:17.8492139' AS DateTime2), 0, CAST(N'2023-08-29T21:29:24.3000226' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Images] ([Id], [Path], [ProductId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (18, N'2c946f27-efff-4aea-ad4f-8bca01598514.jpg', 12, CAST(N'2023-08-29T21:32:44.0491524' AS DateTime2), 0, CAST(N'2023-08-29T21:38:40.6921114' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Images] ([Id], [Path], [ProductId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (19, N'7f49bd1d-04a0-4567-adbe-a42c8e69a509.jpg', 13, CAST(N'2023-08-29T21:43:03.8968041' AS DateTime2), 0, CAST(N'2023-08-29T21:43:13.0946519' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Images] ([Id], [Path], [ProductId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (20, N'f16387c3-0c5a-4c12-853d-f4bd0bf915cd.jpg', 14, CAST(N'2023-08-29T21:48:14.6377821' AS DateTime2), 0, CAST(N'2023-08-29T21:48:20.8217141' AS DateTime2), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Images] OFF
GO
SET IDENTITY_INSERT [dbo].[Prices] ON 

INSERT [dbo].[Prices] ([Id], [Value], [StartedAt], [EndedAt], [ProductId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (2, CAST(590.00 AS Decimal(18, 2)), CAST(N'2023-08-28T22:37:12.3976132' AS DateTime2), CAST(N'2023-08-29T00:11:30.7298871' AS DateTime2), 2, CAST(N'2023-08-28T22:37:12.4809695' AS DateTime2), 0, NULL, NULL, CAST(N'2023-08-29T00:11:30.7300848' AS DateTime2), NULL)
INSERT [dbo].[Prices] ([Id], [Value], [StartedAt], [EndedAt], [ProductId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (3, CAST(650.00 AS Decimal(18, 2)), CAST(N'2023-08-29T00:07:32.0160872' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, CAST(N'2023-08-29T00:07:32.0729463' AS DateTime2), 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Prices] ([Id], [Value], [StartedAt], [EndedAt], [ProductId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (5, CAST(750.00 AS Decimal(18, 2)), CAST(N'2023-08-29T00:11:30.7298880' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, CAST(N'2023-08-29T00:11:30.7300842' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Prices] ([Id], [Value], [StartedAt], [EndedAt], [ProductId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (6, CAST(1500.00 AS Decimal(18, 2)), CAST(N'2023-08-29T20:05:16.3141270' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 3, CAST(N'2023-08-29T20:05:16.4114676' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Prices] ([Id], [Value], [StartedAt], [EndedAt], [ProductId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (8, CAST(1600.00 AS Decimal(18, 2)), CAST(N'2023-08-29T20:08:38.2863898' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 5, CAST(N'2023-08-29T20:08:38.2866498' AS DateTime2), 0, CAST(N'2023-08-29T20:21:06.9683174' AS DateTime2), N'pera.peric@gmail.com', CAST(N'2023-08-29T20:21:07.0166219' AS DateTime2), NULL)
INSERT [dbo].[Prices] ([Id], [Value], [StartedAt], [EndedAt], [ProductId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (10, CAST(1700.00 AS Decimal(18, 2)), CAST(N'2023-08-29T20:51:45.2790662' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 7, CAST(N'2023-08-29T20:51:45.3811011' AS DateTime2), 0, CAST(N'2023-08-29T20:52:40.8638597' AS DateTime2), N'pera.peric@gmail.com', CAST(N'2023-08-29T20:52:40.8726802' AS DateTime2), NULL)
INSERT [dbo].[Prices] ([Id], [Value], [StartedAt], [EndedAt], [ProductId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (11, CAST(1700.00 AS Decimal(18, 2)), CAST(N'2023-08-29T20:54:12.6474196' AS DateTime2), CAST(N'2023-08-29T20:54:21.1485617' AS DateTime2), 8, CAST(N'2023-08-29T20:54:12.7340004' AS DateTime2), 0, CAST(N'2023-08-29T20:54:21.1486335' AS DateTime2), N'pera.peric@gmail.com', CAST(N'2023-08-29T20:54:21.1599175' AS DateTime2), NULL)
INSERT [dbo].[Prices] ([Id], [Value], [StartedAt], [EndedAt], [ProductId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (12, CAST(1700.00 AS Decimal(18, 2)), CAST(N'2023-08-29T21:26:20.3701393' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 9, CAST(N'2023-08-29T21:26:20.4655476' AS DateTime2), 0, CAST(N'2023-08-29T21:26:47.1143820' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Prices] ([Id], [Value], [StartedAt], [EndedAt], [ProductId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (13, CAST(1700.00 AS Decimal(18, 2)), CAST(N'2023-08-29T21:27:43.8790662' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 10, CAST(N'2023-08-29T21:27:43.8793924' AS DateTime2), 0, CAST(N'2023-08-29T21:27:49.3955149' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Prices] ([Id], [Value], [StartedAt], [EndedAt], [ProductId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (14, CAST(1700.00 AS Decimal(18, 2)), CAST(N'2023-08-29T21:29:17.8488683' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 11, CAST(N'2023-08-29T21:29:17.8492132' AS DateTime2), 0, CAST(N'2023-08-29T21:29:24.3000145' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Prices] ([Id], [Value], [StartedAt], [EndedAt], [ProductId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (15, CAST(1700.00 AS Decimal(18, 2)), CAST(N'2023-08-29T21:32:43.9594872' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 12, CAST(N'2023-08-29T21:32:44.0491497' AS DateTime2), 0, CAST(N'2023-08-29T21:38:40.6919346' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Prices] ([Id], [Value], [StartedAt], [EndedAt], [ProductId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (16, CAST(1700.00 AS Decimal(18, 2)), CAST(N'2023-08-29T21:43:03.8078289' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 13, CAST(N'2023-08-29T21:43:03.8968020' AS DateTime2), 0, CAST(N'2023-08-29T21:43:13.0944576' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Prices] ([Id], [Value], [StartedAt], [EndedAt], [ProductId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (17, CAST(1700.00 AS Decimal(18, 2)), CAST(N'2023-08-29T21:48:14.6370687' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 14, CAST(N'2023-08-29T21:48:14.6377804' AS DateTime2), 0, CAST(N'2023-08-29T21:48:20.8217053' AS DateTime2), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Prices] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Title], [CategoryId], [Description], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (2, N'Plisani misevi', 2, N'Plisani misevi igracka za macke', CAST(N'2023-08-28T22:37:12.3657811' AS DateTime2), 1, NULL, NULL, CAST(N'2023-08-29T00:02:44.5569568' AS DateTime2), NULL)
INSERT [dbo].[Products] ([Id], [Title], [CategoryId], [Description], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (3, N'Kucica za hrcka', 2, N'Plasticna kucica za hrcke', CAST(N'2023-08-29T20:05:16.2751931' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([Id], [Title], [CategoryId], [Description], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (5, N'Proizvod1', 2, N'Treci proizvod', CAST(N'2023-08-29T20:08:38.2821202' AS DateTime2), 0, CAST(N'2023-08-29T20:21:06.9979862' AS DateTime2), N'pera.peric@gmail.com', CAST(N'2023-08-29T20:21:07.0163949' AS DateTime2), NULL)
INSERT [dbo].[Products] ([Id], [Title], [CategoryId], [Description], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (7, N'Proizvod2', 2, N'Cetvrti proizvod', CAST(N'2023-08-29T20:51:45.2450349' AS DateTime2), 0, CAST(N'2023-08-29T20:52:40.8722050' AS DateTime2), N'pera.peric@gmail.com', CAST(N'2023-08-29T20:52:40.8724520' AS DateTime2), NULL)
INSERT [dbo].[Products] ([Id], [Title], [CategoryId], [Description], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (8, N'Proizvod3', 2, N'Peti proizvod', CAST(N'2023-08-29T20:54:12.6235961' AS DateTime2), 0, CAST(N'2023-08-29T20:54:21.1593320' AS DateTime2), N'pera.peric@gmail.com', CAST(N'2023-08-29T20:54:21.1596563' AS DateTime2), NULL)
INSERT [dbo].[Products] ([Id], [Title], [CategoryId], [Description], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (9, N'Proizvod4', 2, N'Sesti proizvod', CAST(N'2023-08-29T21:26:20.3330134' AS DateTime2), 0, CAST(N'2023-08-29T21:26:47.1148824' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Products] ([Id], [Title], [CategoryId], [Description], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (10, N'Proizvod5', 2, N'Sesti proizvod', CAST(N'2023-08-29T21:27:43.8759747' AS DateTime2), 0, CAST(N'2023-08-29T21:27:49.3955320' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Products] ([Id], [Title], [CategoryId], [Description], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (11, N'Proizvod6', 2, N'Sesti proizvod', CAST(N'2023-08-29T21:29:17.8454590' AS DateTime2), 0, CAST(N'2023-08-29T21:29:24.3000301' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Products] ([Id], [Title], [CategoryId], [Description], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (12, N'Proizvod7', 2, N'Sedmi proizvod', CAST(N'2023-08-29T21:32:43.9254620' AS DateTime2), 0, CAST(N'2023-08-29T21:38:40.6921286' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Products] ([Id], [Title], [CategoryId], [Description], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (13, N'Proizvod8', 2, N'Sedmi proizvod', CAST(N'2023-08-29T21:43:03.7778858' AS DateTime2), 0, CAST(N'2023-08-29T21:43:13.0946617' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Products] ([Id], [Title], [CategoryId], [Description], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (14, N'Proizvod9', 2, N'Sedmi proizvod', CAST(N'2023-08-29T21:48:14.6324471' AS DateTime2), 0, CAST(N'2023-08-29T21:48:20.8217241' AS DateTime2), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Specifications] ON 

INSERT [dbo].[Specifications] ([Id], [Name], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (1, N'Boja', CAST(N'2023-08-27T21:15:43.8805652' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Specifications] ([Id], [Name], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (2, N'Materijal', CAST(N'2023-08-28T13:49:53.0607499' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Specifications] ([Id], [Name], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (3, N'Tvrdoca', CAST(N'2023-08-29T19:37:55.7562996' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Specifications] ([Id], [Name], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (4, N'Rastegljivost', CAST(N'2023-08-29T19:43:37.0666035' AS DateTime2), 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Specifications] OFF
GO
SET IDENTITY_INSERT [dbo].[SpecificationValues] ON 

INSERT [dbo].[SpecificationValues] ([Id], [Value], [SpecificationId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (1, N'Crna', 1, CAST(N'2023-08-27T21:18:16.4974916' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[SpecificationValues] ([Id], [Value], [SpecificationId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (3, N'Plastika', 2, CAST(N'2023-08-28T13:49:53.1201641' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[SpecificationValues] ([Id], [Value], [SpecificationId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (4, N'Guma', 2, CAST(N'2023-08-28T13:49:53.1201665' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[SpecificationValues] ([Id], [Value], [SpecificationId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (8, N'Rastegljivo', 4, CAST(N'2023-08-29T19:43:37.1210864' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[SpecificationValues] ([Id], [Value], [SpecificationId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (9, N'Kruto', 4, CAST(N'2023-08-29T19:43:37.1210882' AS DateTime2), 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SpecificationValues] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy], [Username]) VALUES (1, N'Ana', N'Blagojevic', N'ana.blagojevic.99.20@ict.edu.rs', N'$2a$11$3YxidQCX.dbfOeUzogmz1ORVXSwkHEnpFVchKtTzHQ/KFCN2MQlMG', CAST(N'2023-07-30T22:55:14.5524000' AS DateTime2), 1, NULL, NULL, CAST(N'2023-08-27T16:26:18.8016542' AS DateTime2), NULL, N'ana_b5')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy], [Username]) VALUES (6, N'Pera', N'Peric', N'pera.peric@gmail.com', N'$2a$11$JgHk59OQYOeunGSQLYxQfOc2X7CdE9IpOKVFRwgAaAQk7daz85.im', CAST(N'2023-07-31T21:44:31.3840797' AS DateTime2), 1, NULL, NULL, CAST(N'2023-08-27T19:54:01.8624694' AS DateTime2), NULL, N'pera_pera2')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserUseCaseLogs] ON 

INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (1, N'Update category using EF', 6, N'pera.peric@gmail.com', N'{"Id":3,"Data":{"Name":"Granule za psec","ParentCategoryId":1}}', 1, CAST(N'2023-08-26T22:20:22.9036023' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (2, N'Update category using EF', 6, N'pera.peric@gmail.com', N'{"Id":3,"Data":{"Name":"Granule za pse","ParentCategoryId":1}}', 1, CAST(N'2023-08-26T22:21:08.7956944' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (3, N'User registration', 0, N'Anonymous', N'{"Email":"anab@gmail.com","Username":"anablagojevic","FirstName":"Ana","LastName":"Blagojevic","Password":"AnaMateja2!","Id":0}', 0, CAST(N'2023-08-26T22:25:03.1353351' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (4, N'User registration', 0, N'Anonymous', N'{"Email":"ana.blagojevic.99.20@ict.edu.rs","Username":"anablagojevic","FirstName":"Ana","LastName":"Blagojevic","Password":"AnaMateja2!","Id":0}', 0, CAST(N'2023-08-26T22:27:35.9236581' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (5, N'User registration', 0, N'Anonymous', N'{"Email":"ana.blagojevic.99.20@ict.edu.rs","Username":"anablagojevic","FirstName":"Ana","LastName":"Blagojevic","Password":"AnaMateja2!","Id":0}', 0, CAST(N'2023-08-26T22:29:51.0526406' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (6, N'User registration', 0, N'Anonymous', N'{"Email":"ana.blagojevic.99.20@ict.edu.rs","Username":"anablagojevic","FirstName":"Ana","LastName":"Blagojevic","Password":"AnaMateja2!","Id":0}', 0, CAST(N'2023-08-26T22:31:40.5020365' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (7, N'Update user use case', 6, N'pera.peric@gmail.com', N'{"UserId":6,"UseCaseIds":[1,2,4,5,6,7,8,9,10,11,12,13,14]}', 1, CAST(N'2023-08-26T22:42:24.5469354' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (8, N'User registration', 0, N'Anonymous', N'{"Email":"ana.blagojevic.99.20@ict.edu.rs","Username":"anablagojevic","FirstName":"Ana","LastName":"Blagojevic","Password":"AnaMateja2!","Id":0}', 0, CAST(N'2023-08-26T22:42:45.9547874' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (9, N'User registration', 0, N'Anonymous', N'{"Email":"ana.blagojevic.99.20@ict.edu.rs","Username":"anablagojevic","FirstName":"Ana","LastName":"Blagojevic","Password":"AnaMateja2!","Id":0}', 0, CAST(N'2023-08-26T22:44:32.9754825' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (10, N'User registration', 6, N'pera.peric@gmail.com', N'{"Email":"ana.blagojevic.99.20@ict.edu.rs","Username":"anablagojevic","FirstName":"Ana","LastName":"Blagojevic","Password":"AnaMateja2!","Id":0}', 0, CAST(N'2023-08-26T22:46:27.6210082' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (11, N'User registration', 0, N'Anonymous', N'{"Email":"ana.blagojevic.99.20@ict.edu.rs","Username":"anablagojevic","FirstName":"Ana","LastName":"Blagojevic","Password":"AnaMateja2!","Id":0}', 0, CAST(N'2023-08-26T22:47:56.0894999' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (12, N'User registration', 0, N'Anonymous', N'{"Email":"ana.blagojevic.99.20@ict.edu.rs","Username":"anablagojevic","FirstName":"Ana","LastName":"Blagojevic","Password":"AnaMateja2!","Id":0}', 0, CAST(N'2023-08-26T22:49:02.7811102' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (13, N'Search user use case logs using EF', 0, N'Anonymous', N'{"Keyword":"category"}', 0, CAST(N'2023-08-26T23:58:03.7630945' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (14, N'Search user use case logs using EF', 0, N'Anonymous', N'{"Keyword":"category"}', 0, CAST(N'2023-08-26T23:59:00.0668759' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (15, N'Search user use case logs using EF', 6, N'pera.peric@gmail.com', N'{"Keyword":null}', 1, CAST(N'2023-08-27T00:02:00.4374300' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (16, N'Search user use case logs using EF', 6, N'pera.peric@gmail.com', N'{"Keyword":null}', 1, CAST(N'2023-08-27T00:02:37.2318195' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (17, N'Search user use case logs using EF', 6, N'pera.peric@gmail.com', N'{"Keyword":null}', 1, CAST(N'2023-08-27T00:02:56.7183833' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (18, N'Search user use case logs using EF', 6, N'pera.peric@gmail.com', N'{"Keyword":null}', 1, CAST(N'2023-08-27T00:03:25.6793402' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (19, N'Search user use case logs using EF', 6, N'pera.peric@gmail.com', N'{"Keyword":null}', 1, CAST(N'2023-08-27T00:04:03.2566530' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (20, N'Search user use case logs using EF', 6, N'pera.peric@gmail.com', N'{"Keyword":null}', 1, CAST(N'2023-08-27T00:05:36.0607877' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (21, N'Search user use case logs using EF', 0, N'Anonymous', N'{"Keyword":"cat"}', 0, CAST(N'2023-08-27T00:07:49.8838424' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (22, N'Search user use case logs using EF', 6, N'pera.peric@gmail.com', N'{"Keyword":"cat"}', 1, CAST(N'2023-08-27T00:14:22.3550653' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (23, N'Search user use case logs using EF', 6, N'pera.peric@gmail.com', N'{"Username":"pera","FromDate":null,"ToDate":null,"Keyword":"cat"}', 1, CAST(N'2023-08-27T14:24:21.3158959' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (24, N'Search user use case logs using EF', 6, N'pera.peric@gmail.com', N'{"Username":"pera.peric@gmail.com","FromDate":null,"ToDate":null,"Keyword":"cat"}', 1, CAST(N'2023-08-27T14:24:51.4218774' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (25, N'Search user use case logs using EF', 6, N'pera.peric@gmail.com', N'{"Username":null,"FromDate":null,"ToDate":null,"Keyword":"cat"}', 1, CAST(N'2023-08-27T14:25:07.9020594' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (26, N'Search user use case logs using EF', 6, N'pera.peric@gmail.com', N'{"Username":"pera.peric@gmail.com","FromDate":null,"ToDate":null,"Keyword":null}', 1, CAST(N'2023-08-27T14:25:21.0012023' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (27, N'Search user use case logs using EF', 6, N'pera.peric@gmail.com', N'{"Username":null,"FromDate":"2023-08-01T00:00:00","ToDate":"2023-08-15T00:00:00","Keyword":null}', 1, CAST(N'2023-08-27T14:25:48.7988598' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (28, N'Search user use case logs using EF', 6, N'pera.peric@gmail.com', N'{"Username":null,"FromDate":"2023-08-25T00:00:00","ToDate":"2023-08-28T00:00:00","Keyword":null}', 1, CAST(N'2023-08-27T14:26:11.4796737' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (29, N'Update user credentials using EF.', 6, N'pera.peric@gmail.com', N'{"FirstName":"Petar","LastName":null,"NewEmail":null,"NewUsername":null,"NewPassword":null,"Id":6}', 0, CAST(N'2023-08-27T16:16:39.9735189' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (30, N'Update user credentials using EF.', 6, N'pera.peric@gmail.com', N'{"FirstName":"Petar","LastName":null,"NewEmail":null,"NewUsername":null,"NewPassword":null,"Id":6}', 0, CAST(N'2023-08-27T16:18:01.1477649' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (31, N'Update user credentials using EF.', 6, N'pera.peric@gmail.com', N'{"FirstName":"Petar","LastName":null,"NewEmail":null,"NewUsername":null,"NewPassword":null,"Id":6}', 0, CAST(N'2023-08-27T16:19:24.0153477' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (32, N'Update user credentials using EF.', 6, N'pera.peric@gmail.com', N'{"FirstName":"Petar","LastName":null,"NewEmail":null,"NewUsername":null,"NewPassword":null,"Id":6}', 1, CAST(N'2023-08-27T16:21:06.3336762' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (33, N'Update user credentials using EF.', 6, N'pera.peric@gmail.com', N'{"FirstName":"Petar","LastName":"Peric","NewEmail":"pera.peric@gmail.com","NewUsername":"pera_pera2","NewPassword":"Pera123!","Id":6}', 1, CAST(N'2023-08-27T16:23:31.0305432' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (34, N'Update user credentials using EF.', 6, N'pera.peric@gmail.com', N'{"FirstName":"Anaaa","LastName":"Blagojevic","NewEmail":"ana.blagojevic.99.20@ict.edu.rs","NewUsername":"pea1232","NewPassword":"Pera123!","Id":1}', 1, CAST(N'2023-08-27T16:24:59.0844418' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (35, N'Update user credentials using EF.', 6, N'pera.peric@gmail.com', N'{"FirstName":"Ana","LastName":"Blagojevic","NewEmail":"ana.blagojevic.99.20@ict.edu.rs","NewUsername":"ana_b5","NewPassword":"Ana12345!","Id":1}', 1, CAST(N'2023-08-27T16:26:18.5750938' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (36, N'Update user credentials using EF.', 6, N'pera.peric@gmail.com', N'{"FirstName":"Anaa","LastName":"Blagojevic","NewEmail":"ana.blagojevic.99.20@ict.edu.rs","NewUsername":"ana_b5","NewPassword":"Ana12345!","Id":1}', 1, CAST(N'2023-08-27T16:45:57.9455214' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (37, N'Update user credentials using EF.', 6, N'pera.peric@gmail.com', N'{"FirstName":"Anaa","LastName":"Blagojevic","NewEmail":"ana.blagojevic.9920@ict.edu.rs","NewUsername":"ana_b55","NewPassword":"Ana12345!","Id":1}', 1, CAST(N'2023-08-27T16:46:41.5630375' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (38, N'Update user credentials using EF.', 6, N'pera.peric@gmail.com', N'{"FirstName":"Anaaa","LastName":"Blagojevic","NewEmail":"ana.blagojevic.9920@ict.edu.rs","NewUsername":"ana_b55","NewPassword":"Ana12345!","Id":1}', 1, CAST(N'2023-08-27T16:49:33.7894595' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (39, N'Update user credentials using EF.', 6, N'pera.peric@gmail.com', N'{"FirstName":"Ana","LastName":"Blagojevic","NewEmail":"ana.blagojevic.9920@ict.edu.rs","NewUsername":"ana_b55","NewPassword":"Ana12345!","Id":1}', 1, CAST(N'2023-08-27T16:53:20.2680234' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (40, N'Update user credentials using EF.', 6, N'pera.peric@gmail.com', N'{"FirstName":"Pera","LastName":"Peric","NewEmail":"pera.peric@gmail.com","NewUsername":"pera_pera2","NewPassword":"Pera123!","Id":6}', 1, CAST(N'2023-08-27T16:54:42.0495578' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (41, N'Update user credentials using EF.', 6, N'pera.peric@gmail.com', N'{"FirstName":"Petar","LastName":"Peric","NewEmail":"pera.peric@gmail.com","NewUsername":"pera_pera2","NewPassword":"Pera123!","Id":6}', 1, CAST(N'2023-08-27T19:30:21.6159317' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (42, N'Update user credentials using EF.', 6, N'pera.peric@gmail.com', N'{"FirstName":"Petar","LastName":"Peric","NewEmail":"pera.peric@gmail.com","NewUsername":"pera_pera2","NewPassword":"Pera123!","Id":6}', 1, CAST(N'2023-08-27T19:51:18.0610525' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (43, N'Update user credentials using EF.', 6, N'pera.peric@gmail.com', N'{"FirstName":"Petar","LastName":"Peric","NewEmail":"pera.peric@gmail.com","NewUsername":"pera_pera2","NewPassword":"Pera123!","Id":6}', 1, CAST(N'2023-08-27T19:53:27.6872778' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (44, N'Update user credentials using EF.', 6, N'pera.peric@gmail.com', N'{"FirstName":"Pera","LastName":"Peric","NewEmail":"pera.peric@gmail.com","NewUsername":"pera_pera2","NewPassword":"Pera123!","Id":6}', 1, CAST(N'2023-08-27T19:54:01.6070032' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (45, N'Update user credentials using EF.', 6, N'pera.peric@gmail.com', N'{"FirstName":"Pera","LastName":"Peric","NewEmail":"pera.peric@gmail.com","NewUsername":"pera_pera2","NewPassword":"Pera123!","Id":1}', 1, CAST(N'2023-08-27T19:54:17.7792245' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (46, N'User registration', 6, N'pera.peric@gmail.com', N'{"Email":"ana@gmail.com","Username":"anablagojevic","FirstName":"Ana","LastName":"Blagojevic","Password":"AnaMateja2!"}', 1, CAST(N'2023-08-27T20:07:53.2440626' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (47, N'User registration', 6, N'pera.peric@gmail.com', N'{"Email":"ana@gmail.com","Username":"anablagojevic_5","FirstName":"Ana","LastName":"Blagojevic","Password":"AnaMateja2!"}', 1, CAST(N'2023-08-27T20:08:09.5530427' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (48, N'User registration', 6, N'pera.peric@gmail.com', N'{"Email":"ana@gmail.com","Username":"ana_bl_5","FirstName":"Ana","LastName":"Blagojevic","Password":"AnaMateja2!"}', 1, CAST(N'2023-08-27T20:08:49.3874576' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (49, N'Delete user using EF', 7, N'ana@gmail.com', N'7', 0, CAST(N'2023-08-27T20:12:33.3721323' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (50, N'Delete user using EF', 7, N'ana@gmail.com', N'7', 1, CAST(N'2023-08-27T20:14:00.4066990' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (51, N'Delete user using EF', 7, N'ana@gmail.com', N'1', 1, CAST(N'2023-08-27T20:15:03.3448029' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (52, N'Delete user using EF', 6, N'pera.peric@gmail.com', N'1', 1, CAST(N'2023-08-27T20:16:05.3903603' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (53, N'Delete user using EF', 6, N'pera.peric@gmail.com', N'1', 1, CAST(N'2023-08-27T20:19:40.5706420' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (54, N'Create specification using EF', 6, N'pera.peric@gmail.com', N'{"Name":"Boja","Values":["Crvena","Crna"],"Id":0}', 1, CAST(N'2023-08-27T21:15:43.6634494' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (55, N'Update specification using EF.', 6, N'pera.peric@gmail.com', N'{"Value":"Crna","SpecificationId":1}', 1, CAST(N'2023-08-27T21:18:15.4192680' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (56, N'Update specification using EF.', 6, N'pera.peric@gmail.com', N'{"Value":"Crna","SpecificationId":1}', 1, CAST(N'2023-08-27T21:18:33.7058746' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (57, N'Create specification using EF', 6, N'pera.peric@gmail.com', N'{"Name":"Materijal","Values":["Plastika","Guma"],"Id":0}', 1, CAST(N'2023-08-28T13:48:38.8705014' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (58, N'Create specification using EF', 6, N'pera.peric@gmail.com', N'{"Name":"Materijal","Values":["Plastika","Guma"],"Id":0}', 1, CAST(N'2023-08-28T13:49:51.8824244' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (59, N'Create product using EF', 6, N'pera.peric@gmail.com', N'{"Title":"Proizvod 1","CategoryId":1,"Description":"Prvi proizvod u bazi","PriceValue":2500.0}', 0, CAST(N'2023-08-28T21:18:43.2645225' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (60, N'Create product using EF', 6, N'pera.peric@gmail.com', N'{"Title":"Proizvod 1","CategoryId":1,"Description":"Prvi proizvod u bazi","PriceValue":2500.0}', 0, CAST(N'2023-08-28T21:20:05.8690997' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (61, N'Create product using EF', 6, N'pera.peric@gmail.com', N'{"Title":"Proizvod 1","CategoryId":1,"Description":"Prvi proizvod u bazi","PriceValue":2500.0}', 0, CAST(N'2023-08-28T21:20:50.9020606' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (62, N'Create product using EF', 6, N'pera.peric@gmail.com', N'{"Title":"Proizvod 1","CategoryId":1,"Description":"Prvi proizvod u bazi","PriceValue":2500.0}', 0, CAST(N'2023-08-28T21:22:13.2574715' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (63, N'Create product using EF', 6, N'pera.peric@gmail.com', N'{"Title":"Proizvod 1","CategoryId":1,"Description":"Prvi proizvod u bazi","PriceValue":2500.0}', 0, CAST(N'2023-08-28T21:22:57.3896989' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (64, N'Create product using EF', 6, N'pera.peric@gmail.com', N'{"Title":"Proizvod 1","CategoryId":1,"Description":"Prvi proizvod u bazi","PriceValue":2500.0}', 1, CAST(N'2023-08-28T21:25:42.8848927' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (65, N'Create product using EF', 6, N'pera.peric@gmail.com', N'{"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"toy2.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"toy2.jpg\""],"Content-Type":["image/jpeg"]},"Length":146585,"Name":"Image","FileName":"toy2.jpg"},"Title":"Plisani mis","CategoryId":2,"Description":"Plisani misevi igracka za macke","ImageFileName":"2023698b-a687-4ae1-bc12-359e70ac9460.jpg","PriceValue":590.0}', 1, CAST(N'2023-08-28T22:37:12.1259490' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (66, N'Update product using EF', 6, N'pera.peric@gmail.com', N'{"NewImage":{"ContentDisposition":"form-data; name=\"NewImage\"; filename=\"toy3.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"NewImage\"; filename=\"toy3.jpg\""],"Content-Type":["image/jpeg"]},"Length":92390,"Name":"NewImage","FileName":"toy3.jpg"},"NewTitle":"Plisani mis","NewDescription":"Plisani misevi igracka za macke","NewImageFileName":"67c88504-1583-4b31-802a-698b45d87e5b.jpg","NewPriceValue":650.0,"Id":0}', 1, CAST(N'2023-08-28T23:49:31.7021770' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (67, N'Update product using EF', 6, N'pera.peric@gmail.com', N'{"NewImage":{"ContentDisposition":"form-data; name=\"NewImage\"; filename=\"toy3.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"NewImage\"; filename=\"toy3.jpg\""],"Content-Type":["image/jpeg"]},"Length":92390,"Name":"NewImage","FileName":"toy3.jpg"},"NewTitle":"Plisani mis","NewDescription":"Plisani misevi igracka za macke","NewImageFileName":"cdd8e0e1-b986-4ba2-aa96-743ceadc5cb4.jpg","NewPriceValue":650.0,"Id":2}', 1, CAST(N'2023-08-28T23:57:30.6451988' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (68, N'Update product using EF', 6, N'pera.peric@gmail.com', N'{"NewImage":{"ContentDisposition":"form-data; name=\"NewImage\"; filename=\"toy3.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"NewImage\"; filename=\"toy3.jpg\""],"Content-Type":["image/jpeg"]},"Length":92390,"Name":"NewImage","FileName":"toy3.jpg"},"NewTitle":"Plisani mis","NewDescription":"Plisani misevi igracka za macke","NewImageFileName":"c65b34c0-db84-4d56-9fea-16cc2e534293.jpg","NewPriceValue":650.0,"Id":2}', 1, CAST(N'2023-08-28T23:58:50.7897662' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (69, N'Update product using EF', 6, N'pera.peric@gmail.com', N'{"NewImage":{"ContentDisposition":"form-data; name=\"NewImage\"; filename=\"toy3.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"NewImage\"; filename=\"toy3.jpg\""],"Content-Type":["image/jpeg"]},"Length":92390,"Name":"NewImage","FileName":"toy3.jpg"},"NewTitle":"Plisani misevi","NewDescription":"Plisani misevi igracka za macke","NewImageFileName":"146b3c25-75de-4121-8cdf-9a9de6279fbc.jpg","NewPriceValue":650.0,"Id":2}', 1, CAST(N'2023-08-29T00:02:43.3847137' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (70, N'Update product using EF', 6, N'pera.peric@gmail.com', N'{"NewImage":{"ContentDisposition":"form-data; name=\"NewImage\"; filename=\"toy3.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"NewImage\"; filename=\"toy3.jpg\""],"Content-Type":["image/jpeg"]},"Length":92390,"Name":"NewImage","FileName":"toy3.jpg"},"NewTitle":"Plisani misevi","NewDescription":"Plisani misevi igracka za macke","NewImageFileName":"131f57e6-9399-4a0e-85a0-3e1cfcaa5d34.jpg","NewPriceValue":650.0,"Id":2}', 1, CAST(N'2023-08-29T00:06:28.9059418' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (71, N'Update product using EF', 6, N'pera.peric@gmail.com', N'{"NewImage":{"ContentDisposition":"form-data; name=\"NewImage\"; filename=\"toy3.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"NewImage\"; filename=\"toy3.jpg\""],"Content-Type":["image/jpeg"]},"Length":92390,"Name":"NewImage","FileName":"toy3.jpg"},"NewTitle":"Plisani misevi","NewDescription":"Plisani misevi igracka za macke","NewImageFileName":"bb18ddcd-b6ba-47d9-b776-7c905dabf44a.jpg","NewPriceValue":650.0,"Id":2}', 1, CAST(N'2023-08-29T00:07:30.8666568' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (72, N'Update product using EF', 6, N'pera.peric@gmail.com', N'{"NewImage":{"ContentDisposition":"form-data; name=\"NewImage\"; filename=\"toy3.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"NewImage\"; filename=\"toy3.jpg\""],"Content-Type":["image/jpeg"]},"Length":92390,"Name":"NewImage","FileName":"toy3.jpg"},"NewTitle":"Proizvod","NewDescription":"Plisani misevi igracka za macke","NewImageFileName":"fbe18e89-c582-491a-ab7a-8e42055ee199.jpg","NewPriceValue":650.0,"Id":1}', 1, CAST(N'2023-08-29T00:10:29.9533109' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (73, N'Update product using EF', 6, N'pera.peric@gmail.com', N'{"NewImage":{"ContentDisposition":"form-data; name=\"NewImage\"; filename=\"toy2.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"NewImage\"; filename=\"toy2.jpg\""],"Content-Type":["image/jpeg"]},"Length":146585,"Name":"NewImage","FileName":"toy2.jpg"},"NewTitle":"Plisani misevi","NewDescription":"Plisani misevi igracka za macke","NewImageFileName":"60a35d4b-c405-40a8-9435-554d60e61630.jpg","NewPriceValue":750.0,"Id":2}', 1, CAST(N'2023-08-29T00:11:30.7141809' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (74, N'Search product by title using EF', 6, N'pera.peric@gmail.com', N'{"Keyword":"mis"}', 1, CAST(N'2023-08-29T00:31:25.3965307' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (75, N'Search product by title using EF', 6, N'pera.peric@gmail.com', N'{"Keyword":"proizvod"}', 1, CAST(N'2023-08-29T00:31:42.1619235' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (76, N'Create Animal using EF', 6, N'pera.peric@gmail.com', N'{"Name":"Hrcak","CategoryIds":[1,2],"Id":0}', 1, CAST(N'2023-08-29T15:06:10.5780154' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (77, N'Create Animal using EF', 6, N'pera.peric@gmail.com', N'{"Name":"Hrcak","CategoryIds":[1,2],"Id":0}', 1, CAST(N'2023-08-29T15:08:17.9959978' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (78, N'Create Animal using EF', 6, N'pera.peric@gmail.com', N'{"Name":"Hrcak","CategoryIds":[1,2],"Id":0}', 1, CAST(N'2023-08-29T15:09:03.3273015' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (79, N'Create Animal using EF', 6, N'pera.peric@gmail.com', N'{"Name":"Pticica","CategoryIds":[1,2],"Id":0}', 1, CAST(N'2023-08-29T15:09:31.2228905' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (80, N'Update animal name using EF', 6, N'pera.peric@gmail.com', N'{"Name":"Ptice","CategoryIds":null,"Id":18}', 1, CAST(N'2023-08-29T19:24:20.7877497' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (81, N'Update animal name using EF', 6, N'pera.peric@gmail.com', N'{"Name":"Ptice","CategoryIds":[1,2,3],"Id":18}', 1, CAST(N'2023-08-29T19:29:03.4098115' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (82, N'Create specification using EF', 6, N'pera.peric@gmail.com', N'{"Name":"Tvrdoca","Values":["Mekano","Srednje","Tvrdo"],"CategoryIds":[4],"Id":0}', 1, CAST(N'2023-08-29T19:37:54.6166202' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (83, N'Create specification using EF', 6, N'pera.peric@gmail.com', N'{"Name":"Tvrdoca","Values":["Mekano","Srednje","Tvrdo"],"CategoryIds":[4],"Id":0}', 1, CAST(N'2023-08-29T19:40:37.6093132' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (84, N'Create specification using EF', 6, N'pera.peric@gmail.com', N'{"Name":"Rastegljivost","Values":["Rastegljivo","Kruto"],"CategoryIds":[2],"Id":0}', 1, CAST(N'2023-08-29T19:43:36.1470950' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (85, N'Delete product using EF', 6, N'pera.peric@gmail.com', N'1', 1, CAST(N'2023-08-29T20:00:24.2916530' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (86, N'Create product using EF', 6, N'pera.peric@gmail.com', N'{"Image":null,"Title":null,"CategoryId":0,"Description":null,"ImageFileName":null,"PriceValue":0.0}', 1, CAST(N'2023-08-29T20:04:08.2590359' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (87, N'Create product using EF', 6, N'pera.peric@gmail.com', N'{"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"toy3.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"toy3.jpg\""],"Content-Type":["image/jpeg"]},"Length":92390,"Name":"Image","FileName":"toy3.jpg"},"Title":"Kucica za hrcka","CategoryId":2,"Description":"Plasticna kucica za hrcke","ImageFileName":"0bca81c7-3361-4c5d-891d-b8cc1b32d633.jpg","PriceValue":1500.0}', 1, CAST(N'2023-08-29T20:05:15.1663194' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (88, N'Create product using EF', 6, N'pera.peric@gmail.com', N'{"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"toy3.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"toy3.jpg\""],"Content-Type":["image/jpeg"]},"Length":92390,"Name":"Image","FileName":"toy3.jpg"},"Title":"Proizvod1","CategoryId":2,"Description":"Treci proizvod","ImageFileName":"4960cd95-c5d5-4cae-bf76-a538190ccb1b.jpg","PriceValue":1600.0}', 1, CAST(N'2023-08-29T20:07:30.0909768' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (89, N'Delete product using EF', 6, N'pera.peric@gmail.com', N'4', 1, CAST(N'2023-08-29T20:08:16.6218002' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (90, N'Create product using EF', 6, N'pera.peric@gmail.com', N'{"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"toy3.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"toy3.jpg\""],"Content-Type":["image/jpeg"]},"Length":92390,"Name":"Image","FileName":"toy3.jpg"},"Title":"Proizvod1","CategoryId":2,"Description":"Treci proizvod","ImageFileName":"722c7075-b70a-490a-bd5c-cb91903ba902.jpg","PriceValue":1600.0}', 1, CAST(N'2023-08-29T20:08:38.2683166' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (91, N'Create product using EF', 6, N'pera.peric@gmail.com', N'{"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"toy3.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"toy3.jpg\""],"Content-Type":["image/jpeg"]},"Length":92390,"Name":"Image","FileName":"toy3.jpg"},"Title":"Proizvod1","CategoryId":2,"Description":"Treci proizvod","ImageFileName":"97487ef0-6ccc-443c-8f88-0a532669c50c.jpg","PriceValue":1600.0}', 1, CAST(N'2023-08-29T20:15:36.0859905' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (92, N'Delete product using EF', 6, N'pera.peric@gmail.com', N'5', 1, CAST(N'2023-08-29T20:16:14.6691195' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (93, N'Delete product using EF', 6, N'pera.peric@gmail.com', N'5', 1, CAST(N'2023-08-29T20:21:05.9162692' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (94, N'Delete product using EF', 6, N'pera.peric@gmail.com', N'5', 1, CAST(N'2023-08-29T20:37:58.6551174' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (95, N'Create product using EF', 6, N'pera.peric@gmail.com', N'{"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"toy3.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"toy3.jpg\""],"Content-Type":["image/jpeg"]},"Length":92390,"Name":"Image","FileName":"toy3.jpg"},"Title":"Proizvod2","CategoryId":2,"Description":"Cetvrti proizvod","ImageFileName":"a5302ebe-e8cf-4efa-9894-4616e5253ac6.jpg","PriceValue":1700.0}', 1, CAST(N'2023-08-29T20:41:28.5202380' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (96, N'Delete product using EF', 6, N'pera.peric@gmail.com', N'6', 1, CAST(N'2023-08-29T20:41:49.8294712' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (97, N'Delete product using EF', 6, N'pera.peric@gmail.com', N'6', 1, CAST(N'2023-08-29T20:43:43.3308993' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (98, N'Delete product using EF', 6, N'pera.peric@gmail.com', N'6', 1, CAST(N'2023-08-29T20:45:42.3941634' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (99, N'Delete product using EF', 6, N'pera.peric@gmail.com', N'6', 1, CAST(N'2023-08-29T20:46:53.9257826' AS DateTime2), 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (100, N'Create product using EF', 6, N'pera.peric@gmail.com', N'{"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"toy3.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"toy3.jpg\""],"Content-Type":["image/jpeg"]},"Length":92390,"Name":"Image","FileName":"toy3.jpg"},"Title":"Proizvod2","CategoryId":2,"Description":"Cetvrti proizvod","ImageFileName":"aa5feaaa-21fb-490d-b1bd-05a92b70586f.jpg","PriceValue":1700.0}', 1, CAST(N'2023-08-29T20:51:44.2822244' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (101, N'Delete product using EF', 6, N'pera.peric@gmail.com', N'7', 1, CAST(N'2023-08-29T20:52:40.7863730' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (102, N'Create product using EF', 6, N'pera.peric@gmail.com', N'{"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"toy3.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"toy3.jpg\""],"Content-Type":["image/jpeg"]},"Length":92390,"Name":"Image","FileName":"toy3.jpg"},"Title":"Proizvod3","CategoryId":2,"Description":"Peti proizvod","ImageFileName":"a52cef6c-20b3-48dc-a5dc-89a40a91a8db.jpg","PriceValue":1700.0}', 1, CAST(N'2023-08-29T20:54:11.4066392' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (103, N'Delete product using EF', 6, N'pera.peric@gmail.com', N'8', 1, CAST(N'2023-08-29T20:54:21.0837959' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (104, N'Create product using EF', 6, N'pera.peric@gmail.com', N'{"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"toy3.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"toy3.jpg\""],"Content-Type":["image/jpeg"]},"Length":92390,"Name":"Image","FileName":"toy3.jpg"},"Title":"Proizvod4","CategoryId":2,"Description":"Sesti proizvod","ImageFileName":"7159901e-b99b-4825-aef9-281dad09f538.jpg","PriceValue":1700.0}', 1, CAST(N'2023-08-29T21:26:20.0864565' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (105, N'Delete product using EF', 6, N'pera.peric@gmail.com', N'9', 1, CAST(N'2023-08-29T21:26:47.0389770' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (106, N'Create product using EF', 6, N'pera.peric@gmail.com', N'{"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"toy3.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"toy3.jpg\""],"Content-Type":["image/jpeg"]},"Length":92390,"Name":"Image","FileName":"toy3.jpg"},"Title":"Proizvod5","CategoryId":2,"Description":"Sesti proizvod","ImageFileName":"db735ec6-fbea-48e1-af1b-8518ecf9e0c4.jpg","PriceValue":1700.0}', 1, CAST(N'2023-08-29T21:27:43.8579768' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (107, N'Delete product using EF', 6, N'pera.peric@gmail.com', N'10', 1, CAST(N'2023-08-29T21:27:49.3757542' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (108, N'Create product using EF', 6, N'pera.peric@gmail.com', N'{"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"toy3.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"toy3.jpg\""],"Content-Type":["image/jpeg"]},"Length":92390,"Name":"Image","FileName":"toy3.jpg"},"Title":"Proizvod6","CategoryId":2,"Description":"Sesti proizvod","ImageFileName":"0d15388d-15f3-41e5-9d18-f024bf9576e2.jpg","PriceValue":1700.0}', 1, CAST(N'2023-08-29T21:29:17.8340727' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (109, N'Delete product using EF', 6, N'pera.peric@gmail.com', N'11', 1, CAST(N'2023-08-29T21:29:24.2845953' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (110, N'Create product using EF', 6, N'pera.peric@gmail.com', N'{"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"toy3.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"toy3.jpg\""],"Content-Type":["image/jpeg"]},"Length":92390,"Name":"Image","FileName":"toy3.jpg"},"Title":"Proizvod7","CategoryId":2,"Description":"Sedmi proizvod","ImageFileName":"2c946f27-efff-4aea-ad4f-8bca01598514.jpg","PriceValue":1700.0}', 1, CAST(N'2023-08-29T21:32:42.7966898' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (111, N'Delete product using EF', 6, N'pera.peric@gmail.com', N'12', 1, CAST(N'2023-08-29T21:32:49.6529927' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (112, N'Create product using EF', 6, N'pera.peric@gmail.com', N'{"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"toy3.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"toy3.jpg\""],"Content-Type":["image/jpeg"]},"Length":92390,"Name":"Image","FileName":"toy3.jpg"},"Title":"Proizvod7","CategoryId":2,"Description":"Sedmi proizvod","ImageFileName":"8aedaa98-e2c4-46ff-85b0-2941d224ca5a.jpg","PriceValue":1700.0}', 1, CAST(N'2023-08-29T21:35:42.1079115' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (113, N'Delete product using EF', 6, N'pera.peric@gmail.com', N'12', 1, CAST(N'2023-08-29T21:35:55.7452899' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (114, N'Delete product using EF', 6, N'pera.peric@gmail.com', N'12', 1, CAST(N'2023-08-29T21:38:39.4607024' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (115, N'Create product using EF', 6, N'pera.peric@gmail.com', N'{"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"toy3.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"toy3.jpg\""],"Content-Type":["image/jpeg"]},"Length":92390,"Name":"Image","FileName":"toy3.jpg"},"Title":"Proizvod8","CategoryId":2,"Description":"Sedmi proizvod","ImageFileName":"7f49bd1d-04a0-4567-adbe-a42c8e69a509.jpg","PriceValue":1700.0}', 1, CAST(N'2023-08-29T21:43:02.6644620' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (116, N'Delete product using EF', 6, N'pera.peric@gmail.com', N'13', 1, CAST(N'2023-08-29T21:43:13.0124920' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (117, N'Create product using EF', 6, N'pera.peric@gmail.com', N'{"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"toy3.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"toy3.jpg\""],"Content-Type":["image/jpeg"]},"Length":92390,"Name":"Image","FileName":"toy3.jpg"},"Title":"Proizvod9","CategoryId":2,"Description":"Sedmi proizvod","ImageFileName":"f16387c3-0c5a-4c12-853d-f4bd0bf915cd.jpg","PriceValue":1700.0}', 1, CAST(N'2023-08-29T21:48:14.6103269' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (118, N'Delete product using EF', 6, N'pera.peric@gmail.com', N'14', 1, CAST(N'2023-08-29T21:48:20.7962021' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (119, N'Create cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":2}', 1, CAST(N'2023-08-30T01:05:39.6478676' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (120, N'Create cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":2}', 1, CAST(N'2023-08-30T01:06:19.3255200' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (121, N'Update cart using EF', 0, N'Anonymous', N'{"ProductId":2}', 0, CAST(N'2023-08-30T14:24:59.8701175' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (122, N'Update cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":2}', 1, CAST(N'2023-08-30T14:25:23.9309752' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (123, N'Create cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":2}', 1, CAST(N'2023-08-30T14:27:25.1309057' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (124, N'Update cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":2}', 1, CAST(N'2023-08-30T14:27:36.8780389' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (125, N'Delete cart using EF', 6, N'pera.peric@gmail.com', N'1', 1, CAST(N'2023-08-30T15:29:21.9129835' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (126, N'Create cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":2}', 1, CAST(N'2023-08-30T15:31:44.8413496' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (127, N'Create cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":3}', 1, CAST(N'2023-08-30T15:32:05.1478745' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (128, N'Create cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":2}', 1, CAST(N'2023-08-30T15:32:10.6408409' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (129, N'Create cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":2}', 1, CAST(N'2023-08-30T15:34:54.7474934' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (130, N'Create cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":2}', 1, CAST(N'2023-08-30T15:37:01.3243275' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (131, N'Create cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":2}', 1, CAST(N'2023-08-30T15:38:52.4866791' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (132, N'Create cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":2}', 1, CAST(N'2023-08-30T15:41:02.2755870' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (133, N'Delete cart using EF', 6, N'pera.peric@gmail.com', N'2', 1, CAST(N'2023-08-30T15:42:36.1418900' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (134, N'Create cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":2}', 1, CAST(N'2023-08-30T15:44:23.8885876' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (135, N'Delete cart using EF', 6, N'pera.peric@gmail.com', N'2', 1, CAST(N'2023-08-30T15:45:14.7407006' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (136, N'Create cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":3}', 1, CAST(N'2023-08-30T15:48:51.0168595' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (137, N'Delete cart using EF', 6, N'pera.peric@gmail.com', N'1', 1, CAST(N'2023-08-30T15:53:15.4644897' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (138, N'Create cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":3}', 1, CAST(N'2023-08-30T15:55:09.6111727' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (139, N'Delete cart using EF', 6, N'pera.peric@gmail.com', N'3', 1, CAST(N'2023-08-30T15:55:49.0998376' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (140, N'Create cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":3}', 1, CAST(N'2023-08-30T16:01:20.6947147' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (141, N'Delete cart using EF', 6, N'pera.peric@gmail.com', N'4', 1, CAST(N'2023-08-30T16:02:07.1599827' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (142, N'Delete category using EF', 6, N'pera.peric@gmail.com', N'4', 1, CAST(N'2023-08-30T16:02:56.3294950' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (143, N'Create cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":3}', 1, CAST(N'2023-08-30T16:04:14.0988881' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (144, N'Create cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":2}', 1, CAST(N'2023-08-30T16:05:35.9397749' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (145, N'Create cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":2}', 1, CAST(N'2023-08-30T16:06:03.4431041' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (146, N'Create cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":3}', 1, CAST(N'2023-08-30T16:06:07.2357297' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (147, N'Create cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":3}', 1, CAST(N'2023-08-30T16:06:09.6435472' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (148, N'Delete cart using EF', 6, N'pera.peric@gmail.com', N'5', 1, CAST(N'2023-08-30T16:09:38.2485990' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (149, N'Create cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":3}', 1, CAST(N'2023-08-30T16:11:01.3039100' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (150, N'Update cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":3}', 1, CAST(N'2023-08-30T16:12:12.1389475' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (151, N'Update cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":3}', 1, CAST(N'2023-08-30T16:13:55.1555904' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (152, N'Create cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":1}', 1, CAST(N'2023-08-30T16:14:12.5713027' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (153, N'Create cart using EF', 0, N'Anonymous', N'{"ProductId":3}', 0, CAST(N'2023-08-30T16:23:50.0719685' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (154, N'Create cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":3}', 1, CAST(N'2023-08-30T16:24:14.7365624' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (155, N'Create cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":3}', 1, CAST(N'2023-08-30T16:24:17.3163988' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (156, N'Update cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":10}', 1, CAST(N'2023-08-30T16:25:44.1586779' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (157, N'Update cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":3}', 1, CAST(N'2023-08-30T16:25:57.9089035' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (158, N'Update cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":3}', 1, CAST(N'2023-08-30T16:26:50.2621121' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (159, N'Update cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":3}', 1, CAST(N'2023-08-30T16:30:33.9607201' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (160, N'Update cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":3}', 1, CAST(N'2023-08-30T16:31:59.4088181' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (161, N'Create cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":3}', 1, CAST(N'2023-08-30T16:34:06.2516214' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (162, N'Create cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":3}', 1, CAST(N'2023-08-30T16:34:10.2275590' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (163, N'Update cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":3}', 1, CAST(N'2023-08-30T16:35:44.9912506' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (164, N'Delete cart using EF', 6, N'pera.peric@gmail.com', N'11', 1, CAST(N'2023-08-30T16:36:35.8276490' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (165, N'Delete cart using EF', 6, N'pera.peric@gmail.com', N'7', 1, CAST(N'2023-08-30T16:36:59.2902473' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (166, N'Create cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":8}', 1, CAST(N'2023-08-30T16:37:42.5187293' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (167, N'Create cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":2}', 1, CAST(N'2023-08-30T16:37:53.5008171' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (168, N'Create cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":2}', 1, CAST(N'2023-08-30T16:37:55.6161315' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (169, N'Create cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":2}', 1, CAST(N'2023-08-30T16:42:08.4416091' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (170, N'Update cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":2}', 1, CAST(N'2023-08-30T16:43:33.9084482' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (171, N'Update cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":2}', 1, CAST(N'2023-08-30T16:44:15.6201960' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (172, N'Update cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":2}', 1, CAST(N'2023-08-30T16:45:22.1704047' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (173, N'Update cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":3}', 1, CAST(N'2023-08-30T16:45:33.1756243' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (174, N'Delete cart using EF', 6, N'pera.peric@gmail.com', N'8', 1, CAST(N'2023-08-30T16:49:24.9252660' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (175, N'Create cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":2}', 1, CAST(N'2023-08-30T17:13:58.3315935' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (176, N'Create cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":2}', 1, CAST(N'2023-08-30T17:14:01.3404570' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (177, N'Create cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":3}', 1, CAST(N'2023-08-30T17:14:05.8130378' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (178, N'Update cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":2}', 1, CAST(N'2023-08-30T17:32:25.0891599' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (179, N'Delete cart using EF', 6, N'pera.peric@gmail.com', N'9', 1, CAST(N'2023-08-30T17:33:21.2908282' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (180, N'Create cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":3}', 1, CAST(N'2023-08-30T17:33:59.3690934' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (181, N'Create cart using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":3}', 1, CAST(N'2023-08-30T17:35:06.1140165' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (182, N'Create comment using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":2,"CommentText":"Jako zanimljivi plisani misevi, macka ih obozava"}', 1, CAST(N'2023-08-30T17:59:53.4378447' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (183, N'Create comment using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":2,"CommentText":"Jako zanimljivi plisani misevi, macka ih obozava"}', 1, CAST(N'2023-08-30T18:00:58.4822111' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (184, N'Update comment using EF', 6, N'pera.peric@gmail.com', N'{"UpdatedCommentText":null,"Id":1}', 1, CAST(N'2023-08-30T18:21:33.3349629' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (185, N'Update comment using EF', 6, N'pera.peric@gmail.com', N'{"UpdatedCommentText":"Jako zanimljivi plisani misevi, macka ih obozava!","Id":1}', 1, CAST(N'2023-08-30T18:22:06.6036912' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (186, N'Delete comment using EF', 6, N'pera.peric@gmail.com', N'1', 0, CAST(N'2023-08-30T18:33:14.0552690' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (187, N'Delete comment using EF', 6, N'pera.peric@gmail.com', N'1', 0, CAST(N'2023-08-30T18:33:53.5735768' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (188, N'Delete comment using EF', 6, N'pera.peric@gmail.com', N'1', 1, CAST(N'2023-08-30T18:35:51.4973490' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserUseCaseLogs] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (189, N'Create comment using EF', 6, N'pera.peric@gmail.com', N'{"ProductId":3,"CommentText":"Super igracka za hrcke"}', 1, CAST(N'2023-08-30T18:37:15.3166734' AS DateTime2), 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[UserUseCaseLogs] OFF
GO
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 1)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 2)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 3)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 4)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 5)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 6)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 7)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 8)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 9)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 10)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 11)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 12)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 13)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 14)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 15)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 16)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 17)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 18)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 19)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 20)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 21)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 22)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 23)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 24)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 25)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 26)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 27)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 28)
GO
/****** Object:  Index [IX_AnimalCategories_AnimalId]    Script Date: 8/30/2023 9:01:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_AnimalCategories_AnimalId] ON [dbo].[AnimalCategories]
(
	[AnimalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Animals_Name]    Script Date: 8/30/2023 9:01:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_Animals_Name] ON [dbo].[Animals]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CartItems_CartId]    Script Date: 8/30/2023 9:01:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_CartItems_CartId] ON [dbo].[CartItems]
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CartItems_ProductId]    Script Date: 8/30/2023 9:01:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_CartItems_ProductId] ON [dbo].[CartItems]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Carts_UserId]    Script Date: 8/30/2023 9:01:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_Carts_UserId] ON [dbo].[Carts]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Categories_Name]    Script Date: 8/30/2023 9:01:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_Categories_Name] ON [dbo].[Categories]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Categories_ParentId]    Script Date: 8/30/2023 9:01:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_Categories_ParentId] ON [dbo].[Categories]
(
	[ParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CategorySpecifications_SpecificationId]    Script Date: 8/30/2023 9:01:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_CategorySpecifications_SpecificationId] ON [dbo].[CategorySpecifications]
(
	[SpecificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_ProductId]    Script Date: 8/30/2023 9:01:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_ProductId] ON [dbo].[Comments]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_UserId]    Script Date: 8/30/2023 9:01:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_UserId] ON [dbo].[Comments]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Images_ProductId]    Script Date: 8/30/2023 9:01:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_Images_ProductId] ON [dbo].[Images]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Prices_ProductId]    Script Date: 8/30/2023 9:01:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_Prices_ProductId] ON [dbo].[Prices]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_CategoryId]    Script Date: 8/30/2023 9:01:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_CategoryId] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Specifications_Name]    Script Date: 8/30/2023 9:01:07 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Specifications_Name] ON [dbo].[Specifications]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SpecificationValues_SpecificationId]    Script Date: 8/30/2023 9:01:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_SpecificationValues_SpecificationId] ON [dbo].[SpecificationValues]
(
	[SpecificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Email]    Script Date: 8/30/2023 9:01:07 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Email] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Username]    Script Date: 8/30/2023 9:01:07 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Username] ON [dbo].[Users]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserUseCaseLogs_CreatedAt]    Script Date: 8/30/2023 9:01:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserUseCaseLogs_CreatedAt] ON [dbo].[UserUseCaseLogs]
(
	[CreatedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserUseCaseLogs_UseCaseName]    Script Date: 8/30/2023 9:01:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserUseCaseLogs_UseCaseName] ON [dbo].[UserUseCaseLogs]
(
	[UseCaseName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserUseCaseLogs_Username]    Script Date: 8/30/2023 9:01:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserUseCaseLogs_Username] ON [dbo].[UserUseCaseLogs]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Animals] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Images] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Prices] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Specifications] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[SpecificationValues] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'') FOR [Username]
GO
ALTER TABLE [dbo].[UserUseCaseLogs] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[AnimalCategories]  WITH CHECK ADD  CONSTRAINT [FK_AnimalCategories_Animals_AnimalId] FOREIGN KEY([AnimalId])
REFERENCES [dbo].[Animals] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AnimalCategories] CHECK CONSTRAINT [FK_AnimalCategories_Animals_AnimalId]
GO
ALTER TABLE [dbo].[AnimalCategories]  WITH CHECK ADD  CONSTRAINT [FK_AnimalCategories_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AnimalCategories] CHECK CONSTRAINT [FK_AnimalCategories_Categories_CategoryId]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Carts_CartId] FOREIGN KEY([CartId])
REFERENCES [dbo].[Carts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Carts_CartId]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Products_ProductId]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Users_UserId]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Categories_ParentId] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Categories_ParentId]
GO
ALTER TABLE [dbo].[CategorySpecifications]  WITH CHECK ADD  CONSTRAINT [FK_CategorySpecifications_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategorySpecifications] CHECK CONSTRAINT [FK_CategorySpecifications_Categories_CategoryId]
GO
ALTER TABLE [dbo].[CategorySpecifications]  WITH CHECK ADD  CONSTRAINT [FK_CategorySpecifications_Specifications_SpecificationId] FOREIGN KEY([SpecificationId])
REFERENCES [dbo].[Specifications] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategorySpecifications] CHECK CONSTRAINT [FK_CategorySpecifications_Specifications_SpecificationId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Products_ProductId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users_UserId]
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_Images_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_Images_Products_ProductId]
GO
ALTER TABLE [dbo].[Prices]  WITH CHECK ADD  CONSTRAINT [FK_Prices_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Prices] CHECK CONSTRAINT [FK_Prices_Products_ProductId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
ALTER TABLE [dbo].[SpecificationValues]  WITH CHECK ADD  CONSTRAINT [FK_SpecificationValues_Specifications_SpecificationId] FOREIGN KEY([SpecificationId])
REFERENCES [dbo].[Specifications] ([Id])
GO
ALTER TABLE [dbo].[SpecificationValues] CHECK CONSTRAINT [FK_SpecificationValues_Specifications_SpecificationId]
GO
ALTER TABLE [dbo].[UserUseCases]  WITH CHECK ADD  CONSTRAINT [FK_UserUseCases_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserUseCases] CHECK CONSTRAINT [FK_UserUseCases_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [pet_shop] SET  READ_WRITE 
GO
