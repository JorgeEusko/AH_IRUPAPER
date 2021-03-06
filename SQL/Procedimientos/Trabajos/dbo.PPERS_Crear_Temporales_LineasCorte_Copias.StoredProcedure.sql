USE [AH_IRUPAPER]
GO
/****** Object:  StoredProcedure [dbo].[PPERS_Crear_Temporales_LineasCorte_Copias]    Script Date: 17/03/2021 13:39:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[PPERS_Crear_Temporales_LineasCorte_Copias]
    @prm_IdTrabajo INT,
    @prm_IdLineaTrabajo INT,
    @prm_Cantidad INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @v_NumCopia INT = 1;

    -- Vacia la tabla PERS_TEMP_LineasCorte_Copias
    DELETE FROM PERS_TEMP_LineasCorte_Copias;

    -- Inserta el numero de copia del palet
    WHILE @v_NumCopia <= @prm_Cantidad BEGIN
        INSERT INTO [dbo].[PERS_TEMP_LineasCorte_Copias]
           ([IdTrabajo]
           ,[IdLinea]
           ,[EnvioA]
           ,[IdCalidadPapel]
           ,[Ancho]
           ,[Metros]
           ,[GramajeM2]
           ,[TotalResmas]
           ,[PesoPalet]
           ,[RefFrabricacion]
           ,[NumCopia])
        SELECT
            @prm_IdTrabajo,
            @prm_IdLineaTrabajo,
            NULL,
            TL.IdCalidad,
            TL.Ancho,
            TL.Largo,
            TL.Gramaje,
            TLR.Total_Resmas,
            TLR.KIlosTeoricos,
            TL.RefTrabajoCliente,
            @v_NumCopia
        FROM PERS_Trabajos_Lineas AS TL 
            JOIN VPers_Trabajos_Lineas_Resumen AS TLR ON TL.IdTrabajo =  TLR.IdTrabajo AND TL.IdLinea = TLR.IdLinea
        WHERE TL.IdTrabajo = @prm_IdTrabajo AND TL.IdLinea = @prm_IdLineaTrabajo      
    END
    
    RETURN -1;
END
GO
