CREATE OR ALTER TRIGGER TPers_Pers_Envios_Lineas_I
ON Pers_Envios_Lineas
AFTER INSERT
AS
BEGIN
	DECLARE 
		@v_IdEnvio INT,
		@v_IdEnvioLinea INT,
		@v_IdDoc T_Id_Doc;

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
           ,[IdDoc])
		SELECT 
			PE.IdEnvio,
			PEl.IdEnvioLinea,
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
			PEL.IdDoc
		FROM PERS_Envios AS PE
			JOIN PERS_Envios_Lineas AS PEL ON PE.IdEnvio = PEL.IdEnvio
			JOIN PERS_Trabajos_Lineas AS PTL ON PEL.IdTrabajo = PTL.IdTrabajo AND PEL.IdTrabajoLinea = PTL.IdLinea
			JOIN PERS_Trabajos AS PT ON PTL.IdTrabajo = PT.IdTrabajo
			JOIN VPERS_Trabajos_Lineas_Resumen AS VTLR ON PTL.IdTrabajo = VTLR.IdTrabajo AND PTL.IdLinea = VTLR.IdLinea
			JOIN Clientes_Datos_Economicos AS CDE ON PE.Cliente = CDE.IdCliente
			JOIN Listas_Precios_Cli_Art AS LPCA ON PTL.IdArticulo = LPCA.IdArticulo AND LPCA.IdLista = CDE.IdLista	
END
GO

ENABLE TRIGGER TPers_Pers_Envios_Lineas_I ON Pers_Envios_Lineas;  
GO