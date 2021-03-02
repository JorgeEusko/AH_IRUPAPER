USE [AH_IRUPAPER]
GO
/****** Object:  Table [dbo].[PERS_Trabajos]    Script Date: 02/03/2021 16:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERS_Trabajos](
	[IdTrabajo] [int] NOT NULL,
	[Fecha] [smalldatetime] NOT NULL,
	[IdCliente] [dbo].[T_Id_Cliente] NOT NULL,
	[IdPedidoCliente] [dbo].[T_IdPedidoCli] NULL,
	[IdPedidoClienteFinal] [dbo].[T_IdPedidoCli] NULL,
	[DireccionEnvio] [int] NULL,
	[Observaciones] [varchar](1000) NULL,
	[IdEstado] [int] NOT NULL,
	[Facturado] [bit] NOT NULL,
	[IdDoc] [dbo].[T_Id_Doc] IDENTITY(1,1) NOT NULL,
	[InsertUpdate] [dbo].[T_CEESI_Insert_Update] NOT NULL,
	[Usuario] [dbo].[T_CEESI_Usuario] NOT NULL,
	[FechaInsertUpdate] [dbo].[T_CEESI_Fecha_Sistema] NOT NULL,
 CONSTRAINT [PK_PERS_Trabajos] PRIMARY KEY CLUSTERED 
(
	[IdTrabajo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PERS_Trabajos] ADD  CONSTRAINT [DF_PERS_Trabajos_InsertUpdate]  DEFAULT ((0)) FOR [InsertUpdate]
GO
ALTER TABLE [dbo].[PERS_Trabajos] ADD  CONSTRAINT [DF_PERS_Trabajos_Usuario]  DEFAULT (user_name()) FOR [Usuario]
GO
ALTER TABLE [dbo].[PERS_Trabajos] ADD  CONSTRAINT [DF_PERS_Trabajos_FechaInsertUpdate]  DEFAULT (getdate()) FOR [FechaInsertUpdate]
GO
ALTER TABLE [dbo].[PERS_Trabajos]  WITH CHECK ADD  CONSTRAINT [FK_PERS_Trabajos_IdEstado] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[PERS_Trabajos_Estados] ([IdEstado])
GO
ALTER TABLE [dbo].[PERS_Trabajos] CHECK CONSTRAINT [FK_PERS_Trabajos_IdEstado]
GO
