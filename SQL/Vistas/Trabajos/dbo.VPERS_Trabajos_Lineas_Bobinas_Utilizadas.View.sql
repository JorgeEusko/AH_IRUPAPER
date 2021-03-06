USE [AH_IRUPAPER]
GO
/****** Object:  View [dbo].[VPERS_Trabajos_Lineas_Bobinas_Utilizadas]    Script Date: 17/03/2021 13:33:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER  VIEW [dbo].[VPERS_Trabajos_Lineas_Bobinas_Utilizadas]
AS
SELECT TLB.IdTrabajo, TLB.IdLinea, COUNT(TLB.IdBobina) AS Bobinas_Utilizadas
FROM PERS_Trabajos_Lineas_Bobinas AS TLB
GROUP BY TLB.IdTrabajo, TLB.IdLinea
GO
