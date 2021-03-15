CREATE OR ALTER VIEW VPERS_Contactos
AS
SELECT 
	C.IdContacto,
	C.Direccion,
	CC.CodigoAlt	
FROM Contactos AS C 
	JOIN Conf_Contactos AS CC ON C.IdContacto = CC.IdContacto
WHERE Nombre NOT IN (SELECT Cliente FROM Clientes_Datos) 
	AND Nombre NOT IN (SELECT Proveedor FROM Prov_Datos) 
GO

ZPERMISOS VPERS_Contactos
GO
