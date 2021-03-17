CREATE OR ALTER PROCEDURE PPERS_Asignar_Envios_Lineas
	@prm_IdEnvio INT
AS
BEGIN
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
	
	RETURN -1;
END
GO

ZPERMISOS PPERS_Asignar_Envios_Lineas
GO