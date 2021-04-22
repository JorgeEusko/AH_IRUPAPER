CREATE OR ALTER PROCEDURE PPERS_Asignar_Bobinas_I
    @prm_IdTrabajo INT,
    @prm_IdLinea INT
AS
BEGIN
    INSERT INTO PERS_Trabajos_Lineas_Bobinas (IdTrabajo, IdLinea, IdBobina)
    SELECT
        @prm_IdTrabajo,
        @prm_IdLinea,
        IdBobina
    FROM PERS_Bobinas 
    WHERE Marcar = 1;

    RETURN -1;
END
GO

ZPERMISOS PPERS_Asignar_Bobinas_I
GO