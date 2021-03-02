USE [AH_IRUPAPER]
GO
/****** Object:  Table [dbo].[PERS_Filas]    Script Date: 02/03/2021 16:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERS_Filas](
	[IdFila] [int] NOT NULL,
	[Fila] [varchar](255) NOT NULL,
	[IdDoc] [dbo].[T_Id_Doc] IDENTITY(1,1) NOT NULL,
	[InsertUpdate] [dbo].[T_CEESI_Insert_Update] NOT NULL,
	[Usuario] [dbo].[T_CEESI_Usuario] NOT NULL,
	[FechaInsertUpdate] [dbo].[T_CEESI_Fecha_Sistema] NOT NULL,
 CONSTRAINT [PK_Pers_Filas] PRIMARY KEY CLUSTERED 
(
	[IdFila] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PERS_Filas] ON 

INSERT [dbo].[PERS_Filas] ([IdFila], [Fila], [IdDoc], [InsertUpdate], [Usuario], [FechaInsertUpdate]) VALUES (1, N'Fila uno', 1, 0, N'ahora', CAST(N'2021-02-18T15:13:34.787' AS DateTime))
INSERT [dbo].[PERS_Filas] ([IdFila], [Fila], [IdDoc], [InsertUpdate], [Usuario], [FechaInsertUpdate]) VALUES (2, N'Fila dos', 2, 0, N'ahora', CAST(N'2021-02-18T15:13:42.630' AS DateTime))
INSERT [dbo].[PERS_Filas] ([IdFila], [Fila], [IdDoc], [InsertUpdate], [Usuario], [FechaInsertUpdate]) VALUES (3, N'Fila tres', 3, 0, N'ahora', CAST(N'2021-02-18T15:13:46.600' AS DateTime))
SET IDENTITY_INSERT [dbo].[PERS_Filas] OFF
ALTER TABLE [dbo].[PERS_Filas] ADD  CONSTRAINT [DF_Pers_Filas_InsertUpdate]  DEFAULT ((0)) FOR [InsertUpdate]
GO
ALTER TABLE [dbo].[PERS_Filas] ADD  CONSTRAINT [DF_Pers_Filas_Usuario]  DEFAULT (user_name()) FOR [Usuario]
GO
ALTER TABLE [dbo].[PERS_Filas] ADD  CONSTRAINT [DF_Pers_Filas_FechaInsertUpdate]  DEFAULT (getdate()) FOR [FechaInsertUpdate]
GO
