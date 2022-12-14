USE [master]
GO
/****** Object:  Database [SGPIDB]    Script Date: 15/11/2022 10:19:06 ******/
CREATE DATABASE [SGPIDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SGPIDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SGPIDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SGPIDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SGPIDB.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SGPIDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SGPIDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SGPIDB] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [SGPIDB] SET ANSI_NULLS ON 
GO
ALTER DATABASE [SGPIDB] SET ANSI_PADDING ON 
GO
ALTER DATABASE [SGPIDB] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [SGPIDB] SET ARITHABORT ON 
GO
ALTER DATABASE [SGPIDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SGPIDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SGPIDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SGPIDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SGPIDB] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [SGPIDB] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [SGPIDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SGPIDB] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [SGPIDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SGPIDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SGPIDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SGPIDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SGPIDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SGPIDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SGPIDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SGPIDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SGPIDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SGPIDB] SET RECOVERY FULL 
GO
ALTER DATABASE [SGPIDB] SET  MULTI_USER 
GO
ALTER DATABASE [SGPIDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SGPIDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SGPIDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SGPIDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SGPIDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SGPIDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SGPIDB] SET QUERY_STORE = OFF
GO
USE [SGPIDB]
GO
/****** Object:  Table [dbo].[Asignatura]    Script Date: 15/11/2022 10:19:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asignatura](
	[IdAsignatura] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Codigo] [varchar](150) NULL,
	[IdPrograma] [int] NULL,
	[Nivel] [int] NULL,
	[Creditos] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAsignatura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Documento]    Script Date: 15/11/2022 10:19:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documento](
	[IdDoc] [int] IDENTITY(1,1) NOT NULL,
	[TipoDocumento] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entrevista]    Script Date: 15/11/2022 10:19:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entrevista](
	[IdEntrevista] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdEstudiante] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEntrevista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estudiante]    Script Date: 15/11/2022 10:19:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estudiante](
	[IdEstudiante] [int] IDENTITY(1,1) NOT NULL,
	[Archivo] [varchar](50) NULL,
	[IdPago] [int] NULL,
	[IdUsuario] [int] NULL,
	[Egreado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEstudiante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genero]    Script Date: 15/11/2022 10:19:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genero](
	[IdGenero] [int] IDENTITY(1,1) NOT NULL,
	[Genero] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdGenero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Homologacion]    Script Date: 15/11/2022 10:19:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Homologacion](
	[IdHomologacion] [int] IDENTITY(1,1) NOT NULL,
	[IdEstudiante] [int] NOT NULL,
	[IdPrograma] [int] NOT NULL,
	[IdTipoHomolo] [int] NOT NULL,
	[PeriodoAcademico] [varchar](30) NOT NULL,
	[IdAsignatura] [int] NOT NULL,
	[CodigoHomologacion] [varchar](30) NOT NULL,
	[NomAsigHomologacion] [varchar](30) NOT NULL,
	[CreditosHomologacion] [int] NOT NULL,
	[Nota] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdHomologacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pagos]    Script Date: 15/11/2022 10:19:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pagos](
	[IdPago] [int] IDENTITY(1,1) NOT NULL,
	[ValorPago] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Programa]    Script Date: 15/11/2022 10:19:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Programa](
	[IdPrograma] [int] IDENTITY(1,1) NOT NULL,
	[Programa] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPrograma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Programacion]    Script Date: 15/11/2022 10:19:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Programacion](
	[IdProgramacion] [int] IDENTITY(1,1) NOT NULL,
	[PeriodoAcademico] [varchar](30) NOT NULL,
	[IdPrograma] [int] NOT NULL,
	[FechaProgramacion] [datetime] NOT NULL,
	[Sala] [varchar](30) NOT NULL,
	[IdAsignatura] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProgramacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 15/11/2022 10:19:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[IdRol] [int] IDENTITY(1,1) NOT NULL,
	[Rol] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoHomologacion]    Script Date: 15/11/2022 10:19:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoHomologacion](
	[IdTipoHomologacion] [int] NOT NULL,
	[TipoHomologacion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_TipoHomologacion] PRIMARY KEY CLUSTERED 
(
	[IdTipoHomologacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 15/11/2022 10:19:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[NumeroDocumento] [varchar](30) NOT NULL,
	[IdDoc] [int] NOT NULL,
	[PrimerNombre] [varchar](255) NOT NULL,
	[SegundoNombre] [varchar](255) NULL,
	[PrimerApellido] [varchar](255) NOT NULL,
	[SegundoApellido] [varchar](255) NOT NULL,
	[IdGenero] [int] NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[IdRol] [int] NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[IdPrograma] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Asignatura] ON 

INSERT [dbo].[Asignatura] ([IdAsignatura], [Nombre], [Codigo], [IdPrograma], [Nivel], [Creditos]) VALUES (1, N'sistemas', N'112', 1, 1, 6)
INSERT [dbo].[Asignatura] ([IdAsignatura], [Nombre], [Codigo], [IdPrograma], [Nivel], [Creditos]) VALUES (2, N'construccion ', N'113', 2, 2, 10)
INSERT [dbo].[Asignatura] ([IdAsignatura], [Nombre], [Codigo], [IdPrograma], [Nivel], [Creditos]) VALUES (3, N'base de datos', N'1124', 1, 4, 20)
INSERT [dbo].[Asignatura] ([IdAsignatura], [Nombre], [Codigo], [IdPrograma], [Nivel], [Creditos]) VALUES (5, N'programacion avanzada', N'4321', 1, 4, 30)
SET IDENTITY_INSERT [dbo].[Asignatura] OFF
GO
SET IDENTITY_INSERT [dbo].[Documento] ON 

INSERT [dbo].[Documento] ([IdDoc], [TipoDocumento]) VALUES (1, N'cedula')
SET IDENTITY_INSERT [dbo].[Documento] OFF
GO
SET IDENTITY_INSERT [dbo].[Estudiante] ON 

INSERT [dbo].[Estudiante] ([IdEstudiante], [Archivo], [IdPago], [IdUsuario], [Egreado]) VALUES (1, NULL, 10, 3, 1)
SET IDENTITY_INSERT [dbo].[Estudiante] OFF
GO
SET IDENTITY_INSERT [dbo].[Genero] ON 

INSERT [dbo].[Genero] ([IdGenero], [Genero]) VALUES (1, N'hombre')
INSERT [dbo].[Genero] ([IdGenero], [Genero]) VALUES (2, N'femenino')
INSERT [dbo].[Genero] ([IdGenero], [Genero]) VALUES (3, N'otro tipo de gay')
SET IDENTITY_INSERT [dbo].[Genero] OFF
GO
SET IDENTITY_INSERT [dbo].[Pagos] ON 

INSERT [dbo].[Pagos] ([IdPago], [ValorPago], [Fecha], [Estado]) VALUES (1, 2000, CAST(N'2022-11-01' AS Date), 0)
INSERT [dbo].[Pagos] ([IdPago], [ValorPago], [Fecha], [Estado]) VALUES (2, 2500, CAST(N'2022-11-11' AS Date), 0)
INSERT [dbo].[Pagos] ([IdPago], [ValorPago], [Fecha], [Estado]) VALUES (3, 2000, CAST(N'2022-11-16' AS Date), 0)
INSERT [dbo].[Pagos] ([IdPago], [ValorPago], [Fecha], [Estado]) VALUES (4, 3000000, CAST(N'2022-11-30' AS Date), 0)
INSERT [dbo].[Pagos] ([IdPago], [ValorPago], [Fecha], [Estado]) VALUES (5, 3000000, CAST(N'2022-11-30' AS Date), 0)
INSERT [dbo].[Pagos] ([IdPago], [ValorPago], [Fecha], [Estado]) VALUES (6, 1300, CAST(N'2022-11-15' AS Date), 0)
INSERT [dbo].[Pagos] ([IdPago], [ValorPago], [Fecha], [Estado]) VALUES (7, 2300, CAST(N'2022-11-14' AS Date), 0)
INSERT [dbo].[Pagos] ([IdPago], [ValorPago], [Fecha], [Estado]) VALUES (8, 3300, CAST(N'2022-11-13' AS Date), 0)
INSERT [dbo].[Pagos] ([IdPago], [ValorPago], [Fecha], [Estado]) VALUES (9, 4300, CAST(N'2022-11-12' AS Date), 0)
INSERT [dbo].[Pagos] ([IdPago], [ValorPago], [Fecha], [Estado]) VALUES (10, 5300, CAST(N'2022-11-11' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Pagos] OFF
GO
SET IDENTITY_INSERT [dbo].[Programa] ON 

INSERT [dbo].[Programa] ([IdPrograma], [Programa]) VALUES (1, N'sistemas')
INSERT [dbo].[Programa] ([IdPrograma], [Programa]) VALUES (2, N'tecnico')
SET IDENTITY_INSERT [dbo].[Programa] OFF
GO
SET IDENTITY_INSERT [dbo].[Programacion] ON 

INSERT [dbo].[Programacion] ([IdProgramacion], [PeriodoAcademico], [IdPrograma], [FechaProgramacion], [Sala], [IdAsignatura], [IdUsuario]) VALUES (2, N'20222', 2, CAST(N'2022-11-01T00:00:00.000' AS DateTime), N'507', 2, 3)
INSERT [dbo].[Programacion] ([IdProgramacion], [PeriodoAcademico], [IdPrograma], [FechaProgramacion], [Sala], [IdAsignatura], [IdUsuario]) VALUES (3, N'2022-2', 2, CAST(N'2022-11-01T00:00:00.000' AS DateTime), N'510', 2, 1)
SET IDENTITY_INSERT [dbo].[Programacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([IdRol], [Rol]) VALUES (1, N'Administrador')
INSERT [dbo].[Rol] ([IdRol], [Rol]) VALUES (2, N'Coordinador')
INSERT [dbo].[Rol] ([IdRol], [Rol]) VALUES (3, N'Estudiante')
SET IDENTITY_INSERT [dbo].[Rol] OFF
GO
INSERT [dbo].[TipoHomologacion] ([IdTipoHomologacion], [TipoHomologacion]) VALUES (1, N'Validacion')
INSERT [dbo].[TipoHomologacion] ([IdTipoHomologacion], [TipoHomologacion]) VALUES (2, N'Vacacional')
INSERT [dbo].[TipoHomologacion] ([IdTipoHomologacion], [TipoHomologacion]) VALUES (3, N'Recuperacion')
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [NumeroDocumento], [IdDoc], [PrimerNombre], [SegundoNombre], [PrimerApellido], [SegundoApellido], [IdGenero], [Email], [IdRol], [Password], [IdPrograma]) VALUES (1, N'1', 1, N'pedro', N'gg', N'gg', N'gg', 1, N'1@g.co', 1, N'1', 1)
INSERT [dbo].[Usuario] ([IdUsuario], [NumeroDocumento], [IdDoc], [PrimerNombre], [SegundoNombre], [PrimerApellido], [SegundoApellido], [IdGenero], [Email], [IdRol], [Password], [IdPrograma]) VALUES (2, N'2', 1, N'cxcbb', N'xcbxcbxb', N'xcbxcbxb', N'xcbxbcxcb', 1, N'pabloagudelor123@gmail.com', 2, N'1', 2)
INSERT [dbo].[Usuario] ([IdUsuario], [NumeroDocumento], [IdDoc], [PrimerNombre], [SegundoNombre], [PrimerApellido], [SegundoApellido], [IdGenero], [Email], [IdRol], [Password], [IdPrograma]) VALUES (3, N'3', 1, N'Juan', N'qwe', N'qwe', N'qwe', 1, N'm@gmail.com', 3, N'1', 1)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[Asignatura]  WITH CHECK ADD  CONSTRAINT [FK_Asignatura_Programa] FOREIGN KEY([IdPrograma])
REFERENCES [dbo].[Programa] ([IdPrograma])
GO
ALTER TABLE [dbo].[Asignatura] CHECK CONSTRAINT [FK_Asignatura_Programa]
GO
ALTER TABLE [dbo].[Entrevista]  WITH CHECK ADD  CONSTRAINT [FK_Entrevista_Estudiante] FOREIGN KEY([IdEntrevista])
REFERENCES [dbo].[Estudiante] ([IdEstudiante])
GO
ALTER TABLE [dbo].[Entrevista] CHECK CONSTRAINT [FK_Entrevista_Estudiante]
GO
ALTER TABLE [dbo].[Entrevista]  WITH CHECK ADD  CONSTRAINT [FK_Entrevista_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Entrevista] CHECK CONSTRAINT [FK_Entrevista_Usuario]
GO
ALTER TABLE [dbo].[Estudiante]  WITH CHECK ADD  CONSTRAINT [FK_Estudiante_Pagos] FOREIGN KEY([IdPago])
REFERENCES [dbo].[Pagos] ([IdPago])
GO
ALTER TABLE [dbo].[Estudiante] CHECK CONSTRAINT [FK_Estudiante_Pagos]
GO
ALTER TABLE [dbo].[Estudiante]  WITH CHECK ADD  CONSTRAINT [FK_Estudiante_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Estudiante] CHECK CONSTRAINT [FK_Estudiante_Usuario]
GO
ALTER TABLE [dbo].[Homologacion]  WITH CHECK ADD  CONSTRAINT [FK_Homologacion_Asignatura] FOREIGN KEY([IdAsignatura])
REFERENCES [dbo].[Asignatura] ([IdAsignatura])
GO
ALTER TABLE [dbo].[Homologacion] CHECK CONSTRAINT [FK_Homologacion_Asignatura]
GO
ALTER TABLE [dbo].[Homologacion]  WITH CHECK ADD  CONSTRAINT [FK_Homologacion_Estudiante] FOREIGN KEY([IdEstudiante])
REFERENCES [dbo].[Estudiante] ([IdEstudiante])
GO
ALTER TABLE [dbo].[Homologacion] CHECK CONSTRAINT [FK_Homologacion_Estudiante]
GO
ALTER TABLE [dbo].[Homologacion]  WITH CHECK ADD  CONSTRAINT [FK_Homologacion_Programa] FOREIGN KEY([IdPrograma])
REFERENCES [dbo].[Programa] ([IdPrograma])
GO
ALTER TABLE [dbo].[Homologacion] CHECK CONSTRAINT [FK_Homologacion_Programa]
GO
ALTER TABLE [dbo].[Homologacion]  WITH CHECK ADD  CONSTRAINT [FK_Homologacion_TipoHomologacion] FOREIGN KEY([IdTipoHomolo])
REFERENCES [dbo].[TipoHomologacion] ([IdTipoHomologacion])
GO
ALTER TABLE [dbo].[Homologacion] CHECK CONSTRAINT [FK_Homologacion_TipoHomologacion]
GO
ALTER TABLE [dbo].[Programacion]  WITH CHECK ADD  CONSTRAINT [FK_Programacion_Asignatura] FOREIGN KEY([IdAsignatura])
REFERENCES [dbo].[Asignatura] ([IdAsignatura])
GO
ALTER TABLE [dbo].[Programacion] CHECK CONSTRAINT [FK_Programacion_Asignatura]
GO
ALTER TABLE [dbo].[Programacion]  WITH CHECK ADD  CONSTRAINT [FK_Programacion_Programa] FOREIGN KEY([IdPrograma])
REFERENCES [dbo].[Programa] ([IdPrograma])
GO
ALTER TABLE [dbo].[Programacion] CHECK CONSTRAINT [FK_Programacion_Programa]
GO
ALTER TABLE [dbo].[Programacion]  WITH CHECK ADD  CONSTRAINT [FK_Programacion_Programa1] FOREIGN KEY([IdPrograma])
REFERENCES [dbo].[Programa] ([IdPrograma])
GO
ALTER TABLE [dbo].[Programacion] CHECK CONSTRAINT [FK_Programacion_Programa1]
GO
ALTER TABLE [dbo].[Programacion]  WITH CHECK ADD  CONSTRAINT [FK_Programacion_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Programacion] CHECK CONSTRAINT [FK_Programacion_Usuario]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Documento] FOREIGN KEY([IdDoc])
REFERENCES [dbo].[Documento] ([IdDoc])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Documento]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Genero] FOREIGN KEY([IdGenero])
REFERENCES [dbo].[Genero] ([IdGenero])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Genero]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Programa] FOREIGN KEY([IdPrograma])
REFERENCES [dbo].[Programa] ([IdPrograma])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Programa]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Rol] FOREIGN KEY([IdRol])
REFERENCES [dbo].[Rol] ([IdRol])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Rol]
GO
USE [master]
GO
ALTER DATABASE [SGPIDB] SET  READ_WRITE 
GO
