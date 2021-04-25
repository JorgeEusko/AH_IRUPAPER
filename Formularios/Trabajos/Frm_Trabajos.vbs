Sub Initialize()
    
    ' Etiqueta superior
    GForm.Caption = "Trabajo"

    ' Tamaño del formulario
    GForm.Move GForm.Left - 2500, GForm.Top + -500, GForm.Width + 8000, GForm.Height + 1200

    With GForm.Botonera
        .ActivarScripts = True
        .BotonAdd "Imprimir Etiquetas", "botImprimirEtiquetas", "", 0, False, 123
    End With ' Botonera

    Set PnlObservaciones = GForm.Controls.Add("AhoraOCX.cntPanel", "PnlObservaciones", GForm.Controls("PnlMain"))
    With PnlObservaciones 
        .Estilo = 2
        .Visible = True
    End With

    Set lPersTab = gForm.Controls.Add("AhoraOCX.CntTab", "lPersTab", GForm.Controls("PnlMain")) 
    With lPersTab
        .AplicaEstilo
        .Visible = True
        .Move 7200, 100, 8000, 2175 
        .InsertItem 2, "Observaciones", PnlObservaciones.Hwnd, 1
    End With 

    Set txtIdTrabajo = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtIdTrabajo", GForm.Controls("PnlMain"))
    With txtIdTrabajo 
        .AplicaEstilo
        .CaptionControl = "Código" 
        .CaptionVisible = True      
        .CaptionWidth = 700 
        .Enabled = False 
        .Formato = "Sin decimales" 
        .ObjOrigen = "EObjeto"
        .ObjPOrigen = "IdTrabajo"
        .Move 210, 240, 2000, 300 
        .Necesario = True
        .TabIndex = 1
        .TabStop = True
        .TipoDato =  "Numeric"
        .Visible = True 
    End With ' txtIdTrabajo

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

    Set chkFacturado = GForm.Controls.Add("AhoraOCX.CheckBoxUser", "chkFacturado", GForm.Controls("PnlMain"))
    With chkFacturado
        .CaptionControl = "Facturado"
        .CaptionVisible = True
        .CaptionWidth = 700
        .Enabled = True
        .ObjOrigen = "EObjeto"
        .ObjPOrigen = "Facturado"
        .Move 4390, 240, 1200, 280 
        .Visible = True
    End With ' chkFacturado

    Set cboIdEstado = GForm.Controls.Add("AhoraOCX.ComboUsuario", "cboIdEstado", GForm.Controls("PnlMain"))
    With cboIdEstado
        .ActivarScripts = True
        .AplicaEstilo
        .CActiva = 1
        .CaptionControl = "Estado"
        .C1Anchura = 700
        .C1Nombre = "IdEstado" 
        .C1TipoDato = 2
        .C2Anchura = 2000
        .C2Nombre = "Descrip"
        .C2TipoDato = 8
        .CaptionLink = True
        .CaptionVisible = True
        .CaptionWidth = 700
        .Descripcion = "SELECT IdEstado, Descrip FROM PERS_Trabajos_Estados"
        .Enabled = True
        .ObjOrigen = "EObjeto"
        .ObjPOrigen = "IdEstado"
        .Move 210, 585, 2000, 300 
        .NColumnas = 2
        .Necesario = True
        .TabIndex = 3
        .TabStop = True
        .Visible = True  
    End With ' cboIdEstado

    Set txtEstado = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtEstado", GForm.Controls("PnlMain"))
    With txtEstado   
        .AplicaEstilo   
        .Enabled = False 
        .Formato = "Mayusculas y Minusculas" 
        .Move 2260, cboIdEstado.Top, 4740, 300
        .Necesario = False
        .TipoDato =  "String"
        .Visible = True 
    End With ' txtEstado

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
        .CaptionWidth = 700
        '.Coleccion = "Clientes"
        '.ColeccionWhere = "WHERE IdCliente=@cboIdCliente"
        .Descripcion = "Select IdCliente, Cliente, NIF From VCOMBO_CLIENTES Order By IdCliente"
        .Enabled = True
        .Formato = "Mayusculas y Minusculas"
        .ObjOrigen = "EObjeto"
        .ObjPOrigen = "IdCliente"
        .Move 210, 930, 2000, 300 
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

    Set cboIdDireccionEnvio = GForm.Controls.Add("AhoraOCX.ComboUsuario", "cboIdDireccionEnvio", GForm.Controls("PnlMain"))
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
        .CaptionWidth = 700
        .Descripcion = "Select CodigoAlt, Direccion From VPERS_Contactos"
        .Enabled = True
        .Formato = "Sin decimales"
        .ObjOrigen = "EObjeto"
        .ObjPOrigen = "DireccionEnvio"
        .Move 210, 1275, 2000, 300 
        .NColumnas = 3
        .Necesario = True
        .TabIndex = 4
        .TabStop = True
        .TipoDato =  "Numeric"
        .Visible = True  
    End With ' cboIdDireccionEnvio

    Set txtDireccionEnvio = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtDireccionEnvio", GForm.Controls("PnlMain"))
    With txtDireccionEnvio
        .AplicaEstilo      
        .Enabled = False 
        .Formato = "Mayusculas y Minusculas" 
        .Move 2260, cboIdDireccionEnvio.Top, 4740, 300 
        .Necesario = False
        .TipoDato =  "String"
        .Visible = True 
    End With ' txtDireccionEnvio

    Set txtIdPedido = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtIdPedido", GForm.Controls("PnlMain"))
    With txtIdPedido
        .AplicaEstilo
        .CaptionControl = "Pedido" 
        .CaptionVisible = True      
        .CaptionWidth = 700   
        .Enabled = True 
        .Formato = "Mayusculas y Minusculas"
        .ObjOrigen = "EObjeto"
        .ObjPOrigen = "IdPedidoCliente"
        .Move 210, 1620, 6790, 300 
        .Necesario = False
        .TabIndex = 5
        .TabStop = True
        .TipoDato =  "String"
        .Visible = True 
    End With ' txtIdPedido

    Set txtIdPedidoFinal = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtIdPedidoFinal", GForm.Controls("PnlMain"))
    With txtIdPedidoFinal
        .AplicaEstilo
        .CaptionControl = "P. Final" 
        .CaptionVisible = True      
        .CaptionWidth = 700   
        .Enabled = True 
        .Formato = "Mayusculas y Minusculas"
        .ObjOrigen = "EObjeto"
        .ObjPOrigen = "IdPedidoClienteFinal"
        .Move 210, 1965, 6790, 300 
        .Necesario = False
        .TabIndex = 6
        .TabStop = True
        .TipoDato =  "String"
        .Visible = True 
    End With ' txtIdPedidoFinal

    Set txtObservaciones = GForm.Controls.Add("AhoraOCX.TextoMultilinea", "txtObservaciones", GForm.Controls("PnlObservaciones"))
    With txtObservaciones
        .AplicaEstilo
        .Formato = "Mayusculas y Minusculas" 
        .ObjOrigen = "EObjeto" 
        .ObjPOrigen = "Observaciones" 
        .Move 0, 0, lPersTab.Width - 100, lPersTab.Height
        .Necesario = False
        .TabIndex = 7
        .TabStop = True
        .TipoDato =  "String" 
        .Visible = True
    End With ' txtObservaciones
  
    Set GrdTrabajoLineas = gForm.Controls.Add("AhoraOCX.cntGridUsuario", "GrdTrabajoLineas", GForm.Controls("PnlMain"))
    With GrdTrabajoLineas
        .Visible = True
        .AplicaEstilo
        .Agregar = True
        .Editar = True
        .Enabled = True
        .Eliminar = True
        .AgregaColumna "IdTrabajo", 0, "Código"
        .AgregaColumna "IdLinea", 600, "Línea"
        .AgregaColumna "RefTrabajoCliente", 1200, "Ref. Trabajo"
        .AgregaColumna "IdArticulo", 2900, "Trabajo", False, "SELECT IdArticulo, Descrip FROM Articulos WHERE IdFamilia = 1", False, "", False, "SELECT IdArticulo, Descrip FROM Articulos"        
        .AgregaColumna "IdCalidad", 2200, "Calidad", False, "SELECT IdCalidad, Descrip FROM PERS_Tipos_Calidad_Papel", False, "", False, "SELECT IdCalidad, Descrip FROM PERS_Tipos_Calidad_Papel"
        .AgregaColumna "Ancho", 1000, "Ancho (cm)", False, "", False, "#,##0.00"
        .AgregaColumna "Largo", 1000, "Largo (cm)", False, "", False, "#,##0.00"
        .AgregaColumna "Gramaje", 1350, "Gramaje (Gr/m2)", False, "", False, "#,##0.00"
        .AgregaColumna "IdArticuloPrecio", 2000, "Art. Palet", False, "SELECT IdArticulo, Descrip FROM Articulos WHERE IdFamilia = 2", False, "", False, "SELECT IdArticulo, Descrip FROM Articulos"
        .AgregaColumna "IdEstado", 1200, "Estado", False, "SELECT IdEstado, Descrip FROM PERS_Trabajos_Estados", False, "", False, "SELECT IdEstado, Descrip FROM PERS_Trabajos_Estados"
        .AgregaColumna "Facturada", 850, "Facturado"
        .Campo("IdLinea").Default = "SELECT ISNULL(MAX(IdLinea), 0) + 1 FROM PERS_Trabajos_Lineas"
        .Campo("IdEstado").Default = "SELECT 1"
        .FROM = "PERS_Trabajos_Lineas"
        .MenuItemAdd "Ver", "botGridVer", 1
        .MenuItemAdd "Bobinas", "botVerBobinas", 0, "botGridVer"
        .MenuItemAdd "Costes de palet", "botVerCostesEnvio", 0, "botGridVer"
        .WHERE = "WHERE 1 = 0"
        .Refresca = True
        .Move 210, 2545, 15000, 1850 
        .ActivarScripts = True
    End With

    Set GrdLineasCorte = gForm.Controls.Add("AhoraOCX.cntGridUsuario", "GrdLineasCorte", GForm.Controls("PnlMain"))
    With GrdLineasCorte
        .ActivarScripts = True
        .AplicaEstilo
        .Agregar = True
        .Editar = True
        .Enabled = True
        .Eliminar = True
        .AgregaColumna "IdTrabajo", 0, "IdTrabajo", False
        .AgregaColumna "IdLinea", 0, "Línea", False
        .AgregaColumna "IdLineaCorte", 0, "Código", False
        .AgregaColumna "Fecha", 1500, "Fecha", False, "", False, "dd/mm/yyyy"
        .AgregaColumna "Palets", 1500, "Palets", False, "", False, "#,##0.00"
        .AgregaColumna "ResmasPorPalet", 1500, "Resmas/Palet", False, "", False, "#,##0.00"
        .AgregaColumna "PaletsPendientes", 1500, "Palets pendientes", True, "", False, "#,##0.00"
        .AgregaColumna "PaletsEnviados", 1500, "Palets enviados", True, "", False, "#,##0.00"
        .FROM = "PERS_Trabajos_Lineas_Corte"
        .WHERE = "WHERE 1 = 0"
        .Move 210, 4600, 15000, 1850 
        .Refresca = True
        .Visible = True
    End With

    Set txtPesoResma = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtPesoResma", GForm.Controls("PnlMain"))
    With txtPesoResma 
        .AplicaEstilo  
        .CaptionControl = "Peso resma" 
        .CaptionVisible = True      
        .CaptionWidth = 1000 
        .Enabled = False 
        .Formato = "Con 2 decimales" 
        .Move 210, 6600, 1500, 600
        .TipoDato =  "Numeric"
        .Visible = True 
        .CaptionPosition = 1
        .backColor = vbWhite
    End With ' txtPesoResma

    Set txtKilosTeoricos = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtKilosTeoricos", GForm.Controls("PnlMain"))
    With txtKilosTeoricos 
        .AplicaEstilo  
        .CaptionControl = "Kg teóricos" 
        .CaptionVisible = True      
        .CaptionWidth = 1000  
        .Enabled = False 
        .Formato = "Con 2 decimales" 
        .Move 1710, 6600, 1500, 600
        .TipoDato =  "Numeric"
        .Visible = True 
        .CaptionPosition = 1
        .backColor = vbWhite
    End With ' txtKilosTeoricos

    Set txtMerma = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtMerma", GForm.Controls("PnlMain"))
    With txtMerma 
        .AplicaEstilo  
        .CaptionControl = "Merma" 
        .CaptionVisible = True      
        .CaptionWidth = 800  
        .Enabled = False 
        .Formato = "Con 2 decimales" 
        .Move 3210, 6600, 1500, 600
        .TipoDato =  "Numeric"
        .Visible = True 
        .CaptionPosition = 1
        .backColor = vbWhite
    End With ' txtMerma

    Set txtPorcentajeMerma = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtPorcentajeMerma", GForm.Controls("PnlMain"))
    With txtPorcentajeMerma 
        .AplicaEstilo  
        .CaptionControl = "%Merma" 
        .CaptionVisible = True      
        .CaptionWidth = 900  
        .Enabled = False 
        .Formato = "Con 2 decimales" 
        .Move 4710, 6600, 1500, 600
        .TipoDato =  "Numeric"
        .Visible = True 
        .CaptionPosition = 1
        .backColor = vbWhite
    End With ' txtPorcentajeMerma

    Set txtBobinasUsadas = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtBobinasUsadas", GForm.Controls("PnlMain"))
    With txtBobinasUsadas 
        .AplicaEstilo  
        .CaptionControl = "Bobinas" 
        .CaptionVisible = True      
        .CaptionWidth = 1000  
        .Enabled = False 
        .Formato = "Sin decimales" 
        .Move 6210, 6600, 1500, 600
        .TipoDato =  "Numeric"
        .Visible = True 
        .CaptionPosition = 1
        .backColor = vbWhite
    End With ' txtBobinasUsadas

    Set txtTotalPalets = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtTotalPalets", GForm.Controls("PnlMain"))
    With txtTotalPalets 
        .AplicaEstilo  
        .CaptionControl = "Pallets" 
        .CaptionVisible = True      
        .CaptionWidth = 1000  
        .Enabled = False 
        .Formato = "Con 2 decimales" 
        .Move 7710, 6600, 1500, 600
        .TipoDato =  "Numeric"
        .Visible = True 
        .CaptionPosition = 1
        .backColor = vbWhite
    End With ' txtTotalPalets

    Set txtTotalResmas = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtTotalResmas", GForm.Controls("PnlMain"))
    With txtTotalResmas 
        .AplicaEstilo  
        .CaptionControl = "Resmas" 
        .CaptionVisible = True      
        .CaptionWidth = 1000  
        .Enabled = False 
        .Formato = "Con 2 decimales" 
        .Move 9210, 6600, 1500, 600
        .TipoDato =  "Numeric"
        .Visible = True
        .CaptionPosition = 1
        .backColor = vbWhite 
    End With ' txtTotalResmas

    Set txtTotalPaletsPendientes = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtTotalPaletsPendientes", GForm.Controls("PnlMain"))
    With txtTotalPaletsPendientes 
        .AplicaEstilo  
        .CaptionControl = "Pallets pendientes" 
        .CaptionVisible = True      
        .CaptionWidth = 1000  
        .Enabled = False 
        .Formato = "Con 2 decimales" 
        .Move 10710, 6600, 1500, 600
        .TipoDato =  "Numeric"
        .Visible = True 
        .CaptionPosition = 1
        .backColor = vbWhite 
    End With ' txtTotalPaletsPendientes

    Set txtTotalPaletsEnviados = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtTotalPaletsEnviados", GForm.Controls("PnlMain"))
    With txtTotalPaletsEnviados 
        .AplicaEstilo  
        .CaptionControl = "Pallets enviados" 
        .CaptionVisible = True      
        .CaptionWidth = 1000  
        .Enabled = False 
        .Formato = "Con 2 decimales" 
        .Move 12810, 6600, 1500, 600
        .TipoDato =  "Numeric"
        .Visible = True 
        .CaptionPosition = 1
        .backColor = vbWhite 
    End With ' txtTotalPaletsEnviados

    Set txtPrecioTrabajo = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtPrecioTrabajo", GForm.Controls("PnlMain"))
    With txtPrecioTrabajo 
        .AplicaEstilo  
        .CaptionControl = "Precio Trabajo" 
        .CaptionVisible = True      
        .CaptionWidth = 1000  
        .Enabled = False 
        .Formato = "Con 2 decimales" 
        .Move 210, 7200, 1500, 600
        .TipoDato =  "Numeric"
        .Visible = True 
        .CaptionPosition = 1
        .backColor = vbWhite 
    End With ' txtPrecioTrabajo

    Set txtKilosCortados = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtKilosCortados", GForm.Controls("PnlMain"))
    With txtKilosCortados 
        .AplicaEstilo  
        .CaptionControl = "Kg cortados" 
        .CaptionVisible = True      
        .CaptionWidth = 1000  
        .Enabled = False 
        .Formato = "Con 2 decimales" 
        .Move 1710, 7200, 1500, 600
        .TipoDato =  "Numeric"
        .Visible = True 
        .CaptionPosition = 1
        .backColor = vbWhite 
    End With ' txtKilosCortados

End Sub ' Initialize

Sub CargaObjeto()

    If GForm.EObjeto.ObjGlobal.Nuevo Then  
        ' Inicializacion del estado de un trabajo nuevo
        GForm.Controls("txtIdTrabajo").Text = GCN.DameValorCampo ("SELECT ISNULL(MAX(IdTrabajo), 0) + 1 AS NuevoCodigoTrabajo FROM Pers_Trabajos", "NuevoCodigoTrabajo")
        GForm.Controls("txtFecha").Text = CStr(Now())
        GForm.Controls("cboIdEstado").Value = 1   
        GForm.Controls("GrdTrabajoLineas").Enabled = False     
        GForm.Controls("GrdLineasCorte").Enabled = False
    Else
        ' Filtro e inicializacion del grid de las lineas de trabajo
        GForm.Controls("GrdTrabajoLineas").Enabled = True
        GForm.Controls("GrdTrabajoLineas").WHERE = "WHERE IdTrabajo = " & CInt(GForm.Controls("txtIdTrabajo").Text)
        GForm.Controls("GrdTrabajoLineas").Campo("IdTrabajo").Default = "SELECT IdTrabajo FROM Pers_Trabajos WHERE IdTrabajo = " & CInt(GForm.Controls("txtIdTrabajo").Text)
        GForm.Controls("GrdTrabajoLineas").Refrescar
        
        ' Filtro e inicializacion del grid de las lineas de corte 
        GForm.Controls("GrdLineasCorte").Where = "WHERE IdTrabajo = " & CInt(GForm.Controls("txtIdTrabajo").Text) & " AND IdLinea = " & CInt(GForm.Controls("GrdTrabajoLineas").GetValue("IdLinea"))
        GForm.Controls("GrdLineasCorte").Campo("IdTrabajo").Default = "SELECT IdTrabajo FROM Pers_Trabajos WHERE IdTrabajo = " & CInt(GForm.Controls("txtIdTrabajo").Text)
        GForm.Controls("GrdLineasCorte").Campo("Fecha").Default = "SELECT GETDATE()"
        GForm.Controls("GrdLineasCorte").Refrescar
    End If

    ' Establecer el texto en los combos
    SetComboText "cboIdCliente", "txtCliente", "SELECT Cliente FROM Clientes_Datos WHERE IdCliente = ", True
    SetComboText "cboIdEstado", "txtEstado", "SELECT Descrip FROM PERS_Trabajos_Estados WHERE IdEstado = ", False
    SetComboText "cboIdDireccionEnvio", "txtDireccionEnvio", "SELECT Direccion FROM VPers_Contactos WHERE CodigoAlt = ", True
End Sub ' CargaObjeto

Sub Combo_AfterUpdate(aCombo)     
    If aCombo.Name = "cboIdCliente" Then 
        SetComboText "cboIdCliente", "txtCliente", "SELECT Cliente FROM Clientes_Datos WHERE IdCliente = ", True
    ElseIf  aCombo.Name = "cboIdEstado" Then
        SetComboText "cboIdEstado", "txtEstado", "SELECT Descrip FROM PERS_Trabajos_Estados WHERE IdEstado = ", False
    ElseIf  aCombo.Name = "cboIdDireccionEnvio" Then
        SetComboText "cboIdDireccionEnvio", "txtDireccionEnvio", "SELECT Direccion FROM VPers_Contactos WHERE CodigoAlt = ", True
    End If
End Sub ' Combo_AfterUpdate

Sub Botonera_AfterExecute(aBotonera, aBoton)
    Dim idTrabajo, idLinea

    If aBoton.Name = "botGuardar" Then
        ' Al guardar, inicializa el grid de lineas de trabajo para poder meter lineas
        GForm.Controls("GrdTrabajoLineas").Enabled = True
        GForm.Controls("GrdTrabajoLineas").Campo("IdTrabajo").Default = "SELECT IdTrabajo FROM Pers_Trabajos WHERE IdTrabajo = " & CInt(GForm.Controls("txtIdTrabajo").Text)
        GForm.Controls("GrdTrabajoLineas").Campo("IdLinea").Default = "SELECT ISNULL(MAX(IdLinea), 0) + 1 FROM PERS_Trabajos_Lineas  WHERE IdTrabajo = " & CInt(GForm.Controls("txtIdTrabajo").Text)
        GForm.Controls("GrdTrabajoLineas").WHERE = "WHERE IdTrabajo = " & CInt(GForm.Controls("txtIdTrabajo").Text)
    
        ' Al guardar, inicializa el grid de lineas de corte para poder meter lineas
        GForm.Controls("GrdLineasCorte").Enabled = True
        GForm.Controls("GrdLineasCorte").Campo("IdTrabajo").Default = "SELECT IdTrabajo FROM Pers_Trabajos WHERE IdTrabajo = " & CInt(GForm.Controls("txtIdTrabajo").Text)
        GForm.Controls("GrdLineasCorte").Campo("Fecha").Default = "SELECT GETDATE()"

    ElseIf aBoton.Name = "botImprimirEtiquetas" Then
        idTrabajo = GForm.Controls("GrdTrabajoLineas").GetValue("IdTrabajo")
        idLinea = GForm.Controls("GrdTrabajoLineas").GetValue("IdLinea")

        If idTrabajo <> "" And idLinea <> "" Then
            Set lFrmGen =  GCN.AhoraProceso("AhoraScripts.DameFrmGenerico", False)
            lFrmGen.Tag = CStr(idTrabajo) & "," & CStr(idLinea)
            lFrmGen.Carga "Frm_Etiquetas", GForm, True
        Else
            GCN.Obj.ShowMsgBox("No ha seleccionado ninguna línea de trabajo")
        End If
    ElseIf aBoton.Name = "botNuevo" Then
        ' Establecer el texto en los combos
        SetComboText "cboIdCliente", "txtCliente", "SELECT Cliente FROM Clientes_Datos WHERE IdCliente = ", True
        SetComboText "cboIdEstado", "txtEstado", "SELECT Descrip FROM PERS_Trabajos_Estados WHERE IdEstado = ", False
        SetComboText "cboIdDireccionEnvio", "txtDireccionEnvio", "SELECT Direccion FROM VPers_Contactos WHERE CodigoAlt = ", True
        GForm.Controls("GrdTrabajoLineas").Where = "WHERE 1 = 0"
        GForm.Controls("GrdLineasCorte").Where = "WHERE 1 = 0"
        GForm.Controls("GrdTrabajoLineas").Enabled = False
        GForm.Controls("GrdLineasCorte").Enabled = False
        GForm.Controls("GrdTrabajoLineas").Refrescar
        GForm.Controls("GrdLineasCorte").Refrescar
        VaciarCamposResumen()
    End If
End Sub ' Botonera_AfterExecute

Sub Menu_AfterExecute(aMenu, aMenuItem)
    Dim idTrabajo, idLinea

    If aMenuItem.Name = "mnuTiposTrabajo" Then
        Set lFrm = gcn.AhoraProceso("NewfrmMantenimiento", False, GCN)
        lFrm.Form.NombreForm = "Frm_Estados_de_trabajo"

        With lFrm.Grid("Mantenimiento")
            If Not .Preparada Then
                .Agregar = True
                .Editar = True
                .Eliminar = True
                .CargaObjetos = False
                .EditarPorObjeto = False
                .AgregaColumna "IdEstado", 800, "Código"
                .AgregaColumna "Descrip", 2600, "Descripción"
                .ColumnaEscalada = "Descrip"
                .From = "PERS_Trabajos_Estados"
            End If
            .Refresca = True  
        End With
        
        lFrm.form.Width = 10000
        lFrm.Form.Caption = "Estados de trabajo"
        lFrm.Carga, False, 4 
    End If
End Sub ' Menu_AfterExecute

Sub Grid_MenuAfterExecute(aGrid,aMenuItem)
    Dim idTrabajo, idLinea, RefTrabajoCli

    idTrabajo = GForm.Controls("GrdTrabajoLineas").GetValue("IdTrabajo")
    idLinea = GForm.Controls("GrdTrabajoLineas").GetValue("IdLinea")

    If aMenuItem.Name = "botVerBobinas" Then
        RefTrabajoCli = GForm.Controls("GrdTrabajoLineas").GetValue("RefTrabajoCliente")

        If idTrabajo <> "" And idLinea <> "" Then
            Set lFrmGen =  GCN.AhoraProceso("AhoraScripts.DameFrmGenerico", False)
            lFrmGen.Tag = CStr(idTrabajo) & "," & CStr(idLinea) & "," & CStr(RefTrabajoCli)
            lFrmGen.Carga "Frm_Trabajos_Lineas_Bobinas", GForm, True
            MostrarDatosResumen()
        Else
            GCN.Obj.ShowMsgBox("No ha seleccionado ninguna línea de trabajo")
        End If
    ElseIf aMenuItem.Name = "botVerCostesEnvio" Then
        If idTrabajo <> "" And idLinea <> "" Then
            Set lFrmGen =  GCN.AhoraProceso("AhoraScripts.DameFrmGenerico", False)
            lFrmGen.Tag = CStr(idTrabajo) & "," & CStr(idLinea)
            lFrmGen.Carga "Frm_CostesEnvio", GForm, True
        Else
            GCN.Obj.ShowMsgBox("No ha seleccionado ninguna línea de trabajo")
        End If
    End If
End Sub

Sub Grid_DblClick(aGrid)
    Dim columna, idArticulo
    columna = aGrid.CampoActual

    If columna = "IdArticulo"  Then
        idArticulo = aGrid.GetValue("IdArticulo")
        Set lObj = GCN.Obj.DameObjeto("Articulos", "Where IdArticulo='" & CStr(idArticulo)& "'")
        lObj.Show, True
    ElseIf columna = "IdArticuloPrecio" Then
        idArticulo = aGrid.GetValue("IdArticuloPrecio")
        Set lObj = GCN.Obj.DameObjeto("Articulos", "Where IdArticulo='" & CStr(idArticulo) & "'")
        lObj.Show, True
    End If
End Sub ' Grid_DblClick

Sub Grid_RowColChange(aGrid, LastRow, LastCol)
    If aGrid.Name = "GrdTrabajoLineas" Then
        GForm.Controls("GrdLineasCorte").Where = "WHERE IdTrabajo = " & CInt(GForm.Controls("txtIdTrabajo").Text) & " AND IdLinea = " & CInt(aGrid.GetValue("IdLinea")) 
        GForm.Controls("GrdLineasCorte").Campo("IdLinea").Default = "SELECT IdLinea FROM PERS_Trabajos_Lineas WHERE IdTrabajo = " & CInt(GForm.Controls("txtIdTrabajo").Text) & " AND IdLinea = " & CInt(aGrid.GetValue("IdLinea"))
        GForm.Controls("GrdLineasCorte").Campo("IdLineaCorte").Default = "SELECT ISNULL(MAX(IdLineaCorte), 0) + 1 FROM PERS_Trabajos_Lineas_Corte WHERE IdTrabajo = " & CInt(GForm.Controls("txtIdTrabajo").Text) & " AND IdLinea = " & CInt(aGrid.GetValue("IdLinea"))
        GForm.Controls("GrdLineasCorte").Refrescar

        MostrarDatosResumen()
    End If
End Sub ' Grid_RowColChange

Sub Grid_AfterUpdate(aGrid)
    If aGrid.Name = "GrdLineasCorte" Then
        MostrarDatosResumen()
        GForm.Controls("GrdTrabajoLineas").Refrescar
    End If
End Sub ' Grid_AfterUpdate

Sub VaciarCamposResumen()
    GForm.Controls("txtPesoResma").Text = ""
    GForm.Controls("txtKilosTeoricos").Text = ""
    GForm.Controls("txtKilosCortados").Text = ""
    GForm.Controls("txtMerma").Text =""
    GForm.Controls("txtPorcentajeMerma").Text = ""
    GForm.Controls("txtBobinasUsadas").Text = ""
    GForm.Controls("txtTotalPalets").Text = ""
    GForm.Controls("txtTotalResmas").Text = ""
    GForm.Controls("txtTotalPaletsEnviados").Text = ""
    GForm.Controls("txtTotalPaletsPendientes").Text = ""
    GForm.Controls("txtPrecioTrabajo").Text = ""
End Sub ' VaciarCamposResumen

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

Sub MostrarDatosResumen() 
    idTrabajo = GForm.Controls("GrdTrabajoLineas").GetValue("IdTrabajo")
    idLinea = GForm.Controls("GrdTrabajoLineas").GetValue("IdLinea")

    If idTrabajo <> "" And idLinea <> "" Then
        Dim lSQL
        lSQL = "SELECT TOP 1 * FROM VPers_Trabajos_Lineas_Resumen WHERE IdTrabajo = " & idTrabajo & " AND IdLinea = " & idLinea 
        Set lResult = gcn.OpenResultSet(lSQL, 2, 3)

        If lResult.Eof = False Then
            GForm.Controls("txtPesoResma").Text = lResult("PesoResma")
            GForm.Controls("txtKilosTeoricos").Text = lResult("KilosTeoricos")
            GForm.Controls("txtKilosCortados").Text = lResult("KilosCortados")
            GForm.Controls("txtMerma").Text = lResult("Merma")
            GForm.Controls("txtPorcentajeMerma").Text = lResult("PorcentajeMerma")
            GForm.Controls("txtBobinasUsadas").Text = lResult("Bobinas_Utilizadas")
            GForm.Controls("txtTotalPalets").Text = lResult("Total_Palets")
            GForm.Controls("txtTotalResmas").Text = lResult("Total_Resmas")
            GForm.Controls("txtTotalPaletsEnviados").Text = lResult("Total_PaletsEnviados")
            GForm.Controls("txtTotalPaletsPendientes").Text = lResult("Total_PaletsPendientes")
            GForm.Controls("txtPrecioTrabajo").Text = lResult("PrecioTrabajo")
        Else
            VaciarCamposResumen()
        End If
    Else
        VaciarCamposResumen()
    End If
End Sub ' MostrarDatosResumen