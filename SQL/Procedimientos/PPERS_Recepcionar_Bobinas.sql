CREATE OR ALTER PROCEDURE [dbo].[PPERS_Recepcionar_Bobinas]
	@prm_IdCliente T_Id_Cliente,
	@prm_Albaran VARCHAR(255),
	@prm_FechaAlbaran SMALLDATETIME,
	@prm_RefTrabajo VARCHAR(255),
	@prm_IdCalidad INT = 1,
	@prm_Ancho T_Decimal,
	@prm_Gramaje T_Decimal,
	@prm_Cantidad INT,
	@prm_RefBobina VARCHAR(255),
	@prm_IdZona INT,
	@prm_IdFila INT,
	@prm_OrigenFlexy BIT = 0
AS
BEGIN

	DECLARE 
		@P0 nvarchar(1000),
		@CadenaStr nvarchar(4000),
		@Msg_Err Varchar(255)
		
	DECLARE 
		@v_IdCliente T_Id_Cliente = TRIM(@prm_IdCliente),
		@v_RefTrabajo VARCHAR(255) = TRIM(@prm_RefTrabajo),
		@v_RefBobina VARCHAR(255) = TRIM(@prm_RefBobina),
		@v_IdBobina INT,
		@v_CantidadActual INT = 0,
		@v_NumBobina INT

	SET NOCOUNT ON;

	IF @v_IdCliente IS NULL OR LEN(@v_IdCliente) = 0 BEGIN 
		PRINT 'No se ha seleccionado ningún cliente.'
		RETURN 0
	END

	IF NOT EXISTS (SELECT 1 FROM Clientes_Datos WHERE IdCliente = @v_IdCliente) BEGIN
		SET @P0 = @v_IdCliente
		SET @CadenaStr = 'El Cliente no existe: %v'
		EXEC sprintf @Msg_err OUT, @CadenaStr, @P0

		PRINT @Msg_err
		RETURN 0
	END

	IF @prm_IdCalidad IS NULL OR LEN(@prm_IdCalidad) = 0 BEGIN 
		PRINT 'No se ha seleccionado el tipo de calidad del papel.'
		RETURN 0
	END

	IF NOT EXISTS (SELECT 1 FROM PERS_Tipos_Calidad_Papel WHERE IdCalidad = @prm_IdCalidad) BEGIN
		SET @P0 = @prm_IdCalidad
		SET @CadenaStr = 'El Tipo de Calidad no existe: %v'
		EXEC sprintf @Msg_err OUT, @CadenaStr, @P0

		PRINT @Msg_err
		RETURN 0
	END

   	-- IF @prm_IdAlbaran IS NULL BEGIN 
	-- 	PRINT 'No se ha seleccionado ningún albarán.'
	-- 	RETURN 0
	-- END

	-- IF NOT EXISTS (SELECT 1 FROM Albaranes_Prov_Cab WHERE IdAlbaran = @prm_IdAlbaran) BEGIN
	-- 	SET @P0 = @prm_IdAlbaran
	-- 	SET @CadenaStr = 'El Albarán no existe: %v'
	-- 	EXEC sprintf @Msg_err OUT, @CadenaStr, @P0

	-- 	PRINT @Msg_err
	-- 	RETURN 0
	-- END

	IF @prm_IdZona IS NOT NULL AND NOT EXISTS (SELECT 1 FROM Pers_Zonas WHERE IdZona = @prm_IdZona) BEGIN
		SET @P0 = @prm_IdZona
		SET @CadenaStr = 'La zona no existe: %v'
		EXEC sprintf @Msg_err OUT, @CadenaStr, @P0

		PRINT @Msg_err
		RETURN 0
	END

	IF @prm_IdFila IS NOT NULL AND NOT EXISTS (SELECT 1 FROM Pers_Filas WHERE IdFila = @prm_IdFila) BEGIN
		SET @P0 = @prm_IdFila
		SET @CadenaStr = 'La fila no existe: %v'
		EXEC sprintf @Msg_err OUT, @CadenaStr, @P0

		PRINT @Msg_err
		RETURN 0
	END

	WHILE @v_CantidadActual < @prm_Cantidad
		BEGIN
		
			SELECT @v_IdBobina = ISNULL(MAX(IdBobina), 0) + 1 FROM PERS_Bobinas;

			IF @v_RefTrabajo IS NOT NULL BEGIN
				SELECT @v_NumBobina = ISNULL(MAX(NumBobina), 0) + 1 FROM PERS_Bobinas WHERE RefTrabajo = @v_RefTrabajo;
			END 
			ELSE IF @v_RefBobina IS NOT NULL BEGIN
				SELECT @v_NumBobina = ISNULL(MAX(NumBobina), 0) + 1 FROM PERS_Bobinas WHERE RefBobina = @v_RefBobina;
			END
			ELSE BEGIN
				SET @v_NumBobina = NULL
			END

			INSERT INTO PERS_Bobinas (
				IdBobina, 
				IdCliente, 
				AlbaranEntrada, 
				FechaEntrada, 
				RefTrabajo, 
				IdCalidad, 
				Ancho, 
				Gramaje,
				IdEstado,
				RefBobina,
				NumBobina,
				IdZona,
				IdFila
			)
			VALUES (
				@v_IdBobina,
				@v_IdCliente,
				@prm_Albaran,
				@prm_FechaAlbaran,
				@v_RefTrabajo,
				@prm_IdCalidad,
				@prm_Ancho,
				@prm_Gramaje,
				1,
				@v_RefBobina,
				@v_NumBobina,
				@prm_IdZona,
				@prm_IdFila
			);

			SET @v_CantidadActual = @v_CantidadActual + 1;
		END;

	--Comprobar si el origen ha sido desde Flexy o desde el ERP
	IF (@prm_OrigenFlexy = 1)
		BEGIN
			--Select para abrir las bobinas que se han generado
			SELECT 'flexygo.nav.openPage("List", "Bobinas", "(RefTrabajo =''' + CAST(@v_RefTrabajo AS NVARCHAR) + ''' AND IdAlbaranEntrada = ''' + CAST(@prm_Albaran AS NVARCHAR) + ''')", null, "current", false, null)' as JSCode
		END
	RETURN -1;
END
GO

ZPermisos PPERS_Recepcionar_Bobinas
GO