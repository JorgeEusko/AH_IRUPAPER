DELETE FROM PERS_Envios_Lineas
DELETE FROM PERS_Envios
DELETE FROM PERS_TEMP_Asignar_Envios
DELETE FROM PERS_TEMP_Contactos
DELETE FROM PERS_TEMP_Generar_Facturas
DELETE FROM PERS_TEMP_Clientes_Datos
DELETE FROM PERS_TEMP_Etiquetas_Palets
DELETE FROM PERS_Trabajos_Lineas_Bobinas
DELETE FROM PERS_Trabajos_Lineas_Corte
DELETE FROM PERS_Trabajos_Lineas
DELETE FROM PERS_Trabajos
DELETE FROM PERS_Bobinas

-- Resetear el autoincrement de la tabla bobinas
--DBCC CHECKIDENT ('PERS_Bobinas', RESEED, 0)