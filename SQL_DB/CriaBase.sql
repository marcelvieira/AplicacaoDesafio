USE [master]
GO

/****** Object:  Database [Challenge]  ******/
CREATE DATABASE [Challenge]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Challenge', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Challenge.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Challenge_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Challenge_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Challenge].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Challenge] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [Challenge] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [Challenge] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [Challenge] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [Challenge] SET ARITHABORT OFF 
GO

ALTER DATABASE [Challenge] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [Challenge] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Challenge] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Challenge] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Challenge] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [Challenge] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [Challenge] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Challenge] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [Challenge] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Challenge] SET  DISABLE_BROKER 
GO

ALTER DATABASE [Challenge] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Challenge] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Challenge] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [Challenge] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [Challenge] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Challenge] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [Challenge] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [Challenge] SET RECOVERY FULL 
GO

ALTER DATABASE [Challenge] SET  MULTI_USER 
GO

ALTER DATABASE [Challenge] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [Challenge] SET DB_CHAINING OFF 
GO

ALTER DATABASE [Challenge] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [Challenge] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [Challenge] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [Challenge] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [Challenge] SET QUERY_STORE = OFF
GO

ALTER DATABASE [Challenge] SET  READ_WRITE 
GO


USE [Challenge]
GO

/****** Object:  Table [dbo].[Pessoa]  ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Pessoa](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nchar](100) NOT NULL,
	[Morada] [nchar](255) NOT NULL,
	[Email] [nchar](80) NOT NULL,
	[FotoURL] [nchar](255) NULL,
	[Grupo] [nchar](100) NULL,
 CONSTRAINT [PK_Pessoas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [Challenge]
GO

/****** Object:  Table [dbo].[Telefone] ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Telefone](
	[Id_Item] [int] IDENTITY(1,1) NOT NULL,
	[Id_Pessoa] [int] NOT NULL,
	[Tipo] [nchar](20) NULL,
	[Numero] [nchar](15) NULL,
 CONSTRAINT [PK_Telefone] PRIMARY KEY CLUSTERED 
(
	[Id_Item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Telefone]  WITH CHECK ADD  CONSTRAINT [FK_Telefone_Pessoa] FOREIGN KEY([Id_Pessoa])
REFERENCES [dbo].[Pessoa] ([Id])
GO

ALTER TABLE [dbo].[Telefone] CHECK CONSTRAINT [FK_Telefone_Pessoa]
GO




