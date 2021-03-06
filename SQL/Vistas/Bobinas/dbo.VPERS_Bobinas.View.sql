USE [AH_IRUPAPER]
GO
/****** Object:  View [dbo].[VPERS_Bobinas]    Script Date: 17/03/2021 13:33:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER VIEW [dbo].[VPERS_Bobinas]
AS
SELECT PB.*, PBE.Descrip AS DescripEstado, PZ.Zona, PF.Fila, PTCP.Descrip AS DescripCalidadPapel, CD.Cliente
FROM PERS_Bobinas AS PB
	JOIN PERS_Bobinas_Estados AS PBE ON PB.IdEstado = PBE.IdEstado
	LEFT JOIN PERS_Tipos_Calidad_Papel AS PTCP ON PB.IdCalidad = PTCP.IdCalidad
	LEFT JOIN PERS_Zonas AS PZ ON PB.IdZona = PZ.IdZona
	LEFT JOIN PERS_Filas AS PF ON PB.IdFila = PF.IdFila
	LEFT JOIN Clientes_Datos AS CD ON PB.IdCliente = CD.IdCliente
GO
