CREATE OR ALTER VIEW VPers_Trabajos_Lineas_Resumen
AS
SELECT
    T1.*,
    T1.PesoResma * T1.Total_Resmas AS KilosCortados,
    T1.KilosTeoricos - (T1.PesoResma * T1.Total_Resmas) AS Merma,
    (T1.PesoResma * T1.Total_Resmas) / T1.KilosTeoricos AS PorcentajeMerma
FROM (
SELECT 
    TL.IdTrabajo,
    TL.IdLinea,
    ((TL.Ancho * TL.Largo * (TL.Gramaje * 500)) / 10000000) AS PesoResma,
    TLBU.Bobinas_Utilizadas,
    TLK.KilosTeoricos,
    TLCS.Total_Palets,
    TLCS.Total_Resmas,
    TLCS.Total_PaletsEnviados,
    TLCS.Total_PaletsPendientes
FROM PERS_Trabajos_Lineas AS TL 
    JOIN VPers_Trabajos_Lineas_Bobinas_Utilizadas AS TLBU ON TL.IdTrabajo = TLBU.IdTrabajo AND TL.IdLinea = TLBU.IdLinea
    LEFT JOIN VPers_Trabajos_Lineas_KilosTeoricos AS TLK ON TL.IdTrabajo = TLK.IdTrabajo AND TL.IdLinea = TLK.IdLinea
    LEFT JOIN VPers_Trabajos_Lineas_Cortes_Sumas AS TLCS  ON TL.IdTrabajo = TLCS.IdTrabajo AND TL.IdLinea = TLCS.IdLinea
) AS T1
GO

ZPermisos VPers_Trabajos_Lineas_Resumen
GO