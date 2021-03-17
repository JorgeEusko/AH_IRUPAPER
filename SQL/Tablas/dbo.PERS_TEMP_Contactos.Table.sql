USE [AH_IRUPAPER]
GO
/****** Object:  Table [dbo].[PERS_TEMP_Contactos]    Script Date: 17/03/2021 13:23:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERS_TEMP_Contactos](
	[IdContacto] [int] NULL,
	[Nombre] [varchar](255) NULL,
	[Direccion] [dbo].[T_Direccion] NULL,
	[Marcado] [bit] NULL,
	[IdDoc] [dbo].[T_Id_Doc] NOT NULL
) ON [PRIMARY]
GO
