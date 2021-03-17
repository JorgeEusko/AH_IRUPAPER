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
    GForm.Move GForm.Left, GForm.Top + 500, GForm.Width + 3775, GForm.Height - 600

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
        .AgregaColumna "PaletsCortados", 1200, "Palets", True
        .AgregaColumna "PaletsEnviados", 1200, "Palets enviados", True
        .AgregaColumna "PaletsPendientes", 1200, "Palets pendientes", True
        .AgregaColumna "PaletsAsignar", 1200, "Asignar palets"
        .FROM = "PERS_TEMP_Asignar_Envios"
        .Move 210, 200, 13800, 4000 
        .Refresca = True
        .Visible = True
    End With

End Sub ' Initialize

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
        End If
    End If
End Sub ' Botonera_AfterExecute