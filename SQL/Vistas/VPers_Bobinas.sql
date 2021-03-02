CREATE OR ALTER VIEW VPers_Bobinas
AS
SELECT PB.*, PBE.Descrip AS DescripEstado, PZ.Zona, PF.Fila, PTCP.Descrip AS DescripCalidadPapel, CD.Cliente
FROM PERS_Bobinas AS PB
	JOIN PERS_Bobinas_Estados AS PBE ON PB.IdEstado = PBE.IdEstado
	LEFT JOIN PERS_Tipos_Calidad_Papel AS PTCP ON PB.IdCalidad = PTCP.IdCalidad
	LEFT JOIN PERS_Zonas AS PZ ON PB.IdZona = PZ.IdZona
	LEFT JOIN PERS_Filas AS PF ON PB.IdFila = PF.IdFila
	LEFT JOIN Clientes_Datos AS CD ON PB.IdCliente = CD.IdCliente
GO

ZPermisos VPers_Bobinas
GO	