CREATE OR ALTER TRIGGER TPers_Trabajos_Lineas_I
ON Pers_Trabajos_Lineas
AFTER INSERT
AS
BEGIN
	DECLARE 
		@v_IdTrabajo INT,
		@v_IdLinea INT,
		@v_RefTrabajo VARCHAR(255);

	-- Recupera la referencia de la línea de trabajo
	SELECT 
		@v_IdTrabajo = I.IdTrabajo, 
		@v_IdLinea = I.IdLinea,
		@v_RefTrabajo = TRIM(I.RefTrabajoCliente)
	FROM inserted as I;

	-- Inserta la linea junto con la bobina
	INSERT INTO PERS_Trabajos_Lineas_Bobinas (IdTrabajo, IdLinea, IdBobina, RefBobina, NumBobina)
	SELECT
		@v_IdTrabajo,
		@v_IdLinea,
		IdBobina,
		RefBobina,
		NumBobina
	FROM PERS_Bobinas
	WHERE TRIM(RefTrabajo) = @v_RefTrabajo;
	
END
GO

ENABLE TRIGGER TPers_Trabajos_Lineas_I ON Pers_Trabajos_Lineas;  
GO