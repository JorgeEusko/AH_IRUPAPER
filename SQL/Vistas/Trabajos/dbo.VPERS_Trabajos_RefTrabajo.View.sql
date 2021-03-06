USE [AH_IRUPAPER]
GO
/****** Object:  View [dbo].[VPERS_Trabajos]    Script Date: 17/03/2021 13:33:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER  VIEW [dbo].[VPERS_Trabajos_RefTrabajo]
AS
SELECT 
	DISTINCT
	PT.*, 
	PTE.Descrip AS DescripEstado, 
	CD.Cliente,
	PTL.RefTrabajoCliente AS RefTrabajo
FROM PERS_Trabajos PT
	JOIN PERS_Trabajos_Estados AS PTE on PT.IdEstado =  PTE.IdEstado
	JOIN Clientes_Datos AS CD ON PT.IdCliente = CD.IdCliente
	JOIN PERS_Trabajos_Lineas AS PTL ON PT.IdTrabajo = PTL.IdTrabajo
GO

ZPERMISOS VPERS_Trabajos_RefTrabajo
GO
