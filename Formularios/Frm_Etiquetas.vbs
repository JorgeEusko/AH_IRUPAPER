Sub Initialize
    Dim idTrabajo, idLinea
    Set params = gcn.DameNewCollection

    params = Split(GForm.Tag, ",")
    idTrabajo = params(0)
    idLinea = params(1)

    ' Etiqueta superior
    GForm.Caption = "Etiquetas"

    ' Tamaño del formulario
    GForm.Move GForm.Left, GForm.Top + 500, GForm.Width - 2250, GForm.Height + 1300

    With GForm.Botonera
        .ActivarScripts = True
        .BotonesMantenimiento = 4
        .Boton("botGuardar").Visible = False
        .Boton("botNuevo").Visible = False
        .Boton("botEliminar").Visible = False
        .Boton("botImprimir").Visible = False
        .BotonAdd "Imprimir", "btnImprimirEtiquetas", , 0, True, 123
        .SeguridadObjeto = 0
    End With ' Botonera

    Set txtEnvioA = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtEnvioA", GForm.Controls("PanMain"))
    With txtEnvioA
        .ActivarScripts = True
        .AplicaEstilo
        .CaptionControl = "Envio a" 
        .CaptionVisible = True      
        .CaptionWidth = 2000 
        .Enabled = False 
        .Formato = "Mayusculas y minusculas" 
        .Move 210, 240,  4500, 300 
        .Necesario = True
        .TipoDato =  "String"
        .Visible = True 
    End With ' txtEnvioA

    Set txtCalidad = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtCalidad", GForm.Controls("PanMain"))
    With txtCalidad
        .ActivarScripts = True
        .AplicaEstilo
        .CaptionControl = "Calidad" 
        .CaptionVisible = True      
        .CaptionWidth = 2000 
        .Enabled = False 
        .Formato = "Mayusculas y minusculas" 
        .Move 210, 585,  4500, 300 
        .Necesario = True
        .TipoDato =  "String"
        .Visible = True 
    End With ' txtCalidad

    Set txtGramaje = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtGramaje", GForm.Controls("PanMain"))
    With txtGramaje
        .ActivarScripts = True
        .AplicaEstilo
        .CaptionControl = "Gramaje" 
        .CaptionVisible = True      
        .CaptionWidth = 2000 
        .Enabled = False 
        .Formato = "Con 2 decimales" 
        .Move 210, 930,  4500, 300 
        .Necesario = True
        .TipoDato =  "Numeric"
        .Visible = True 
    End With ' txtGramaje

    Set txtTamano = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtTamano", GForm.Controls("PanMain"))
    With txtTamano
        .ActivarScripts = True
        .AplicaEstilo
        .CaptionControl = "Tamaño" 
        .CaptionVisible = True      
        .CaptionWidth = 2000 
        .Enabled = False 
        .Formato = "Mayusculas y minusculas"  
        .Move 210, 1275,  4500, 300 
        .Necesario = True
        .TipoDato =  "String"
        .Visible = True 
    End With ' txtGramaje

    Set txtRefCli = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtRefCli", GForm.Controls("PanMain"))
    With txtRefCli
        .ActivarScripts = True
        .AplicaEstilo
        .CaptionControl = "Ref. Cli" 
        .CaptionVisible = True      
        .CaptionWidth = 2000 
        .Enabled = False 
        .Formato = "Mayusculas y minusculas" 
        .Move 210, 1620,  4500, 300 
        .Necesario = True
        .TipoDato =  "String"
        .Visible = True 
    End With ' txtRefCli

    Set txtRefFabricacion = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtRefFabricacion", GForm.Controls("PanMain"))
    With txtRefFabricacion
        .ActivarScripts = True
        .AplicaEstilo
        .CaptionControl = "Ref. Fabricación" 
        .CaptionVisible = True      
        .CaptionWidth = 2000 
        .Enabled = False 
        .Formato = "Mayusculas y minusculas" 
        .Move 210, 1965,  4500, 300 
        .Necesario = True
        .TipoDato =  "String"
        .Visible = True 
    End With ' txtRefFabricacion

    Set GrdEtiquetas = gForm.Controls.Add("AhoraOCX.cntGridUsuario", "GrdEtiquetas", GForm.Controls("PanMain"))
    With GrdEtiquetas
        .ActivarScripts = True
        .Visible = True
        .AplicaEstilo
        .Agregar = False
        .Editar = False
        .Enabled = True
        .Eliminar = False
        .AgregaColumna "IdTrabajo", 0, "Código"
        .AgregaColumna "IdLinea", 600, "Línea", True
        .AgregaColumna "Total_Palets", 1200, "Palets", True
        .AgregaColumna "Total_Resmas", 1200, "Resmas", True
        .AgregaColumna "PesoResma", 1200, "Peso resma", True
        .AgregaColumna "@EtIni", 1000, "Etiqueta Ini", True
        .AgregaColumna "@EtFin", 1000, "Etiqueta Fin", True
        .Campo("@EtIni").Sustitucion = "SELECT 1"
        .Campo("@EtFin").Sustitucion = "SELECT @Total_Palets"
        .FROM = "VPers_Trabajos_Lineas_Resumen"
        .Where = "WHERE IdTrabajo = " & idTrabajo & " AND IdLinea = " & idLinea
        .Refresca = True
        .Move 210, 2545, 8000, 3000 
    End With

    Set txtImprimirDesde = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtImprimirDesde", GForm.Controls("PanMain"))
    With txtImprimirDesde
        .ActivarScripts = True
        .AplicaEstilo
        .CaptionControl = "Imprimir desde" 
        .CaptionVisible = True      
        .CaptionWidth = 1300 
        .Enabled = True 
        .Formato = "Sin decimales" 
        .Move 210, 5900, 2300, 300
        .Necesario = True
        .TipoDato =  "Numeric"
        .Visible = True 
    End With ' txtImprimirDesde

    Set txtImprimirHasta = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtImprimirHasta", GForm.Controls("PanMain"))
    With txtImprimirHasta
        .ActivarScripts = True
        .AplicaEstilo
        .CaptionControl = " hasta" 
        .CaptionVisible = True      
        .CaptionWidth = 650 
        .Enabled = True 
        .Formato = "Sin decimales" 
        .Move txtImprimirDesde.Width + txtImprimirDesde.Left + 100, 5900, 1650, 300
        .Necesario = True
        .TipoDato =  "Numeric"
        .Visible = True 
    End With ' txtImprimirHasta

End Sub 

Sub Show()
    If GForm.Tag <> "" Then
        Dim idTrabajo, idLinea
        Set params = gcn.DameNewCollection

        params = Split(GForm.Tag, ",")
        idTrabajo = params(0)
        idLinea = params(1)

        Dim lSQL
        lSQL = "SELECT TOP 1 * FROM VPERS_Etiquetas_Cabecera WHERE IdTrabajo = " & idTrabajo & " AND IdLinea = " & idLinea

        Set lResult = gcn.OpenResultSet(lSQL, 2, 3)

        GForm.Controls("txtEnvioA").Text = lResult("DireccionEnvio")
        GForm.Controls("txtCalidad").Text = lResult("TipoPapel")
        GForm.Controls("txtGramaje").Text = lResult("Gramaje")
        GForm.Controls("txtTamano").Text = lResult("Tamano")
        GForm.Controls("txtRefCli").Text = lResult("RefCliente")
        GForm.Controls("txtRefFabricacion").Text = lResult("RefTrabajo")
    End If
End Sub ' Show

Sub Grid_RowColChange(aGrid, LastRow, LastCol)
    If aGrid.Name = "GrdEtiquetas" Then

        etiquetaFin = GForm.Controls("GrdEtiquetas").GetValue("Total_Palets")

        If etiquetaFin <> "" Then
            GForm.Controls("txtImprimirDesde").Text = 1
            GForm.Controls("txtImprimirHasta").Text = CDbl(etiquetaFin)
        Else
            GForm.Controls("txtImprimirDesde").Text = 0
            GForm.Controls("txtImprimirHasta").Text = 0
        End If

    End If
End Sub ' Grid_RowColChange

Sub Botonera_AfterExecute(aBotonera, aBoton)
    If aBoton.Name = "btnImprimirEtiquetas" Then
        Dim textoWhere

        Set params = gcn.DameNewCollection
        params.Add CInt(GForm.Controls("GrdEtiquetas").GetValue("IdTrabajo"))
        params.Add CInt(GForm.Controls("GrdEtiquetas").GetValue("IdLinea"))
        params.Add CInt(GForm.Controls("txtImprimirDesde").Text)
        params.Add CInt(GForm.Controls("txtImprimirHasta").Text)

        GCN.EjecutaStoreCol "PPERS_Crear_Etiquetas_Palets", params

        textoWhere = "WHERE PERS_TEMP_Etiquetas_Palets.IdTrabajo = " & GForm.Controls("GrdEtiquetas").GetValue("IdTrabajo") & " AND PERS_TEMP_Etiquetas_Palets.IdLinea =" & GForm.Controls("GrdEtiquetas").GetValue("IdLinea")
        
        gCn.AhoraProceso "ImprimirFichero", False, GCN, Nothing, "\PERSONALIZADOS\EUSKO Etiquetas.rpt","", textoWhere
    End If
End Sub ' Botonera_AfterExecute