USE [AH_IRUPAPER]
GO
/****** Object:  Table [dbo].[PERS_Trabajos_Lineas_Bobinas]    Script Date: 02/03/2021 16:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERS_Trabajos_Lineas_Bobinas](
	[IdTrabajo] [int] NOT NULL,
	[IdLinea] [int] NOT NULL,
	[IdBobina] [int] NOT NULL,
	[RefBobina] [varchar](255) NULL,
	[NumBobina] [int] NOT NULL,
	[Utilizada] [bit] NOT NULL,
	[IdDoc] [dbo].[T_Id_Doc] IDENTITY(1,1) NOT NULL,
	[InsertUpdate] [dbo].[T_CEESI_Insert_Update] NOT NULL,
	[Usuario] [dbo].[T_CEESI_Usuario] NOT NULL,
	[FechaInsertUpdate] [dbo].[T_CEESI_Fecha_Sistema] NOT NULL,
 CONSTRAINT [PK_PERS_Trabajos_Lineas_Bobinas] PRIMARY KEY CLUSTERED 
(
	[IdTrabajo] ASC,
	[IdLinea] ASC,
	[IdBobina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PERS_Trabajos_Lineas_Bobinas] ADD  CONSTRAINT [DF_PERS_Trabajos_Lineas_Bobinas_Utilizada]  DEFAULT ((0)) FOR [Utilizada]
GO
ALTER TABLE [dbo].[PERS_Trabajos_Lineas_Bobinas] ADD  CONSTRAINT [DF_PERS_Trabajos_Lineas_Bobinas_InsertUpdate]  DEFAULT ((0)) FOR [InsertUpdate]
GO
ALTER TABLE [dbo].[PERS_Trabajos_Lineas_Bobinas] ADD  CONSTRAINT [DF_PERS_Trabajos_Lineas_Bobinas_Usuario]  DEFAULT (user_name()) FOR [Usuario]
GO
ALTER TABLE [dbo].[PERS_Trabajos_Lineas_Bobinas] ADD  CONSTRAINT [DF_PERS_Trabajos_Lineas_Bobinas_FechaInsertUpdate]  DEFAULT (getdate()) FOR [FechaInsertUpdate]
GO
ALTER TABLE [dbo].[PERS_Trabajos_Lineas_Bobinas]  WITH CHECK ADD  CONSTRAINT [FK_PERS_Trabajos_Lineas_Bobinas_IdBobina] FOREIGN KEY([IdBobina])
REFERENCES [dbo].[PERS_Bobinas] ([IdBobina])
GO
ALTER TABLE [dbo].[PERS_Trabajos_Lineas_Bobinas] CHECK CONSTRAINT [FK_PERS_Trabajos_Lineas_Bobinas_IdBobina]
GO
ALTER TABLE [dbo].[PERS_Trabajos_Lineas_Bobinas]  WITH CHECK ADD  CONSTRAINT [FK_PERS_Trabajos_Lineas_IdTrabajoLinea] FOREIGN KEY([IdTrabajo])
REFERENCES [dbo].[PERS_Trabajos] ([IdTrabajo])
GO
ALTER TABLE [dbo].[PERS_Trabajos_Lineas_Bobinas] CHECK CONSTRAINT [FK_PERS_Trabajos_Lineas_IdTrabajoLinea]
GO
