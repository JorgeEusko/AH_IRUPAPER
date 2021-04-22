CREATE OR ALTER TRIGGER TPers_Trabajos_Lineas_U
ON Pers_Trabajos_Lineas
AFTER UPDATE
AS
BEGIN
	DECLARE 
		@v_IdTrabajo INT,
		@v_IdLinea INT,
		@v_IdEstado INT,
		@v_TotalLineas INT,
		@v_LineasTerminadas INT;

	-- Recupera la referencia de la linea de trabajo
	SELECT 
		@v_IdTrabajo = I.IdTrabajo, 
		@v_IdLinea = I.IdLinea,
		@v_IdEstado = IdEstado
	FROM inserted as I;

    -- Si el estado de la linea es 'Terminada', establece el estado de las bobinas
	-- como 'Cortadas'
	IF @v_IdEstado = 3 BEGIN
		UPDATE PB
		SET PB.IdEstado  = 3
		FROM PERS_Trabajos_Lineas_Bobinas AS PTLB
			JOIN Pers_Bobinas AS PB ON PTLB.IdBobina = PB.IdBobina
		WHERE IdTrabajo = @v_IdTrabajo AND IdLinea = @v_IdLinea

		-- Obtiene el total de lineas de trabajo para ese trabajo
		SET @v_TotalLineas = (SELECT COUNT(*) FROM PERS_Trabajos_Lineas WHERE IdTrabajo = @v_IdTrabajo)
		
		-- Obtiene el total de lineas de trabajo 'terminadas' para ese trabajo
		SET @v_LineasTerminadas = (SELECT COUNT(*) FROM PERS_Trabajos_Lineas WHERE IdTrabajo = @v_IdTrabajo AND IdEstado = 3)

		-- Si el total de lineas de trabajo es igual al total de lineas de trabajo 'terminadas',
		-- significa que el trabajo esta 'terminado'
		IF @v_TotalLineas = @v_LineasTerminadas BEGIN
			UPDATE PERS_Trabajos
			SET IdEstado = 3
			WHERE IdTrabajo = @v_IdTrabajo
		END
	END

END
GO

ENABLE TRIGGER TPers_Trabajos_Lineas_U ON Pers_Trabajos_Lineas;  
GO