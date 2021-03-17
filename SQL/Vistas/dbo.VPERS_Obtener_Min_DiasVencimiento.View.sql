USE [AH_IRUPAPER]
GO
/****** Object:  View [dbo].[VPERS_Obtener_Min_DiasVencimiento]    Script Date: 17/03/2021 13:33:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[VPERS_Obtener_Min_DiasVencimiento]
AS
	SELECT
		IdFormaPago,
		(SELECT MIN(PrimerVencimiento)
			FROM FormasPago_Lineas AS T2
			WHERE T2.IdFormaPago = T1.IdFormaPago) AS Aplazamiento
	FROM FormasPago AS T1
GO
