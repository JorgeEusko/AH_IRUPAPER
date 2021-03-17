USE [AH_IRUPAPER]
GO
/****** Object:  Table [dbo].[PERS_Envios]    Script Date: 17/03/2021 13:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERS_Envios](
	[IdEnvio] [int] NOT NULL,
	[Fecha] [smalldatetime] NULL,
	[Cliente] [dbo].[T_Id_Cliente] NOT NULL,
	[IdDirEnvio] [varchar](255) NULL,
	[Transportista] [dbo].[T_Id_Proveedor] NULL,
	[Matricula] [varchar](255) NULL,
	[LineaObservaciones1] [varchar](1000) NULL,
	[LineaObservaciones2] [varchar](1000) NULL,
	[ImprimirObservaciones] [bit] NULL,
	[IdDoc] [dbo].[T_Id_Doc] IDENTITY(1,1) NOT NULL,
	[InsertUpdate] [dbo].[T_CEESI_Insert_Update] NOT NULL,
	[Usuario] [dbo].[T_CEESI_Usuario] NOT NULL,
	[FechaInsertUpdate] [dbo].[T_CEESI_Fecha_Sistema] NOT NULL,
 CONSTRAINT [PK_PERS_Envios] PRIMARY KEY CLUSTERED 
(
	[IdEnvio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PERS_Envios] ADD  CONSTRAINT [DF_PERS_Envios_InsertUpdate]  DEFAULT ((0)) FOR [InsertUpdate]
GO
ALTER TABLE [dbo].[PERS_Envios] ADD  CONSTRAINT [DF_PERS_Envios_Usuario]  DEFAULT (user_name()) FOR [Usuario]
GO
ALTER TABLE [dbo].[PERS_Envios] ADD  CONSTRAINT [DF_PERS_Envios_FechaInsertUpdate]  DEFAULT (getdate()) FOR [FechaInsertUpdate]
GO
