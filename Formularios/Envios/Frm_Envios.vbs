Sub Initialize
    
    ' Etiqueta superior
    GForm.Caption = "Envío"

    ' Tamaño del formulario
    GForm.Move GForm.Left - 2500, GForm.Top + 500, GForm.Width + 5000, GForm.Height - 2000

    With GForm.Botonera
        .ActivarScripts = True
        .BotonAdd "Asignar envios", "btnAsignarEnvios", , 0, True, 123
    End With ' Botonera

    Set PnlObservaciones1 = GForm.Controls.Add("AhoraOCX.cntPanel", "PnlObservaciones1", GForm.Controls("PnlMain"))
    With PnlObservaciones1 
        .Estilo = 2
        .Visible = True
    End With

    Set PnlObservaciones2 = GForm.Controls.Add("AhoraOCX.cntPanel", "PnlObservaciones2", GForm.Controls("PnlMain"))
    With PnlObservaciones2 
        .Estilo = 2
        .Visible = True
    End With

    Set lPersTab = gForm.Controls.Add("AhoraOCX.CntTab", "lPersTab", GForm.Controls("PnlMain")) 
    With lPersTab
        .AplicaEstilo
        .Visible = True
        .Move 7200, 100, 5000, 1965 
        .InsertItem 1, "Observaciones 1", PnlObservaciones1.Hwnd, 1
        .InsertItem 2, "Observaciones 2", PnlObservaciones2.Hwnd, 1
    End With 

    Set txtIdEnvio = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtIdEnvio", GForm.Controls("PnlMain"))
    With txtIdEnvio 
        .AplicaEstilo
        .CaptionControl = "Código" 
        .CaptionVisible = True      
        .CaptionWidth = 1150 
        .Enabled = False 
        .Formato = "Sin decimales" 
        .ObjOrigen = "EObjeto"
        .ObjPOrigen = "IdEnvio"
        .Move 210, 240, 2000, 300 
        .Necesario = True
        .TipoDato =  "Numeric"
        .Visible = True 
    End With ' txtIdEnvio

    Set txtFecha = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtFecha", GForm.Controls("PnlMain"))
    With txtFecha
        .AplicaEstilo
        .CaptionControl = "Fecha" 
        .CaptionVisible = True      
        .CaptionWidth = 700 
        .Enabled = True 
        .Formato = "Fecha Corta" 
        .ObjOrigen = "EObjeto"
        .ObjPOrigen = "Fecha"
        .Move 2300, 240, 2000, 300 
        .Necesario = True
        .TabIndex = 2
        .TabStop = True
        .TipoDato =  "Date"
        .Visible = True 
    End With ' txtFecha

    Set cboIdCliente = GForm.Controls.Add("AhoraOCX.ComboUsuario", "cboIdCliente", GForm.Controls("PnlMain"))
    With cboIdCliente 
        .AplicaEstilo
        .ActivarScripts = True
        .CActiva = 1
        .CaptionControl = "Cliente"
        .C1Anchura = 1320
        .C1Nombre = "IdCliente" 
        .C1TipoDato = 8
        .C2Anchura = 3570
        .C2Nombre = "Cliente"
        .C2TipoDato = 8
        .CaptionLink = True
        .CaptionVisible = True
        .CaptionWidth = 1150
        .Descripcion = "Select IdCliente, Cliente, NIF From VCOMBO_CLIENTES Order By IdCliente"
        .Enabled = True
        .Formato = "Mayusculas y Minusculas"
        .ObjOrigen = "EObjeto"
        .ObjPOrigen = "Cliente"
        .Move 210, 585, 2000, 300 
        .NColumnas = 3
        .Necesario = True
        .TabIndex = 4
        .TabStop = True
        .TipoDato =  "String"
        .Visible = True  
    End With ' cboIdCliente

    Set txtCliente = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtCliente", GForm.Controls("PnlMain"))
    With txtCliente
        .AplicaEstilo      
        .Enabled = False 
        .Formato = "Mayusculas y Minusculas" 
        .Move 2260, cboIdCliente.Top, 4740, 300 
        .Necesario = False
        .TipoDato =  "String"
        .Visible = True 
    End With ' txtCliente

    Set cboIdDirEnvio = GForm.Controls.Add("AhoraOCX.ComboUsuario", "cboIdDirEnvio", GForm.Controls("PnlMain"))
    With cboIdDirEnvio 
        .AplicaEstilo
        .ActivarScripts = True
        .CActiva = 1
        .CaptionControl = "Dir. Envio"
        .C1Anchura = 1320
        .C1Nombre = "CodigoAlt" 
        .C1TipoDato = 8
        .C2Anchura = 3570
        .C2Nombre = "Direccion"
        .C2TipoDato = 8
        .CaptionLink = True
        .CaptionVisible = True
        .CaptionWidth = 1150
        .Descripcion = "Select CodigoAlt, Direccion From VPERS_Contactos"
        .Enabled = True
        .Formato = "Mayusculas y Minusculas"
        .ObjOrigen = "EObjeto"
        .ObjPOrigen = "IdDirEnvio"
        .Move 210, 930, 2000, 300 
        .NColumnas = 3
        .Necesario = True
        .TabIndex = 4
        .TabStop = True
        .TipoDato =  "String"
        .Visible = True  
    End With ' cboIdDirEnvio

    Set txtDirEnvio = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtDirEnvio", GForm.Controls("PnlMain"))
    With txtDirEnvio
        .AplicaEstilo      
        .Enabled = False 
        .Formato = "Mayusculas y Minusculas" 
        .Move 2260, cboIdDirEnvio.Top, 4740, 300 
        .Necesario = False
        .TipoDato =  "String"
        .Visible = True 
    End With ' txtDirEnvio

    Set cboIdTransportista = GForm.Controls.Add("AhoraOCX.ComboUsuario", "cboIdTransportista", GForm.Controls("PnlMain"))
    With cboIdTransportista 
        .AplicaEstilo
        .ActivarScripts = True
        .CActiva = 1
        .CaptionControl = "Transportista"
        .C1Anchura = 1320
        .C1Nombre = "IdProveedor" 
        .C1TipoDato = 8
        .C2Anchura = 3570
        .C2Nombre = "Proveedor"
        .C2TipoDato = 8
        .CaptionLink = True
        .CaptionVisible = True
        .CaptionWidth = 1150
        .Descripcion = "Select IdProveedor, Proveedor From Prov_Datos WHERE IdTipo = -1"
        .Enabled = True
        .Formato = "Sin decimales"
        .ObjOrigen = "EObjeto"
        .ObjPOrigen = "Transportista"
        .Move 210, 1275, 2000, 300 
        .NColumnas = 3
        .Necesario = True
        .TabIndex = 4
        .TabStop = True
        .TipoDato =  "Numeric"
        .Visible = True  
    End With ' cboIdTransportista

    Set txtTransportista = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtTransportista", GForm.Controls("PnlMain"))
    With txtTransportista
        .AplicaEstilo      
        .Enabled = False 
        .Formato = "Mayusculas y Minusculas" 
        .Move 2260, cboIdTransportista.Top, 4740, 300 
        .Necesario = False
        .TipoDato =  "String"
        .Visible = True 
    End With ' txtTransportista

    Set txtMatricula = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtMatricula", GForm.Controls("PnlMain"))
    With txtMatricula
        .AplicaEstilo  
        .CaptionControl = "Matrícula" 
        .CaptionVisible = True 
        .CaptionWidth = 1150      
        .Enabled = True 
        .Formato = "Mayusculas y Minusculas" 
        .Move 210, 1620, 6800, 300 
        .Necesario = False
        .TipoDato =  "String"
        .Visible = True 
    End With ' txtMatricula
    
    Set txtObservaciones = GForm.Controls.Add("AhoraOCX.TextoMultilinea", "txtObservaciones1", GForm.Controls("PnlObservaciones1"))
    With txtObservaciones
        .AplicaEstilo
        .Formato = "Mayusculas y Minusculas" 
        .ObjOrigen = "EObjeto" 
        .ObjPOrigen = "LineaObservaciones1" 
        .Move 0, 0, lPersTab.Width - 100, lPersTab.Height
        .Necesario = False
        .TabIndex = 6
        .TabStop = True
        .TipoDato =  "String" 
        .Visible = True
    End With ' txtObservaciones1
    
    Set txtObservaciones = GForm.Controls.Add("AhoraOCX.TextoMultilinea", "txtObservaciones2", GForm.Controls("PnlObservaciones2"))
    With txtObservaciones
        .AplicaEstilo
        .Formato = "Mayusculas y Minusculas" 
        .ObjOrigen = "EObjeto" 
        .ObjPOrigen = "LineaObservaciones2" 
        .Move 0, 0, lPersTab.Width - 100, lPersTab.Height
        .Necesario = False
        .TabIndex = 7
        .TabStop = True
        .TipoDato =  "String" 
        .Visible = True
    End With ' txtObservaciones2

    Set GrdEnviosLineas = gForm.Controls.Add("AhoraOCX.cntGridUsuario", "GrdEnviosLineas", GForm.Controls("PnlMain"))
    With GrdEnviosLineas
        .ActivarScripts = True
        .Visible = True
        .AplicaEstilo
        .Agregar = False
        .Editar = False
        .Enabled = False
        .Eliminar = False
        .AgregaColumna "IdEnvio", 0, "Código"
        .AgregaColumna "IdEnvioLinea", 600, "Línea"
        .AgregaColumna "RefTrabajo", 1400, "Ref."
        .AgregaColumna "IdPedidoCliente", 1400, "Nº Pedido"
        .AgregaColumna "IdPedidoClienteFinal", 1400, "Nº Pedido Envío"
        .AgregaColumna "Palets", 1200, "Palets"
        .AgregaColumna "ResmasPorPalet", 1200, "Resmas/Palets", True
        .AgregaColumna "Resmas", 1200, "Resmas"
        '.AgregaColumna "Total", 1200, "Total"
        .AgregaColumna "PesoResma", 1200, "Peso Resma"
        '.AgregaColumna "PesoTotal", 1200, "Peso total"
        .FROM = "PERS_Envios_Lineas"
        .WHERE =  "WHERE 1 = 0"
        .Refresca = True
        .Move 210, 2100, 12000, 3000 
    End With

End Sub ' Initialize

Sub CargaObjeto()
    CargarEnvio()
End Sub ' CargaObjeto

Sub Combo_AfterUpdate(aCombo)     
    If aCombo.Name = "cboIdCliente" Then 
        SetComboTextString "cboIdCliente", "txtCliente", "SELECT Cliente FROM Clientes_Datos WHERE IdCliente = '"
    ElseIf  aCombo.Name = "cboIdTransportista" Then
        SetComboTextString "cboIdTransportista", "txtTransportista", "SELECT Proveedor FROM Prov_Datos WHERE IdProveedor = '"
    ElseIf  aCombo.Name = "cboIdDirEnvio" Then
        SetComboTextString "cboIdDirEnvio", "txtDirEnvio", "SELECT Direccion FROM VPers_Contactos WHERE CodigoAlt = '"
    End If
End Sub ' Combo_AfterUpdate

Sub Botonera_AfterExecute(aBotonera, aBoton)
    If aBoton.Name = "btnAsignarEnvios" Then
        Dim idCliente, idDirEnvio, idEnvio

        idCliente = GForm.Controls("cboIdCliente")
        idDirEnvio = GForm.Controls("cboIdDirEnvio")
        idEnvio = GForm.Controls("txtIdEnvio")

        If idCliente <> "" And idDirEnvio <> "" Then
            Set lFrmGen =  GCN.AhoraProceso("AhoraScripts.DameFrmGenerico", False)
            lFrmGen.Tag = CStr(idCliente) & "," & CStr(idDirEnvio) & "," & CStr(idEnvio)
            lFrmGen.Carga "Frm_AsignarEnvios", GForm, True

            GForm.Controls("GrdEnviosLineas").Refrescar
        Else
            GCN.Obj.ShowMsgBox("Debe seleccionar un cliente y unadirección de envío.")
        End If
    ElseIf aBoton.Name = "botGuardar" Then
        GForm.Controls("GrdEnviosLineas").Enabled = True
    ElseIf aBoton.Name = "botNuevo" Then
        CargarEnvio()
    End If
End Sub ' Botonera_AfterExecute

Sub CargarEnvio()
    If GForm.EObjeto.ObjGlobal.Nuevo Then
        GForm.Controls("GrdEnviosLineas").Enabled = False
        GForm.Controls("txtIdEnvio").Text = GCN.DameValorCampo ("SELECT ISNULL(MAX(IdEnvio), 0) + 1 AS NuevoCodigoEnvio FROM Pers_Envios", "NuevoCodigoEnvio")
        GForm.Controls("txtFecha").Text = CStr(Now())  
    Else
        GForm.Controls("GrdEnviosLineas").Enabled = True
        GForm.Controls("GrdEnviosLineas").WHERE = "WHERE IdEnvio = " & GForm.Controls("txtIdEnvio").Text
        GForm.Controls("GrdEnviosLineas").Refrescar
    End If

    SetComboTextString "cboIdCliente", "txtCliente", "SELECT Cliente FROM Clientes_Datos WHERE IdCliente = '"
    SetComboTextString "cboIdTransportista", "txtTransportista", "SELECT Proveedor FROM Prov_Datos WHERE IdProveedor = '"
    SetComboTextString "cboIdDirEnvio", "txtDirEnvio", "SELECT Direccion FROM VPers_Contactos WHERE CodigoAlt = '"
End Sub ' CargarEnvio

' Jorge: Funcion para establecer la descripcion del valor de un combo
Sub SetComboTextString(comboName, textName, sqlText)
  
  If Len(GForm.Controls(comboName).Value) > 0 Then
    Dim comboValue
    comboValue = GForm.Controls(comboName).Value
    GForm.Controls(textName).Text = GCN.DameValorcampo(sqlText & comboValue & "'")
  Else
    GForm.Controls(textName).Text = ""
  End If

End Sub