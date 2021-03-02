CREATE OR ALTER TRIGGER TPers_Trabajos_Lineas_D
ON Pers_Trabajos_Lineas
AFTER DELETE
AS
BEGIN
	DECLARE 
		@v_IdTrabajo INT,
		@v_IdLinea INT;

	-- Recupera la referencia de la línea de trabajo
	SELECT 
		@v_IdTrabajo = I.IdTrabajo, 
		@v_IdLinea = I.IdLinea
	FROM inserted as I;

	-- Elimina el enlace con las bobinas
	DELETE FROM PERS_Trabajos_Lineas_Bobinas
	WHERE IdTrabajo = @v_IdTrabajo AND IdLinea = @v_IdLinea;
	
END
GO

DISABLE TRIGGER TPers_Trabajos_Lineas_D ON Pers_Trabajos_Lineas;  
GO