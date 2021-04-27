CREATE OR ALTER PROCEDURE PPERS_Generar_Envios_Pedidos_I
	@prm_IdCliente T_Id_Cliente,
	@prm_IdPedido T_Id_Pedido OUT
AS
BEGIN
	SET NOCOUNT ON;

	--Declarar variables para la cabecera de pedido
    DECLARE 
        @v_IdCliente T_Id_Cliente = TRIM(@prm_IdCliente),
		@v_IdPedido T_Id_Pedido = (SELECT ISNULL(MAX(IdPedido),0) + 1 FROM Pedidos_Cli_Cabecera),
		@v_NumPedido T_Id_Pedido = (SELECT ISNULL(MAX(NumPedido),0) + 1 FROM Pedidos_Cli_Cabecera),
        @v_DescripPedido VARCHAR(255) = 'Facturar envios de corte de papel.',
        @v_FechaPedido T_Fecha_Corta = GETDATE(),
        @v_FechaActual T_Fecha_Corta = GETDATE(),
		@v_AñoNum VARCHAR(10) = CAST(YEAR(GETDATE()) AS varchar(10)),
		@v_IdContacto INT,
		@v_IdContactoA INT,
		@v_IdContactoF INT,
		@v_FormaPago T_Forma_Pago,
		@v_IdLista T_Id_Lista,
		@v_Descuento T_Decimal,
		@v_ProntoPago T_Decimal,
		@v_IdPortes T_Id_Portes,
		@v_IdIVA T_Id_IVA,
		@v_IdTransportista T_Id_Proveedor,
		@v_RecEquivalencia T_Booleano,
        @v_Error VARCHAR(MAX)  

	-- Obtiene los datos del cliente 
	SELECT  
		@v_IdContacto = IdContacto, 
		@v_IdContactoA = IdContactoA, 
		@v_IdContactoF = IdContactoF 
	FROM Clientes_Datos
	WHERE IdCliente = @v_IdCliente

	-- Obtiene los datos economicos del cliente
	SELECT 
		@v_IdLista = IdLista,
		@v_FormaPago = FormaPago,
		@v_Descuento = Descuento,
		@v_ProntoPago = ProntoPago,
		@v_IdIVA = IdIva,
		@v_IdPortes = IdPortes,
		@v_IdTransportista = IdTransportista,
		@v_RecEquivalencia = RecEquivalencia
	FROM Clientes_Datos_Economicos
	WHERE IdCliente = @v_IdCliente
   
    BEGIN TRY  
        -- INSERT --
        -- AHORA - PPedidos_Cli_Cabecera_I --
        EXECUTE pPedidos_Cli_Cabecera_I 
                    @IdPedido          = @v_IdPedido, 
                    @IdEmpresa         = 0, 
                    @AñoNum            = @v_AñoNum, 
                    @SeriePedido       = 0, 
                    @NumPedido         = @v_NumPedido, 
                    @Fecha             = @v_FechaPedido, 
                    @IdCliente         = @v_IdCliente, 
                    @Origen            = NULL, 
                    @IdPedidoCli       = NULL, 
                    @IdContacto        = @v_IdContacto, 
                    @IdContactoA       = @v_IdContactoA, 
                    @IdContactoF       = @v_IdContactoF, 
                    @DescripcionPed    = @v_DescripPedido, 
                    @IdLista           = @v_IdLista, 
                    @IdListaRevision   = 1, 
                    @IdEmpleado        = 0, 
                    @IdDepartamento    = NULL, 
                    @IdTransportista   = @v_IdTransportista, 
                    @IdMoneda          = 1, 
                    @FormaPago         = @v_FormaPago, 
                    @Descuento         = @v_Descuento, 
                    @ProntoPago        = @v_ProntoPago, 
                    @IdPortes          = @v_IdPortes, 
                    @IdIva             = @v_IdIVA, 
                    @IdEstado          = 0, 
                    @IdSituacion       = 0, 
                    @FechaSalida       = NULL, 
                    @Observaciones     = NULL, 
                    @Comision          = 0, 
                    @Cambio            = 0, 
                    @CambioEuros       = 1, 
                    @CambioBloqueado   = 0, 
                    @Representante     = NULL, 
                    @IdCentroCoste     = NULL, 
                    @IdProyecto        = NULL, 
                    @IdOferta          = NULL, 
                    @Revision          = NULL, 
                    @Inmovilizado      = 0, 
                    @Referencia        = NULL, 
                    @RecogidaPorCli    = 0, 
                    @ContactoLlamada   = NULL, 
                    @Hora              = NULL, 
                    @HoraSalida        = NULL, 
                    @IdTipoPedido      = 0, 
                    @RecEquivalencia   = @v_RecEquivalencia, 
                    @Bloqueado         = 0, 
                    @IdMotivoBloqueo   = NULL, 
                    @IdEmpleadoBloqueo = NULL, 
                    @IdApertura        = NULL, 
                    @IdPedidoOrigen    = 0, 
                    @NoCalcularPromo   = 0, 
                    @ECommerce         = 0, 
                    @IdTipoCli         = 0, 
                    @IdDoc             = NULL, 
                    @Usuario           = 'dbo', 
                    @FechaInsertUpdate = @v_FechaActual;
			
		--Declarar variables para el cursor que recorre la tabla PERS_TEMP_Generar_Facturas
		DECLARE
			@v_IdEnvio INT,
			@v_IdEnvioLinea INT;

		--Declarar variables para generar las lineas del pedido
		DECLARE 
			@v_IdArticuloTrabajo T_Id_Articulo,
			@v_UnidadesTrabajo DECIMAL(38, 14),
			@v_PrecioTrabajo DECIMAL(38, 14),
			@v_IdArticuloPalet T_Id_Articulo,
			@v_UnidadesPalet DECIMAL(38, 14),
			@v_PrecioPalet DECIMAL(38, 14),
			@v_PERS_RefTrabajo VARCHAR(255),
			@v_PERS_IdPedidoCliente VARCHAR(100),
			@v_PERS_IdPedidoClienteFinal VARCHAR(100),
			@v_CostesPalets BIT;

		DECLARE cur_generar_facturas CURSOR
		FOR 
			SELECT IdEnvio, IdEnvioLinea
			FROM PERS_TEMP_Generar_Facturas
			WHERE Marcar = 1 AND PedidoGenerado = 0;

		OPEN cur_generar_facturas;

		FETCH NEXT FROM cur_generar_facturas INTO @v_IdEnvio, @v_IdEnvioLinea;

		WHILE @@FETCH_STATUS = 0
		BEGIN
			-- Obtenemos los datos del trabajo relacionado con el envio
			SELECT
				@v_PERS_RefTrabajo = PTL.RefTrabajoCliente,
				@v_PERS_IdPedidoCliente = PT.IdPedidoCliente,
				@v_PERS_IdPedidoClienteFinal = PT.IdPedidoClienteFinal,
				@v_CostesPalets = PTL.CostePaletFacturable
			FROM PERS_Trabajos AS PT 
				JOIN PERS_Trabajos_Lineas AS PTL ON PT.IdTrabajo = PTL.IdTrabajo
				JOIN PERS_Envios_Lineas AS PEL ON PTL.IdTrabajo = PEL.IdTrabajo AND PTL.IdLinea = PEL.IdTrabajoLinea
			WHERE PEL.IdEnvio = @v_IdEnvio AND PEL.IdEnvioLinea = @v_IdEnvioLinea;

			-- Obtenemos los articulos y sus unidades
			SELECT
				@v_IdArticuloTrabajo = PTL.IdArticulo,
				@v_UnidadesTrabajo = (PEL.PALETS * PTLC.ResmasPorPalet * (PTL.Ancho * PTL.Largo * (PTL.Gramaje * 500)) / 10000000) / 1000,
				@v_IdArticuloPalet = PTL.IdArticuloPrecio,
				@v_UnidadesPalet = PEL.Palets
			FROM PERS_Trabajos_Lineas AS PTL
				JOIN PERS_Envios_Lineas AS PEL ON PTL.IdTrabajo = PEL.IdTrabajo AND PTL.IdLinea = PEL.IdTrabajoLinea
				JOIN PERS_Trabajos_Lineas_Corte AS PTLC ON PEL.IdTrabajo = PTLC.IdTrabajo AND PEL.IdTrabajoLinea = PTLC.IdLinea AND PEL.IdTrabajoLineaCorte = PTLC.IdLineaCorte
			WHERE PEL.IdEnvio = @v_IdEnvio AND PEL.IdEnvioLinea = @v_IdEnvioLinea;

			-- Obtenemos la descripcion y el precio del Articulo Trabajo
			SELECT @v_PrecioTrabajo = LPCA.Precio
			FROM Articulos AS A
				JOIN Listas_Precios_Cli_Art AS LPCA ON A.IdArticulo = LPCA.IdArticulo
				JOIN Clientes_Datos_Economicos AS CDE ON LPCA.IdLista = CDE.IdLista
			WHERE CDE.IdCliente = @v_IdCliente AND LPCA.IdArticulo = @v_IdArticuloTrabajo

			-- Obtenemos la descripcion y el precio del Articulo Palet
			SELECT @v_PrecioPalet = LPCA.Precio
			FROM Articulos AS A
				JOIN Listas_Precios_Cli_Art AS LPCA ON A.IdArticulo = LPCA.IdArticulo
			WHERE LPCA.IdLista = 0 AND LPCA.IdArticulo = @v_IdArticuloPalet

			-- Crea la linea de trabajo
			EXEC PPERS_Pedido_Venta_Lineas_I @v_IdPedido, @v_IdArticuloTrabajo, @v_UnidadesTrabajo, @v_PrecioTrabajo, @v_IdLista, @v_IdEnvio, @v_IdEnvioLinea, @v_PERS_RefTrabajo, @v_PERS_IdPedidoCliente, @v_PERS_IdPedidoClienteFinal

			-- Crea la linea de palet si en Costes_Palets la linea esta marcada como facturable
			IF @v_CostesPalets = 1 BEGIN
				EXEC PPERS_Pedido_Venta_Lineas_I @v_IdPedido, @v_IdArticuloPalet, @v_UnidadesPalet, @v_PrecioPalet, 0, @v_IdEnvio, @v_IdEnvioLinea, @v_PERS_RefTrabajo, @v_PERS_IdPedidoCliente, @v_PERS_IdPedidoClienteFinal
			END
			-- Si no esta marcada como facturable, crea una salida de almacen
			-- y descuenta los palets del stock
			ELSE BEGIN
				EXEC pAlmacen_Hist_Mov_I 
					@IdAlmacen         = 0, 
					@FechaMovimiento   = @v_FechaActual, 
					@IdArticulo        = @v_IdArticuloPalet, 
					@IdMovimiento      = 8, 
					@Lote              = NULL, 
					@FechaLote         = @v_FechaActual, 
					@IdEmbalaje        = NULL, 
					@IdAlbaran         = NULL, 
					@Cantidad          = @v_UnidadesPalet, 
					@IdCliente         = NULL, 
					@IdProveedor       = NULL, 
					@IdAlmacenTraspaso = NULL, 
					@Descrip           = 'Salida de palets', 
					@Valor             = 0, 
					@UnidadesStock     = 0, 
					@Precio            = 0, 
					@FechaValor        = @v_FechaActual, 
					@IdAlbaranEnvio    = NULL, 
					@IdContrato        = NULL, 
					@IdParte           = NULL, 
					@IdUbicacion       = '0', 
					@IdTipoObjeto      = 0, 
					@IdDocObjeto       = NULL, 
					@Objeto            = NULL, 
					@IdDocActEnv       = 0, 
					@P1                = NULL, 
					@P2                = NULL, 
					@P3                = NULL, 
					@P4                = NULL, 
					@P5                = NULL, 
					@P6                = NULL, 
					@P7                = NULL, 
					@P8                = NULL, 
					@P9                = NULL, 
					@P10               = NULL, 
					@IdDoc             = NULL, 
					@Usuario           = 'dbo', 
					@FechaInsertUpdate = @v_FechaActual
			END
			
			UPDATE PERS_TEMP_Generar_Facturas 
			SET PedidoGenerado = 1
			WHERE Marcar = 1 
				AND PedidoGenerado = 0
				AND IdEnvio = @v_IdEnvio
				AND IdEnvioLinea = @v_IdEnvioLinea
				AND IdCliente = @v_IdCliente;

			FETCH NEXT FROM cur_generar_facturas INTO @v_IdEnvio, @v_IdEnvioLinea;
		END;

		CLOSE cur_generar_facturas;

		DEALLOCATE cur_generar_facturas;

		SET @prm_IdPedido = @v_IdPedido;
		
		RETURN -1;
	END TRY  

    BEGIN CATCH  
        DECLARE @v_SalidaMessage NVARCHAR(4000)    
        DECLARE @v_SalidaSeverity INT    
        DECLARE @v_SalidaState INT    
  
        SELECT     
            @v_SalidaMessage = ERROR_MESSAGE(),    
            @v_SalidaSeverity = ERROR_SEVERITY(),
            @v_SalidaState = ERROR_STATE()    
    
        RAISERROR (@v_SalidaMessage, @v_SalidaSeverity, @v_SalidaState)  
		
		RETURN 0
    END CATCH 
END
GO

ZPERMISOS PPERS_Generar_Envios_Pedidos_I
GO