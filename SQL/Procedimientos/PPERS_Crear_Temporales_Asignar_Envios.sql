CREATE OR ALTER PROCEDURE PPERS_Crear_Temporales_Asignar_Envios
	@prm_IdCliente T_Id_Cliente,
	@prm_IdDirEnvio VARCHAR(255)
AS
BEGIN
	SET NOCOUNT ON;

	-- Vacia la tabla
	DELETE FROM PERS_TEMP_Asignar_Envios;

	-- Inserta las lineas de corte con palets pendientes
	INSERT INTO [dbo].[PERS_TEMP_Asignar_Envios]
           ([IdTrabajo]
           ,[IdLinea]
           ,[IdLineaCorte]
           ,[FechaCorte]
           ,[RefTrabajo]
           ,[PedidoCliente]
           ,[IdCliente]
           ,[Cliente]
           ,[PaletsCortados]
           ,[Resmas]
           ,[PaletsEnviados]
           ,[PaletsPendientes]
           ,[PaletsAsignar]
           ,[IdDoc])
	SELECT
		PTLC.IdTrabajo,
		PTLC.IdLinea,
		PTLC.IdLineaCorte,
		PTLC.Fecha,
		PTL.RefTrabajoCliente,
		PT.IdPedidoCliente,
		PT.IdCliente,
		CD.Cliente,
		PTLC.Palets,
		(PTLC.ResmasPorPalet * PTLC.Palets) AS Resmas,
		PTLC.PaletsEnviados,
		PTLC.PaletsPendientes,
		0,
		PTLC.IdDoc
	FROM PERS_Trabajos_Lineas_Corte AS PTLC
		JOIN PERS_Trabajos_Lineas AS PTL ON PTLC.IdTrabajo = PTL.IdTrabajo AND PTLC.IdLinea = PTL.IdLinea
		JOIN PERS_Trabajos AS PT ON PTLC.IdTrabajo = PT.IdTrabajo
		JOIN Clientes_Datos AS CD ON PT.IdCliente = CD.IdCliente
	WHERE PTLC.PaletsPendientes > 0;

	RETURN -1;
END
GO

ZPERMISOS PPERS_Crear_Temporales_Asignar_Envios
GO