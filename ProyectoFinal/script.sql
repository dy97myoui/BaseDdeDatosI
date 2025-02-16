USE [master]
GO
/****** Object:  Database [atencion_al_cliente]    Script Date: 30/11/2021 10:41:08 ******/
CREATE DATABASE [atencion_al_cliente]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'atencion_al_cliente', FILENAME = N'D:\SQL server\MSSQL15.MSSQLSERVER\MSSQL\DATA\atencion_al_cliente.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'atencion_al_cliente_log', FILENAME = N'D:\SQL server\MSSQL15.MSSQLSERVER\MSSQL\DATA\atencion_al_cliente_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [atencion_al_cliente] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [atencion_al_cliente].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [atencion_al_cliente] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [atencion_al_cliente] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [atencion_al_cliente] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [atencion_al_cliente] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [atencion_al_cliente] SET ARITHABORT OFF 
GO
ALTER DATABASE [atencion_al_cliente] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [atencion_al_cliente] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [atencion_al_cliente] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [atencion_al_cliente] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [atencion_al_cliente] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [atencion_al_cliente] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [atencion_al_cliente] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [atencion_al_cliente] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [atencion_al_cliente] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [atencion_al_cliente] SET  ENABLE_BROKER 
GO
ALTER DATABASE [atencion_al_cliente] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [atencion_al_cliente] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [atencion_al_cliente] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [atencion_al_cliente] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [atencion_al_cliente] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [atencion_al_cliente] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [atencion_al_cliente] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [atencion_al_cliente] SET RECOVERY FULL 
GO
ALTER DATABASE [atencion_al_cliente] SET  MULTI_USER 
GO
ALTER DATABASE [atencion_al_cliente] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [atencion_al_cliente] SET DB_CHAINING OFF 
GO
ALTER DATABASE [atencion_al_cliente] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [atencion_al_cliente] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [atencion_al_cliente] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [atencion_al_cliente] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'atencion_al_cliente', N'ON'
GO
ALTER DATABASE [atencion_al_cliente] SET QUERY_STORE = OFF
GO
USE [atencion_al_cliente]
GO
/****** Object:  User [RonaldHito2]    Script Date: 30/11/2021 10:41:09 ******/
CREATE USER [RonaldHito2] FOR LOGIN [RonaldHito2] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [RonaldBaseDeDatosI]    Script Date: 30/11/2021 10:41:09 ******/
CREATE USER [RonaldBaseDeDatosI] FOR LOGIN [RonaldBaseDeDatosI] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  UserDefinedFunction [dbo].[pro_ven]    Script Date: 30/11/2021 10:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[pro_ven](@dato1 INT)
    RETURNS INT AS
    BEGIN
        DECLARE @respuesta INT;
        SET @respuesta = (
            SELECT COUNT(ci.id_admin) AS productos_vendidos
            FROM citas_y_reservas AS ci
            WHERE id_admin = @dato1
            );
        RETURN @respuesta;
    end
GO
/****** Object:  Table [dbo].[marca_auto]    Script Date: 30/11/2021 10:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marca_auto](
	[id_marca] [int] NOT NULL,
	[marca] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos_autos]    Script Date: 30/11/2021 10:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos_autos](
	[id_auto] [int] NOT NULL,
	[nombre_auto] [varchar](30) NOT NULL,
	[tipo_auto] [varchar](30) NOT NULL,
	[id_marca] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_auto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[caracteristicas_del_auto]    Script Date: 30/11/2021 10:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[caracteristicas_del_auto](
	[numero_auto] [int] IDENTITY(1,1) NOT NULL,
	[color] [varchar](30) NOT NULL,
	[motor] [varchar](100) NOT NULL,
	[caja] [varchar](100) NULL,
	[modelo] [int] NOT NULL,
	[asientos] [int] NOT NULL,
	[peso_kg] [int] NOT NULL,
	[id_auto] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[numero_auto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[precio]    Script Date: 30/11/2021 10:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[precio](
	[numero_auto] [int] IDENTITY(1,1) NOT NULL,
	[precio_normal] [int] NOT NULL,
	[credito] [int] NOT NULL,
	[descuento] [int] NOT NULL,
	[cuotas] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[numero_auto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Gama_segun_Precio]    Script Date: 30/11/2021 10:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[Gama_segun_Precio] AS
    SELECT prod.nombre_auto AS Nombre, ma.marca AS Marca, prod.tipo_auto, pre.precio_normal AS Precio , Gama =
        CASE
            WHEN pre.precio_normal > 10000 AND pre.precio_normal <= 15000 THEN 'Gama Basica'
            WHEN pre.precio_normal > 15000 AND pre.precio_normal <= 20000 THEN 'Gama Intermedia'
            WHEN pre.precio_normal > 20000 AND pre.precio_normal <= 25000 THEN 'Gama Alta'
            WHEN pre.precio_normal > 25000 THEN 'Gama Alta++'
        END
    FROM precio AS pre
    INNER JOIN caracteristicas_del_auto AS carac ON pre.numero_auto = carac.numero_auto
    INNER JOIN productos_autos AS prod ON carac.id_auto = prod.id_auto
    INNER JOIN marca_auto AS ma ON prod.id_marca = ma.id_marca
GO
/****** Object:  View [dbo].[Autos_King_long]    Script Date: 30/11/2021 10:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[Autos_King_long] AS
    SELECT ma.marca, prod.nombre_auto, prod.tipo_auto
    FROM marca_auto AS ma
    INNER JOIN productos_autos AS prod ON ma.id_marca = prod.id_marca
    WHERE ma.id_marca = 911
GO
/****** Object:  View [dbo].[Autos_Great_Wall]    Script Date: 30/11/2021 10:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[Autos_Great_Wall] AS
    SELECT ma.marca, prod.nombre_auto, prod.tipo_auto
    FROM marca_auto AS ma
    INNER JOIN productos_autos AS prod ON ma.id_marca = prod.id_marca
    WHERE ma.id_marca = 111
GO
/****** Object:  View [dbo].[Autos_Haval]    Script Date: 30/11/2021 10:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[Autos_Haval] AS
    SELECT ma.marca, prod.nombre_auto, prod.tipo_auto
    FROM marca_auto AS ma
    INNER JOIN productos_autos AS prod ON ma.id_marca = prod.id_marca
    WHERE ma.id_marca = 211
GO
/****** Object:  View [dbo].[Autos_Geely]    Script Date: 30/11/2021 10:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[Autos_Geely] AS
    SELECT ma.marca, prod.nombre_auto, prod.tipo_auto
    FROM marca_auto AS ma
    INNER JOIN productos_autos AS prod ON ma.id_marca = prod.id_marca
    WHERE ma.id_marca = 311
GO
/****** Object:  View [dbo].[Autos_Forland]    Script Date: 30/11/2021 10:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[Autos_Forland] AS
    SELECT ma.marca, prod.nombre_auto, prod.tipo_auto
    FROM marca_auto AS ma
    INNER JOIN productos_autos AS prod ON ma.id_marca = prod.id_marca
    WHERE ma.id_marca = 411
GO
/****** Object:  View [dbo].[Autos_JMC]    Script Date: 30/11/2021 10:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[Autos_JMC] AS
    SELECT ma.marca, prod.nombre_auto, prod.tipo_auto
    FROM marca_auto AS ma
    INNER JOIN productos_autos AS prod ON ma.id_marca = prod.id_marca
    WHERE ma.id_marca = 511
GO
/****** Object:  View [dbo].[Autos_Changan]    Script Date: 30/11/2021 10:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[Autos_Changan] AS
    SELECT ma.marca, prod.nombre_auto, prod.tipo_auto
    FROM marca_auto AS ma
    INNER JOIN productos_autos AS prod ON ma.id_marca = prod.id_marca
    WHERE ma.id_marca = 611
GO
/****** Object:  View [dbo].[Autos_Chery]    Script Date: 30/11/2021 10:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[Autos_Chery] AS
    SELECT ma.marca, prod.nombre_auto, prod.tipo_auto
    FROM marca_auto AS ma
    INNER JOIN productos_autos AS prod ON ma.id_marca = prod.id_marca
    WHERE ma.id_marca = 711
GO
/****** Object:  View [dbo].[Autos_Foton]    Script Date: 30/11/2021 10:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[Autos_Foton] AS
    SELECT ma.marca, prod.nombre_auto, prod.tipo_auto
    FROM marca_auto AS ma
    INNER JOIN productos_autos AS prod ON ma.id_marca = prod.id_marca
    WHERE ma.id_marca = 811
GO
/****** Object:  View [dbo].[ver_seleccion]    Script Date: 30/11/2021 10:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[ver_seleccion] AS
    SELECT ma.marca, prod.nombre_auto, prod.tipo_auto, carac.color, carac.motor, carac.caja, carac.modelo, carac.asientos, carac.peso_kg
    FROM productos_autos AS prod
    INNER JOIN caracteristicas_del_auto AS carac ON prod.id_auto = carac.id_auto
    INNER JOIN marca_auto AS ma ON prod.id_marca = ma.id_marca
GO
/****** Object:  View [dbo].[PRECIOS]    Script Date: 30/11/2021 10:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[PRECIOS]
AS SELECT prod.nombre_auto, ma.marca, prod.tipo_auto,pre.precio_normal, pre.credito, pre.cuotas
FROM caracteristicas_del_auto as carac
INNER JOIN precio AS pre ON pre.numero_auto = carac.numero_auto
INNER JOIN productos_autos AS prod ON carac.id_auto = prod.id_auto
INNER JOIN marca_auto AS ma ON prod.id_marca = ma.id_marca
GO
/****** Object:  View [dbo].[DESCUENTOS]    Script Date: 30/11/2021 10:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[DESCUENTOS]
AS SELECT prod.nombre_auto, ma.marca, prod.tipo_auto,pre.precio_normal, pre.descuento
FROM caracteristicas_del_auto as carac
INNER JOIN precio AS pre ON pre.numero_auto = carac.numero_auto
INNER JOIN productos_autos AS prod ON carac.id_auto = prod.id_auto
INNER JOIN marca_auto AS ma ON prod.id_marca = ma.id_marca
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 30/11/2021 10:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[ci] [varchar](15) NOT NULL,
	[nombres] [varchar](50) NOT NULL,
	[apellidos] [varchar](100) NOT NULL,
	[correo] [varchar](100) NULL,
	[ciudad] [varchar](50) NOT NULL,
	[id_auto] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ci] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[citas_y_reservas]    Script Date: 30/11/2021 10:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[citas_y_reservas](
	[numero_de_cita] [int] IDENTITY(1,1) NOT NULL,
	[ci_cliente] [varchar](15) NOT NULL,
	[id_admin] [int] NOT NULL,
	[horario] [time](7) NOT NULL,
	[fecha] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[numero_de_cita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[agendar_cita]    Script Date: 30/11/2021 10:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[agendar_cita]
AS SELECT cli.ci,cli.nombres,cli.apellidos,cli.correo,cli.ciudad,cli.id_auto,cit.id_admin,cit.horario,cit.fecha
FROM clientes AS cli
INNER JOIN citas_y_reservas AS cit ON cit.ci_cliente=cli.ci
GO
/****** Object:  Table [dbo].[administradores]    Script Date: 30/11/2021 10:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[administradores](
	[id_admin] [int] NOT NULL,
	[nombres] [varchar](50) NOT NULL,
	[apellidos] [varchar](100) NOT NULL,
	[correo_electronico] [varchar](100) NULL,
	[sede_ciudad] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_admin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[administradores] ([id_admin], [nombres], [apellidos], [correo_electronico], [sede_ciudad]) VALUES (6972733, N'Ronald', N'Choque', N'ronald@gmail.com', N'La Paz')
INSERT [dbo].[administradores] ([id_admin], [nombres], [apellidos], [correo_electronico], [sede_ciudad]) VALUES (10092647, N'Daniel', N'Ticona', N'gustavo@gmail.com', N'El Alto')
INSERT [dbo].[administradores] ([id_admin], [nombres], [apellidos], [correo_electronico], [sede_ciudad]) VALUES (11070582, N'Daniel', N'Escobar', N'daniel@gmail.com', N'La Paz')
GO
SET IDENTITY_INSERT [dbo].[caracteristicas_del_auto] ON 

INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (1, N'Gris', N'MITSUBISHI 4G15-4CIL-SISTEMA VVT', N'MANUAL DE 5V (MT)', 2018, 5, 1130, 11)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (2, N'Rojo', N'MITSUBISHI 4G15-4CIL-SISTEMA VVT', N'AUTOMATICA DE 6V (ATM)', 2018, 5, 1130, 12)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (3, N'Rojo', N'MITSUBISHI 4G15 GASOLINA-16V-4CIL EN LINEA-SISTEMA VVT', N'MANUAL DE 5V (MT)', 2018, 5, 1160, 13)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (4, N'Naranja Cobre', N'MITSUBISHI 4G15 GASOLINA 16V-4CIL EN LINEA-SISTEMA VVT', N'AUTOMATICA DE 6V (ATM)', 2018, 5, 1160, 14)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (5, N'Blanco', N'MITSUBISHI 4G69-16V-4CIL EN LINEA', N'MANUAL DE 5V', 2018, 5, 1725, 15)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (6, N'Plateado', N'MITSUBISHI 4G69-16V-4CIL EN LINEA', N'MANUAL DE 5V', 2018, 2, 1550, 16)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (7, N'Blanco', N'4G69S4N (MITSUBISHI 2-4L)', N'MANUAL DE 5V', 2018, 5, 1830, 17)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (8, N'Plateado', N'MITSUBISHI 4G69-16V-4CIL EN LINEA', N'MANUAL DE 5V', 2018, 5, 1830, 18)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (9, N'Naranja Cobre', N'MITSUBISHI 4G69-16V-4CIL EN LINEA', N'MANUAL DE 5V', 2018, 5, 1830, 19)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (10, N'Azul Metalico', N'GW4G15B GASOLINA-16V-4CIL EN LINEA-DOHC CON VVT EN ESCAPE Y TURBOCARGADOR', N'MANUAL DE 6V', 2021, 5, 1930, 21)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (11, N'Plateado', N'4C20 NT-GDIT-INYECCION DIRECTA-(DHC)-TURBO CARGADO', N'AMT 7DCT450 7V', 2021, 5, 1549, 22)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (12, N'Celeste Metalico', N'L4 CVVT DOHC-1800CC-16V-4CIL EN LINEA', N'MANUAL DE 5V', 2018, 5, 1250, 31)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (13, N'Plateado', N'2.0-16V-4CIL EN LINEA', N'MANUAL DE 6V', 2018, 5, 1550, 32)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (14, N'Blanco', N'2.0-16V-4CIL EN LINEA', N'AUTOMATICA 6V', 2018, 5, 1683, 33)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (15, N'Blanco', N'MITSUBISHI 4G15 4Q20M', N'MANUAL DE 5V (MT)', 2017, 2, 1015, 41)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (16, N'Blanco', N'MITSUBISHI 4G15 4Y22M1', N'MANUAL DE 5V(MT)', 2017, 2, 2010, 42)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (17, N'Blanco', N'MITSUBISHI 4G15 4Y22M1', N'MANUAL DE 5V (MT)', 2017, 2, 1130, 43)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (18, N'Blanco', N'MITSUBISHI 4G15 4Y22M1', N'MANUAL DE 5V (MT)', 2017, 2, 2210, 44)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (19, N'Blanco', N'MITSUBISHI 4G694N-GASOLINA-4CIL EN LINEA', N'MANUAL DE 5V (MT)', 2017, 15, 2500, 51)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (20, N'Plateado', N'JL473Q', N'MANUAL DE 5V (MT)', 2018, 8, 1890, 61)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (21, N'Plateado', N'DAM-13R', N'MANUALDE 5V (MT)', 2018, 2, 2735, 62)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (22, N'Plateado', N'EA15-AB', N'MANUAL DE 5V (MT)', 2017, 8, 1325, 63)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (23, N'Rojo', N'BLUE-CORE-1.4VVT-1480CC-16V', N'MANUAL DE 5V (MT)', 2017, 5, 1080, 64)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (24, N'Naranja Cobre', N'BLUE-CORE-1.5-1480CC-16V', N'AUTOMATICA DE 5V (ATM)', 2017, 5, 1210, 65)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (25, N'Blanco', N'BLUE-CORE-TURBO-ENGINE-JL476ZOCD-1499CC', N'AUTOMATICA DE 6V (ATM)', 2018, 5, 1530, 66)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (26, N'Rojo', N'DOHC-TURBO-ENGINE-JL476ZQCC', N'AUTOMATICA DE 6V (ATM)', 2018, 7, 1470, 67)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (27, N'Azul Metalico', N'BLUE-CORE-4CIL TURBO-16V', N'AUTOMATICA DE 6V (ATM)', 2018, 5, 2010, 68)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (28, N'Naranja Cobre', N'EMISION-EURO-V-4CIL-1500CC', N'MANUAL DE 5V (MT)', 2018, 5, 1230, 71)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (29, N'Azul', N'EMISION-EURO-V-4CIL-2000CC', N'AUTOMATICA DE 7V (ATM)', 2018, 5, 1350, 72)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (30, N'Plateado', N'EMISION-EURO-III-GASOLINA-4CIL-16V', N'AUTOMATICA DE 5V (ATM)', 2018, 11, 1300, 73)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (31, N'Plateado', N'EMISION-EURO-VI-ODB-GASOLINA-4CIL-16V', N'AUTOMATICA DE 5V (ATM)', 2018, 2, 850, 74)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (32, N'Plateado', N'COMMON-RAIL-BOSCH-A-DIESEL-2400CC', N'AUTOMATICA DE 5V (ATM)', 2020, 11, 1350, 81)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (33, N'Blanco', N'COMMON-RAIL-BOSCH-DIESEL-2700CC', N'AUTOMATICA DE 5V (ATM)', 2020, 13, 1430, 82)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (34, N'Plateado', N'1500CC-INYECCION-DIRECTA-4CIL', N'AUTOMATICA DE 5V (ATM)', 2021, 7, 1330, 83)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (35, N'Blanco', N'2300CCA-GASOLINA', N'MECANICA DE 5V (TM)', 2020, 3, 1730, 84)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (36, N'Blanco', N'1TR-BOSCH-2300CC-GASOLINA', N'MECANICA DE 5V (TM)', 2020, 15, 1510, 85)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (37, N'Blanco', N'1TR-BOSCH-2300CC-GASOLINA', N'MECANICA DE 5V (TM)', 2021, 15, 1580, 86)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (38, N'Negro', N'4Y-2300CC-4CIL', N'MECANICA DE 5V (TM)', 2020, 15, 1480, 91)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (39, N'Blanco', N'4Y 2400CC-4CIL', N'MECANICA DE 5V (TM)', 2020, 15, 1530, 92)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (40, N'Plateado', N'4Y 2300CC-4CIL', N'MECANICA DE 5V (TM)', 2020, 15, 1510, 93)
INSERT [dbo].[caracteristicas_del_auto] ([numero_auto], [color], [motor], [caja], [modelo], [asientos], [peso_kg], [id_auto]) VALUES (41, N'Blanco', N'4Y 2300CC-4CIL', N'MECANICA DE 5V (TM)', 2020, 15, 1450, 94)
SET IDENTITY_INSERT [dbo].[caracteristicas_del_auto] OFF
GO
SET IDENTITY_INSERT [dbo].[citas_y_reservas] ON 

INSERT [dbo].[citas_y_reservas] ([numero_de_cita], [ci_cliente], [id_admin], [horario], [fecha]) VALUES (1, N'11565412LP', 11070582, CAST(N'12:30:00' AS Time), CAST(N'2021-11-29' AS Date))
INSERT [dbo].[citas_y_reservas] ([numero_de_cita], [ci_cliente], [id_admin], [horario], [fecha]) VALUES (2, N'4567983OR', 6972733, CAST(N'15:00:00' AS Time), CAST(N'2021-11-30' AS Date))
INSERT [dbo].[citas_y_reservas] ([numero_de_cita], [ci_cliente], [id_admin], [horario], [fecha]) VALUES (3, N'6723450TJ', 6972733, CAST(N'08:30:00' AS Time), CAST(N'2021-12-20' AS Date))
INSERT [dbo].[citas_y_reservas] ([numero_de_cita], [ci_cliente], [id_admin], [horario], [fecha]) VALUES (4, N'5638238SC', 11070582, CAST(N'15:30:00' AS Time), CAST(N'2021-11-30' AS Date))
SET IDENTITY_INSERT [dbo].[citas_y_reservas] OFF
GO
INSERT [dbo].[clientes] ([ci], [nombres], [apellidos], [correo], [ciudad], [id_auto]) VALUES (N'11565412LP', N'Daniel', N'Ruiz', N'daniel12@gmail.com', N'La Paz', 12)
INSERT [dbo].[clientes] ([ci], [nombres], [apellidos], [correo], [ciudad], [id_auto]) VALUES (N'23454345TJ', N'Ramiro', N'Quispe', N'ramiro67@gmail.com', N'La Paz', 12)
INSERT [dbo].[clientes] ([ci], [nombres], [apellidos], [correo], [ciudad], [id_auto]) VALUES (N'4567983OR', N'Luis', N'Ramos', N'luis15@gmail.com', N'La Paz', 22)
INSERT [dbo].[clientes] ([ci], [nombres], [apellidos], [correo], [ciudad], [id_auto]) VALUES (N'5638238SC', N'Pedro', N'Quiroga', N'juan56@gmail.com', N'La Paz', 86)
INSERT [dbo].[clientes] ([ci], [nombres], [apellidos], [correo], [ciudad], [id_auto]) VALUES (N'6723450TJ', N'Adrian', N'Jusino', N'adrian87@gmail.com', N'La Paz', 86)
GO
INSERT [dbo].[marca_auto] ([id_marca], [marca]) VALUES (111, N'Great Wall')
INSERT [dbo].[marca_auto] ([id_marca], [marca]) VALUES (211, N'Haval')
INSERT [dbo].[marca_auto] ([id_marca], [marca]) VALUES (311, N'Geely')
INSERT [dbo].[marca_auto] ([id_marca], [marca]) VALUES (411, N'Forland')
INSERT [dbo].[marca_auto] ([id_marca], [marca]) VALUES (511, N'JMC')
INSERT [dbo].[marca_auto] ([id_marca], [marca]) VALUES (611, N'Changan')
INSERT [dbo].[marca_auto] ([id_marca], [marca]) VALUES (711, N'Chery')
INSERT [dbo].[marca_auto] ([id_marca], [marca]) VALUES (811, N'Foton')
INSERT [dbo].[marca_auto] ([id_marca], [marca]) VALUES (911, N'King Long')
GO
SET IDENTITY_INSERT [dbo].[precio] ON 

INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (1, 15500, 775, 3100, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (2, 16500, 825, 3300, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (3, 17500, 875, 3500, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (4, 18500, 925, 3700, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (5, 25500, 1275, 5100, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (6, 22500, 1125, 4500, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (7, 24500, 1225, 4900, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (8, 24300, 1215, 4860, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (9, 25600, 1280, 5120, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (10, 23500, 1175, 4700, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (11, 30500, 1525, 6100, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (12, 17900, 895, 3580, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (13, 24600, 1230, 4920, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (14, 26500, 1325, 5300, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (15, 17400, 870, 3480, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (16, 21500, 1075, 4300, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (17, 19500, 975, 3900, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (18, 24500, 1225, 4900, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (19, 27500, 1375, 5500, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (20, 12200, 610, 2440, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (21, 13000, 650, 2600, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (22, 13400, 670, 2680, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (23, 12500, 625, 2500, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (24, 17800, 890, 3560, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (25, 20600, 1030, 4120, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (26, 21100, 1055, 4220, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (27, 25900, 1295, 5180, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (28, 11490, 575, 2310, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (29, 20600, 1030, 4120, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (30, 25000, 1250, 5000, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (31, 21000, 1050, 4200, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (32, 24800, 1240, 4960, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (33, 23500, 1175, 4700, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (34, 18800, 940, 3760, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (35, 13300, 665, 1330, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (36, 17000, 850, 3400, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (37, 20600, 1030, 4120, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (38, 23000, 1150, 4600, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (39, 31490, 1574, 6286, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (40, 27000, 1350, 5400, 24)
INSERT [dbo].[precio] ([numero_auto], [precio_normal], [credito], [descuento], [cuotas]) VALUES (41, 25000, 1250, 5000, 24)
SET IDENTITY_INSERT [dbo].[precio] OFF
GO
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (11, N'C30 MT', N'Sedan', 111)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (12, N'C30 ATM', N'Sedan', 111)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (13, N'M4 MT', N'Vagoneta', 111)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (14, N'M4 ATM', N'Vagoneta', 111)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (15, N'H5', N'Vagoneta', 111)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (16, N'Wingle 5 4x4', N'Camioneta', 111)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (17, N'Wingle 5 Digniti', N'Camioneta', 111)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (18, N'Wingle 5 Upgrade', N'Camioneta', 111)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (19, N'Wingle 6', N'Camioneta', 111)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (21, N'H2 MT 4x2', N'Vagoneta', 211)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (22, N'H6 Supreme', N'Vagoneta', 211)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (31, N'Engrand 7', N'Sedan', 311)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (32, N'Engrand X7 Sport MT', N'Vagoneta', 311)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (33, N'Engrand X7 Sport AT', N'Vagoneta', 311)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (41, N'1.5T', N'Camion', 411)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (42, N'2T', N'Camion', 411)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (43, N'Cargo Box 1.5T', N'Camion', 411)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (44, N'Cargo Box 2T', N'Camion', 411)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (51, N'Touring techo medio', N'Minibus', 511)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (61, N'M201', N'Minibus', 611)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (62, N'Q20', N'Camion', 611)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (63, N'Honor', N'Vagoneta', 611)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (64, N'Alsvin', N'Sedan', 611)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (65, N'CS35 Plus', N'Vagoneta', 611)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (66, N'CS55', N'Vagoneta', 611)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (67, N'CX70', N'Vagoneta', 611)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (68, N'Hunter', N'Camioneta', 611)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (71, N'Tiggo 2', N'Vagoneta', 711)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (72, N'Tiggo 4', N'Vagoneta', 711)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (73, N'Yoyo van- 11 Pasajeros', N'Minibus', 711)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (74, N'Yoki XL', N'Camion', 711)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (81, N'Saloom 2400 CC', N'Minibus', 811)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (82, N'Royal Saloom 2700 CC', N'Minibus', 811)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (83, N'Gratour', N'Vagoneta', 811)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (84, N'3T', N'Camion', 811)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (85, N'View C2 Bajo', N'Minibus', 811)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (86, N'View C2 alto', N'Minibus', 811)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (91, N'New', N'Minibus', 911)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (92, N'Kingo', N'Minibus', 911)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (93, N'Camello Alto', N'Minibus', 911)
INSERT [dbo].[productos_autos] ([id_auto], [nombre_auto], [tipo_auto], [id_marca]) VALUES (94, N'Camello Bajo', N'Minibus', 911)
GO
/****** Object:  Index [UQ__citas_y___AD3C2FAC92044111]    Script Date: 30/11/2021 10:41:09 ******/
ALTER TABLE [dbo].[citas_y_reservas] ADD UNIQUE NONCLUSTERED 
(
	[horario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[caracteristicas_del_auto]  WITH CHECK ADD FOREIGN KEY([id_auto])
REFERENCES [dbo].[productos_autos] ([id_auto])
GO
ALTER TABLE [dbo].[citas_y_reservas]  WITH CHECK ADD FOREIGN KEY([ci_cliente])
REFERENCES [dbo].[clientes] ([ci])
GO
ALTER TABLE [dbo].[citas_y_reservas]  WITH CHECK ADD FOREIGN KEY([id_admin])
REFERENCES [dbo].[administradores] ([id_admin])
GO
ALTER TABLE [dbo].[clientes]  WITH CHECK ADD FOREIGN KEY([id_auto])
REFERENCES [dbo].[productos_autos] ([id_auto])
GO
ALTER TABLE [dbo].[precio]  WITH CHECK ADD FOREIGN KEY([numero_auto])
REFERENCES [dbo].[caracteristicas_del_auto] ([numero_auto])
GO
ALTER TABLE [dbo].[productos_autos]  WITH CHECK ADD FOREIGN KEY([id_marca])
REFERENCES [dbo].[marca_auto] ([id_marca])
GO
/****** Object:  StoredProcedure [dbo].[consultas]    Script Date: 30/11/2021 10:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[consultas]
@nombre VARCHAR(100)
AS SELECT ma.marca, prod.nombre_auto, prod.tipo_auto, carac.color, carac.motor, carac.caja, carac.modelo, carac.asientos, carac.peso_kg
FROM productos_autos AS prod
INNER JOIN caracteristicas_del_auto AS carac ON prod.id_auto = carac.id_auto
INNER JOIN marca_auto AS ma ON prod.id_marca = ma.id_marca
WHERE prod.nombre_auto = @nombre;
GO
USE [master]
GO
ALTER DATABASE [atencion_al_cliente] SET  READ_WRITE 
GO
