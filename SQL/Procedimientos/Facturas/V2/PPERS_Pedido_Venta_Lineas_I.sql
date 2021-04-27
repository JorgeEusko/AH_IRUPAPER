CREATE OR ALTER PROCEDURE [dbo].[PPERS_Pedido_Venta_Lineas_I]
    @prm_IdPedido T_Id_Pedido,  
    @prm_IdArticulo T_Id_Articulo,
    @prm_Cantidad T_Decimal_2,
	@prm_Precio T_Decimal_2,
	@prm_IdLista T_Id_Lista,
	@prm_IdEnvio INT,
	@prm_IdEnvioLinea INT,
	@prm_RefTrabajo VARCHAR(255),
    @prm_IdPedidoCliente VARCHAR(100),
    @prm_IdPedidoClienteFinal VARCHAR(100)
AS  
BEGIN  
    --Declarar las variables  
    DECLARE 
		@v_Error VARCHAR(MAX),
		@v_Descrip varchar(255) = (SELECT Descrip FROM Articulos WHERE IdArticulo = @prm_IdArticulo),
		@v_IdLinea T_Id_Linea = (SELECT ISNULL(MAX(IdLinea),0) + 1 FROM Pedidos_Cli_Lineas WHERE IdPedido = @prm_IdPedido),  
		@v_IdAlmacen T_Id_Almacen = 0,
		@v_Comision T_Decimal = (SELECT Comision FROM Pedidos_Cli_Cabecera WHERE IdPedido = @prm_IdPedido) ,
		@v_DescuentoCalculado T_Decimal,
		@v_Precio T_Decimal,
		@v_IdCliente T_Id_Cliente,
		@v_IdMoneda T_Id_Moneda,
		@v_IdMonedaDev T_Id_Moneda,
		@v_Descuento T_Decimal,
		@v_DtoLP1 T_Decimal,
		@v_DtoLP2 T_Decimal,
		@v_DtoLP3 T_Decimal,
		@v_DtoLP4 T_Decimal,
		@v_DtoLP5 T_Decimal,
		@v_DtoGD T_Decimal,
		@v_FechaHoy Smalldatetime  = GETDATE(),
		@v_IdDocPadre INT 

    SET NOCOUNT ON; 
  
	BEGIN TRANSACTION
    BEGIN TRY

		--Calcular descuentos
		SELECT @v_DescuentoCalculado = FPAD.Descuento
		FROM  dbo.FunDamePrecio_Articulo_Descuentos ('OFF', 'ON', 0, 0, 0, 0, 0, @v_DescuentoCalculado ) FPAD

		-- Recupera los datos del cliente
		SELECT 
			@v_IdCliente = IdCliente,
			@v_IdDocPadre = IdDoc
		FROM Pedidos_Cli_Cabecera
		WHERE IdPedido = @prm_IdPedido

		-- Recupera el id de la lista 
		SELECT @v_IdMoneda = IdMoneda
		FROM Clientes_Datos_Economicos
		WHERE IdCliente = @v_IdCliente

		-- Recupera el precio del articulo
		EXEC PDamePrecio_Articulo 
			@prm_IdArticulo, 
			@v_IdCliente, 
			@prm_IdLista, 
			@prm_Cantidad, 
			@v_IdMoneda,
			@v_Precio OUT,
			0,
			@v_Descuento OUT,
			0,
			0,
			@v_DtoLP1 OUT,
			@v_DtoLP2 OUT,
			@v_DtoGD OUT,
			@v_IdAlmacen,
			0,
			0,
			0,
			'Un',
			@v_FechaHoy,
			0,
			0,
			0,
			0,
			'Pedido_Lineas', 
			0, 
			'Pedidos', 
			@v_IdDocPadre

		-- Establece el precio
		IF @prm_Precio IS NOT NULL AND  @prm_Precio <> 0
			SET @v_Precio = @prm_Precio

		EXECUTE pPedidos_Cli_Lineas_I 
					@IdPedido              = @prm_IdPedido, 
					@IdLinea               = @v_IdLinea, 
					@IdArticulo            = @prm_IdArticulo, 
					@IdArticuloCli         = NULL, 
					@IdAlmacen             = @v_IdAlmacen, 
					@Cantidad              = @prm_Cantidad, 
					@Precio                = 0, 
					@Precio_EURO           = @v_Precio, 
					@PrecioMoneda          = 0, 
					@Descuento             = @v_DescuentoCalculado, 
					@IdIva                 = 0, 
					@IdEstado              = 0, 
					@IdSituacion           = 0, 
					@IdEmbalaje            = NULL, 
					@CantidadEmbalaje      = 1, 
					@Observaciones         = NULL, 
					@Descrip               = @v_Descrip, 
					@Comision              = @v_Comision, 
					@IdAlbaran             = NULL, 
					@FechaAlbaran          = NULL, 
					@IdFactura             = NULL, 
					@FechaFactura          = NULL, 
					@CantidadLotes         = 0, 
					@Marca                 = NULL, 
					@EmbalajeFinal         = NULL, 
					@CantidadEmbalajeFinal = 1, 
					@Descrip2              = NULL, 
					@PesoNeto              = 0, 
					@PesoEmbalaje          = 0, 
					@PesoEmbalajeFinal     = 0, 
					@Orden                 = 0, 
					@TotalComision         = 0, 
					@Path                  = NULL, 
					@DtoLP1                = @v_DtoLP1, 
					@DtoLP2                = @v_DtoLP2, 
					@DtoGD                 = @v_DtoGD, 
					@DtoMan                = 0, 
					@ConjManual            = 0, 
					@IdDocPadre            = NULL, 
					@IdFase                = NULL, 
					@IdProyecto_Produccion = NULL, 
					@CuentaArticulo        = NULL, 
					@TipoUnidadPres        = NULL, 
					@UnidadesStock         = 0, 
					@UnidadesPres          = 0, 
					@Precio_EuroPres       = 0, 
					@PrecioMonedaPres      = 0, 
					@IdOrdenCarga          = NULL, 
					@IdOferta              = NULL, 
					@Revision              = NULL, 
					@IdOfertaLinea         = NULL, 
					@RefCliente            = NULL, 
					@NumPlano              = NULL, 
					@IdParte               = NULL, 
					@IdSeguimiento         = NULL, 
					@IdConceptoCertif      = NULL, 
					@NumBultos             = 1, 
					@IdTipoOperacion       = NULL, 
					@IdFacturaCertif       = 0, 
					@UdsCarga              = 0, 
					@IdEmbalaje_Disp       = NULL, 
					@IdOrdenRecepcion      = NULL, 
					@CantRecep             = 0, 
					@NumBultosFinal        = 0, 
					@DtoLP3                = 0, 
					@DtoLP4                = 0, 
					@DtoLP5                = 0, 
					@UdStockCarga          = 0, 
					@UdStockRecep          = 0, 
					@IdMaquina             = NULL, 
					@Total_Euros           = 0, 
					@Total_Moneda          = 0, 
					@IdMotivoIVAExento     = NULL, 
					@IdOpServicios         = NULL, 
					@IdOperacionFiscal     = NULL, 
					@IdRetencion           = 0, 
					@IdDoc                 = NULL, 
					@Usuario               = 'dbo', 
					@FechaInsertUpdate     = @v_FechaHoy

		-- Establece los datos del lincaje entre el pedido, los datos de envío y del trabajo
		UPDATE Conf_Pedidos_Cli_Lineas
		SET IdEnvio = @prm_IdEnvio,
			IdEnvioLinea = @prm_IdEnvioLinea,
			RefTrabajo = @prm_RefTrabajo,
			IdPedidoCliente = @prm_IdPedidoCliente,
			IdPedidoClienteFinal = @prm_IdPedidoClienteFinal
		WHERE IdPedido = @prm_IdPedido AND IdLinea = @v_IdLinea;

		COMMIT TRANSACTION
    END TRY  

    BEGIN CATCH  
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION

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

ZPERMISOS PPERS_Pedido_Venta_Lineas_I
GO