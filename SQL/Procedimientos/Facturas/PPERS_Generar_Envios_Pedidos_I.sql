CREATE OR ALTER PROCEDURE PPERS_Generar_Envios_Pedidos_I
AS
BEGIN

	DECLARE
		@v_IdEnvio INT,
		@v_IdEnvioLinea INT,
		@v_IdCliente T_Id_Cliente;

    DECLARE cur_generar_facturas CURSOR
    FOR 
    SELECT IdEnvio, IdEnvioLinea, IdCliente
	FROM PERS_TEMP_Generar_Facturas
	WHERE Marcar = 1 AND IdEnvio NOT IN (SELECT IdEnvio FROM Conf_Pedidos_Cli WHERE IdEnvio IS NOT NULL);

	OPEN cur_generar_facturas;

	FETCH NEXT FROM cur_generar_facturas INTO @v_IdEnvio, @v_IdEnvioLinea, @v_IdCliente;

	WHILE @@FETCH_STATUS = 0  
    BEGIN
		EXEC PPERS_Pedido_Venta_Cabecera_I @v_IdCliente, @v_IdEnvio, @v_IdEnvioLinea

        FETCH NEXT FROM cur_generar_facturas INTO @v_IdEnvio, @v_IdEnvioLinea, @v_IdCliente;
    END;

	CLOSE cur_generar_facturas;

	DEALLOCATE cur_generar_facturas;

	RETURN -1;
END
GO

ZPERMISOS PPERS_Generar_Envios_Pedidos_I
GO