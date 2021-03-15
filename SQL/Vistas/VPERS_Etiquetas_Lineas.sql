SELECT
    ((T1.Ancho * T1.Largo * (T1.Gramaje * 500)) / 10000000) * T1.Resmas AS PesoResmas,
    ((T1.Ancho * T1.Largo * (T1.Gramaje * 500)) / 10000000) * T1.Resmas AS PesoResmas,
FROM (
    SELECT 
        PTLC.IdTrabajo,
        PTLC.IdLinea,
        PTLC.IdLineaCorte,
        PTL.Gramaje,
        PTL.Ancho,
        PTL.Largo,
        PTL.AnchoPalet,
        PTL.LargoPalet,
        (PTLC.ResmasPorPalet * PTLC.Palets) AS Resmas,
        PTLC.Palets,
    
    FROM PERS_Trabajos_Lineas AS PTL
        JOIN PERS_Trabajos_Lineas_Corte AS PTLC ON PTL.IdTrabajo = PTLC.IdTrabajo AND PTL.IdLinea = PTLC.IdLinea
) AS T1.