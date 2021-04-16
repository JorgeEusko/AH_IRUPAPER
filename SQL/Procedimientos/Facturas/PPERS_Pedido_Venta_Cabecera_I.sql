CREATE OR ALTER PROCEDURE PPERS_Pedido_Venta_Cabecera_I
    @prm_IdCliente T_Id_Cliente,
    @prm_IdEnvio INT,
	@prm_IdEnvioLinea INT
AS  
BEGIN  
    --Declarar variables  
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

    SET NOCOUNT ON;

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
                    @FechaInsertUpdate = @v_FechaActual
	
		UPDATE Conf_Pedidos_Cli
        SET IdEnvio = @prm_IdEnvio
        WHERE IdPedido = @v_IdPedido;

		-- Parte para generar las lineas
		DECLARE 
			@v_IdArticuloTrabajo T_Id_Articulo,
			@v_UnidadesTrabajo DECIMAL(38, 14),
			@v_PrecioTrabajo DECIMAL(38, 14),
			@v_IdArticuloPalet T_Id_Articulo,
			@v_UnidadesPalet DECIMAL(38, 14),
			@v_PrecioPalet DECIMAL(38, 14);

		-- Obtenemos los articulos y sus unidades
		SELECT
			@v_IdArticuloTrabajo = PTL.IdArticulo,
			@v_UnidadesTrabajo = (PEL.PALETS * PTLC.ResmasPorPalet * (PTL.Ancho * PTL.Largo * (PTL.Gramaje * 500)) / 10000000) / 1000,
			@v_IdArticuloPalet = PTL.IdArticuloPrecio,
			@v_UnidadesPalet = PEL.Palets
		FROM PERS_Trabajos_Lineas AS PTL
			JOIN PERS_Envios_Lineas AS PEL ON PTL.IdTrabajo = PEL.IdTrabajo AND PTL.IdLinea = PEL.IdTrabajoLinea
			JOIN PERS_Trabajos_Lineas_Corte AS PTLC ON PEL.IdTrabajo = PTLC.IdTrabajo AND PEL.IdTrabajoLinea = PTLC.IdLinea AND PEL.IdTrabajoLineaCorte = PTLC.IdLineaCorte
		WHERE PEL.IdEnvio = @prm_IdEnvio AND PEL.IdEnvioLinea = @prm_IdEnvioLinea;

		-- Obtenemos la descripcion y el precio del Articulo Trabajo
		SELECT @v_PrecioTrabajo = LPCA.Precio
		FROM Articulos AS A
			JOIN Listas_Precios_Cli_Art AS LPCA ON A.IdArticulo = LPCA.IdArticulo
			JOIN Clientes_Datos_Economicos AS CDE ON LPCA.IdLista = CDE.IdLista
		WHERE CDE.IdCliente = @prm_IdCliente AND LPCA.IdArticulo = @v_IdArticuloTrabajo

		-- Obtenemos la descripcion y el precio del Articulo Palet
		SELECT @v_PrecioPalet = LPCA.Precio
		FROM Articulos AS A
			JOIN Listas_Precios_Cli_Art AS LPCA ON A.IdArticulo = LPCA.IdArticulo
		WHERE LPCA.IdLista = 0 AND LPCA.IdArticulo = @v_IdArticuloPalet

        -- Crea la linea de trabajo
        EXEC PPERS_Pedido_Venta_Lineas_I @v_IdPedido, @v_IdArticuloTrabajo, @v_UnidadesTrabajo, @v_PrecioTrabajo, @v_IdLista

        -- Crea la linea de palet
        EXEC PPERS_Pedido_Venta_Lineas_I @v_IdPedido, @v_IdArticuloPalet, @v_UnidadesPalet, @v_PrecioPalet, 0

        RETURN 1;
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
    END CATCH  
END  
GO

ZPERMISOS PPERS_Pedido_Venta_Cabecera_I
GO