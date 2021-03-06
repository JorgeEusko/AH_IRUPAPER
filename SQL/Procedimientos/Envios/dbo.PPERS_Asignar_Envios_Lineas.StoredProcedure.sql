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

	DECLARE 
		@v_IdTrabajo INT,
		@v_IdLinea INT,
		@v_IdLineaCorte INT,
		@v_IdEnvioLinea INT;

	DECLARE cur_asignar_envios CURSOR
    FOR 
	SELECT IdTrabajo, IdLinea, IdLineaCorte
	FROM PERS_TEMP_Asignar_Envios
	WHERE PaletsAsignar > 0;

	OPEN cur_asignar_envios;

	FETCH NEXT FROM cur_asignar_envios INTO @v_IdTrabajo, @v_IdLinea, @v_IdLineaCorte;

	-- Insertamos las lineas de envio en modo CURSOR (en vez de INSERT () SELECT *) porque hay que calcular
	-- para cada nueva linea un nuevo codigo. Si se hace de la segunda forma, para todos pone el mismo codigo 
	-- y ocurre un error de clave primaria.
	WHILE @@FETCH_STATUS = 0  
    BEGIN

		SET @v_IdEnvioLinea = (SELECT ISNULL(MAX(IdEnvioLinea), 0) + 1 FROM PERS_Envios_Lineas WHERE IdEnvio = @prm_IdEnvio);

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
			,@v_IdEnvioLinea
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
		WHERE T1.IdTrabajo = @v_IdTrabajo
			AND  T1.IdLinea = @v_IdLinea
			AND T1.IdLineaCorte = @v_IdLineaCorte;

        FETCH NEXT FROM cur_asignar_envios INTO @v_IdTrabajo, @v_IdLinea, @v_IdLineaCorte;
    END;

	CLOSE cur_asignar_envios;

	DEALLOCATE cur_asignar_envios;

	-- Resta los palets a las lineas de corte
	UPDATE PTLC
	SET PTLC.PaletsEnviados = PTLC.PaletsEnviados + PTAE.PaletsAsignar,
		PTLC.PaletsPendientes = PTLC.PaletsPendientes - PTAE.PaletsAsignar
	FROM PERS_Trabajos_Lineas_Corte AS PTLC
		JOIN PERS_TEMP_Asignar_Envios AS PTAE ON 
			PTLC.IdTrabajo = PTAE.IdTrabajo AND
			PTLC.IdLinea = PTAE.IdLinea AND
			PTLC.IdLineaCorte = PTAE.IdLineaCorte
	WHERE PTAE.PaletsAsignar > 0

	-- Resta los palets a la tabla temporal de asignacion de envios
	UPDATE PERS_TEMP_Asignar_Envios
	SET PaletsEnviados = PaletsEnviados + PaletsAsignar,
		PaletsPendientes = PaletsPendientes - PaletsAsignar,
		PaletsAsignar = 0

	RETURN -1;
END
GO

ZPERMISOS PPERS_Asignar_Envios_Lineas
GO
