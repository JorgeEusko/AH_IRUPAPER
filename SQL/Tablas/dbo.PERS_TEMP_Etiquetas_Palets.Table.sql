USE [AH_IRUPAPER]
GO
/****** Object:  Table [dbo].[PERS_TEMP_Etiquetas_Palets]    Script Date: 17/03/2021 13:23:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERS_TEMP_Etiquetas_Palets](
	[IdTrabajo] [int] NOT NULL,
	[IdLinea] [int] NOT NULL,
	[EnvioA] [varchar](50) NULL,
	[IdCalidadPapel] [int] NULL,
	[Ancho] [dbo].[T_Decimal] NULL,
	[Metros] [dbo].[T_Decimal] NULL,
	[GramajeM2] [dbo].[T_Decimal] NULL,
	[TotalResmas] [int] NULL,
	[PesoPalet] [dbo].[T_Decimal] NULL,
	[RefFrabricacion] [varchar](255) NULL,
	[NumCopia] [int] NULL
) ON [PRIMARY]
GO
