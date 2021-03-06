USE [AH_IRUPAPER]
GO
/****** Object:  View [dbo].[VPERS_Etiquetas_Cabecera]    Script Date: 17/03/2021 13:33:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[VPERS_Etiquetas_Cabecera]
AS
SELECT 
	PTL.IdTrabajo,
	PTL.IdLinea,
	PT.DireccionEnvio,
	PTCP.Descrip AS TipoPapel,
	PTL.Gramaje,
	CONCAT(
		CAST(CAST(PTL.Ancho AS DECIMAL(34, 2)) AS VARCHAR(40)),
		' X ',
		CAST(CAST(PTL.Largo AS DECIMAL(34, 2)) AS VARCHAR(40))
	) AS Tamano,
	PT.IdPedidoCliente AS RefCliente,
	PTL.RefTrabajoCliente AS RefTrabajo
FROM PERS_Trabajos AS PT
	JOIN PERS_Trabajos_Lineas AS PTL ON PT.IdTrabajo = PTL.IdTrabajo
	LEFT JOIN PERS_Tipos_Calidad_Papel AS PTCP ON PTL.IdCalidad = PTCP.IdCalidad
GO
