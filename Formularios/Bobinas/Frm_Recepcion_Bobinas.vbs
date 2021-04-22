' GCN.AhoraProceso "AhoraScripts.AbrirFrmGenerico", False, "FrmRecepcionBobinas", GCN.Sesion.MainForm, False

Sub Initialize()

    ' Etiqueta superior
    GForm.Caption = "Recepción de bobinas"

    ' Tamaño del formulario
    GForm.Move GForm.Left, GForm.Top + 500, GForm.Width - 3500, GForm.Height - 1000

    With GForm.Botonera
        .ActivarScripts = True
        .BotonesMantenimiento = 4
        .BotonAdd "Crear Bobinas", "btnCrearBobinas", "", 0, False, 123
        .Boton("botGuardar").Visible = False
        .Boton("botNuevo").Visible = False
        .Boton("botEliminar").Visible = False
        .Boton("botImprimir").Visible = False
        .SeguridadObjeto = 0
    End With ' Botonera

    Set txtRefBobina = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtRefBobina", GForm.Controls("PanMain"))
    With txtRefBobina
        .AplicaEstilo
        .CaptionControl = "Ref. Bobina" 
        .CaptionVisible = True      
        .CaptionWidth = 1150 
        .Enabled = True 
        .Formato = "Mayusculas y Minusculas" 
        .ObjOrigen = "EObjeto"
        .ObjPOrigen = "RefBobina"
        .Move 210, 240, 6800, 300 
        .Necesario = True
        .TabIndex = 1
        .TabStop = True
        .TipoDato =  "String"
        .Visible = True 
    End With ' txtRefBobina

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
        .Move 210, 585, 2000, 300 
        .NColumnas = 3
        .Necesario = True
        .TabIndex = 2
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

    Set txtAlbaranEntrada = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtAlbaranEntrada", GForm.Controls("PanMain"))
    With txtAlbaranEntrada 
        .AplicaEstilo
        .CaptionControl = "Albarán" 
        .CaptionVisible = True      
        .CaptionWidth = 1150
        .Enabled = True
        .Move 210, 930, 3290, 300 
        .Necesario = False
        .TabIndex = 3
        .TabStop = True
        .Visible = True  
    End With ' txtAlbaranEntrada

    Set txtFechaEntrada = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtFechaEntrada", GForm.Controls("PanMain"))
    With txtFechaEntrada
        .AplicaEstilo
        .CaptionControl = "Fecha Entrada" 
        .CaptionVisible = True      
        .CaptionWidth = 1150 
        .Enabled = True 
        .Formato = "Fecha Corta" 
        .Move 3650, 930, 3360, 300 
        .Necesario = True
        .TabIndex = 4
        .TabStop = True
        .TipoDato =  "Date"
        .Visible = True 
    End With ' txtFechaEntrada

    Set txtRefTrabajo = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtRefTrabajo", GForm.Controls("PanMain"))
    With txtRefTrabajo
        .AplicaEstilo
        .CaptionControl = "Ref. Trabajo" 
        .CaptionVisible = True      
        .CaptionWidth = 1150 
        .Enabled = True 
        .Formato = "Mayusculas y Minusculas" 
        .Move 210, 1275, 6800, 300 
        .Necesario = False
        .TabIndex = 5
        .TabStop = True
        .TipoDato =  "String"
        .Visible = True 
    End With ' txtRefTrabajo

    Set cboIdCalidad = GForm.Controls.Add("AhoraOCX.ComboUsuario", "cboIdCalidad", GForm.Controls("PanMain"))
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
        .CaptionWidth = 1150
        .Descripcion = "SELECT IdCalidad, Descrip FROM PERS_Tipos_Calidad_Papel"
        .Enabled = True
        .Move 210, 1965, 2000, 300
        .NColumnas = 2
        .Necesario = True
        .TabIndex = 6
        .TabStop = True
        .Visible = True  
    End With ' cboIdCalidad

    Set txtCalidad = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtCalidad", GForm.Controls("PanMain"))
    With txtCalidad
        .AplicaEstilo      
        .Enabled = False
        .Formato = "Mayusculas y Minusculas" 
        .Move 2260, cboIdCalidad.Top, 4740, 300
        .Necesario = False
        .TipoDato =  "String"
        .Visible = True 
    End With ' txtCalidad

    Set txtAncho = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtAncho", GForm.Controls("PanMain"))
    With txtAncho
        .AplicaEstilo
        .CaptionControl = "Ancho" 
        .CaptionVisible = True      
        .CaptionWidth = 1150 
        .Enabled = True 
        .Formato = "Con 2 decimales" 
        .Move 210, 2310, 2375, 300 
        .Necesario = True
        .TabIndex = 7
        .TabStop = True
        .TipoDato =  "Numeric"
        .Visible = True 
    End With ' txtAncho

    Set txtGramaje = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtGramaje", GForm.Controls("PanMain"))
    With txtGramaje 
        .AplicaEstilo
        .CaptionControl = "Gramaje" 
        .CaptionVisible = True      
        .CaptionWidth = 1150
        .Enabled = True 
        .Formato = "Con 2 decimales" 
        .Move 2635, 2310, 2375, 300
        .Necesario = True
        .TabIndex = 8
        .TabStop = True
        .TipoDato =  "Numeric"
        .Visible = True 
    End With ' txtGramaje

    Set cboIdZona = GForm.Controls.Add("AhoraOCX.ComboUsuario", "cboIdZona", GForm.Controls("PanMain"))
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
        .C2TipoDato = 9
        .CaptionLink = True
        .CaptionVisible = True
        .CaptionWidth = 1150
        .Descripcion = "SELECT IdZona, Zona FROM PERS_Zonas"
        .Enabled = True
        .ObjOrigen = "EObjeto"
        .ObjPOrigen = "IdZona"
        .Move 210, 3000, 2000, 300
        .NColumnas = 2
        .Necesario = False
        .TabIndex = 9
        .TabStop = True
        .Visible = True  
    End With ' cboIdZona

    Set txtZona = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtZona", GForm.Controls("PanMain"))
    With txtZona 
        .AplicaEstilo      
        .Enabled = False 
        .Formato = "Mayusculas y Minusculas" 
        .Move 2260, cboIdZona.Top, 4740, 300
        .Necesario = False
        .TipoDato =  "String"
        .Visible = True 
    End With ' txtZona
    
    Set cboIdFila = GForm.Controls.Add("AhoraOCX.ComboUsuario", "cboIdFila", GForm.Controls("PanMain"))
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
        .CaptionWidth = 1150
        .Descripcion = "SELECT IdFila, Fila FROM PERS_Filas"
        .Enabled = True
        .ObjOrigen = "EObjeto"
        .ObjPOrigen = "IdFila"
        .Move 210, 3345, 2000, 300
        .NColumnas = 2
        .Necesario = False
        .TabIndex = 10
        .TabStop = True
        .Visible = True  
    End With ' cboIdZona

    Set txtFila = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtFila", GForm.Controls("PanMain"))
    With txtFila
        .AplicaEstilo      
        .Enabled = False 
        .Formato = "Mayusculas y Minusculas" 
        .Move 2260, cboIdFila.Top, 4740, 300
        .Necesario = False
        .TipoDato =  "String"
        .Visible = True 
    End With ' txtFila

End Sub ' Initialize

Sub Show()
    GForm.Controls("txtRefBobina").SetFocus
    GForm.Controls("txtFechaEntrada").Text = CStr(Now())
End Sub ' Show

Sub Combo_AfterUpdate(aCombo)

    If aCombo.Name = "cboIdCliente" Then 
      SetComboText "cboIdCliente", "txtCliente", "SELECT Cliente FROM Clientes_Datos WHERE IdCliente = "
      
    ElseIf aCombo.Name = "cboIdCalidad" Then 
      SetComboText "cboIdCalidad", "txtCalidad", "SELECT Descrip FROM PERS_Tipos_Calidad_Papel WHERE IdCalidad = "

    ElseIf aCombo.Name = "cboIdZona" Then
      SetComboText "cboIdZona", "txtZona", "SELECT Zona FROM PERS_Zonas WHERE IdZona = "
    
    ElseIf aCombo.Name = "cboIdFila" Then
      SetComboText "cboIdFila", "txtFila", "SELECT Fila FROM PERS_Filas WHERE IdFila = "     
    End If

End Sub ' Combo_AfterUpdate

Sub Botonera_AfterExecute(aBotonera, aBoton)
    If aBoton.Name = "btnCrearBobinas" Then
        CrearBobinas()
    End If
End Sub ' Botonera_AfterExecute

'Jorge: Proceso que crea las bobinas
Sub CrearBobinas()
    Dim IdCliente, IdAlbaran, Gramaje, Ancho, RefTrabajo, IdCalidad, FechaEntrada, Cantidad, RefBobina, IdZona, IdFila

    Cantidad = InputBox("Introduce la cantidad de bobinas")
        
    If Len(Cantidad) = 0 Then
        GCN.Obj.ShowMsgBox("Debes introducir una cantidad")
    ElseIf Cantidad < 1 Then
        GCN.Obj.ShowMsgBox("Debes indicar una cantidad superior a 0")
    Else
        IdCliente = GForm.Controls("cboIdCliente").Value
        Albaran = GForm.Controls("txtAlbaranEntrada").Text
        FechaEntrada = GForm.Controls("txtFechaEntrada").Text
        RefTrabajo = GForm.Controls("txtRefTrabajo").Text
        IdCalidad = GForm.Controls("cboIdCalidad").Value
        Gramaje = GForm.Controls("txtGramaje").Text
        Ancho = GForm.Controls("txtAncho").Text
        RefBobina = GForm.Controls("txtRefBobina").Text
        IdZona = GForm.Controls("cboIdZona").Value
        IdFila = GForm.Controls("cboIdFila").Value

        Set params = GCN.DameNewCollection
        params.Add idCliente
        params.Add Albaran
        params.Add FechaEntrada
        params.Add RefTrabajo
        params.Add IdCalidad
        params.Add Ancho
        params.Add Gramaje
        params.Add Cantidad
        params.Add RefBobina
        params.Add IdZona
        params.Add IdFila

        If GCN.EjecutaStoreCol("PPERS_Recepcionar_Bobinas", params) Then
            GCN.Obj.ShowMsgBox("Bobinas creadas con éxito.")

            Set lCol = Gcn.Obj.DameColeccion("Bobinas", "WHERE RefTrabajo = '" & RefTrabajo & "'", , False)
            lCol.Show()
        Else
            GCN.Obj.ShowMsgBox("Error al crear las bobinas.")
        End If
    End If
End Sub ' CrearBobinas

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
