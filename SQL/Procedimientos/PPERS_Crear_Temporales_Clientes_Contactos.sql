CREATE OR ALTER PROCEDURE PPERS_Crear_Temporales_Clientes_Contactos
AS
BEGIN
	EXECUTE AS LOGIN = 'sa'; 

	SET NOCOUNT ON;

	IF EXISTS (
		SELECT 1
		FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME IN ('PERS_TEMP_Clientes_Datos', 'PERS_TEMP_Contactos')
	) 
	BEGIN
		DROP TABLE PERS_TEMP_Clientes_Datos;
		DROP TABLE PERS_TEMP_Contactos;
	END

	-- Crea una tabla auxiliar/temporal para seleccionar clientes
	CREATE TABLE PERS_TEMP_Clientes_Datos (
		IdCliente T_Id_Cliente,
		Cliente T_Nombre,
		Marcado BIT,
		IdDoc T_Id_Doc
	);

	-- Inserta los datos de los clientes existentes
	INSERT INTO PERS_TEMP_Clientes_Datos (IdCliente, Cliente, Marcado, IdDoc)
	SELECT IdCliente, Cliente, 0, IdDoc
	FROM Clientes_Datos;
	
	-- Crea una tabla auxiliar/temporal para seleccionar contactos
	CREATE TABLE PERS_TEMP_Contactos (
		IdContacto INT,
		Nombre VARCHAR(255),
		Direccion T_Direccion,
		Marcado BIT,
		IdDoc T_Id_Doc
	);

	-- Inserta los datos de los contactos existentes
	INSERT INTO PERS_TEMP_Contactos (IdContacto, Nombre, Direccion, Marcado, IdDoc)
	SELECT IdContacto, Nombre, Direccion, 0, IdDoc
	FROM Contactos
	WHERE Nombre NOT IN (SELECT Cliente FROM Clientes_Datos) AND Direccion IS NOT NULL

	EXECUTE ZPermisos PERS_TEMP_Clientes_Datos

	EXECUTE ZPermisos PERS_TEMP_Contactos

	RETURN -1;
END
GO

ZPermisos PPers_Crear_Temporales_Clientes_Contactos
GO