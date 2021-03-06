USE [AH_IRUPAPER]
GO
/****** Object:  View [dbo].[VPERS_Trabajos_Lineas_Cortes_Sumas]    Script Date: 17/03/2021 13:33:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[VPERS_Trabajos_Lineas_Cortes_Sumas]
AS
SELECT 
    TLC.IdTrabajo, 
    TLC.IdLinea, 
    SUM(TLC.Palets) AS Total_Palets,
    SUM(TLC.ResmasPorPalet * Palets) AS Total_Resmas,
    SUM(TLC.PaletsEnviados) AS
    Total_PaletsEnviados,
    SUM(TLC.PaletsPendientes) AS
    Total_PaletsPendientes
FROM PERS_Trabajos_Lineas_Corte AS TLC
GROUP BY TLC.IdTrabajo, TLC.IdLinea
GO
