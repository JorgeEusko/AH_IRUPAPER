CREATE OR ALTER TRIGGER TPERS_Zonas_D
ON PERS_Zonas
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
                JOIN Deleted AS D ON PB.IdZona = D.IdZona)
        BEGIN
            PRINT 'IMPOSIBLE ELIMINAR ZONA. EXISTEN BOBINAS ASOCIADAS.'
            ROLLBACK TRAN
            RETURN
        END
    END
END
GO

ALTER TABLE PERS_Zonas ENABLE TRIGGER TPERS_Zonas_D
GO