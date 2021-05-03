'  GCN.AhoraProceso "AhoraScripts.AbrirFrmGenerico", False, "FrmBusquedaPorRefTrabajo", GCN.Sesion.MainForm, False
Sub Initialize

    ' Etiqueta superior
    GForm.Caption = "Busqueda de Trabajos por Referencia"

    ' Tamaño del formulario
    GForm.Move GForm.Left - 1800, GForm.Top + 500, GForm.Width + 3700, GForm.Height

    With GForm.Botonera
        .ActivarScripts = True
        .BotonesMantenimiento = 4
        .Boton("botGuardar").Visible = False
        .Boton("botNuevo").Visible = False
        .Boton("botEliminar").Visible = False
        .Boton("botImprimir").Visible = False
        .SeguridadObjeto = 0
    End With ' Botonera

    Set txtRefTrabajo = GForm.Controls.Add("AhoraOCX.TextoUsuario", "txtRefTrabajo", GForm.Controls("PanMain"))
    With txtRefTrabajo 
        .AplicaEstilo
        .CaptionControl = "Ref. Trabajo:" 
        .CaptionVisible = True      
        .CaptionWidth = 1150 
        .Enabled = True 
        .Formato = "Mayusculas y minusculas" 
        .Move 210, 200, 3000, 300 
        .Necesario = True
        .TabIndex = 1
        .TabStop = True
        .TipoDato =  "String"
        .Visible = True 
    End With ' txtRefTrabajo

    Set cntFiltro = GForm.Controls.Add("AhoraOCX.cntBotonera", "cntFiltro", GForm.Controls("PanMain"))
    With cntFiltro
        .ActivarScripts = True
        .BotonAdd "Filtrar", "btnFiltrar", "", 0, False
        .HabilitaBotones
        .Move txtRefTrabajo.Left + txtRefTrabajo.Width + 100, txtRefTrabajo.Top - 30, 1000, 300
        .SeguridadObjeto = True
        .Visible = True
    End With ' cntFiltro

    Set GrdTrabajosRef = gForm.Controls.Add("AhoraOCX.cntGridUsuario", "GrdTrabajosRef", GForm.Controls("PanMain"))
    With GrdTrabajosRef
        .ActivarScripts = True
        .AplicaEstilo
        .Agregar = False
        .Editar = False
        .Enabled = True
        .Eliminar = False
        .AgregaColumna "IdTrabajo", 1000, "IdTrabajo", True
        .AgregaColumna "RefTrabajo", 1500, "RefTrabajo", True
        .AgregaColumna "Cliente", 2500, "Cliente", True
        .AgregaColumna "DescripEstado", 1500, "Estado", True
        .AgregaColumna "Facturado", 1000, "Facturado", True
        .AgregaColumna "DireccionEnvio", 1500, "Dirección de envío", True
        .AgregaColumna "Fecha", 800, "Fecha", True, "", False, "dd/mm/yyyy"
        .AgregaColumna "IdPedidoCliente", 1500, "Pedido Clente", True
        .AgregaColumna "IdPedidoClienteFinal", 1500, "Pedido Clente Final", True
        .FROM = "VPERS_Trabajos_RefTrabajo"
        .WHERE = "WHERE 1 = 0"
        .Move 210, 650, 14000, 4200 
        .Refresca = True
        .Visible = True
    End With

End Sub ' Initialize

Sub Botonera_AfterExecute(aBotonera, aBoton)
    If aBoton.Name = "btnFiltrar" Then
        Dim refTrabajo
        refTrabajo = GForm.Controls("txtRefTrabajo").Text

        ' Si hay seleccionada una direccion de envio, se agrega al filtro
        If Len(refTrabajo) > 0 Then
            textoWhere = "WHERE  = '" & idDirEnvio & "'"
        End If

        ' Aplica el filtro y refresca el grid
        GForm.Controls("GrdTrabajosRef").WHERE = textoWhere
        GForm.Controls("GrdTrabajosRef").Refrescar
    End If
End Sub ' Botonera_AfterExecute

Sub Grid_DblClick(aGrid)
    Dim idTrabajo
    idTrabajo = aGrid.GetValue("IdTrabajo")
    Set lObj = GCN.Obj.DameObjeto("Trabajos", "Where IdTrabajo = " & idTrabajo)
    lObj.Show, True
End Sub ' Grid_DblClick

