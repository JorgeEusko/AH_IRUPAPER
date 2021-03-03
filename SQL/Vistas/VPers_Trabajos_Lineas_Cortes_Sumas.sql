CREATE OR ALTER VIEW VPers_Trabajos_Lineas_Cortes_Sumas
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

ZPermisos VPers_Trabajos_Lineas_Sumas
GO