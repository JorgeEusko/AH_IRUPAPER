CREATE OR ALTER TRIGGER TPERS_Bobinas_Estados_D
ON PERS_Bobinas_Estados
FOR DELETE
AS 
BEGIN
    IF EXISTS(SELECT 1 FROM deleted) BEGIN
        PRINT 'IMPOSIBLE ELIMINAR ESTADO DE BOBINA'
        ROLLBACK TRAN
        RETURN
    END
END
GO

ALTER TABLE PERS_Bobinas_Estados ENABLE TRIGGER TPERS_Bobinas_Estados_D
GO