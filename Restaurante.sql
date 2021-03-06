/*
KASANDRA DIAZ 17-SIIN-1-040
KATHERINE MALENO 16-MIIN-1-064 
UNIVERSIDAD:O&M
SECCION:0541
*/

USE [Restaurante]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 29/11/2018 23:14:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IDCliente] [int] NOT NULL,
	[Nombre] [nchar](10) NOT NULL,
	[Apellido] [nchar](10) NULL,
	[Telefono] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 29/11/2018 23:14:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[IDFactura] [int] NOT NULL,
	[NumeroFactura] [nchar](10) NOT NULL,
	[FechaFactura] [date] NOT NULL,
	[MontoFactura] [numeric](18, 0) NOT NULL,
	[ClienteID] [int] NOT NULL,
	[RestanteFactura] [numeric](18, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pago]    Script Date: 29/11/2018 23:14:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pago](
	[IDPago] [int] NOT NULL,
	[FacturaID] [int] NOT NULL,
	[FechaPago] [date] NOT NULL,
	[MontoPagado] [numeric](18, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD FOREIGN KEY([ClienteID])
REFERENCES [dbo].[Factura] ([IDFactura])
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD FOREIGN KEY([FacturaID])
REFERENCES [dbo].[Factura] ([IDFactura])
GO
