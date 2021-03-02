USE [AH_IRUPAPER]
GO
/****** Object:  Table [dbo].[PERS_Bobinas]    Script Date: 02/03/2021 16:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERS_Bobinas](
	[IdBobina] [int] NOT NULL,
	[NumBobina] [int] NOT NULL,
	[RefBobina] [varchar](255) NOT NULL,
	[IdCliente] [dbo].[T_Id_Cliente] NOT NULL,
	[IdPedidoCliente] [dbo].[T_Id_Pedido] NULL,
	[RefTrabajo] [varchar](255) NULL,
	[AlbaranEntrada] [varchar](255) NULL,
	[FechaEntrada] [datetime] NOT NULL,
	[Kilos] [dbo].[T_Decimal] NULL,
	[Ancho] [dbo].[T_Decimal] NOT NULL,
	[Metros] [dbo].[T_Decimal] NULL,
	[Gramaje] [dbo].[T_Decimal] NOT NULL,
	[IdCalidad] [int] NOT NULL,
	[IdTrabajo] [int] NULL,
	[IdLineaTrabajo] [int] NULL,
	[IdEstado] [int] NOT NULL,
	[Observaciones] [varchar](1000) NULL,
	[IdZona] [int] NULL,
	[IdFila] [int] NULL,
	[IdDoc] [dbo].[T_Id_Doc] IDENTITY(1,1) NOT NULL,
	[InsertUpdate] [dbo].[T_CEESI_Insert_Update] NOT NULL,
	[Usuario] [dbo].[T_CEESI_Usuario] NOT NULL,
	[FechaInsertUpdate] [dbo].[T_CEESI_Fecha_Sistema] NOT NULL,
 CONSTRAINT [PK_PERS_Bobinas] PRIMARY KEY CLUSTERED 
(
	[IdBobina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PERS_Bobinas] ADD  CONSTRAINT [DF_PERS_Bobinas_InsertUpdate]  DEFAULT ((0)) FOR [InsertUpdate]
GO
ALTER TABLE [dbo].[PERS_Bobinas] ADD  CONSTRAINT [DF_PERS_Bobinas_Usuario]  DEFAULT (user_name()) FOR [Usuario]
GO
ALTER TABLE [dbo].[PERS_Bobinas] ADD  CONSTRAINT [DF_PERS_Bobinas_FechaInsertUpdate]  DEFAULT (getdate()) FOR [FechaInsertUpdate]
GO
ALTER TABLE [dbo].[PERS_Bobinas]  WITH CHECK ADD  CONSTRAINT [FK_PERS_Bobinas_IdCalidad] FOREIGN KEY([IdCalidad])
REFERENCES [dbo].[PERS_Tipos_Calidad_Papel] ([IdCalidad])
GO
ALTER TABLE [dbo].[PERS_Bobinas] CHECK CONSTRAINT [FK_PERS_Bobinas_IdCalidad]
GO
ALTER TABLE [dbo].[PERS_Bobinas]  WITH CHECK ADD  CONSTRAINT [FK_Pers_Bobinas_IdEstado] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[PERS_Bobinas_Estados] ([IdEstado])
GO
ALTER TABLE [dbo].[PERS_Bobinas] CHECK CONSTRAINT [FK_Pers_Bobinas_IdEstado]
GO
ALTER TABLE [dbo].[PERS_Bobinas]  WITH CHECK ADD  CONSTRAINT [FK_PERS_Bobinas_IdFila] FOREIGN KEY([IdFila])
REFERENCES [dbo].[PERS_Filas] ([IdFila])
GO
ALTER TABLE [dbo].[PERS_Bobinas] CHECK CONSTRAINT [FK_PERS_Bobinas_IdFila]
GO
ALTER TABLE [dbo].[PERS_Bobinas]  WITH CHECK ADD  CONSTRAINT [FK_PERS_Bobinas_IdZona] FOREIGN KEY([IdZona])
REFERENCES [dbo].[PERS_Zonas] ([IdZona])
GO
ALTER TABLE [dbo].[PERS_Bobinas] CHECK CONSTRAINT [FK_PERS_Bobinas_IdZona]
GO
