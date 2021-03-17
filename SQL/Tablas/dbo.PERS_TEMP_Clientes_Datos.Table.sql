USE [AH_IRUPAPER]
GO
/****** Object:  Table [dbo].[PERS_TEMP_Clientes_Datos]    Script Date: 17/03/2021 13:23:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERS_TEMP_Clientes_Datos](
	[IdCliente] [dbo].[T_Id_Cliente] NOT NULL,
	[Cliente] [dbo].[T_Nombre] NULL,
	[Marcado] [bit] NULL,
	[IdDoc] [dbo].[T_Id_Doc] NOT NULL
) ON [PRIMARY]
GO
