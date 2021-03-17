USE [AH_IRUPAPER]
GO
/****** Object:  View [dbo].[VPERS_Asignar_Envios]    Script Date: 17/03/2021 13:33:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[VPERS_Asignar_Envios]
AS
SELECT	
	IdTrabajo,
	IdLinea,
	IdLineaCorte,
	Palets,
	CAST(0 AS BIT) AS Seleccionar
FROM PERS_Trabajos_Lineas_Corte 
GO
