CREATE OR ALTER VIEW VPers_Costes_Palets_Resumen
AS
SELECT
	T.*,
	T.ImportePalet * T.Total_Palets AS CostePalets
FROM (
	SELECT
		TL.IdTrabajo,
		TL.IdLinea,
		TL.IdArticuloPrecio,
		ART.Descrip AS ArticuloPrecio,
		PCA.Precio,
		TL.Ancho,
		TL.Largo,
		TL.Ancho * TL.Largo AS Superficie,
		CASE
			WHEN (TL.Ancho * TL.Largo * PCA.Precio) < CART.PrecioMinimo THEN CART.PrecioMinimo
			ELSE (TL.Ancho * TL.Largo * PCA.Precio)
		END AS ImportePalet,
		VTLR.Total_Palets,
		TL.CostePaletFacturable
	FROM PERS_Trabajos_Lineas AS TL
		JOIN PERS_Trabajos AS T ON TL.IdTrabajo = T.IdTrabajo
		LEFT JOIN Articulos AS ART ON TL.IdArticuloPrecio = ART.IdArticulo
		JOIN Clientes_Datos_Economicos AS CDE ON T.IdCliente = CDE.IdCliente
		LEFT JOIN Listas_Precios_Cli_Art AS PCA ON CDE.IdLista = PCA.IdLista AND TL.IdArticuloPrecio = PCA.IdArticulo
		LEFT JOIN Conf_Articulos AS CART ON TL.IdArticuloPrecio = CART.IdArticulo
		JOIN VPers_Trabajos_Lineas_Resumen AS VTLR ON TL.IdTrabajo = VTLR.IdTrabajo AND TL.IdLinea = VTLR.IdLinea
) AS T
GO

ZPERMISOS VPers_Costes_Palets_Resumen
GO

SELECT * FROM VPers_Costes_Palets_Resumen