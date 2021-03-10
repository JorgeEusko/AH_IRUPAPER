CREATE OR ALTER PROCEDURE PPERS_Enlazar_Clientes_Contactos
AS
BEGIN
	
	DECLARE 
		@v_IdCliente T_Id_Cliente,
		@v_IdContacto INT,
		@v_NumContacto INT,
		@v_IdClienteAux T_Id_Cliente = '';

	-- Crea un cursor de solo lectura
	DECLARE cur_temp_cli_cont CURSOR 
		READ_ONLY
	FOR
		SELECT IdCliente, IdContacto
		FROM PERS_TEMP_Clientes_Datos AS TCD
			JOIN PERS_TEMP_Contactos as TC ON TCD.Marcado = TCD.Marcado AND TCD.Marcado = 1
		ORDER BY TCD.IdCliente;

	-- Abre el cursor
	OPEN cur_temp_cli_cont;
	
	-- Situa el cursor en la primera fila
	FETCH NEXT FROM cur_temp_cli_cont INTO @v_IdCliente, @v_IdContacto;

	-- Comprueba si se ha leido la fila correctamente
	WHILE @@FETCH_STATUS = 0 BEGIN
			
		-- Comprueba si el cliente ya tiene enlazado a ese contacto
		IF NOT EXISTS (SELECT 1 FROM Clientes_Contactos WHERE IdCliente = @v_IdCliente AND IdContacto = @v_IdContacto) BEGIN

			-- Comprueba si el cliente actual es diferente al anterior
			IF @v_IdCliente <> @v_IdClienteAux BEGIN
				SET @v_IdClienteAux = @v_IdCliente;
				SET @v_NumContacto = (SELECT MAX(IdContactoObj) + 1 FROM Clientes_Contactos WHERE IdCliente = @v_IdCliente);
			END

			-- Enlaza el contacto (direccion de envio) con el cliente
			INSERT INTO Contactos_Objetos(IdContacto, Objeto, IdDocObjeto,IdContactoObj,IdTipo,IdEstado)
				VALUES (@v_IdContacto, 'Cliente', (SELECT IdDoc FROM Clientes_Datos WHERE IdCliente = @v_IdCliente), @v_NumContacto, 1, 0);
		END
		
		FETCH NEXT FROM cur_temp_cli_cont INTO @v_IdCliente, @v_IdContacto;
		SET @v_NumContacto = @v_NumContacto + 1;
	END

	-- Libera el bloqueo y los recursos del cursor de los clientes marcados.
	CLOSE cur_temp_cli_cont;
	DEALLOCATE cur_temp_cli_cont;

	RETURN -1;
END
GO

ZPermisos PPERS_Enlazar_Clientes_Contactos
GO