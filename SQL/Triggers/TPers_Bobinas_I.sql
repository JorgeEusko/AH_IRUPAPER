CREATE OR ALTER TRIGGER TPers_Bobinas_I
ON Pers_Bobinas
AFTER INSERT
AS
BEGIN
	DECLARE 
		@v_RefTrabajo VARCHAR(255),
		@v_IdBobina INT,
		@v_RefBobina VARCHAR(255),
		@v_NumBobina INT;

	-- Recupera la referencia de la l�nea de trabajo
	SELECT 
		@v_IdBobina = I.IdBobina,
		@v_RefTrabajo = TRIM(I.RefTrabajo),
		@v_RefBobina = I.RefBobina,
		@v_NumBobina = I.NumBobina
	FROM inserted as I;

	-- Inserta la linea junto con la bobina
	INSERT INTO PERS_Trabajos_Lineas_Bobinas (IdTrabajo, IdLinea, IdBobina, RefBobina, NumBobina)
	SELECT
		IdTrabajo,
		IdLinea,
		@v_IdBobina,
		@v_RefBobina,
		@v_NumBobina
	FROM PERS_Trabajos_Lineas
	WHERE TRIM(RefTrabajoCliente) = @v_RefTrabajo;
	
END
GO

ENABLE TRIGGER TPers_Bobinas_I ON Pers_Bobinas;  
GO