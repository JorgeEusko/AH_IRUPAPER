USE [AH_IRUPAPER]
GO
/****** Object:  View [dbo].[VPERS_Costes_Palets_Resumen]    Script Date: 17/03/2021 13:33:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE or alter  VIEW [dbo].[VPERS_Costes_Palets_Resumen]
AS
SELECT
	T2.*,	
	T2.ImportePalet * T2.Total_Palets AS CostePalets
FROM ( 
	SELECT 
		T.*,
		T.Ancho * T.Largo / 10000 AS Superficie,
		CASE
			WHEN (T.Ancho * T.Largo / 10000 * T.Precio) < T.PrecioArtMin THEN T.PrecioArtMin
			ELSE (T.Ancho * T.Largo / 10000 * T.Precio)
		END AS ImportePalet
	FROM (
		SELECT
			TL.IdTrabajo,
			TL.IdLinea,
			TL.IdArticuloPrecio,
			ART.Descrip AS ArticuloPrecio,
			PCA.Precio,
			CASE
				WHEN TL.AnchoPalet IS NULL THEN TL.Ancho
				ELSE TL.AnchoPalet
			END AS Ancho, 
			CASE
				WHEN TL.LargoPalet IS NULL THEN TL.Largo
				ELSE TL.LargoPalet
			END AS Largo, 
			CART.PrecioArtMin,
			VTLR.Total_Palets,
			TL.CostePaletFacturable
		FROM PERS_Trabajos_Lineas AS TL
			JOIN PERS_Trabajos AS T ON TL.IdTrabajo = T.IdTrabajo
			LEFT JOIN Articulos AS ART ON TL.IdArticuloPrecio = ART.IdArticulo
			LEFT JOIN Listas_Precios_Cli_Art AS PCA ON PCA.IdLista = 0 AND TL.IdArticuloPrecio = PCA.IdArticulo
			LEFT JOIN Conf_Articulos AS CART ON TL.IdArticuloPrecio = CART.IdArticulo
			JOIN VPers_Trabajos_Lineas_Resumen AS VTLR ON TL.IdTrabajo = VTLR.IdTrabajo AND TL.IdLinea = VTLR.IdLinea
		) AS T
	) AS T2
GO
