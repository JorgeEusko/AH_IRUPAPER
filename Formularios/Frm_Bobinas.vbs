Sub Initialize()

    GForm.Botonera.ActivarScripts = True
    
    ' Etiqueta superior
    GForm.Caption = "Bobina"

    ' Tamaño del formulario
    GForm.Move GForm.Left, GForm.Top + 500, GForm.Width, GForm.Height - 2060

    GForm.Botonera.ActivarScripts = True
    GForm.Botonera.BotonAdd "Ver trabajo", "btnVerTrabajo", , 0, True, 123

    Set PnlDatos = GForm.Controls.Add("AhoraOCX.cntPanel", "PnlDatos", GForm.Controls("PnlMain"))
    With PnlDatos 
        .Estilo = 2
        .Visible = True
    End With
    
    Set PnlAlmacenamiento = GForm.Controls.Add("AhoraOCX.cntPanel", "PnlAlmacenamiento", GForm.Controls("PnlMain"))
    With PnlAlmacenamiento
        .Estilo = 2
        .Visible = True
    End With
    
    Set PnlObservaciones = GForm.Controls.Add("AhoraOCX.cntPanel", "PnlObservaciones", GForm.Controls("PnlMain"))
    With PnlObservaciones 
        .Estilo = 2
        .Visible = True
    End With

    Set lPersTab = gForm.Controls.Add("AhoraOCX.CntTab", "lPersTab", GForm.Controls("PnlMain")) 
    With lPersTab
        .AplicaEstilo
        .Visible = True
        .Move 210, 2655, 6800, 1900 
        .InsertItem 1, "Datos", PnlDatos.Hwnd, 1
        .InsertItem 2, "Almacenamiento", PnlAlmacenamiento.Hwnd, 1
        .InsertItem 3, "Observaciones", PnlObservaciones.Hwnd, 1
    End With 

    Set txtIdBobina = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtIdBobina", GForm.Controls("PnlMain"))
    With txtIdBobina 
        .AplicaEstilo
        .CaptionControl = "Código" 
        .CaptionVisible = True      
        .CaptionWidth = 1150 
        .Enabled = False 
        .Formato = "Sin decimales" 
        .ObjOrigen = "EObjeto"
        .ObjPOrigen = "IdBobina"
        .Move 210, 240, 2000, 300 
        .Necesario = True
        '.TabIndex = 1
        '.TabStop = True
        .TipoDato =  "Numeric"
        .Visible = True 
    End With ' txtIdBobina

    Set cboIdEstado = GForm.Controls.Add("AhoraOCX.ComboUsuario", "cboIdEstado", GForm.Controls("PnlMain"))
    With cboIdEstado
        .ActivarScripts = True
        .AplicaEstilo
        .CActiva = 1
        .CaptionControl = "Estado"
        .C1Anchura = 700
        .C1Nombre = "IdEstado" 
        .C1TipoDato = 2
        .C2Anchura = 3000
        .C2Nombre = "Descrip"
        .C2TipoDato = 8
        .CaptionLink = True
        .CaptionVisible = True
        .CaptionWidth = 700
        .Descripcion = "SELECT IdEstado, Descrip FROM PERS_Bobinas_Estados"
        .Enabled = True
        .ObjOrigen = "EObjeto"
        .ObjPOrigen = "IdEstado"
        .Move 2300, 240, 1550, 300 
        .NColumnas = 2
        .Necesario = True
        '.TabIndex = 11
        '.TabStop = True
        .Visible = True  
    End With ' cboIdEstado

    Set txtEstado = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtEstado", GForm.Controls("PnlMain"))
    With txtEstado   
        .AplicaEstilo   
        .Enabled = False 
        .Formato = "Mayusculas y Minusculas" 
        .Move 3900, cboIdEstado.Top, 3100, 300 
        .Necesario = False
        .TipoDato =  "String"
        .Visible = True 
    End With ' txtEstado
    
    Set txtRefBobina = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtRefBobina", GForm.Controls("PnlMain"))
    With txtRefBobina
        .AplicaEstilo
        .CaptionControl = "Ref. Bobina" 
        .CaptionVisible = True      
        .CaptionWidth = 1150 
        .Enabled = True 
        .Formato = "Mayusculas y Minusculas" 
        .ObjOrigen = "EObjeto"
        .ObjPOrigen = "RefBobina"
        .Move 210, 585, 6800, 300 
        .Necesario = True
        .TabIndex = 1
        .TabStop = True
        .TipoDato =  "String"
        .Visible = True 
    End With ' txtRefBobina
    
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
        .ObjPOrigen = "IdCliente"
        .Move 210, 930, 2000, 300 
        .NColumnas = 3
        .Necesario = True
        .TabIndex = 2
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

    Set txtAlbaranEntrada = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtAlbaranEntrada", GForm.Controls("PnlMain"))
    With txtAlbaranEntrada 
        .AplicaEstilo      
        .CaptionControl = "Albarán" 
        .CaptionVisible = True      
        .CaptionWidth = 1150 
        .Enabled = True 
        .Formato = "Mayusculas y Minusculas"
        .ObjOrigen = "EObjeto"
        .ObjPOrigen = "AlbaranEntrada"
        .Move 210, 1275, 3290, 300 
        .Necesario = False
        .TabIndex = 3
        .TabStop = True
        .Visible = True  
    End With ' txtAlbaranEntrada

    Set txtFechaEntrada = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtFechaEntrada", GForm.Controls("PnlMain"))
    With txtFechaEntrada
        .AplicaEstilo
        .CaptionControl = "Fecha Entrada" 
        .CaptionVisible = True      
        .CaptionWidth = 1150 
        .Enabled = True 
        .Formato = "Fecha Corta" 
        .ObjOrigen = "EObjeto"
        .ObjPOrigen = "FechaEntrada"
        .Move 3650, 1275, 3360, 300 
        .Necesario = True
        .TabIndex = 4
        .TabStop = True
        .TipoDato =  "Date"
        .Visible = True 
    End With ' txtFechaEntrada

    Set txtRefTrabajo = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtRefTrabajo", GForm.Controls("PnlMain"))
    With txtRefTrabajo
        .AplicaEstilo
        .CaptionControl = "Ref. Trabajo" 
        .CaptionVisible = True      
        .CaptionWidth = 1150 
        .Enabled = True 
        .Formato = "Mayusculas y Minusculas" 
        .ObjOrigen = "EObjeto"
        .ObjPOrigen = "RefTrabajo"
        .Move 210, 1620, 6800, 300 
        .Necesario = False
        .TabIndex = 5
        .TabStop = True
        .TipoDato =  "String"
        .Visible = True 
    End With ' txtRefTrabajo
    
    Set txtNumBobina = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtNumBobina", GForm.Controls("PnlMain"))
    With txtNumBobina 
        .AplicaEstilo
        .CaptionControl = "Nº Bobina" 
        .CaptionVisible = True      
        .CaptionWidth = 1150 
        .Enabled = False 
        .Formato = "Sin decimales" 
        .ObjOrigen = "EObjeto"
        .ObjPOrigen = "NumBobina"
        .Move 210, 1965, 2000, 300 
        .Necesario = True
        '.TabIndex = 3
        '.TabStop = True
        .TipoDato =  "Numeric"
        .Visible = True 
    End With ' txtNumBobina 
    
    Set txtKilos = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtKilos", GForm.Controls("PnlDatos"))
    With txtKilos
        .ActivarScripts = True
        .AplicaEstilo
        .CaptionControl = "Kilos" 
        .CaptionVisible = True      
        .CaptionWidth = 700 
        .Enabled = True 
        .Formato = "Con 2 decimales" 
        .ObjOrigen = "EObjeto"
        .ObjPOrigen = "Kilos"
        .Move 100, 100, 1600, 300
        .Necesario = False
        .TabIndex = 6
        .TabStop = True
        .TipoDato =  "Numeric"
        .Visible = True 
    End With ' txtKilos

    Set txtAncho = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtAncho", GForm.Controls("PnlDatos"))
    With txtAncho
        .AplicaEstilo
        .CaptionControl = "Ancho" 
        .CaptionVisible = True      
        .CaptionWidth = 700 
        .Enabled = True 
        .Formato = "Con 2 decimales" 
        .ObjOrigen = "EObjeto"
        .ObjPOrigen = "Ancho"
        .Move 1900, 100, 1600, 300 
        .Necesario = True
        .TabIndex = 7
        .TabStop = True
        .TipoDato =  "Numeric"
        .Visible = True 
    End With ' txtAncho

    Set txtMetros = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtMetros", GForm.Controls("PnlDatos"))
    With txtMetros
        .AplicaEstilo
        .CaptionControl = "Metros" 
        .CaptionVisible = True      
        .CaptionWidth = 700 
        .Enabled = True 
        .Formato = "Con 2 decimales" 
        .ObjOrigen = "EObjeto"
        .ObjPOrigen = "Metros"
        .Move 100, 435, 1600, 300 
        .Necesario = False
        .TabIndex = 8
        .TabStop = True
        .TipoDato =  "Numeric"
        .Visible = True 
    End With ' txtMetros

    Set txtGramaje = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtGramaje", GForm.Controls("PnlDatos"))
    With txtGramaje 
        .AplicaEstilo
        .CaptionControl = "Gramaje" 
        .CaptionVisible = True      
        .CaptionWidth = 700
        .Enabled = True 
        .Formato = "Con 2 decimales" 
        .ObjOrigen = "EObjeto"
        .ObjPOrigen = "Gramaje" 
        .Move 1900, 435, 1600, 300
        .Necesario = True
        .TabIndex = 9
        .TabStop = True
        .TipoDato =  "Numeric"
        .Visible = True 
    End With ' txtGramaje
    
    Set cboIdCalidad = GForm.Controls.Add("AhoraOCX.ComboUsuario", "cboIdCalidad", GForm.Controls("PnlDatos"))
    With cboIdCalidad 
        .ActivarScripts = True
        .AplicaEstilo
        .CActiva = 1
        .CaptionControl = "Calidad"
        .C1Anchura = 700
        .C1Nombre = "IdCalidad" 
        .C1TipoDato = 2
        .C2Anchura = 2500
        .C2Nombre = "Descrip"
        .C2TipoDato = 8
        .CaptionLink = True
        .CaptionVisible = True
        .CaptionWidth = 700
        .Descripcion = "SELECT IdCalidad, Descrip FROM PERS_Tipos_Calidad_Papel"
        .Enabled = True
        .ObjOrigen = "EObjeto"
        .ObjPOrigen = "IdCalidad"
        .Move 100, 780, 1600, 300
        .NColumnas = 2
        .Necesario = False
        .TabIndex = 10
        .TabStop = True
        .Visible = True  
    End With ' cboIdCalidad

    Set txtCalidad = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtCalidad", GForm.Controls("PnlDatos"))
    With txtCalidad
        .AplicaEstilo      
        .Enabled = False 
        .Formato = "Mayusculas y Minusculas" 
        .Move 1750, cboIdCalidad.Top, 4860, 300
        .Necesario = False
        .TipoDato =  "String"
        .Visible = True 
    End With ' txtCalidad
    
    Set cboIdZona = GForm.Controls.Add("AhoraOCX.ComboUsuario", "cboIdZona", GForm.Controls("PnlAlmacenamiento"))
    With cboIdZona
        .ActivarScripts = True
        .AplicaEstilo
        .CActiva = 1
        .CaptionControl = "Zona"
        .C1Anchura = 700
        .C1Nombre = "IdZona" 
        .C1TipoDato = 2
        .C2Anchura = 2500
        .C2Nombre = "Zona"
        .C2TipoDato = 8
        .CaptionLink = True
        .CaptionVisible = True
        .CaptionWidth = 700
        .Descripcion = "SELECT IdZona, Zona FROM PERS_Zonas"
        .Enabled = True
        .ObjOrigen = "EObjeto"
        .ObjPOrigen = "IdZona"
        .Move 100, 100, 1600, 300
        .NColumnas = 2
        .Necesario = False
        .TabIndex = 11
        .TabStop = True
        .Visible = True  
    End With ' cboIdZona

    Set txtZona = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtZona", GForm.Controls("PnlAlmacenamiento"))
    With txtZona 
        .AplicaEstilo      
        .Enabled = False 
        .Formato = "Mayusculas y Minusculas" 
        .Move 1750, cboIdZona.Top, 4860, 300
        .Necesario = False
        .TipoDato =  "String"
        .Visible = True 
    End With ' txtZona
    
    Set cboIdFila = GForm.Controls.Add("AhoraOCX.ComboUsuario", "cboIdFila", GForm.Controls("PnlAlmacenamiento"))
    With cboIdFila
        .ActivarScripts = True
        .AplicaEstilo
        .CActiva = 1
        .CaptionControl = "Fila"
        .C1Anchura = 700
        .C1Nombre = "IdFila" 
        .C1TipoDato = 2
        .C2Anchura = 2500
        .C2Nombre = "Fila"
        .C2TipoDato = 8
        .CaptionLink = True
        .CaptionVisible = True
        .CaptionWidth = 700
        .Descripcion = "SELECT IdFila, Fila FROM PERS_Filas"
        .Enabled = True
        .ObjOrigen = "EObjeto"
        .ObjPOrigen = "IdFila"
        .Move 100, 445, 1600, 300
        .NColumnas = 2
        .Necesario = False
        .TabIndex = 12
        .TabStop = True
        .Visible = True  
    End With ' cboIdZona

    Set txtFila = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtFila", GForm.Controls("PnlAlmacenamiento"))
    With txtFila
        .AplicaEstilo      
        .Enabled = False 
        .Formato = "Mayusculas y Minusculas" 
        .Move 1750, cboIdFila.Top, 4860, 300
        .Necesario = False
        .TipoDato =  "String"
        .Visible = True 
    End With ' txtFila
    
    Set txtObservaciones = GForm.Controls.Add("AhoraOCX.TextoMultilinea", "txtObservaciones", GForm.Controls("PnlObservaciones"))
    With txtObservaciones
        .AplicaEstilo
        .Formato = "Mayusculas y Minusculas" 
        .ObjOrigen = "EObjeto" 
        .ObjPOrigen = "Observaciones" 
        .Move 0, 0, lPersTab.Width - 100, lPersTab.Height
        .Necesario = False
        .TabIndex = 13
        .TabStop = True
        .TipoDato =  "String" 
        .Visible = True
    End With
    
End Sub ' Initialize

Sub CargaObjeto()

    If GForm.EObjeto.ObjGlobal.Nuevo Then  
        GForm.Controls("txtIdBobina").Text = GCN.DameValorCampo ("SELECT ISNULL(MAX(IdBobina), 0) + 1 AS NuevoCodigoBobina FROM Pers_Bobinas", "NuevoCodigoBobina")
        GForm.Controls("cboIdEstado") = 1 
        GForm.Controls("txtNumBobina").Text = 1
        GForm.Controls("txtFechaEntrada").Text = CStr(Now())
    End If
    
    SetAllComboText()
End Sub ' CargaObjeto()

Sub Botonera_BeforeExecute(aBotonera, aBoton, aCancel)
  If aBoton.Name = "botGuardar" Then
    Dim kilos, metros, ancho, gramaje
    
    ancho = CDbl(gForm.Controls("txtAncho").Text)
    gramaje = CDbl(gForm.Controls("txtGramaje").Text)
    
    If gForm.Controls("txtKilos").Text > 0  Then
      kilos = CDbl(gForm.Controls("txtKilos").Text)
      GForm.Controls("txtMetros").Text = CStr((kilos / (ancho * gramaje)) * 100000)
      
    ElseIf gForm.Controls("txtMetros").Text > 0 Then
      metros = CDbl(gForm.Controls("txtMetros").Text)
      GForm.Controls("txtKilos").Text = CStr((ancho * gramaje * (metros / 10000)))
    End If
 
  End If  
End Sub

Sub Botonera_AfterExecute(aBotonera, aBoton)
    If aBoton.Name = "botNuevo" Then
        GForm.Controls("txtIdBobina").Text = GCN.DameValorCampo ("SELECT ISNULL(MAX(IdBobina), 0) + 1 AS NuevoCodigoBobina FROM Pers_Bobinas", "NuevoCodigoBobina")
        GForm.Controls("cboIdEstado") = 1
        SetAllComboText()
    ElseIf aBoton.Name = "btnVerTrabajo" Then
    
        If GForm.Controls("txtIdBobina").Text <> "" Then
            Dim idTrabajo 
            idTrabajo = GCN.DameValorCampo("SELECT IdTrabajo FROM PERS_Trabajos_Lineas_Bobinas WHERE IdBobina = " & GForm.Controls("txtIdBobina").Text)

            If Len(CStr(idTrabajo)) > 0 Then
                Set lObj = GCN.Obj.DameObjeto("Trabajos", "WHERE IdTrabajo = " & idTrabajo)
                lObj.show, True
            Else
                GCN.Obj.ShowMsgBox("Esta bobina no está enlazada a ningún trabajo.")
            End If
        End If
    End If
End Sub ' Botonera_AfterExecute

Sub Combo_AfterUpdate(aCombo)     
    If aCombo.Name = "cboIdCliente" Then 
      SetComboText "cboIdCliente", "txtCliente", "SELECT Cliente FROM Clientes_Datos WHERE IdCliente = "
      
    ElseIf aCombo.Name = "cboIdCalidad" Then 
      SetComboText "cboIdCalidad", "txtCalidad", "SELECT Descrip FROM PERS_Tipos_Calidad_Papel WHERE IdCalidad = "

    ElseIf  aCombo.Name = "cboIdEstado" Then
      SetComboText "cboIdEstado", "txtEstado", "SELECT Descrip FROM PERS_Bobinas_Estados WHERE IdEstado = "
    
    ElseIf aCombo.Name = "cboIdZona" Then
      SetComboText "cboIdZona", "txtZona", "SELECT Zona FROM PERS_Zonas WHERE IdZona = "
    
    ElseIf aCombo.Name = "cboIdFila" Then
      SetComboText "cboIdFila", "txtFila", "SELECT Fila FROM PERS_Filas WHERE IdFila = "     
    End If
End Sub ' Combo_AfterUpdate

Sub Menu_AfterExecute(aMenu, aMenuItem)
    If aMenuItem.Name = "mnuTiposCalidad" Then
        GetMenuMantenimiento "Tipos de Calidad de Papel","PERS_Tipos_Calidad_Papel", "IdCalidad", "Descrip"
    
    ElseIf aMenuItem.Name = "mnuZonas" Then
        GetMenuMantenimiento "Zonas","PERS_Zonas", "IdZona", "Zona"
        
    ElseIf aMenuItem.Name = "mnuFilas" Then
        GetMenuMantenimiento "Filas","PERS_Filas", "IdFila", "Fila"     
    End If
End Sub ' Menu_AfterExecute

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

' Jorge: Establece el la descripcion del valor de todos los combos
Sub SetAllComboText()
  SetComboText "cboIdCliente", "txtCliente", "SELECT Cliente FROM Clientes_Datos WHERE IdCliente = "
  SetComboText "cboIdCalidad", "txtCalidad", "SELECT Descrip FROM PERS_Tipos_Calidad_Papel WHERE IdCalidad = "
  SetComboText "cboIdEstado", "txtEstado", "SELECT Descrip FROM PERS_Bobinas_Estados WHERE IdEstado = "
  SetComboText "cboIdZona", "txtZona", "SELECT Zona FROM PERS_Zonas WHERE IdZona = "
  SetComboText "cboIdFila", "txtFila", "SELECT Fila FROM PERS_Filas WHERE IdFila = "
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