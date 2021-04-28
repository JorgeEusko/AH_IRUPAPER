CREATE OR ALTER TRIGGER TPers_Pers_Envios_Lineas_I
ON Pers_Envios_Lineas
AFTER INSERT
AS
BEGIN
	DECLARE 
		@v_IdEnvio INT,
		@v_IdEnvioLinea INT,
		@v_IdDoc T_Id_Doc,
		@v_IdTrabajo INT,
		@v_IdTrabajoLinea INT,
		@v_LineasCorteEnviadas INT,
		@v_LineasCorteTotales INT;

	-- Recupera la referencia de la l�nea de trabajo
	SELECT 
		@v_IdEnvio = I.IdEnvio,
		@v_IdEnvioLinea = IdEnvioLinea,
		@v_IdDoc = I.IdDoc
	FROM inserted as I;

	-- Agrega la linea de envio a la linea de trabajo
	INSERT INTO [dbo].[PERS_TEMP_Generar_Facturas]
           ([IdEnvio]
           ,[IdEnvioLinea]
           ,[IdCliente]
           ,[RefTrabajoCliente]
           ,[IdPedidoCliente]
           ,[Fecha]
           ,[IdArticulo]
           ,[KilosCortados]
           ,[TotalPalets]
           ,[TotalResmas]
           ,[TotalPaletsEnviados]
           ,[Precio]
           ,[FechaPrimerEnvio]
           ,[IdDoc]
		   ,Marcar
		   ,PedidoGenerado)
		SELECT 
			@v_IdEnvio,
			@v_IdEnvioLinea,
			PE.Cliente,
			PTL.RefTrabajoCliente,
			PT.IdPedidoClienteFinal,
			PE.Fecha,
			PTL.IdArticulo,
			VTLR.KilosCortados,
			PEL.Palets,
			PEL.Resmas,
			VTLR.Total_PaletsEnviados,
			LPCA.Precio,
			PE.Fecha AS FechaPrimerEnvio,
			@v_IdDoc,
			0,
			0
		FROM PERS_Envios AS PE
			JOIN PERS_Envios_Lineas AS PEL ON PE.IdEnvio = PEL.IdEnvio
			JOIN PERS_Trabajos_Lineas AS PTL ON PEL.IdTrabajo = PTL.IdTrabajo AND PEL.IdTrabajoLinea = PTL.IdLinea
			JOIN PERS_Trabajos AS PT ON PTL.IdTrabajo = PT.IdTrabajo
			JOIN VPERS_Trabajos_Lineas_Resumen AS VTLR ON PTL.IdTrabajo = VTLR.IdTrabajo AND PTL.IdLinea = VTLR.IdLinea
			JOIN Clientes_Datos_Economicos AS CDE ON PE.Cliente = CDE.IdCliente
			JOIN Listas_Precios_Cli_Art AS LPCA ON PTL.IdArticulo = LPCA.IdArticulo AND LPCA.IdLista = CDE.IdLista
		WHERE PEL.IdEnvio = @v_IdEnvio AND PEL.IdEnvioLinea = @v_IdEnvioLinea; 

		-- Comprobacion de si la linea de trabajo tiene que estar indicada como 'Terminada'
		SELECT @v_LineasCorteEnviadas = COUNT(*)
		FROM PERS_Envios_Lineas
		WHERE IdTrabajo = @v_IdTrabajo AND IdTrabajoLinea = @v_IdTrabajoLinea;

		SELECT @v_LineasCorteTotales = COUNT(*)
		FROM PERS_Trabajos_Lineas
		WHERE IdTrabajo = 1 AND IdLinea = 1;

		-- Si la cantidad de lineas enviadaas es igual a la cantidad de lineas de corte totales,
		-- hay que marcar la linea de trabajo como terminada
		IF @v_LineasCorteEnviadas = @v_LineasCorteTotales BEGIN
			UPDATE PERS_Trabajos_Lineas
			SET IdEstado = 3
			WHERE IdTrabajo = 1 AND IdLinea = 1;
		END

END
GO

ENABLE TRIGGER TPers_Pers_Envios_Lineas_I ON Pers_Envios_Lineas;  
GO