CREATE OR ALTER VIEW VPers_Trabajos_Lineas_KilosTeoricos
AS 
SELECT TLB.IdTrabajo, TLB.IdLinea, SUM(B.Kilos) AS KilosTeoricos
FROM Pers_Trabajos_Lineas_Bobinas AS TLB 
    JOIN PERS_Bobinas AS B ON TLB.IdBobina = B.IdBobina
WHERE TLB.Utilizada = 1
GROUP BY TLB.IdTrabajo, TLB.IdLinea
GO

ZPermisos VPers_Trabajos_Lineas_KilosTeoricos
GO