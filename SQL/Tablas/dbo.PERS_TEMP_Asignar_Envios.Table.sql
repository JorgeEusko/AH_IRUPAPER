USE [AH_IRUPAPER]
GO
/****** Object:  Table [dbo].[PERS_TEMP_Asignar_Envios]    Script Date: 17/03/2021 13:23:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERS_TEMP_Asignar_Envios](
	[IdTrabajo] [int] NOT NULL,
	[IdLinea] [int] NOT NULL,
	[IdLineaCorte] [int] NOT NULL,
	[FechaCorte] [smalldatetime] NOT NULL,
	[RefTrabajo] [varchar](255) NOT NULL,
	[PedidoCliente] [dbo].[T_IdPedidoCli] NULL,
	[IdCliente] [dbo].[T_Id_Cliente] NOT NULL,
	[Cliente] [varchar](255) NOT NULL,
	[PaletsCortados] [dbo].[T_Decimal] NOT NULL,
	[Resmas] [dbo].[T_Decimal] NOT NULL,
	[PaletsEnviados] [dbo].[T_Decimal] NOT NULL,
	[PaletsPendientes] [dbo].[T_Decimal] NOT NULL,
	[PaletsAsignar] [dbo].[T_Decimal] NULL,
	[IdDoc] [dbo].[T_Id_Doc] NOT NULL,
 CONSTRAINT [PK_PERS_TEMP_Asignar_Envios] PRIMARY KEY CLUSTERED 
(
	[IdTrabajo] ASC,
	[IdLinea] ASC,
	[IdLineaCorte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
