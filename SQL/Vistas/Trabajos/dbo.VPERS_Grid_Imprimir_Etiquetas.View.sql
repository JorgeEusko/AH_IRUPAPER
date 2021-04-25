CREATE OR ALTER VIEW VPERS_Grid_Imprimir_Etiquetas
AS
SELECT 
	TLC.IdTrabajo,
	TLC.IdLinea,
	TLC.IdLineaCorte,
	TLC.Palets,
	TLC.ResmasPorPalet * TLC.Palets AS Resmas,
	((TL.Ancho * TL.Largo * (TL.Gramaje * 500)) / 10000000) AS PesoResma,
	((TL.AnchoPalet * TL.LargoPalet * (TL.Gramaje * 500)) / 10000000) AS PesoPalet,
	TLC.IdDoc
FROM PERS_Trabajos_Lineas_Corte AS TLC
	JOIN PERS_Trabajos_Lineas AS TL ON TLC.IdTrabajo = TL.IdTrabajo AND TLC.IdLinea = TL.IdLinea
GO

ZPERMISOS VPERS_Grid_Imprimir_Etiquetas
GO