USE [AH_IRUPAPER]
GO
/****** Object:  View [dbo].[VPERS_Contactos]    Script Date: 17/03/2021 13:33:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[VPERS_Contactos]
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
