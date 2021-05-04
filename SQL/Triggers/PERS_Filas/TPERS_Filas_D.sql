CREATE OR ALTER TRIGGER TPERS_Filas_D
ON PERS_Filas
FOR DELETE
AS 
BEGIN
    IF EXISTS(SELECT 1 FROM inserted) BEGIN
        
        --------------------------------------------------------------
        -- EVITAR BORRADOS si existen regs asociados en:
        --	PERS_BOBINAS
        --------------------------------------------------------------
        IF EXISTS (
            SELECT TOP 1 1 
            FROM PERS_Bobinas AS PB 
                JOIN Deleted AS D ON PB.IdFila = D.IdFila)
        BEGIN
            PRINT 'IMPOSIBLE ELIMINAR FILA. EXISTEN BOBINAS ASOCIADAS.'
            ROLLBACK TRAN
            RETURN
        END
    END
END
GO

ALTER TABLE PERS_Filas ENABLE TRIGGER TPERS_Filas_D
GO