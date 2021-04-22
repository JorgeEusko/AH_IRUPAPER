CREATE OR ALTER PROCEDURE PPERS_Desasignar_Bobinas_D
    @prm_IdTrabajo INT,
    @prm_IdLinea INT
AS
BEGIN
    DELETE 
    FROM PERS_Trabajos_Lineas_Bobinas
    WHERE IdTrabajo = @prm_IdTrabajo 
        AND IdLinea = @prm_IdLinea
        AND IdBobina IN (SELECT IdBobina FROM Pers_Bobinas WHERE Marcar = 1)

    RETURN -1;
END
GO

ZPERMISOS PPERS_Desasignar_Bobinas_D
GO