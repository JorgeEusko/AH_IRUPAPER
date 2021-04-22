CREATE OR ALTER TRIGGER TPERS_Trabajos_Lineas_Bobinas_U
ON PERS_Trabajos_Lineas_Bobinas
AFTER UPDATE
AS
BEGIN
	DECLARE @v_IdBobina INT;

	-- Recupera el codigo de la bobinas
	SELECT @v_IdBobina = I.IdBobina
	FROM inserted as I;

	-- Actualiza el estado de la bobina
	UPDATE PERS_Bobinas
	SET IdEstado = 2
	WHERE IdBobina = @v_IdBobina;	
END
GO

ENABLE TRIGGER TPERS_Trabajos_Lineas_Bobinas_U ON PERS_Trabajos_Lineas_Bobinas;  
GO