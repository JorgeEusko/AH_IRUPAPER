'  GCN.AhoraProceso "AhoraScripts.AbrirFrmGenerico", False, "FrmGenerarFacturas", GCN.Sesion.MainForm, False
Sub Initialize()

    ' Etiqueta superior
    GForm.Caption = "Generación de facturas"

    ' Tamaño del formulario
    GForm.Move GForm.Left, GForm.Top + 500, GForm.Width + 4000, GForm.Height

    With GForm.Botonera
        .ActivarScripts = True
        .BotonesMantenimiento = 4
        .BotonAdd "Generar", "btnGenerar", "", 0, False, 123
        .Boton("botGuardar").Visible = False
        .Boton("botNuevo").Visible = False
        .Boton("botEliminar").Visible = False
        .Boton("botImprimir").Visible = False
        .SeguridadObjeto = 0
    End With ' Botonera

    Set cboIdCliente = GForm.Controls.Add("AhoraOCX.ComboUsuario", "cboIdCliente", GForm.Controls("PanMain"))
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
        .Move 210, 200, 2000, 300 
        .NColumnas = 3
        .Necesario = True
        .TabIndex = 1
        .TabStop = True
        .TipoDato =  "String"
        .Visible = True  
    End With ' cboIdCliente

    Set txtCliente = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtCliente", GForm.Controls("PanMain"))
    With txtCliente
        .AplicaEstilo      
        .Enabled = False 
        .Formato = "Mayusculas y Minusculas" 
        .Move 2260, cboIdCliente.Top, 4740, 300 
        .Necesario = False
        .TipoDato =  "String"
        .Visible = True 
    End With ' txtCliente

    Set txtFechaDesde = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtFechaDesde", GForm.Controls("PanMain"))
    With txtFechaDesde
        .AplicaEstilo 
        .CaptionControl = "Fecha desde"     
        .CaptionVisible = True
        .CaptionWidth = 1150
        .Enabled = True 
        .Formato = "Fecha Corta" 
        .Move 210, 585, 2200, 300 
        .Necesario = False
        .TipoDato =  "Date"
        .Visible = True 
    End With ' txtFechaDesde
    
    Set txtFechaHasta = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtFechaHasta", GForm.Controls("PanMain"))
    With txtFechaHasta
        .AplicaEstilo 
        .CaptionControl = "hasta"     
        .CaptionVisible = True
        .CaptionWidth = 650
        .Enabled = True 
        .Formato = "Fecha Corta" 
        .Move 2500, 585, 1700, 300 
        .Necesario = False
        .TipoDato =  "Date"
        .Visible = True 
    End With ' txtFechaHasta

    Set cntFiltro = GForm.Controls.Add("AhoraOCX.cntBotonera", "cntFiltro", GForm.Controls("PanMain"))
    With cntFiltro
        .ActivarScripts = True
        .BotonAdd "Filtrar", "btnFiltrar", "", 0, False, 123
        .HabilitaBotones
        .Move 6000, 585, 1000, 300
        .SeguridadObjeto = True
        .Visible = True
    End With ' cntFiltro

    Set GrdGenerarFacturasLineas = gForm.Controls.Add("AhoraOCX.cntGridUsuario", "GrdGenerarFacturasLineas", GForm.Controls("PanMain"))
    With GrdGenerarFacturasLineas
        .Visible = True
        .AplicaEstilo
        .Agregar = False
        .CargaObjetos = False
        .Editar = True
        .EditarPorObjeto = False
        .Enabled = True
        .Eliminar = False
        .AgregaColumna "IdEnvio", 0, "Código"
        .AgregaColumna "IdEnvioLinea", 600, "Línea", True
        .AgregaColumna "RefTrabajoCliente", 1400, "Ref. Trabajo", True
        .AgregaColumna "IdPedidoCliente", 1400, "Su pedido", True
        .AgregaColumna "Fecha", 1000, "Fecha", True
        .AgregaColumna "IdArticulo", 2500, "Trabajo", True, "SELECT IdArticulo, Descrip FROM Articulos WHERE IdFamilia = 1", False, "", False, "SELECT IdArticulo, Descrip FROM Articulos"        
        .AgregaColumna "KilosCortados", 1000, "Kilos", True, "", False, "#,##0.00"
        .AgregaColumna "TotalPalets", 1200, "Palets", True, "", False, "#,##0.00"
        .AgregaColumna "TotalResmas", 1200, "Resmas", True, "", False, "#,##0.00"
        .AgregaColumna "TotalPaletsEnviados", 1200, "Palets Enviados", True, "", False, "#,##0.00"
        .AgregaColumna "Precio", 1200, "Precio/Tn.", True, "", False, "#,##0.00"
        '.AgregaColumna "FechaPrimerEnvio", 1200, "F. Primer Envio", True
        .AgregaColumna "Marcar", 1100, "Marcar", False
        .FROM = "PERS_TEMP_Generar_Facturas"
        .WHERE = "WHERE 1 = 0"
        .Move 210, 1100, 14300, 3900 
        .ActivarScripts = True
        .Refresca = True
    End With

End Sub ' Initialize

Sub Combo_AfterUpdate(aCombo)     
    If aCombo.Name = "cboIdCliente" Then 
        SetComboTextString "cboIdCliente", "txtCliente", "SELECT Cliente FROM Clientes_Datos WHERE IdCliente = '"
    End If
End Sub ' Combo_AfterUpdate

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

Sub Botonera_AfterExecute(aBotonera, aBoton)
    
    If aBoton.Name = "btnFiltrar" Then
        Dim idCliente, fechaDesde, fechaHasta, textoWhere 
        idCliente = GForm.Controls("cboIdCliente").Value
        fechaDesde = GForm.Controls("txtFechaDesde").Text
        fechaHasta = GForm.Controls("txtFechaHasta").Text

        ' Filtra el valor del cliente
        If Len(idCliente) > 0 Then
            textoWhere = "WHERE IdCliente = '" & idCliente & "' "
        End If

        ' Filtra el valor de fecha de inicio
        If Len(fechaDesde) > 0 And Len(textoWhere) > 0 Then
            textoWhere = textoWhere & " AND Fecha >= '" & fechaDesde & "' "
        ElseIf Len(fechaDesde) > 0 Then
            textoWhere = "WHERE Fecha >= '" & fechaDesde &"' "
        End If
        
        ' Filtra el valor de fecha de fin
        If Len(fechaHasta) > 0 And Len(textoWhere) > 0 Then
            textoWhere = textoWhere & " AND Fecha <= '" & fechaHasta & "' "
        ElseIf Len(fechaHasta) > 0 Then
            textoWhere = "WHERE Fecha >= '" & fechaHasta & "' "
        End If

        ' Aplica el filtro
        If Len(textoWhere) > 0 Then
            GForm.Controls("GrdGenerarFacturasLineas").Where = textoWhere
            GForm.Controls("GrdGenerarFacturasLineas").Refrescar
        End If
        
    ElseIf aBoton.Name = "btnGenerar" Then
        Set params = gcn.DameNewCollection
        If GCN.EjecutaStoreCol("PPERS_Generar_Envios_Pedidos_I", params) Then
            GCN.Obj.ShowMsgBox("Pedidos generados con exito.")
        Else
            GCN.Obj.ShowMsgBox("Ha ocurrido un error al crear los pedidos.")
        End If
    End If

End Sub ' Botonera_AfterExecute