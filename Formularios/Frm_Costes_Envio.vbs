Sub Initialize()

    ' Etiqueta superior
    GForm.Caption = "Costes de envío"

    ' Tamaño del formulario
    GForm.Move GForm.Left + 8000, GForm.Top + 1000, GForm.Width - 7000, GForm.Height - 2000

    With GForm.Botonera
        .ActivarScripts = True
        .BotonesMantenimiento = 4
        .Boton("botGuardar").Visible = False
        .Boton("botNuevo").Visible = False
        .Boton("botEliminar").Visible = False
        .Boton("botImprimir").Visible = False
        .SeguridadObjeto = 0
    End With ' Botonera

    Set txtArticuloPalet = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtArticuloPalet", GForm.Controls("PanMain"))
    With txtArticuloPalet
        .AplicaEstilo
        .CaptionControl = "Palet" 
        .CaptionVisible = True      
        .CaptionWidth = 1150 
        .Enabled = False 
        .Formato = "Mayusculas y Minusculas" 
        .Move 210, 240, 3000, 300 
        .Necesario = True
        .TipoDato =  "String"
        .Visible = True 
    End With ' txtArticuloPalet

    Set txtPrecio = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtPrecio", GForm.Controls("PanMain"))
    With txtPrecio
        .AplicaEstilo
        .CaptionControl = "Precio" 
        .CaptionVisible = True      
        .CaptionWidth = 1150 
        .Enabled = False 
        .Formato = "Con 2 decimales" 
        .Move 210, 585, 3000, 300 
        .Necesario = True
        .TipoDato =  "Numeric"
        .Visible = True 
    End With ' txtPrecio
    
    Set txtLargo = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtLargo", GForm.Controls("PanMain"))
    With txtLargo
        .AplicaEstilo
        .CaptionControl = "Largo" 
        .CaptionVisible = True      
        .CaptionWidth = 1150 
        .Enabled = False 
        .Formato = "Con 2 decimales" 
        .Move 210, 930,  3000, 300 
        .Necesario = True
        .TipoDato =  "Numeric"
        .Visible = True 
    End With ' txtLargo

    Set txtAncho = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtAncho", GForm.Controls("PanMain"))
    With txtAncho
        .AplicaEstilo
        .CaptionControl = "Ancho" 
        .CaptionVisible = True      
        .CaptionWidth = 1150 
        .Enabled = False 
        .Formato = "Con 2 decimales" 
        .Move 210, 1275, 3000, 300 
        .Necesario = True
        .TipoDato =  "Numeric"
        .Visible = True 
    End With ' txtAncho
    
    Set txtSuperficie = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtSuperficie", GForm.Controls("PanMain"))
    With txtSuperficie
        .AplicaEstilo
        .CaptionControl = "Superficie" 
        .CaptionVisible = True      
        .CaptionWidth = 1150 
        .Enabled = False 
        .Formato = "Con 2 decimales" 
        .Move 210, 1620, 3000, 300 
        .Necesario = True
        .TipoDato =  "Numeric"
        .Visible = True 
    End With ' txtSuperficie

    Set txtImporte = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtImporte", GForm.Controls("PanMain"))
    With txtImporte
        .AplicaEstilo
        .CaptionControl = "Importe" 
        .CaptionVisible = True      
        .CaptionWidth = 1150 
        .Enabled = False 
        .Formato = "Con 2 decimales" 
        .Move 210, 1965, 3000, 300 
        .Necesario = True
        .TipoDato =  "Numeric"
        .Visible = True 
    End With ' txtImporte

    Set txtCostePalet = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtCostePalet", GForm.Controls("PanMain"))
    With txtCostePalet
        .AplicaEstilo
        .CaptionControl = "Coste palet" 
        .CaptionVisible = True      
        .CaptionWidth = 1150 
        .Enabled = False 
        .Formato = "Con 2 decimales" 
        .Move 210, 2310, 3000, 300 
        .Necesario = True
        .TipoDato =  "Numeric"
        .Visible = True 
    End With ' txtCostePalet
    
    Set chkCosteFacturable = GForm.Controls.Add("AhoraOCX.CheckBoxUser", "chkCosteFacturable", GForm.Controls("PanMain"))
    With chkCosteFacturable
        .ActivarScripts = True
        .CaptionControl = "Facturable"
        .CaptionVisible = True
        .CaptionWidth = 1150
        .Enabled = True
        .Move 210, 2655, 1375, 280 
        .Visible = True
    End With ' chkCosteFacturable

End Sub ' Initialize

Sub Show()
    If GForm.Tag <> "" Then
        Dim idTrabajo, idLinea
        Set params = gcn.DameNewCollection

        params = Split(GForm.Tag, ",")
        idTrabajo = params(0)
        idLinea = params(1)

        Dim lSQL
        lSQL = "SELECT TOP 1 * FROM VPers_Costes_Palets_Resumen WHERE IdTrabajo = " & idTrabajo & " AND IdLinea = " & idLinea

        Set lResult = gcn.OpenResultSet(lSQL, 2, 3)

        GForm.Controls("txtArticuloPalet").Text = lResult("ArticuloPrecio")
        GForm.Controls("txtPrecio").Text = lResult("Precio")
        GForm.Controls("txtAncho").Text = lResult("Ancho")
        GForm.Controls("txtLargo").Text = lResult("Largo")
        GForm.Controls("txtSuperficie").Text = lResult("Superficie")
        GForm.Controls("txtImporte").Text = lResult("ImportePalet")
        GForm.Controls("txtCostePalet").Text = lResult("CostePalets")

        If lResult("CostePaletFacturable") = "Verdadero" Then
            GForm.Controls("chkCosteFacturable").Value = True
        Else
            GForm.Controls("chkCosteFacturable").Value = False
        End If
    End If
End Sub ' Show

Sub Check_Click(aCheckBox)
    If aCheckBox.Name = "chkCosteFacturable" Then
        If GForm.Tag <> "" Then
            Dim idTrabajo, idLinea
            Set params = gcn.DameNewCollection

            params = Split(GForm.Tag, ",")
            idTrabajo = params(0)
            idLinea = params(1)

            GCN.ExecuteSQL("UPDATE PERS_Trabajos_Lineas SET CostePaletFacturable = " & aCheckBox.Value & " WHERE IdTrabajo = " & idTrabajo & " AND IdLinea = " & idLinea)
        End If
    End If
End Sub ' Check_Click