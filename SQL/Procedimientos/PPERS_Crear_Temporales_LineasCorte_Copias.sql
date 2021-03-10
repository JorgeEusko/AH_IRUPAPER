CREATE OR ALTER PROCEDURE PPERS_Crear_Temporales_LineasCorte_Copias
    @prm_IdTrabajo INT,
    @prm_IdLineaTrabajo INT,
    @prm_Cantidad INT
AS
BEGIN
    
    SET NOCOUNT ON;

    DECLARE @v_NumCopia INT = 1;

    -- Vacia la tabla PERS_TEMP_LineasCorte_Copias
    DELETE FROM PERS_TEMP_LineasCorte_Copias;

    WHILE @v_NumCopia <= prm_Cantidad BEGIN
        INSERT INTO [dbo].[PERS_TEMP_LineasCorte_Copias]
           ([IdTrabajo]
           ,[IdLinea]
           ,[IdLineaCorte]
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
            
        VALUES
           (<IdTrabajo, int,>
           ,<IdLinea, int,>
           ,<IdLineaCorte, int,>
           ,<EnvioA, varchar(50),>
           ,<IdCalidadPapel, varchar(255),>
           ,<Ancho, [dbo].[T_Decimal],>
           ,<Metros, [dbo].[T_Decimal],>
           ,<GramajeM2, [dbo].[T_Decimal],>
           ,<TotalResmas, int,>
           ,<PesoPalet, [dbo].[T_Decimal],>
           ,<RefFrabricacion, varchar(255),>
           ,<NumCopia, int,>)

    END
    
    RETURN -1;
END