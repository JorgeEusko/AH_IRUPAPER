CREATE OR ALTER VIEW VPers_Trabajos
AS
SELECT PT.*, PTE.Descrip AS DescripEstado, CD.Cliente
FROM PERS_Trabajos PT
	JOIN PERS_Trabajos_Estados AS PTE on PT.IdEstado =  PTE.IdEstado
	JOIN Clientes_Datos AS CD ON PT.IdCliente = CD.IdCliente
GO

ZPermisos VPers_Trabajos
GO