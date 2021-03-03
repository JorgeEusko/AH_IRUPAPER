CREATE OR ALTER VIEW VPers_Trabajos_Lineas_Bobinas_Utilizadas
AS
SELECT TLB.IdTrabajo, TLB.IdLinea, SUM(TLB.IdBobina) AS Bobinas_Utilizadas
FROM PERS_Trabajos_Lineas_Bobinas AS TLB
WHERE TLB.Utilizada = 1
GROUP BY TLB.IdTrabajo, TLB.IdLinea
GO

ZPermisos VPers_Trabajos_Lineas_Bobinas_Utilizadas
GO