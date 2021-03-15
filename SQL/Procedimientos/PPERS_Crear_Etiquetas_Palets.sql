CREATE OR ALTER PROCEDURE PPERS_Crear_Etiquetas_Palets
    @prm_IdTrabajo INT,
    @prm_IdLineaTrabajo INT,
    @prm_IdLineaCorte INT,
    @prm_EtiquetaIni INT,
    @prm_EtiquetaFin INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @v_NumCopia INT = @prm_EtiquetaIni;

    -- Vacia la tabla PERS_TEMP_LineasCorte_Copias
    DELETE FROM PERS_TEMP_Etiquetas_Palets;

    -- Inserta el numero de copia del palet
    WHILE @v_NumCopia <= @prm_EtiquetaFin BEGIN
        INSERT INTO [dbo].[PERS_TEMP_Etiquetas_Palets]
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
            TL.AnchoPalet,
            TL.LargoPalet,
            TL.Gramaje,
            TLR.Total_Resmas,
            TLR.KIlosTeoricos,
            TL.RefTrabajoCliente,
            @v_NumCopia
        FROM PERS_Trabajos_Lineas AS TL 
            JOIN VPers_Trabajos_Lineas_Resumen AS TLR ON TL.IdTrabajo =  TLR.IdTrabajo AND TL.IdLinea = TLR.IdLinea
        WHERE TL.IdTrabajo = @prm_IdTrabajo AND TL.IdLinea = @prm_IdLineaTrabajo      

        SET @v_NumCopia = @v_NumCopia + 1;
    END
    
    RETURN -1;
END
GO

ZPERMISOS PPERS_Crear_Etiquetas_Palets
GO
