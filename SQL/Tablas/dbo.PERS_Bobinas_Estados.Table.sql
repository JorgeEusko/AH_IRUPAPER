USE [AH_IRUPAPER]
GO
/****** Object:  Table [dbo].[PERS_Bobinas_Estados]    Script Date: 02/03/2021 16:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERS_Bobinas_Estados](
	[IdEstado] [int] NOT NULL,
	[Descrip] [varchar](255) NOT NULL,
	[IdDoc] [dbo].[T_Id_Doc] IDENTITY(1,1) NOT NULL,
	[InsertUpdate] [dbo].[T_CEESI_Insert_Update] NOT NULL,
	[Usuario] [dbo].[T_CEESI_Usuario] NOT NULL,
	[FechaInsertUpdate] [dbo].[T_CEESI_Fecha_Sistema] NOT NULL,
 CONSTRAINT [PK_PERS_Bobinas_Estados] PRIMARY KEY CLUSTERED 
(
	[IdEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PERS_Bobinas_Estados] ON 

INSERT [dbo].[PERS_Bobinas_Estados] ([IdEstado], [Descrip], [IdDoc], [InsertUpdate], [Usuario], [FechaInsertUpdate]) VALUES (1, N'Disponible', 1, 0, N'dbo', CAST(N'2021-02-01T15:28:55.893' AS DateTime))
INSERT [dbo].[PERS_Bobinas_Estados] ([IdEstado], [Descrip], [IdDoc], [InsertUpdate], [Usuario], [FechaInsertUpdate]) VALUES (2, N'En proceso', 2, 0, N'dbo', CAST(N'2021-02-01T15:29:01.317' AS DateTime))
INSERT [dbo].[PERS_Bobinas_Estados] ([IdEstado], [Descrip], [IdDoc], [InsertUpdate], [Usuario], [FechaInsertUpdate]) VALUES (3, N'Cortada', 3, 0, N'dbo', CAST(N'2021-02-01T15:29:05.380' AS DateTime))
SET IDENTITY_INSERT [dbo].[PERS_Bobinas_Estados] OFF
ALTER TABLE [dbo].[PERS_Bobinas_Estados] ADD  CONSTRAINT [DF_PERS_Bobinas_Estados_InsertUpdate]  DEFAULT ((0)) FOR [InsertUpdate]
GO
ALTER TABLE [dbo].[PERS_Bobinas_Estados] ADD  CONSTRAINT [DF_PERS_Bobinas_Estados_Usuario]  DEFAULT (user_name()) FOR [Usuario]
GO
ALTER TABLE [dbo].[PERS_Bobinas_Estados] ADD  CONSTRAINT [DF_PERS_Bobinas_Estados_FechaInsertUpdate]  DEFAULT (getdate()) FOR [FechaInsertUpdate]
GO
