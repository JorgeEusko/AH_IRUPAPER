Sub Initialize()

    GForm.Botonera.ActivarScripts = True
    
    ' Etiqueta superior
    GForm.Caption = "Trabajo"

    ' Tamaño del formulario
    GForm.Move GForm.Left - 2500, GForm.Top + 500, GForm.Width + 8000, GForm.Height

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
        .C1Nombre = "IdContacto" 
        .C1TipoDato = 8
        .C2Anchura = 3570
        .C2Nombre = "Direccion"
        .C2TipoDato = 8
        .CaptionLink = True
        .CaptionVisible = True
        .CaptionWidth = 700
        .Descripcion = "Select IdContacto, Direccion, Nombre From Clientes_Contactos"
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
        .ActivarScripts = True
        .Visible = True
        .AplicaEstilo
        .Agregar = True
        .Editar = True
        .Enabled = True
        .Eliminar = True
        .AgregaColumna "IdTrabajo", 0, "Código"
        .AgregaColumna "IdLinea", 600, "Línea"
        .AgregaColumna "RefTrabajoCliente", 1200, "Ref. Trabajo"
        .AgregaColumna "IdArticulo", 2900, "Trabajo", False, "SELECT IdArticulo, Descrip FROM Articulos", False, "", False, "SELECT IdArticulo, Descrip FROM Articulos"        
        .AgregaColumna "IdCalidad", 2200, "Calidad", False, "SELECT IdCalidad, Descrip FROM PERS_Tipos_Calidad_Papel", False, "", False, "SELECT IdCalidad, Descrip FROM PERS_Tipos_Calidad_Papel"
        .AgregaColumna "Ancho", 1000, "Ancho (cm)", False, "", False, "#,##0.00"
        .AgregaColumna "Largo", 1000, "Largo (cm)", False, "", False, "#,##0.00"
        .AgregaColumna "Gramaje", 1350, "Gramaje (Gr/m2)", False, "", False, "#,##0.00"
        .AgregaColumna "IdArticuloPrecio", 2000, "Art. Palet", False, "SELECT IdArticulo, Descrip FROM Articulos", False, "", False, "SELECT IdArticulo, Descrip FROM Articulos"
        .AgregaColumna "IdEstado", 1200, "Estado", False, "SELECT IdEstado, Descrip FROM PERS_Trabajos_Estados", False, "", False, "SELECT IdEstado, Descrip FROM PERS_Trabajos_Estados"
        .AgregaColumna "Facturada", 850, "Facturado"
        .Campo("IdLinea").Default = "SELECT ISNULL(MAX(IdLinea), 0) + 1 FROM PERS_Trabajos_Lineas"
        .Campo("IdEstado").Default = "SELECT 1"
        .FROM = "PERS_Trabajos_Lineas"
        .WHERE = "WHERE 1 = 0"
        .Refresca = True
        .Move 210, 2545, 15000, 3000 
    End With
    
    Set txtPesoResma = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtPesoResma", GForm.Controls("PnlMain"))
    With txtPesoResma 
        .AplicaEstilo  
        .CaptionControl = "Peso resma" 
        .CaptionVisible = True      
        .CaptionWidth = 1000  
        .Enabled = False 
        .Formato = "Con 2 decimales" 
        .Move 210, 5980, 2000, 300
        .TipoDato =  "Numeric"
        .Visible = True 
    End With ' txtPesoResma

    Set txtKilosTeoricos = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtKilosTeoricos", GForm.Controls("PnlMain"))
    With txtKilosTeoricos 
        .AplicaEstilo  
        .CaptionControl = "Kg teoricos" 
        .CaptionVisible = True      
        .CaptionWidth = 1000  
        .Enabled = False 
        .Formato = "Con 2 decimales" 
        .Move 2310, 5980, 2000, 300
        .TipoDato =  "Numeric"
        .Visible = True 
    End With ' txtKilosTeoricos

    Set txtMerma = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtMerma", GForm.Controls("PnlMain"))
    With txtMerma 
        .AplicaEstilo  
        .CaptionControl = "Merma" 
        .CaptionVisible = True      
        .CaptionWidth = 800  
        .Enabled = False 
        .Formato = "Con 2 decimales" 
        .Move 4410 + 200, 5980, 1800, 300
        .TipoDato =  "Numeric"
        .Visible = True 
    End With ' txtMerma

    Set txtPorcentajeMerma = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtPorcentajeMerma", GForm.Controls("PnlMain"))
    With txtPorcentajeMerma 
        .AplicaEstilo  
        .CaptionControl = "%Merma" 
        .CaptionVisible = True      
        .CaptionWidth = 900  
        .Enabled = False 
        .Formato = "Con 2 decimales" 
        .Move 6510 + 100, 5980, 1900, 300
        .TipoDato =  "Numeric"
        .Visible = True 
    End With ' txtPorcentajeMerma

    Set txtBobinasUsadas = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtBobinasUsadas", GForm.Controls("PnlMain"))
    With txtBobinasUsadas 
        .AplicaEstilo  
        .CaptionControl = "Bobinas usadas" 
        .CaptionVisible = True      
        .CaptionWidth = 1000  
        .Enabled = False 
        .Formato = "Sin decimales" 
        .Move 8610, 5980, 2000, 300
        .TipoDato =  "Numeric"
        .Visible = True 
    End With ' txtBobinasUsadas

    Set txtTotalPalets = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtTotalPalets", GForm.Controls("PnlMain"))
    With txtTotalPalets 
        .AplicaEstilo  
        .CaptionControl = "T. Palets" 
        .CaptionVisible = True      
        .CaptionWidth = 1000  
        .Enabled = False 
        .Formato = "Con 2 decimales" 
        .Move 10710, 5980, 2000, 300
        .TipoDato =  "Numeric"
        .Visible = True 
    End With ' txtTotalPalets

    Set txtTotalResmas = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtTotalResmas", GForm.Controls("PnlMain"))
    With txtTotalResmas 
        .AplicaEstilo  
        .CaptionControl = "T. Resmas" 
        .CaptionVisible = True      
        .CaptionWidth = 1000  
        .Enabled = False 
        .Formato = "Con 2 decimales" 
        .Move 12810, 5980, 2000, 300
        .TipoDato =  "Numeric"
        .Visible = True 
    End With ' txtTotalResmas

    Set txtTotalPaletsEnviados = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtTotalPaletsEnviados", GForm.Controls("PnlMain"))
    With txtTotalPaletsEnviados 
        .AplicaEstilo  
        .CaptionControl = "Palets enviados" 
        .CaptionVisible = True      
        .CaptionWidth = 1000  
        .Enabled = False 
        .Formato = "Con 2 decimales" 
        .Move 210, 6325, 2000, 300
        .TipoDato =  "Numeric"
        .Visible = True 
    End With ' txtTotalPaletsEnviados

    Set txtTotalPaletsPendientes = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtTotalPaletsPendientes", GForm.Controls("PnlMain"))
    With txtTotalPaletsPendientes 
        .AplicaEstilo  
        .CaptionControl = "Palets pendientes" 
        .CaptionVisible = True      
        .CaptionWidth = 1000  
        .Enabled = False 
        .Formato = "Con 2 decimales" 
        .Move 2310, 6325, 2000, 300
        .TipoDato =  "Numeric"
        .Visible = True 
    End With ' txtTotalPaletsPendientes

    Set txtKilosCortados = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtKilosCortados", GForm.Controls("PnlMain"))
    With txtKilosCortados 
        .AplicaEstilo  
        .CaptionControl = "Kg cortados" 
        .CaptionVisible = True      
        .CaptionWidth = 1000  
        .Enabled = False 
        .Formato = "Con 2 decimales" 
        .Move 4410, 6325, 2000, 300
        .TipoDato =  "Numeric"
        .Visible = True 
    End With ' txtKilosCortados

End Sub ' Initialize

Sub CargaObjeto()

    If GForm.EObjeto.ObjGlobal.Nuevo Then  
        GForm.Controls("GrdTrabajoLineas").Enabled = False

        GForm.Controls("txtIdTrabajo").Text = GCN.DameValorCampo ("SELECT ISNULL(MAX(IdTrabajo), 0) + 1 AS NuevoCodigoTrabajo FROM Pers_Trabajos", "NuevoCodigoTrabajo")
        GForm.Controls("txtFecha").Text = CStr(Now())
        GForm.Controls("cboIdEstado").Value = 1        
    Else
        GForm.Controls("GrdTrabajoLineas").Enabled = True
        GForm.Controls("GrdTrabajoLineas").WHERE = "WHERE IdTrabajo = " & CInt(GForm.Controls("txtIdTrabajo").Text)
        GForm.Controls("GrdTrabajoLineas").Campo("IdTrabajo").Default = "SELECT IdTrabajo FROM Pers_Trabajos WHERE IdTrabajo = " & CInt(GForm.Controls("txtIdTrabajo").Text)
        GForm.Controls("GrdTrabajoLineas").Refrescar
    End If

    SetComboText "cboIdEstado", "txtEstado", "SELECT Descrip FROM PERS_Trabajos_Estados WHERE IdEstado = "
    SetComboText "cboIdCliente", "txtCliente", "SELECT Cliente FROM Clientes_Datos WHERE IdCliente = "
    SetComboText "cboIdDireccionEnvio", "txtDireccionEnvio", "SELECT Direccion FROM Clientes_Contactos WHERE IdContacto = "

End Sub ' CargaObjeto

Sub Combo_AfterUpdate(aCombo)     
    If aCombo.Name = "cboIdCliente" Then 
        SetComboText "cboIdCliente", "txtCliente", "SELECT Cliente FROM Clientes_Datos WHERE IdCliente = "
    ElseIf  aCombo.Name = "cboIdEstado" Then
        SetComboText "cboIdEstado", "txtEstado", "SELECT Descrip FROM PERS_Trabajos_Estados WHERE IdEstado = "
    ElseIf  aCombo.Name = "cboIdDireccionEnvio" Then
        SetComboText "cboIdDireccionEnvio", "txtDireccionEnvio", "SELECT Direccion FROM Clientes_Contactos WHERE IdContacto = "
    End If
End Sub ' Combo_AfterUpdate

Sub Botonera_AfterExecute(aBotonera, aBoton)
    Dim idTrabajo, idLinea

    If aBoton.Name = "botGuardar" Then
        GForm.Controls("GrdTrabajoLineas").Enabled = True
        GForm.Controls("GrdTrabajoLineas").Campo("IdTrabajo").Default = "SELECT IdTrabajo FROM Pers_Trabajos WHERE IdTrabajo = " & CInt(GForm.Controls("txtIdTrabajo").Text)
        GForm.Controls("GrdTrabajoLineas").Campo("IdLinea").Default = "SELECT ISNULL(MAX(IdLinea), 0) + 1 FROM PERS_Trabajos_Lineas  WHERE IdTrabajo = " & CInt(GForm.Controls("txtIdTrabajo").Text)
        GForm.Controls("GrdTrabajoLineas").WHERE = "WHERE IdTrabajo = " & CInt(GForm.Controls("txtIdTrabajo").Text)
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
    End If
End Sub ' Botonera_AfterExecute

Sub Menu_AfterExecute(aMenu, aMenuItem)
    Dim idTrabajo, idLinea

    If aMenuItem.Name = "mnuTiposTrabajo" Then
        GetMenuMantenimiento "Estados de trabajo","PERS_Trabajos_Estados", "IdEstado", "Descrip"     
    ElseIf aMenuItem.Name = "botVerBobinas" Then
        idTrabajo = GForm.Controls("GrdTrabajoLineas").GetValue("IdTrabajo")
        idLinea = GForm.Controls("GrdTrabajoLineas").GetValue("IdLinea")

        If idTrabajo <> "" And idLinea <> "" Then
            Set lFrm = gcn.AhoraProceso("NewfrmMantenimiento", False, GCN)
            lFrm.Form.NombreForm = "Frm_Bobinas_de_Lineas_de_Trabajo"

            With lFrm.Grid("Bobinas de Lineas de Trabajo")
                If Not .Preparada Then
                    .Agregar = False
                    .Editar = True
                    .Eliminar = False
                    .CargaObjetos = False
                    .EditarPorObjeto = False
                    .AgregaColumna "IdLinea", 600, "Linea", True
                    .AgregaColumna "RefBobina", 1200, "Ref. Bobina", True
                    .AgregaColumna "NumBobina", 800, "Num. Bobina", True
                    .AgregaColumna "Utilizada", 800, "Utilizada", False
                    .From = "PERS_Trabajos_Lineas_Bobinas"
                    .Where = "WHERE IdTrabajo = " & idTrabajo & " AND IdLinea = " & idLinea
                End If
                .Refresca = True  
            End With
            
            lFrm.form.Width = 6000
            lFrm.Form.Caption = "Bobinas de Lineas de Trabajo"
            lFrm.Carga, False, 4
        Else
            GCN.Obj.ShowMsgBox("No ha seleccionado ninguna línea de trabajo")
        End If

    ElseIf aMenuItem.Name = "botVerLineasCorte" Then

        idTrabajo = GForm.Controls("GrdTrabajoLineas").GetValue("IdTrabajo")
        idLinea = GForm.Controls("GrdTrabajoLineas").GetValue("IdLinea")

        If idTrabajo <> "" And idLinea <> "" Then

            Set lFrmGen =  GCN.AhoraProceso("AhoraScripts.DameFrmGenerico", False)
            lFrmGen.Tag = CStr(idTrabajo) & "," & CStr(idLinea)
            lFrmGen.Carga "Frm_LineasCorte", GForm, True

        Else
            GCN.Obj.ShowMsgBox("No ha seleccionado ninguna línea de trabajo")
        End If
    ElseIf aMenuItem.Name = "botVerCostesEnvio" Then

        idTrabajo = GForm.Controls("GrdTrabajoLineas").GetValue("IdTrabajo")
        idLinea = GForm.Controls("GrdTrabajoLineas").GetValue("IdLinea")

        If idTrabajo <> "" And idLinea <> "" Then

            Set lFrmGen =  GCN.AhoraProceso("AhoraScripts.DameFrmGenerico", False)
            lFrmGen.Tag = CStr(idTrabajo) & "," & CStr(idLinea)
            lFrmGen.Carga "Frm_CostesEnvio", GForm, True

        Else
            GCN.Obj.ShowMsgBox("No ha seleccionado ninguna línea de trabajo")
        End If
    End If
End Sub ' Menu_AfterExecute

Sub Grid_RowColChange(aGrid, LastRow, LastCol)
    If aGrid.Name = "GrdTrabajoLineas" Then

        idTrabajo = GForm.Controls("GrdTrabajoLineas").GetValue("IdTrabajo")
        idLinea = GForm.Controls("GrdTrabajoLineas").GetValue("IdLinea")

        If idTrabajo <> "" And idLinea <> "" Then
            Dim lSQL
            lSQL = "SELECT TOP 1 * FROM VPers_Trabajos_Lineas_Resumen WHERE IdTrabajo = " & idTrabajo & " AND IdLinea = " & idLinea
            
            Set lResult = gcn.OpenResultSet(lSQL, 2, 3)

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
        Else
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
        End If

    End If
End Sub ' Grid_RowColChange

' Jorge: Funcion para establecer la descripcion del valor de un combo
Sub SetComboText(comboName, textName, sqlText)
  
  If Len(GForm.Controls(comboName).Value) > 0 Then
    Dim comboValue
    comboValue = GForm.Controls(comboName).Value
    GForm.Controls(textName).Text = GCN.DameValorcampo(sqlText & comboValue)
  Else
    GForm.Controls(textName).Text = ""
  End If

End Sub

' Jorge: Funcion para abrir un formulario de mantenimiento
Sub GetMenuMantenimiento(mnuTitle, tableName, idCol, descripCol)
       
  Set lFrm = gcn.AhoraProceso("NewfrmMantenimiento", False, GCN)
  lFrm.Form.NombreForm = "Frm_" & Replace(mnuTitle, " ", "_")

  With lFrm.Grid("Mantenimiento")
     If Not .Preparada Then
       .Agregar = True
       .Editar = True
       .Eliminar = True
       .CargaObjetos = False
       .EditarPorObjeto = False
       .AgregaColumna idCol, 800, "Código"
       .AgregaColumna descripCol, 2600, "Descripción"
       .ColumnaEscalada = descripCol
       .From = tableName
     End If
    .Refresca = True  
  End With
 
  lFrm.form.Width = 10000
  lFrm.Form.Caption = mnuTitle
  lFrm.Carga, False, 4

End Sub
