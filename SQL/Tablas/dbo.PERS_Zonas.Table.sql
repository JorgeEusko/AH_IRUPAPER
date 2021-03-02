USE [AH_IRUPAPER]
GO
/****** Object:  Table [dbo].[PERS_Zonas]    Script Date: 02/03/2021 16:08:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERS_Zonas](
	[IdZona] [int] NOT NULL,
	[Zona] [varchar](255) NOT NULL,
	[IdDoc] [dbo].[T_Id_Doc] IDENTITY(1,1) NOT NULL,
	[InsertUpdate] [dbo].[T_CEESI_Insert_Update] NOT NULL,
	[Usuario] [dbo].[T_CEESI_Usuario] NOT NULL,
	[FechaInsertUpdate] [dbo].[T_CEESI_Fecha_Sistema] NOT NULL,
 CONSTRAINT [PK_Pers_Zonas] PRIMARY KEY CLUSTERED 
(
	[IdZona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PERS_Zonas] ON 

INSERT [dbo].[PERS_Zonas] ([IdZona], [Zona], [IdDoc], [InsertUpdate], [Usuario], [FechaInsertUpdate]) VALUES (1, N'Zona uno', 1, 0, N'ahora', CAST(N'2021-02-18T15:13:08.183' AS DateTime))
INSERT [dbo].[PERS_Zonas] ([IdZona], [Zona], [IdDoc], [InsertUpdate], [Usuario], [FechaInsertUpdate]) VALUES (2, N'Zona dos', 2, 0, N'ahora', CAST(N'2021-02-18T15:13:11.810' AS DateTime))
INSERT [dbo].[PERS_Zonas] ([IdZona], [Zona], [IdDoc], [InsertUpdate], [Usuario], [FechaInsertUpdate]) VALUES (3, N'Zona tres', 3, 0, N'ahora', CAST(N'2021-02-18T15:13:16.437' AS DateTime))
INSERT [dbo].[PERS_Zonas] ([IdZona], [Zona], [IdDoc], [InsertUpdate], [Usuario], [FechaInsertUpdate]) VALUES (4, N'Zona cuatro', 4, 0, N'ahora', CAST(N'2021-02-18T15:13:20.237' AS DateTime))
SET IDENTITY_INSERT [dbo].[PERS_Zonas] OFF
ALTER TABLE [dbo].[PERS_Zonas] ADD  CONSTRAINT [DF_Pers_Zonas_InsertUpdate]  DEFAULT ((0)) FOR [InsertUpdate]
GO
ALTER TABLE [dbo].[PERS_Zonas] ADD  CONSTRAINT [DF_Pers_Zonas_Usuario]  DEFAULT (user_name()) FOR [Usuario]
GO
ALTER TABLE [dbo].[PERS_Zonas] ADD  CONSTRAINT [DF_Pers_Zonas_FechaInsertUpdate]  DEFAULT (getdate()) FOR [FechaInsertUpdate]
GO
