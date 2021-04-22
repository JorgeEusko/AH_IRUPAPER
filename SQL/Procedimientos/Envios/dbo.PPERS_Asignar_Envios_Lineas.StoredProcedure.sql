/****** Object:  StoredProcedure [dbo].[PPERS_Asignar_Envios_Lineas]    Script Date: 17/03/2021 13:39:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE [dbo].[PPERS_Asignar_Envios_Lineas]
	@prm_IdEnvio INT
AS
BEGIN

	IF EXISTS (SELECT 1
	FROM PERS_TEMP_Asignar_Envios
	WHERE PaletsAsignar > PaletsPendientes) BEGIN
		PRINT 'Existen lineas con una cantidad de pallets asignados superior a los pallets pendientes'
		RETURN 0
	END

	INSERT INTO [dbo].[PERS_Envios_Lineas]
		([IdEnvio]
		,[IdEnvioLinea]
		,[IdTrabajo]
		,[IdTrabajoLinea]
		,[IdTrabajoLineaCorte]
		,[RefTrabajo]
		,[IdPedidoCliente]
		,[IdPedidoClienteFinal]
		,[Palets]
		,[ResmasPorPalet]
		,[Resmas]
		,[PesoResma]
		,Facturada)
	SELECT
		@prm_IdEnvio
		,(SELECT ISNULL(MAX(IdEnvioLinea), 0) + 1 FROM PERS_Envios_Lineas WHERE IdEnvio = @prm_IdEnvio)
		,T1.IdTrabajo
		,T1.IdLinea
		,T1.IdLineaCorte
		,T1.RefTrabajo
		,T1.PedidoCliente
		,PT.IdPedidoClienteFinal
		,T1.PaletsAsignar
		,T1.ResmasPorPalet
		,T1.PaletsAsignar * PTLC.ResmasPorPalet As ResmasEnviadas
		,PTL.AnchoPalet * PTL.LargoPalet * (PTL.Gramaje * 500) / 10000000 AS PesoResma,
		0
	FROM PERS_TEMP_Asignar_Envios AS T1
		JOIN PERS_Trabajos AS PT ON
		T1.IdTrabajo = PT.IdTrabajo
		JOIN PERS_Trabajos_Lineas AS PTL ON
		T1.IdTrabajo = PTL.IdTrabajo AND
			T1.IdLinea = PTL.IdLinea
		JOIN PERS_Trabajos_Lineas_Corte AS PTLC ON
		T1.IdTrabajo = PTLC.IdTrabajo AND
			T1.IdLinea = PTLC.IdLinea AND
			T1.IdLineaCorte = PTLC.IdLineaCorte

	WHERE T1.PaletsAsignar > 0

	UPDATE PTLC
	SET PTLC.PaletsEnviados = PTLC.PaletsEnviados + PTAE.PaletsAsignar,
		PTLC.PaletsPendientes = PTLC.PaletsPendientes - PTAE.PaletsAsignar
	FROM PERS_Trabajos_Lineas_Corte AS PTLC
		JOIN PERS_TEMP_Asignar_Envios AS PTAE ON 
			PTLC.IdTrabajo = PTAE.IdTrabajo AND
			PTLC.IdLinea = PTAE.IdLinea AND
			PTLC.IdLineaCorte = PTAE.IdLineaCorte
	WHERE PTAE.PaletsAsignar > 0


	UPDATE PERS_TEMP_Asignar_Envios
	SET PaletsEnviados = PaletsEnviados + PaletsAsignar,
		PaletsPendientes = PaletsPendientes - PaletsAsignar,
		PaletsAsignar = 0

	RETURN -1;
END
GO

ZPERMISOS PPERS_Asignar_Envios_Lineas
GO
