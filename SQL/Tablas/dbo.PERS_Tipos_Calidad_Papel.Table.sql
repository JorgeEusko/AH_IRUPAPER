USE [AH_IRUPAPER]
GO
/****** Object:  Table [dbo].[PERS_Tipos_Calidad_Papel]    Script Date: 02/03/2021 16:08:12 ******/
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
SET IDENTITY_INSERT [dbo].[PERS_Tipos_Calidad_Papel] ON 

INSERT [dbo].[PERS_Tipos_Calidad_Papel] ([IdCalidad], [Descrip], [IdDoc], [InsertUpdate], [Usuario], [FechaInsertUpdate]) VALUES (0, N'COPYST BLANCO K5', 1, 0, N'dbo', CAST(N'2021-02-02T10:04:25.200' AS DateTime))
INSERT [dbo].[PERS_Tipos_Calidad_Papel] ([IdCalidad], [Descrip], [IdDoc], [InsertUpdate], [Usuario], [FechaInsertUpdate]) VALUES (1, N'OFFSET BLANCO K2', 2, 0, N'dbo', CAST(N'2021-02-02T10:04:46.607' AS DateTime))
INSERT [dbo].[PERS_Tipos_Calidad_Papel] ([IdCalidad], [Descrip], [IdDoc], [InsertUpdate], [Usuario], [FechaInsertUpdate]) VALUES (2, N'OFFSET BLANCO K3', 3, 0, N'dbo', CAST(N'2021-02-02T10:04:53.407' AS DateTime))
INSERT [dbo].[PERS_Tipos_Calidad_Papel] ([IdCalidad], [Descrip], [IdDoc], [InsertUpdate], [Usuario], [FechaInsertUpdate]) VALUES (3, N'OFFSET BLANCO K8', 4, 0, N'dbo', CAST(N'2021-02-02T10:04:59.233' AS DateTime))
INSERT [dbo].[PERS_Tipos_Calidad_Papel] ([IdCalidad], [Descrip], [IdDoc], [InsertUpdate], [Usuario], [FechaInsertUpdate]) VALUES (4, N'COPYST BLANCO K2', 5, 0, N'dbo', CAST(N'2021-02-02T10:05:05.703' AS DateTime))
INSERT [dbo].[PERS_Tipos_Calidad_Papel] ([IdCalidad], [Descrip], [IdDoc], [InsertUpdate], [Usuario], [FechaInsertUpdate]) VALUES (5, N'OFFSET BLANCO K10', 6, 0, N'dbo', CAST(N'2021-02-02T10:05:22.733' AS DateTime))
SET IDENTITY_INSERT [dbo].[PERS_Tipos_Calidad_Papel] OFF
ALTER TABLE [dbo].[PERS_Tipos_Calidad_Papel] ADD  CONSTRAINT [DF_PERS_Tipos_Calidad_Papel_InsertUpdate]  DEFAULT ((0)) FOR [InsertUpdate]
GO
ALTER TABLE [dbo].[PERS_Tipos_Calidad_Papel] ADD  CONSTRAINT [DF_PERS_Tipos_Calidad_Papel_Usuario]  DEFAULT (user_name()) FOR [Usuario]
GO
ALTER TABLE [dbo].[PERS_Tipos_Calidad_Papel] ADD  CONSTRAINT [DF_PERS_Tipos_Calidad_Papel_FechaInsertUpdate]  DEFAULT (getdate()) FOR [FechaInsertUpdate]
GO
