Sub Initialize

    ' Etiqueta superior
    GForm.Caption = "Imprimir Albarán de Envío General"

    ' Tamaño del formulario
    GForm.Move GForm.Left + 1500, GForm.Top + 1500, GForm.Width - 4000, GForm.Height - 3000

    With GForm.Botonera
        .ActivarScripts = True
        .BotonesMantenimiento = 4
        .Boton("botGuardar").Visible = False
        .Boton("botNuevo").Visible = False
        .Boton("botEliminar").Visible = False
        .Boton("botImprimir").Visible = False
        .BotonAdd "Imprimir", "btnImprimirAlbEnvio", , 0, True, 123
        .SeguridadObjeto = 0
    End With ' Botonera

    Set txtReceptor = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtReceptor", GForm.Controls("PanMain"))
    With txtReceptor
        .AplicaEstilo  
        .CaptionControl = "Receptor" 
        .CaptionVisible = True 
        .CaptionWidth = 1500      
        .Enabled = True 
        .Formato = "Mayusculas y Minusculas" 
        .Move 210, 200, 5000, 300 
        .Necesario = False
        .TabStop = True
        .TipoDato =  "String"
        .Visible = True 
    End With ' txtReceptor

    Set txtDomicilio = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtDomicilio", GForm.Controls("PanMain"))
    With txtDomicilio
        .AplicaEstilo  
        .CaptionControl = "Domicilio" 
        .CaptionVisible = True 
        .CaptionWidth = 1500      
        .Enabled = True 
        .Formato = "Mayusculas y Minusculas" 
        .Move 210, 545, 5000, 300 
        .Necesario = False
        .TabStop = True
        .TipoDato =  "String"
        .Visible = True 
    End With ' txtDomicilio

    Set txtDomicilioTrasnp = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtDomicilioTrasnp", GForm.Controls("PanMain"))
    With txtDomicilioTrasnp
        .AplicaEstilo  
        .CaptionControl = "Domicilio Trasnp." 
        .CaptionVisible = True 
        .CaptionWidth = 1500      
        .Enabled = True 
        .Formato = "Mayusculas y Minusculas" 
        .Move 210, 890, 5000, 300 
        .Necesario = False
        .TabStop = True
        .TipoDato =  "String"
        .Visible = True 
    End With ' txtDomicilioTrasp

    Set txtCIFTrasnp = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtCIFTrasnp", GForm.Controls("PanMain"))
    With txtCIFTrasnp
        .AplicaEstilo  
        .CaptionControl = "CIF Trasnp." 
        .CaptionVisible = True 
        .CaptionWidth = 1500      
        .Enabled = True 
        .Formato = "Mayusculas y Minusculas" 
        .Move 210, 1235, 5000, 300 
        .Necesario = False
        .TabStop = True
        .TipoDato =  "String"
        .Visible = True 
    End With ' txtCIFTrasnp

End Sub ' Initialize

Sub Show()
    Dim lSQL
    lSQL = "SELECT Receptor, Domicilio, [Domicilio Transporte] AS DomTransp, CIF_Transporte FROM PERS_Envios WHERE IdEnvio = " & CStr(GForm.Tag)

    Set lResult = GCN.OpenResultSet(lSQL, 2, 3)

    If lResult.EOF = False Then
        GForm.Controls("txtReceptor").Text = lResult("Receptor")
        GForm.Controls("txtDomicilio").Text = lResult("Domicilio")
        GForm.Controls("txtDomicilioTrasnp").Text = lResult("DomTransp")
        GForm.Controls("txtCIFTrasnp").Text = lResult("CIF_Transporte")
    End IF
End Sub ' Show

Sub Botonera_AfterExecute(aBotonera, aBoton)
    If aBoton.Name = "btnImprimirAlbEnvio" Then
        Dim textoUpdate, receptor, domicilio, domicilioTransp, cifTransp

        receptor = GForm.Controls("txtReceptor").Text
        domicilio = GForm.Controls("txtDomicilio").Text
        domicilioTransp = GForm.Controls("txtDomicilioTrasnp").Text
        cifTransp = GForm.Controls("txtCIFTrasnp").Text

        If Len(receptor) > 0 Then
            textoUpdate = " Receptor = '" & receptor & "', " 
        Else
            textoUpdate = " Receptor = NULL," 
        End If

        If Len(domicilio) > 0 Then
            textoUpdate = textoUpdate & " Domicilio = '" & domicilio & "', " 
        ElseIf Len(domicilio) = 0 Then
            textoUpdate = textoUpdate & " Domicilio = NULL, " 
        End If

        If Len(domicilioTransp) > 0Then
            textoUpdate = textoUpdate & " [Domicilio Transporte] = '" & domicilioTransp & "', " 
        ElseIf Len(domicilioTransp) = 0 Then
            textoUpdate = textoUpdate & " [Domicilio Transporte] = NULL, "  
        End If

        If Len(cifTransp) > 0 Then
            textoUpdate = textoUpdate & " CIF_Transporte = '" & cifTransp & "' " 
        ElseIf Len(cifTransp) = 0 Then
            textoUpdate = textoUpdate & " CIF_Transporte = NULL " 
        End If

        textoUpdate = "UPDATE PERS_Envios SET " & textoUpdate & " WHERE IdEnvio = " & CStr(GForm.Tag)
        GCN.ExecuteSql(textoUpdate)

        If aBoton.Name = "btnImprimirAlbEnvio" Then
            gCn.AhoraProceso "ImprimirFichero", False, GCN, Nothing, "\PERSONALIZADOS\EUSKO Albaran Envio General.rpt","", "WHERE PERS_Envios.IdEnvio = " & CStr(GForm.Tag)
        End If
    End If
End Sub ' Botonera_AfterExecute

            