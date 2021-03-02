USE [AH_IRUPAPER]
GO
/****** Object:  Table [dbo].[PERS_Trabajos_Lineas]    Script Date: 02/03/2021 16:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERS_Trabajos_Lineas](
	[IdTrabajo] [int] NOT NULL,
	[IdLinea] [int] NOT NULL,
	[RefTrabajoCliente] [nchar](10) NOT NULL,
	[IdArticulo] [dbo].[T_Id_Articulo] NOT NULL,
	[Precio] [dbo].[T_Decimal] NULL,
	[IdEstado] [int] NOT NULL,
	[Facturada] [bit] NULL,
	[Ancho] [dbo].[T_Decimal] NOT NULL,
	[Largo] [dbo].[T_Decimal] NOT NULL,
	[Gramaje] [dbo].[T_Decimal] NOT NULL,
	[IdCalidad] [int] NOT NULL,
	[CostePalet] [dbo].[T_Decimal] NULL,
	[FechaPrimerEnvio] [dbo].[T_Fecha_Corta] NULL,
	[IdDoc] [dbo].[T_Id_Doc] IDENTITY(1,1) NOT NULL,
	[InsertUpdate] [dbo].[T_CEESI_Insert_Update] NOT NULL,
	[Usuario] [dbo].[T_CEESI_Usuario] NOT NULL,
	[FechaInsertUpdate] [dbo].[T_CEESI_Fecha_Sistema] NOT NULL,
 CONSTRAINT [PK_PERS_Trabajos_Lineas] PRIMARY KEY CLUSTERED 
(
	[IdTrabajo] ASC,
	[IdLinea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PERS_Trabajos_Lineas] ADD  CONSTRAINT [DF_PERS_Trabajos_Lineas_InsertUpdate]  DEFAULT ((0)) FOR [InsertUpdate]
GO
ALTER TABLE [dbo].[PERS_Trabajos_Lineas] ADD  CONSTRAINT [DF_PERS_Trabajos_Lineas_Usuario]  DEFAULT (user_name()) FOR [Usuario]
GO
ALTER TABLE [dbo].[PERS_Trabajos_Lineas] ADD  CONSTRAINT [DF_PERS_Trabajos_Lineas_FechaInsertUpdate]  DEFAULT (getdate()) FOR [FechaInsertUpdate]
GO
ALTER TABLE [dbo].[PERS_Trabajos_Lineas]  WITH CHECK ADD  CONSTRAINT [FK_PERS_Trabajos_Lineas_IdTrabajo] FOREIGN KEY([IdTrabajo])
REFERENCES [dbo].[PERS_Trabajos] ([IdTrabajo])
GO
ALTER TABLE [dbo].[PERS_Trabajos_Lineas] CHECK CONSTRAINT [FK_PERS_Trabajos_Lineas_IdTrabajo]
GO
