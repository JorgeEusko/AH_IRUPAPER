USE [AH_IRUPAPER]
GO
/****** Object:  Table [dbo].[PERS_Trabajos_Lineas_Corte]    Script Date: 02/03/2021 16:08:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERS_Trabajos_Lineas_Corte](
	[IdTrabajo] [int] NOT NULL,
	[IdLinea] [int] NOT NULL,
	[IdLineaCorte] [int] NOT NULL,
	[Fecha] [dbo].[T_Fecha_Corta] NULL,
	[Palets] [dbo].[T_Decimal] NULL,
	[ResmasPorPalet] [dbo].[T_Decimal] NULL,
	[PaletsEnviados] [dbo].[T_Decimal] NULL,
	[PaletsPendientes] [dbo].[T_Decimal] NULL,
	[NumEnvio] [int] NULL,
	[IdDoc] [dbo].[T_Id_Doc] IDENTITY(1,1) NOT NULL,
	[InsertUpdate] [dbo].[T_CEESI_Insert_Update] NOT NULL,
	[Usuario] [dbo].[T_CEESI_Usuario] NOT NULL,
	[FechaInsertUpdate] [dbo].[T_CEESI_Fecha_Sistema] NOT NULL,
 CONSTRAINT [PK_PERS_Trabajos_Lineas_Corte] PRIMARY KEY CLUSTERED 
(
	[IdTrabajo] ASC,
	[IdLinea] ASC,
	[IdLineaCorte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PERS_Trabajos_Lineas_Corte] ADD  CONSTRAINT [DF_PERS_Trabajos_Lineas_Corte_InsertUpdate]  DEFAULT ((0)) FOR [InsertUpdate]
GO
ALTER TABLE [dbo].[PERS_Trabajos_Lineas_Corte] ADD  CONSTRAINT [DF_PERS_Trabajos_Lineas_Corte_Usuario]  DEFAULT (user_name()) FOR [Usuario]
GO
ALTER TABLE [dbo].[PERS_Trabajos_Lineas_Corte] ADD  CONSTRAINT [DF_PERS_Trabajos_Lineas_Corte_FechaInsertUpdate]  DEFAULT (getdate()) FOR [FechaInsertUpdate]
GO
ALTER TABLE [dbo].[PERS_Trabajos_Lineas_Corte]  WITH CHECK ADD  CONSTRAINT [FK_PERS_Trabajos_Lineas_Corte_IdTrabajoLineaCorte] FOREIGN KEY([IdTrabajo], [IdLinea])
REFERENCES [dbo].[PERS_Trabajos_Lineas] ([IdTrabajo], [IdLinea])
GO
ALTER TABLE [dbo].[PERS_Trabajos_Lineas_Corte] CHECK CONSTRAINT [FK_PERS_Trabajos_Lineas_Corte_IdTrabajoLineaCorte]
GO
