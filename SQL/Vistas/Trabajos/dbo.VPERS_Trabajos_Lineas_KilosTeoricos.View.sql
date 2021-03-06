USE [AH_IRUPAPER]
GO
/****** Object:  View [dbo].[VPERS_Trabajos_Lineas_KilosTeoricos]    Script Date: 17/03/2021 13:33:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER VIEW [dbo].[VPERS_Trabajos_Lineas_KilosTeoricos]
AS 
SELECT TLB.IdTrabajo, TLB.IdLinea, SUM(B.Kilos) AS KilosTeoricos
FROM Pers_Trabajos_Lineas_Bobinas AS TLB 
    JOIN PERS_Bobinas AS B ON TLB.IdBobina = B.IdBobina
GROUP BY TLB.IdTrabajo, TLB.IdLinea
GO
