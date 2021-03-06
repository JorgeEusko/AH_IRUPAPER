USE [AH_IRUPAPER]
GO
/****** Object:  View [dbo].[VPERS_Trabajos]    Script Date: 17/03/2021 13:33:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[VPERS_Trabajos]
AS
SELECT PT.*, PTE.Descrip AS DescripEstado, CD.Cliente
FROM PERS_Trabajos PT
	JOIN PERS_Trabajos_Estados AS PTE on PT.IdEstado =  PTE.IdEstado
	JOIN Clientes_Datos AS CD ON PT.IdCliente = CD.IdCliente
GO
