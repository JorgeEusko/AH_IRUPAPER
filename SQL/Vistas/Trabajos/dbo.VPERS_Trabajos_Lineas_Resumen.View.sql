USE [AH_IRUPAPER]
GO
/****** Object:  View [dbo].[VPERS_Trabajos_Lineas_Resumen]    Script Date: 17/03/2021 13:33:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER  VIEW [dbo].[VPERS_Trabajos_Lineas_Resumen]
AS
SELECT
    T1.*,
    T1.PesoResma * T1.Total_Resmas AS KilosCortados,
    T1.KilosTeoricos - (T1.PesoResma * T1.Total_Resmas) AS Merma,
    (T1.PesoResma * T1.Total_Resmas) / T1.KilosTeoricos AS PorcentajeMerma
FROM (
SELECT 
    TL.IdTrabajo,
    TL.IdLinea,
    ((TL.Ancho * TL.Largo * (TL.Gramaje * 500)) / 10000000) AS PesoResma,
    TLBU.Bobinas_Utilizadas,
    TLK.KilosTeoricos,
    TLCS.Total_Palets,
    TLCS.Total_Resmas,
    TLCS.Total_PaletsEnviados,
    TLCS.Total_PaletsPendientes,
    PCA.Precio AS PrecioTrabajo,
    TL.IdDoc
FROM PERS_Trabajos_Lineas AS TL 
    LEFT JOIN VPers_Trabajos_Lineas_Bobinas_Utilizadas AS TLBU ON TL.IdTrabajo = TLBU.IdTrabajo AND TL.IdLinea = TLBU.IdLinea
    LEFT JOIN VPers_Trabajos_Lineas_KilosTeoricos AS TLK ON TL.IdTrabajo = TLK.IdTrabajo AND TL.IdLinea = TLK.IdLinea
    LEFT JOIN VPers_Trabajos_Lineas_Cortes_Sumas AS TLCS  ON TL.IdTrabajo = TLCS.IdTrabajo AND TL.IdLinea = TLCS.IdLinea
    JOIN PERS_Trabajos AS T ON TL.IdTrabajo = T.IdTrabajo
    LEFT JOIN Clientes_Datos_Economicos AS CD ON T.IdCliente = CD.IdCliente
    LEFT JOIN Listas_Precios_Cli_Art AS PCA ON CD.IdLista = PCA.IdLista AND TL.IdArticulo = PCA.IdArticulo
) AS T1
GO
