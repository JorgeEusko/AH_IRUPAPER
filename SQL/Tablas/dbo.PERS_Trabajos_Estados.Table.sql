USE [AH_IRUPAPER]
GO
/****** Object:  Table [dbo].[PERS_Trabajos_Estados]    Script Date: 02/03/2021 16:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERS_Trabajos_Estados](
	[IdEstado] [int] NOT NULL,
	[Descrip] [varchar](255) NOT NULL,
	[IdDoc] [dbo].[T_Id_Doc] IDENTITY(1,1) NOT NULL,
	[InsertUpdate] [dbo].[T_CEESI_Insert_Update] NOT NULL,
	[Usuario] [dbo].[T_CEESI_Usuario] NOT NULL,
	[FechaInsertUpdate] [dbo].[T_CEESI_Fecha_Sistema] NOT NULL,
 CONSTRAINT [PK_PERS_Trabajos_Estados] PRIMARY KEY CLUSTERED 
(
	[IdEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PERS_Trabajos_Estados] ON 

INSERT [dbo].[PERS_Trabajos_Estados] ([IdEstado], [Descrip], [IdDoc], [InsertUpdate], [Usuario], [FechaInsertUpdate]) VALUES (1, N'Pendiente', 1, 0, N'ahora', CAST(N'2021-02-23T09:04:06.007' AS DateTime))
INSERT [dbo].[PERS_Trabajos_Estados] ([IdEstado], [Descrip], [IdDoc], [InsertUpdate], [Usuario], [FechaInsertUpdate]) VALUES (2, N'En proceso', 2, 0, N'ahora', CAST(N'2021-02-23T09:04:10.507' AS DateTime))
INSERT [dbo].[PERS_Trabajos_Estados] ([IdEstado], [Descrip], [IdDoc], [InsertUpdate], [Usuario], [FechaInsertUpdate]) VALUES (3, N'Terminado', 3, 0, N'ahora', CAST(N'2021-02-23T09:04:14.793' AS DateTime))
SET IDENTITY_INSERT [dbo].[PERS_Trabajos_Estados] OFF
ALTER TABLE [dbo].[PERS_Trabajos_Estados] ADD  CONSTRAINT [DF_PERS_Trabajos_Estados_InsertUpdate]  DEFAULT ((0)) FOR [InsertUpdate]
GO
ALTER TABLE [dbo].[PERS_Trabajos_Estados] ADD  CONSTRAINT [DF_PERS_Trabajos_Estados_Usuario]  DEFAULT (user_name()) FOR [Usuario]
GO
ALTER TABLE [dbo].[PERS_Trabajos_Estados] ADD  CONSTRAINT [DF_PERS_Trabajos_Estados_FechaInsertUpdate]  DEFAULT (getdate()) FOR [FechaInsertUpdate]
GO
