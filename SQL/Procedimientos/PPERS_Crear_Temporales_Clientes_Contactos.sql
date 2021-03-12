CREATE OR ALTER PROCEDURE PPERS_Crear_Temporales_Clientes_Contactos
AS
BEGIN
	SET NOCOUNT ON;

	-- Elimina los datos temporales de clientes
	DELETE FROM PERS_TEMP_Clientes_Datos;

	-- Inserta los datos de los clientes existentes
	INSERT INTO PERS_TEMP_Clientes_Datos (IdCliente, Cliente, Marcado, IdDoc)
	SELECT IdCliente, Cliente, 0, IdDoc
	FROM Clientes_Datos;
	
	-- Elimina los datos temporales de contactos
	DELETE FROM PERS_TEMP_Contactos;

	-- Inserta los datos de los contactos existentes
	INSERT INTO PERS_TEMP_Contactos (IdContacto, Nombre, Direccion, Marcado, IdDoc)
	SELECT IdContacto, Nombre, Direccion, 0, IdDoc
	FROM Contactos
	WHERE Nombre NOT IN (SELECT Cliente FROM Clientes_Datos) AND Direccion IS NOT NULL;

	RETURN -1;
END
GO

ZPermisos PPers_Crear_Temporales_Clientes_Contactos
GO