CREATE OR ALTER TRIGGER TPERS_Zonas_U
ON PERS_Zonas
FOR UPDATE
AS 
BEGIN
    IF EXISTS(SELECT 1 FROM inserted) BEGIN
        IF UPDATE(IdZona)
        BEGIN
            PRINT 'IMPOSIBLE ACTUALIZAR ZONA'
            ROLLBACK TRAN
            RETURN
        END
    END
END
GO

ALTER TABLE PERS_Zonas ENABLE TRIGGER TPERS_Zonas_U
GO