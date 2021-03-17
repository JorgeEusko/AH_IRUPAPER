USE [AH_IRUPAPER]
GO
/****** Object:  Table [dbo].[PERS_Envios_Lineas]    Script Date: 17/03/2021 13:23:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERS_Envios_Lineas](
	[IdEnvio] [int] NOT NULL,
	[IdEnvioLinea] [int] NOT NULL,
	[IdTrabajo] [int] NULL,
	[IdTrabajoLinea] [int] NULL,
	[IdTrabajoLineaCorte] [int] NULL,
	[RefTrabajo] [varchar](255) NULL,
	[IdPedidoCliente] [dbo].[T_IdPedidoCli] NULL,
	[IdPedidoClienteFinal] [dbo].[T_IdPedidoCli] NULL,
	[Palets] [dbo].[T_Decimal] NULL,
	[Resmas] [dbo].[T_Decimal] NULL,
	[PesoResma] [dbo].[T_Decimal] NULL,
	[IdDoc] [dbo].[T_Id_Doc] IDENTITY(1,1) NOT NULL,
	[InsertUpdate] [dbo].[T_CEESI_Insert_Update] NOT NULL,
	[Usuario] [dbo].[T_CEESI_Usuario] NOT NULL,
	[FechaInsertUpdate] [dbo].[T_CEESI_Fecha_Sistema] NOT NULL,
 CONSTRAINT [PK_PERS_Envios_Lineas] PRIMARY KEY CLUSTERED 
(
	[IdEnvio] ASC,
	[IdEnvioLinea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PERS_Envios_Lineas] ADD  CONSTRAINT [DF_PERS_Envios_Lineas_InsertUpdate]  DEFAULT ((0)) FOR [InsertUpdate]
GO
ALTER TABLE [dbo].[PERS_Envios_Lineas] ADD  CONSTRAINT [DF_PERS_Envios_Lineas_Usuario]  DEFAULT (user_name()) FOR [Usuario]
GO
ALTER TABLE [dbo].[PERS_Envios_Lineas] ADD  CONSTRAINT [DF_PERS_Envios_Lineas_FechaInsertUpdate]  DEFAULT (getdate()) FOR [FechaInsertUpdate]
GO
ALTER TABLE [dbo].[PERS_Envios_Lineas]  WITH CHECK ADD  CONSTRAINT [FK_PERS_Envios_Lineas_PERS_Trabajos_Lineas] FOREIGN KEY([IdTrabajo], [IdTrabajoLinea], [IdTrabajoLineaCorte])
REFERENCES [dbo].[PERS_Trabajos_Lineas_Corte] ([IdTrabajo], [IdLinea], [IdLineaCorte])
GO
ALTER TABLE [dbo].[PERS_Envios_Lineas] CHECK CONSTRAINT [FK_PERS_Envios_Lineas_PERS_Trabajos_Lineas]
GO
