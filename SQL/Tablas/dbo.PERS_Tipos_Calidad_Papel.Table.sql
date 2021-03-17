USE [AH_IRUPAPER]
GO
/****** Object:  Table [dbo].[PERS_Tipos_Calidad_Papel]    Script Date: 17/03/2021 13:23:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERS_Tipos_Calidad_Papel](
	[IdCalidad] [int] NOT NULL,
	[Descrip] [varchar](255) NOT NULL,
	[IdDoc] [dbo].[T_Id_Doc] IDENTITY(1,1) NOT NULL,
	[InsertUpdate] [dbo].[T_CEESI_Insert_Update] NOT NULL,
	[Usuario] [dbo].[T_CEESI_Usuario] NOT NULL,
	[FechaInsertUpdate] [dbo].[T_CEESI_Fecha_Sistema] NOT NULL,
 CONSTRAINT [PK_PERS_Tipos_Calidad_Papel] PRIMARY KEY CLUSTERED 
(
	[IdCalidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PERS_Tipos_Calidad_Papel] ADD  CONSTRAINT [DF_PERS_Tipos_Calidad_Papel_InsertUpdate]  DEFAULT ((0)) FOR [InsertUpdate]
GO
ALTER TABLE [dbo].[PERS_Tipos_Calidad_Papel] ADD  CONSTRAINT [DF_PERS_Tipos_Calidad_Papel_Usuario]  DEFAULT (user_name()) FOR [Usuario]
GO
ALTER TABLE [dbo].[PERS_Tipos_Calidad_Papel] ADD  CONSTRAINT [DF_PERS_Tipos_Calidad_Papel_FechaInsertUpdate]  DEFAULT (getdate()) FOR [FechaInsertUpdate]
GO
