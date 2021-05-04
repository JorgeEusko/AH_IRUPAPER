CREATE OR ALTER TRIGGER TPERS_Tipos_Calidad_Papel_D
ON PERS_Tipos_Calidad_Papel
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
                JOIN Deleted AS D ON PB.IdCalidad = D.IdCalidad)
        BEGIN
            PRINT 'IMPOSIBLE ELIMINAR TIPO DE CALIDAD DE PAPEL. EXISTEN BOBINAS ASOCIADAS.'
            ROLLBACK TRAN
            RETURN
        END
    END
END
GO

ALTER TABLE PERS_Tipos_Calidad_Papel ENABLE TRIGGER TPERS_Tipos_Calidad_Papel_D
GO