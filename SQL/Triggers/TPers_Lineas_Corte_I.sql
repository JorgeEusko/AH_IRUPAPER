CREATE OR ALTER TRIGGER TPers_Lineas_Corte_I
ON Pers_Trabajos_Lineas_Corte
AFTER INSERT
AS
BEGIN
	DECLARE 
		@v_IdTrabajo INT,
		@v_IdLinea INT,
		@v_IdLineaCorte INT,
		@v_Palets T_Decimal;

	-- Recupera la referencia de la linea de trabajo
	SELECT 
		@v_IdTrabajo = I.IdTrabajo,
		@v_IdLinea = I.IdLinea,
		@v_IdLineaCorte = I.IdLineaCorte,
		@v_Palets = Palets
	FROM inserted as I;

	-- Inserta la linea junto con la bobina
	UPDATE Pers_Trabajos_Lineas_Corte
	SET 
		PaletsPendientes = @v_Palets,
		PaletsEnviados = 0
	WHERE IdTrabajo = @v_IdTrabajo
		AND IdLinea = @v_IdLinea
		AND IdLineaCorte =  @v_IdLineaCorte
END
GO

ENABLE TRIGGER TPers_Lineas_Corte_I ON Pers_Trabajos_Lineas_Corte;  
GO