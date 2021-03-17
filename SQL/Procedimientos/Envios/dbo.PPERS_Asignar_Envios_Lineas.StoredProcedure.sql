USE [AH_IRUPAPER]
GO
/****** Object:  StoredProcedure [dbo].[PPERS_Asignar_Envios_Lineas]    Script Date: 17/03/2021 13:39:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER   PROCEDURE [dbo].[PPERS_Asignar_Envios_Lineas]
	@prm_IdEnvio INT
AS
BEGIN

	IF EXISTS (SELECT 1 FROM PERS_TEMP_Asignar_Envios WHERE PaletsAsignar > PaletsPendientes) BEGIN
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
           ,[Resmas]
           ,[PesoResma])
	SELECT 
			@prm_IdEnvio
			,(SELECT ISNULL(MAX(IdEnvioLinea), 0) + 1 FROM PERS_Envios_Lineas WHERE IdEnvio = @prm_IdEnvio)
			,T1.IdTrabajo
			,T1.IdLinea
			,T1.IdLineaCorte
			,T1.RefTrabajo
			,T1.PedidoCliente
			,(SELECT IdPedidoClienteFinal FROM PERS_Trabajos AS PT WHERE PT.IdTrabajo = T1.IdTrabajo)
			,T1.PaletsAsignar
			,Resmas
			,(SELECT ((VCPR.AnchoPalet * VCPR.LargoPalet * (VCPR.Gramaje * 500)) / 10000000) FROM PERS_Trabajos_Lineas AS VCPR WHERE VCPR.IdTrabajo = T1.IdTrabajo AND VCPR.IdLinea = T1.IdLinea)
	  FROM PERS_TEMP_Asignar_Envios AS T1
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
