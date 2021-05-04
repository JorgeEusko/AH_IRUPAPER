SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-------------------------------------------------------------------------------------------
-- PERS_BOBIBINAS_ESTADOS
-------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[PERS_Bobinas_Estados] (
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

ALTER TABLE [dbo].[PERS_Bobinas_Estados] ADD  CONSTRAINT [DF_PERS_Bobinas_Estados_InsertUpdate]  DEFAULT ((0)) FOR [InsertUpdate]
GO

ALTER TABLE [dbo].[PERS_Bobinas_Estados] ADD  CONSTRAINT [DF_PERS_Bobinas_Estados_Usuario]  DEFAULT (user_name()) FOR [Usuario]
GO

ALTER TABLE [dbo].[PERS_Bobinas_Estados] ADD  CONSTRAINT [DF_PERS_Bobinas_Estados_FechaInsertUpdate]  DEFAULT (getdate()) FOR [FechaInsertUpdate]
GO

ZPERMISOS PERS_Bobinas_Estados
GO

SET IDENTITY_INSERT [dbo].[PERS_Bobinas_Estados] ON 
GO

INSERT [dbo].[PERS_Bobinas_Estados] ([IdEstado], [Descrip], [IdDoc], [InsertUpdate], [Usuario], [FechaInsertUpdate]) VALUES (1, N'Disponible', 1, 0, N'dbo', CAST(N'2021-02-01T15:28:55.893' AS DateTime))
INSERT [dbo].[PERS_Bobinas_Estados] ([IdEstado], [Descrip], [IdDoc], [InsertUpdate], [Usuario], [FechaInsertUpdate]) VALUES (2, N'En proceso', 2, 0, N'dbo', CAST(N'2021-02-01T15:29:01.317' AS DateTime))
INSERT [dbo].[PERS_Bobinas_Estados] ([IdEstado], [Descrip], [IdDoc], [InsertUpdate], [Usuario], [FechaInsertUpdate]) VALUES (3, N'Cortada', 3, 0, N'dbo', CAST(N'2021-02-01T15:29:05.380' AS DateTime))
INSERT [dbo].[PERS_Bobinas_Estados] ([IdEstado], [Descrip], [IdDoc], [InsertUpdate], [Usuario], [FechaInsertUpdate]) VALUES (4, N'Disponible con observaciones', 4, 0, N'dbo', CAST(N'2021-02-01T15:29:05.400' AS DateTime))

SET IDENTITY_INSERT [dbo].[PERS_Bobinas_Estados] OFF
GO
-------------------------------------------------------------------------------------------
-- PERS_FILAS
-------------------------------------------------------------------------------------------
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

ALTER TABLE [dbo].[PERS_Filas] ADD  CONSTRAINT [DF_Pers_Filas_InsertUpdate]  DEFAULT ((0)) FOR [InsertUpdate]
GO

ALTER TABLE [dbo].[PERS_Filas] ADD  CONSTRAINT [DF_Pers_Filas_Usuario]  DEFAULT (user_name()) FOR [Usuario]
GO

ALTER TABLE [dbo].[PERS_Filas] ADD  CONSTRAINT [DF_Pers_Filas_FechaInsertUpdate]  DEFAULT (getdate()) FOR [FechaInsertUpdate]
GO

ZPERMISOS PERS_Filas
GO
-------------------------------------------------------------------------------------------
-- PERS_ZONAS
-------------------------------------------------------------------------------------------
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

ALTER TABLE [dbo].[PERS_Zonas] ADD  CONSTRAINT [DF_Pers_Zonas_InsertUpdate]  DEFAULT ((0)) FOR [InsertUpdate]
GO

ALTER TABLE [dbo].[PERS_Zonas] ADD  CONSTRAINT [DF_Pers_Zonas_Usuario]  DEFAULT (user_name()) FOR [Usuario]
GO

ALTER TABLE [dbo].[PERS_Zonas] ADD  CONSTRAINT [DF_Pers_Zonas_FechaInsertUpdate]  DEFAULT (getdate()) FOR [FechaInsertUpdate]
GO

ZPERMISOS PERS_Zonas
GO
-------------------------------------------------------------------------------------------
-- PERS_TIPOS_CALIDAD_PAPEL
-------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[PERS_Tipos_Calidad_Papel](
	[IdCalidad] [int] NOT NULL,
	[Descrip] [varchar](255) NOT NULL,
	[IdDoc] [dbo].[T_Id_Doc] IDENTITY(1,1) NOT NULL,
	[InsertUpdate] [dbo].[T_CEESI_Insert_Update] NOT NULL,
	[Usuario] [dbo].[T_CEESI_Usuario] NOT NULL,
	[FechaInsertUpdate] [dbo].[T_CEESI_Fecha_Sistema] NOT NULL,
 CONSTRAINT [PK_PERS_Tipos_Calidad_Papel] PRIMARY KEY CLUSTERED 
(
	[IdCalidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[PERS_Tipos_Calidad_Papel] ADD  CONSTRAINT [DF_PERS_Tipos_Calidad_Papel_InsertUpdate]  DEFAULT ((0)) FOR [InsertUpdate]
GO

ALTER TABLE [dbo].[PERS_Tipos_Calidad_Papel] ADD  CONSTRAINT [DF_PERS_Tipos_Calidad_Papel_Usuario]  DEFAULT (user_name()) FOR [Usuario]
GO

ALTER TABLE [dbo].[PERS_Tipos_Calidad_Papel] ADD  CONSTRAINT [DF_PERS_Tipos_Calidad_Papel_FechaInsertUpdate]  DEFAULT (getdate()) FOR [FechaInsertUpdate]
GO

ZPERMISOS PERS_Tipos_Calidad_Papel
GO
-------------------------------------------------------------------------------------------
-- PERS_TRABAJOS_ESTADOS
-------------------------------------------------------------------------------------------
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

ALTER TABLE [dbo].[PERS_Trabajos_Estados] ADD  CONSTRAINT [DF_PERS_Trabajos_Estados_InsertUpdate]  DEFAULT ((0)) FOR [InsertUpdate]
GO

ALTER TABLE [dbo].[PERS_Trabajos_Estados] ADD  CONSTRAINT [DF_PERS_Trabajos_Estados_Usuario]  DEFAULT (user_name()) FOR [Usuario]
GO

ALTER TABLE [dbo].[PERS_Trabajos_Estados] ADD  CONSTRAINT [DF_PERS_Trabajos_Estados_FechaInsertUpdate]  DEFAULT (getdate()) FOR [FechaInsertUpdate]
GO

ZPERMISOS PERS_Trabajos_Estados
GO
-------------------------------------------------------------------------------------------
-- PERS_BOBINAS
-------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[PERS_Bobinas](
	[IdBobina] [int] NOT NULL,
	[NumBobina] [int] NOT NULL,
	[RefBobina] [varchar](255) NOT NULL,
	[IdCliente] [dbo].[T_Id_Cliente] NOT NULL,
	[RefTrabajo] [varchar](255) NULL,
	[AlbaranEntrada] [varchar](255) NULL,
	[FechaEntrada] [datetime] NOT NULL,
	[Kilos] [dbo].[T_Decimal] NULL,
	[Ancho] [dbo].[T_Decimal] NOT NULL,
	[Metros] [dbo].[T_Decimal] NULL,
	[Gramaje] [dbo].[T_Decimal] NOT NULL,
	[IdCalidad] [int] NOT NULL,
	[IdEstado] [int] NOT NULL,
	[Observaciones] [varchar](1000) NULL,
	[IdZona] [int] NULL,
	[IdFila] [int] NULL,
	[Asignada] [dbo].[T_Booleano] NULL,
	[Marcar] [dbo].[T_Booleano] NULL,
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

ALTER TABLE [dbo].[PERS_Bobinas] ADD  CONSTRAINT [DF_PERS_Bobinas_Kilos]  DEFAULT ((0)) FOR [Kilos]
GO

ALTER TABLE [dbo].[PERS_Bobinas] ADD  CONSTRAINT [DF_PERS_Bobinas_Metros]  DEFAULT ((0)) FOR [Metros]
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

ZPERMISOS PERS_Bobinas
GO
-------------------------------------------------------------------------------------------
-- PERS_TRABAJOS
-------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[PERS_Trabajos](
	[IdTrabajo] [int] NOT NULL,
	[Fecha] [smalldatetime] NOT NULL,
	[IdCliente] [dbo].[T_Id_Cliente] NOT NULL,
	[IdPedidoCliente] [dbo].[T_IdPedidoCli] NULL,
	[IdPedidoClienteFinal] [dbo].[T_IdPedidoCli] NULL,
	[DireccionEnvio] [varchar](255) NULL,
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

ZPERMISOS PERS_Trabajos
GO
-------------------------------------------------------------------------------------------
-- PERS_TRABAJOS_LINEAS
-------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[PERS_Trabajos_Lineas](
	[IdTrabajo] [int] NOT NULL,
	[IdLinea] [int] NOT NULL,
	[RefTrabajoCliente] [nchar](10) NOT NULL,
	[IdArticulo] [dbo].[T_Id_Articulo] NOT NULL,
	[IdEstado] [int] NOT NULL,
	[Facturada] [bit] NOT NULL,
	[Ancho] [dbo].[T_Decimal] NOT NULL,
	[Largo] [dbo].[T_Decimal] NOT NULL,
	[Gramaje] [dbo].[T_Decimal] NOT NULL,
	[IdCalidad] [int] NOT NULL,
	[IdArticuloPrecio] [dbo].[T_Id_Articulo] NULL,
    [AnchoPalet] [dbo].[T_Decimal] NULL,
	[LargoPalet] [dbo].[T_Decimal] NULL,
	[FechaPrimerEnvio] [dbo].[T_Fecha_Corta] NULL,
	[CostePaletFacturable] [bit] NOT NULL,
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

ALTER TABLE [dbo].[PERS_Trabajos_Lineas] ADD  CONSTRAINT [DF_PERS_Trabajos_Lineas_Facturada]  DEFAULT ((0)) FOR [Facturada]
GO

ALTER TABLE [dbo].[PERS_Trabajos_Lineas] ADD  CONSTRAINT [DF_PERS_Trabajos_Lineas_CostePaletFacturable]  DEFAULT ((0)) FOR [CostePaletFacturable]
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

ZPERMISOS PERS_Trabajos_Lineas
GO
-------------------------------------------------------------------------------------------
-- PERS_TRABAJOS_LINEAS_BOBINAS
-------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[PERS_Trabajos_Lineas_Bobinas](
	[IdTrabajo] [int] NOT NULL,
	[IdLinea] [int] NOT NULL,
	[IdBobina] [int] NOT NULL,
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

ALTER TABLE [dbo].[PERS_Trabajos_Lineas_Bobinas]  WITH CHECK ADD  CONSTRAINT [FK_PERS_Trabajos_Lineas_IdTrabajoLinea] FOREIGN KEY([IdTrabajo], [IdLinea])
REFERENCES [dbo].[PERS_Trabajos_Lineas] ([IdTrabajo], [IdLinea])
GO

ALTER TABLE [dbo].[PERS_Trabajos_Lineas_Bobinas] CHECK CONSTRAINT [FK_PERS_Trabajos_Lineas_IdTrabajoLinea]
GO

ZPERMISOS PERS_Trabajos_Lineas_Bobinas
GO
-------------------------------------------------------------------------------------------
-- PERS_TRABAJOS_LINEAS_CORTE
-------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[PERS_Trabajos_Lineas_Corte](
	[IdTrabajo] [int] NOT NULL,
	[IdLinea] [int] NOT NULL,
	[IdLineaCorte] [int] NOT NULL,
	[Fecha] [dbo].[T_Fecha_Corta] NULL,
	[Palets] [dbo].[T_Decimal] NULL,
	[ResmasPorPalet] [dbo].[T_Decimal] NULL,
	[PaletsEnviados] [dbo].[T_Decimal] NULL,
	[PaletsPendientes] [dbo].[T_Decimal] NULL,
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

ZPERMISOS PERS_Trabajos_Lineas_Corte
GO
-------------------------------------------------------------------------------------------
-- PERS_ENVIOS
-------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[PERS_Envios](
	[IdEnvio] [int] NOT NULL,
	[NumEnvioCliente] [int] NOT NULL,
	[Fecha] [smalldatetime] NOT NULL,
	[Cliente] [dbo].[T_Id_Cliente] NOT NULL,
	[IdDirEnvio] [varchar](255) NULL,
	[Transportista] [dbo].[T_Id_Proveedor] NULL,
	[Matricula] [varchar](255) NULL,
	[LineaObservaciones1] [varchar](1000) NULL,
	[LineaObservaciones2] [varchar](1000) NULL,
	[ImprimirObservaciones] [bit] NULL,
	[Receptor] [varchar](255) NULL,
	[Domicilio] [varchar](255) NULL,
	[Domicilio Transporte] [varchar](255) NULL,
	[CIF_Transporte] [varchar](255) NULL,
	[IdDoc] [dbo].[T_Id_Doc] IDENTITY(1,1) NOT NULL,
	[InsertUpdate] [dbo].[T_CEESI_Insert_Update] NOT NULL,
	[Usuario] [dbo].[T_CEESI_Usuario] NOT NULL,
	[FechaInsertUpdate] [dbo].[T_CEESI_Fecha_Sistema] NOT NULL,
 CONSTRAINT [PK_PERS_Envios] PRIMARY KEY CLUSTERED 
(
	[IdEnvio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[PERS_Envios] ADD  CONSTRAINT [DF_PERS_Envios_InsertUpdate]  DEFAULT ((0)) FOR [InsertUpdate]
GO

ALTER TABLE [dbo].[PERS_Envios] ADD  CONSTRAINT [DF_PERS_Envios_Usuario]  DEFAULT (user_name()) FOR [Usuario]
GO

ALTER TABLE [dbo].[PERS_Envios] ADD  CONSTRAINT [DF_PERS_Envios_FechaInsertUpdate]  DEFAULT (getdate()) FOR [FechaInsertUpdate]
GO

ZPERMISOS PERS_Envios
GO
-------------------------------------------------------------------------------------------
-- PERS_ENVIOS_LINEAS
-------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[PERS_Envios_Lineas](
	[IdEnvio] [int] NOT NULL,
	[IdEnvioLinea] [int] NOT NULL,
	[IdTrabajo] [int] NOT NULL,
	[IdTrabajoLinea] [int] NOT NULL,
	[IdTrabajoLineaCorte] [int] NOT NULL,
	[RefTrabajo] [varchar](255) NOT NULL,
	[IdPedidoCliente] [dbo].[T_IdPedidoCli] NULL,
	[IdPedidoClienteFinal] [dbo].[T_IdPedidoCli] NULL,
	[Palets] [dbo].[T_Decimal] NOT NULL,
	[ResmasPorPalet] [dbo].[T_Decimal] NOT NULL,
	[Resmas] [dbo].[T_Decimal] NOT NULL,
	[PesoResma] [dbo].[T_Decimal] NOT NULL,
	[Facturada] [bit] NULL,
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

ALTER TABLE [dbo].[PERS_Envios_Lineas]  WITH CHECK ADD  CONSTRAINT [FK_PERS_Envios_Lineas_PERS_Envios] FOREIGN KEY([IdEnvio])
REFERENCES [dbo].[PERS_Envios] ([IdEnvio])
GO

ALTER TABLE [dbo].[PERS_Envios_Lineas] CHECK CONSTRAINT [FK_PERS_Envios_Lineas_PERS_Envios]
GO

ALTER TABLE [dbo].[PERS_Envios_Lineas]  WITH CHECK ADD  CONSTRAINT [FK_PERS_Envios_Lineas_PERS_Trabajos_Lineas] FOREIGN KEY([IdTrabajo], [IdTrabajoLinea], [IdTrabajoLineaCorte])
REFERENCES [dbo].[PERS_Trabajos_Lineas_Corte] ([IdTrabajo], [IdLinea], [IdLineaCorte])
GO

ALTER TABLE [dbo].[PERS_Envios_Lineas] CHECK CONSTRAINT [FK_PERS_Envios_Lineas_PERS_Trabajos_Lineas]
GO

ZPERMISOS PERS_Envios_Lineas
GO
-------------------------------------------------------------------------------------------
-- PERS_TEMP_ASIGNAR_ENVIOS
-------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[PERS_TEMP_Asignar_Envios](
	[IdTrabajo] [int] NOT NULL,
	[IdLinea] [int] NOT NULL,
	[IdLineaCorte] [int] NOT NULL,
	[FechaCorte] [smalldatetime] NOT NULL,
	[RefTrabajo] [varchar](255) NOT NULL,
	[PedidoCliente] [dbo].[T_IdPedidoCli] NULL,
	[IdCliente] [dbo].[T_Id_Cliente] NOT NULL,
	[Cliente] [varchar](255) NOT NULL,
	[PaletsCortados] [dbo].[T_Decimal] NOT NULL,
	[ResmasPorPalet] [dbo].[T_Decimal] NULL,
	[Resmas] [dbo].[T_Decimal] NOT NULL,
	[PaletsEnviados] [dbo].[T_Decimal] NOT NULL,
	[PaletsPendientes] [dbo].[T_Decimal] NOT NULL,
	[PaletsAsignar] [dbo].[T_Decimal] NULL,
	[IdDoc] [dbo].[T_Id_Doc] NOT NULL,
	[DireccionEnvio] [varchar](255) NULL,
 CONSTRAINT [PK_PERS_TEMP_Asignar_Envios] PRIMARY KEY CLUSTERED 
(
	[IdTrabajo] ASC,
	[IdLinea] ASC,
	[IdLineaCorte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ZPERMISOS PERS_TEMP_Asignar_Envios
GO
-------------------------------------------------------------------------------------------
-- PERS_TEMP_CLIENTES_DATOS
-------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[PERS_TEMP_Clientes_Datos](
	[IdCliente] [dbo].[T_Id_Cliente] NOT NULL,
	[Cliente] [dbo].[T_Nombre] NULL,
	[Marcado] [bit] NULL,
	[IdDoc] [dbo].[T_Id_Doc] NOT NULL
) ON [PRIMARY]
GO

ZPERMISOS PERS_TEMP_Clientes_Datos
GO
-------------------------------------------------------------------------------------------
-- PERS_TEMP_CONTACTOS
-------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[PERS_TEMP_Contactos](
	[IdContacto] [int] NULL,
	[Nombre] [varchar](255) NULL,
	[Direccion] [dbo].[T_Direccion] NULL,
	[Marcado] [bit] NULL,
	[IdDoc] [dbo].[T_Id_Doc] NOT NULL
) ON [PRIMARY]
GO

ZPERMISOS PERS_TEMP_Contactos
GO
-------------------------------------------------------------------------------------------
-- PERS_TEMP_ETIQUETAS_PALETS
-------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[PERS_TEMP_Etiquetas_Palets](
	[IdTrabajo] [int] NOT NULL,
	[IdLinea] [int] NOT NULL,
	[IdLineaCorte] [int] NOT NULL,
	[EnvioA] [varchar](50) NULL,
	[IdCalidadPapel] [int] NULL,
	[Ancho] [dbo].[T_Decimal] NULL,
	[Metros] [dbo].[T_Decimal] NULL,
	[GramajeM2] [dbo].[T_Decimal] NULL,
	[TotalResmas] [int] NULL,
	[PesoPalet] [dbo].[T_Decimal] NULL,
	[RefFrabricacion] [varchar](255) NULL,
	[NumCopia] [int] NULL
) ON [PRIMARY]
GO

ZPERMISOS PERS_TEMP_Etiquetas_Palets
GO
-------------------------------------------------------------------------------------------
-- PERS_TEMP_GENERAR_FACTURAS
-------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[PERS_TEMP_Generar_Facturas](
	[IdEnvio] [int] NOT NULL,
	[IdEnvioLinea] [int] NOT NULL,
	[IdCliente] [dbo].[T_Id_Cliente] NOT NULL,
	[RefTrabajoCliente] [varchar](255) NOT NULL,
	[IdPedidoCliente] [dbo].[T_IdPedidoCli] NULL,
	[Fecha] [smalldatetime] NULL,
	[IdArticulo] [dbo].[T_Id_Articulo] NOT NULL,
	[KilosCortados] [dbo].[T_Decimal] NOT NULL,
	[TotalPalets] [dbo].[T_Decimal] NOT NULL,
	[TotalResmas] [dbo].[T_Decimal] NOT NULL,
	[TotalPaletsEnviados] [dbo].[T_Decimal] NOT NULL,
	[Precio] [dbo].[T_Decimal] NOT NULL,
	[FechaPrimerEnvio] [nchar](10) NULL,
	[IdDoc] [dbo].[T_Id_Doc] NOT NULL,
	[Marcar] [bit] NOT NULL,
	[PedidoGenerado] [bit] NOT NULL,
 CONSTRAINT [PK_PERS_TEMP_Generar_Facturas] PRIMARY KEY CLUSTERED 
(
	[IdEnvio] ASC,
	[IdEnvioLinea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[PERS_TEMP_Generar_Facturas] ADD  CONSTRAINT [DF_PERS_TEMP_Generar_Facturas_Marcar]  DEFAULT ((0)) FOR [Marcar]
GO

ZPERMISOS PERS_TEMP_Generar_Facturas
GO