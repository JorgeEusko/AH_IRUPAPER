-- CREATE OR ALTER VIEW VPERS_Trabajos_Lineas_Totales
-- AS
-- SELECT 
-- 	T.*,
-- 	ISNULL(KilosTeoricos - T.KilosCortados, 0.0) as Merma,
-- 	ISNULL(KilosTeoricos / (KilosTeoricos - T.KilosCortados), 0.0) AS PorcentajeMerma
	
-- FROM ( 
-- 	SELECT 
-- 		TL.*, 
-- 		((Ancho * Largo * (Gramaje * 500)) / 10000000) AS PesoResma,
-- 		ISNULL((dbo.FPers_Obtener_Kilos_Teoricos(TL.IdTrabajo, TL.IdLinea)), 0.0) AS KilosTeoricos,
-- 		ISNULL((dbo.FPers_Obtener_Suma_Palets(TL.IdTrabajo, TL.IdLinea)), 0) AS SumaPalets,
-- 		ISNULL((dbo.FPers_Obtener_Suma_Resmas(TL.IdTrabajo, TL.IdLinea)), 0) AS SumaResmas,
-- 		ISNULL((dbo.FPers_Obtener_Palets_Pendientes(TL.IdTrabajo, TL.IdLinea)), 0) AS PaletsPendientes,
-- 		ISNULL((dbo.FPers_Obtener_Palets_Enviados(TL.IdTrabajo, TL.IdLinea)), 0) AS PaletsEnviados,
-- 		ISNULL((dbo.FPers_Bobinas_Utilizadas(TL.IdTrabajo, TL.IdLinea)), 0) AS BobinasUtilizadas
-- 	FROM PERS_Trabajos_Lineas AS TL
-- ) AS T
-- GO

ZPermisos VPERS_Trabajos_Lineas
GO

CREATE OR ALTER FUNCTION FPers_Obtener_Kilos_Teoricos (
	@prm_IdTrabajo INT,
	@prm_IdLinea INT
)
RETURNS T_Decimal
BEGIN
RETURN (	
	SELECT SUM(B.Kilos)
	FROM Pers_Trabajos_Lineas_Bobinas AS TLB
		JOIN PERS_Bobinas AS B ON TLB.IdBobina = B.IdBobina
	WHERE TLB.IdTrabajo = @prm_IdTrabajo 
		AND TLB.IdLinea = @prm_IdLinea
		AND TLB.Utilizada = 1
)
END
GO

CREATE OR ALTER FUNCTION FPers_Obtener_Suma_Palets (
	@prm_IdTrabajo INT,
	@prm_IdLinea INT
)
RETURNS T_Decimal
BEGIN
RETURN (	
	SELECT SUM(TLC.Palets)
	FROM PERS_Trabajos_Lineas_Corte AS TLC
	WHERE TLC.IdTrabajo = @prm_IdTrabajo AND TLC.IdLinea = @prm_IdLinea
)
END
GO

ZPermisos FPers_Obtener_Suma_Palets
GO

CREATE OR ALTER FUNCTION FPers_Obtener_Suma_Resmas (
	@prm_IdTrabajo INT,
	@prm_IdLinea INT
)
RETURNS T_Decimal
BEGIN
RETURN (	
	SELECT SUM(TLC.ResmasPorPalet * Palets)
	FROM PERS_Trabajos_Lineas_Corte AS TLC
	WHERE TLC.IdTrabajo = @prm_IdTrabajo AND TLC.IdLinea = @prm_IdLinea
)
END
GO

ZPermisos FPers_Obtener_Suma_Resmas
GO

CREATE OR ALTER FUNCTION FPers_Obtener_Palets_Enviados (
	@prm_IdTrabajo INT,
	@prm_IdLinea INT
)
RETURNS T_Decimal
BEGIN
RETURN (	
	SELECT SUM(TLC.PaletsEnviados)
	FROM PERS_Trabajos_Lineas_Corte AS TLC
	WHERE TLC.IdTrabajo = @prm_IdTrabajo AND TLC.IdLinea = @prm_IdLinea
)
END
GO

ZPermisos FPers_Obtener_Palets_Enviados
GO

CREATE OR ALTER FUNCTION FPers_Obtener_Palets_Pendientes (
	@prm_IdTrabajo INT,
	@prm_IdLinea INT
)
RETURNS T_Decimal
BEGIN
RETURN (	
	SELECT SUM(TLC.PaletsPendientes)
	FROM PERS_Trabajos_Lineas_Corte AS TLC
	WHERE TLC.IdTrabajo = @prm_IdTrabajo AND TLC.IdLinea = @prm_IdLinea
)
END
GO

ZPermisos FPers_Obtener_Palets_Pendientes
GO

CREATE OR ALTER FUNCTION FPers_Bobinas_Utilizadas (
	@prm_IdTrabajo INT,
	@prm_IdLinea INT
)
RETURNS T_Decimal
BEGIN
RETURN (	
	SELECT SUM(TLB.IdBobina)
	FROM PERS_Trabajos_Lineas_Bobinas AS TLB
	WHERE TLB.IdTrabajo = @prm_IdTrabajo AND TLB.IdLinea = @prm_IdLinea AND TLB.Utilizada = 1
)
END
GO

ZPermisos FPers_Bobinas_Utilizadas
GO