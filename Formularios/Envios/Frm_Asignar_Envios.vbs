Sub Initialize()

    ' Obtiene los valores del formulario padre
    paramsGForm = Split(GForm.Tag, ",")
    idCliente = paramsGForm(0)
    idDirEnvio = paramsGForm(1)
    idEnvio = paramsGForm(2)

    ' Establece los parametros para el procedimiento almacendo
    Set params = gcn.DameNewCollection
    params.Add idCliente
    params.Add idDirEnvio

    ' Carga la tabla temporal con las lineas de corte pendientes
    GCN.EjecutaStoreCol "PPERS_Crear_Temporales_Asignar_Envios", params

    ' Etiqueta superior
    GForm.Caption = "Asignar Envios"

    ' Tamaño del formulario
    GForm.Move GForm.Left - 2000, GForm.Top + 500, GForm.Width + 5000, GForm.Height - 300

    With GForm.Botonera
        .ActivarScripts = True
        .BotonesMantenimiento = 4
        .Boton("botGuardar").Visible = False
        .Boton("botNuevo").Visible = False
        .Boton("botEliminar").Visible = False
        .Boton("botImprimir").Visible = False
        .BotonAdd "Asignar", "btnAsignarEnvios", , 0, True, 123
        .SeguridadObjeto = 0
    End With ' Botonera

    Set cboIdDireccionEnvio = GForm.Controls.Add("AhoraOCX.ComboUsuario", "cboIdDireccionEnvio", GForm.Controls("PanMain"))
    With cboIdDireccionEnvio 
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
        .CaptionWidth = 1200
        .Descripcion = "Select CodigoAlt, Direccion From VPERS_Contactos"
        .Enabled = True
        .Formato = "Sin decimales"
        .Move 210, 200, 2500, 300 
        .NColumnas = 2
        .Necesario = True
        .TabIndex = 4
        .TabStop = True
        .TipoDato =  "Numeric"
        .Value = idDirEnvio
        .Visible = True  
    End With ' cboIdDireccionEnvio

    Set txtDireccionEnvio = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtDireccionEnvio", GForm.Controls("PanMain"))
    With txtDireccionEnvio
        .AplicaEstilo      
        .Enabled = False 
        .Formato = "Mayusculas y Minusculas" 
        .Move 2760, cboIdDireccionEnvio.Top, 4740, 300 
        .Necesario = False
        .TipoDato =  "String"
        .Visible = True 
    End With ' txtDireccionEnvio

    Set cntFiltro = GForm.Controls.Add("AhoraOCX.cntBotonera", "cntFiltro", GForm.Controls("PanMain"))
    With cntFiltro
        .ActivarScripts = True
        .BotonAdd "Filtrar", "btnFiltrar", "", 0, False
        .HabilitaBotones
        .Move txtDireccionEnvio.Left + txtDireccionEnvio.Width + 100, cboIdDireccionEnvio.Top - 30, 1000, 300
        .SeguridadObjeto = True
        .Visible = True
    End With ' cntFiltro

    Set GrdAsignarEnvios = gForm.Controls.Add("AhoraOCX.cntGridUsuario", "GrdAsignarEnvios", GForm.Controls("PanMain"))
    With GrdAsignarEnvios
        .ActivarScripts = True
        .AplicaEstilo
        .Agregar = False
        .Editar = True
        .Enabled = True
        .Eliminar = False
        .AgregaColumna "IdTrabajo", 0, "IdTrabajo", True
        .AgregaColumna "IdLinea", 0, "Línea", True
        .AgregaColumna "IdLineaCorte", 0, "Línea Corte", True
        .AgregaColumna "FechaCorte", 1200, "Fecha corte", True
        .AgregaColumna "RefTrabajo", 1500, "Ref.", True
        .AgregaColumna "PedidoCliente", 1500, "Pedido", True
        .AgregaColumna "IdCliente", 1000, "Cliente", True
        .AgregaColumna "Cliente", 3000, "Nombre", True
        .AgregaColumna "ResmasPorPalet", 1200, "Resmas/Palets", True
        .AgregaColumna "PaletsCortados", 1200, "Palets", True
        .AgregaColumna "PaletsPendientes", 1200, "Palets pendientes", True
        .AgregaColumna "PaletsEnviados", 1200, "Palets enviados", True
        .AgregaColumna "PaletsAsignar", 1200, "Asignar palets"
        .FROM = "PERS_TEMP_Asignar_Envios"
        .WHERE = "WHERE IdCliente = '" & idCliente & "' AND DireccionEnvio = '" & idDirEnvio & "'"
        .Move 210, 650, 15000, 4000 
        .Refresca = True
        .Visible = True
    End With

End Sub ' Initialize

Sub Show
    SetComboText "cboIdDireccionEnvio", "txtDireccionEnvio", "SELECT Direccion FROM VPERS_Contactos WHERE CodigoAlt = ", True
End Sub ' Show

Sub Combo_AfterUpdate(aCombo)     
    If aCombo.Name = "cboIdDireccionEnvio" Then 
        SetComboText "cboIdDireccionEnvio", "txtDireccionEnvio", "SELECT Direccion FROM VPERS_Contactos WHERE CodigoAlt = ", True
    End If
End Sub ' Combo_AfterUpdate

Sub Botonera_AfterExecute(aBotonera, aBoton)
    If aBoton.Name = "btnAsignarEnvios" Then
        ' Obtiene los valores del formulario padre
        paramsGForm = Split(GForm.Tag, ",")
        idCliente = paramsGForm(0)
        idDirEnvio = paramsGForm(1)
        idEnvio = paramsGForm(2)

        ' Establece los parametros para el procedimiento almacendo
        Set params = gcn.DameNewCollection
        params.Add idEnvio

        If GCN.EjecutaStoreCol("PPERS_Asignar_Envios_Lineas", params) Then
            GCN.Obj.ShowMsgBox("Envios asignados correctamente.")
            GForm.Controls("GrdAsignarEnvios").Refrescar
        Else
            GCN.Obj.ShowMsgBox("Ha ocurrido algún al asignar los envios.")
        End If
    ElseIf aBoton.Name = "btnFiltrar" Then
        Dim idCliente, idDirEnvio, textoWhere 
        ' Obtiene el cliente y la direccion de envio
        paramsGForm = Split(GForm.Tag, ",")
        idCliente = paramsGForm(0)
        idDirEnvio = GForm.Controls("cboIdDireccionEnvio").Value

        ' Inicializa el filtro
        textoWhere = "WHERE IdCliente = '" & idCliente & "'"

        ' Si hay seleccionada una direccion de envio, se agrega al filtro
        If Len(idDirEnvio) > 0 Then
            textoWhere = textoWhere & "AND DireccionEnvio = '" & idDirEnvio & "'"
        End If

        ' Aplica el filtro y refresca el grid
        GForm.Controls("GrdAsignarEnvios").WHERE = textoWhere
        GForm.Controls("GrdAsignarEnvios").Refrescar
    End If
End Sub ' Botonera_AfterExecute

' Jorge: Funcion para establecer la descripcion del valor de un combo
Sub SetComboText(comboName, textName, sqlText, isStringValue)
  If Len(GForm.Controls(comboName).Value) > 0 Then
    Dim comboValue
    comboValue = GForm.Controls(comboName).Value
    
    If isStringValue Then
        GForm.Controls(textName).Text = GCN.DameValorcampo(sqlText & "'" & comboValue & "'")
    Else
        GForm.Controls(textName).Text = GCN.DameValorcampo(sqlText & comboValue)
    End If
  Else
    GForm.Controls(textName).Text = ""
  End If
End Sub