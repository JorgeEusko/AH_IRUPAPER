CREATE OR ALTER TRIGGER TPERS_Bobinas_I
ON PERS_Bobinas
FOR INSERT 
AS 
BEGIN
    SET NOCOUNT ON;

    DECLARE @Ins INT;

    IF EXISTS(SELECT 1 FROM inserted) BEGIN
        -------------------------------------------------------------------------------------------
        -- Comprobar integridad con tablas:
        -- Clientes_Datos
        -- PERS_Tipos_Calidad_Papel
        -- PERS_Bobinas_Estados
        -- Zonas
        -- Filas
        -------------------------------------------------------------------------------------------
        SELECT @Ins = COUNT(I.IdCliente)	
        FROM Inserted AS I LEFT JOIN Clientes_Datos AS CD ON I.IdCliente = CD.IdCliente
        WHERE (I.IdCliente IS NOT NULL)	
        
        IF @Ins > 0 BEGIN	
            PRINT 'Cliente No Existente. Tabla: Bobinas'
            ROLLBACK TRANSACTION
            RETURN
	    END	
        -------------------------------------------------------------------------------------------
        SELECT @Ins = COUNT(I.IdCalidad)	
        FROM Inserted AS I LEFT JOIN PERS_Tipos_Calidad_Papel AS TPC ON I.IdCalidad = TPC.IdCalidad
        WHERE (I.IdCalidad IS NOT NULL)	
        
        IF @Ins > 0 BEGIN	
            PRINT 'Tipo de Calidad No Existente. Tabla: Bobinas'
            ROLLBACK TRANSACTION
            RETURN
	    END	
        -------------------------------------------------------------------------------------------
    END
END