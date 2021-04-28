Sub Initialize()
    ' Etiqueta superior
    GForm.Caption = "Enlazar Bobinas"

    ' Tamaño del formulario
    GForm.Move GForm.Left + 2250, GForm.Top, GForm.Width + 300, GForm.Height - 400

    Dim idTrabajo, idLinea, refTrabajo
    If GForm.Tag <> "" Then
        Set params = gcn.DameNewCollection
        params = Split(GForm.Tag, ",")
        idTrabajo = params(0)
        idLinea = params(1)
        refTrabajo = params(2)
    End If

    GCN.ExecuteSql "UPDATE PERS_Bobinas SET Asignada = 0, Marcar = 0"
    GCN.ExecuteSql "UPDATE PERS_Bobinas SET Asignada = 1 WHERE IdBobina IN (SELECT IdBobina FROM PERS_Trabajos_Lineas_Bobinas WHERE IdTrabajo = " & idTrabajo & " AND IdLinea = " & idLinea & ")"

    With GForm.Botonera
        .ActivarScripts = True
        .BotonesMantenimiento = 4
        .Boton("botGuardar").Visible = False
        .Boton("botNuevo").Visible = False
        .Boton("botEliminar").Visible = False
        .Boton("botImprimir").Visible = False
        .BotonAdd "Asignar Bobinas", "btnAsignarBobinas", , 0, True, 123
        .BotonAdd "Desasignar Bobinas", "btnDesasignarBobinas", , 0, True, 123
        .SeguridadObjeto = 0
    End With ' Botonera

    Set chkVerBobinas = GForm.Controls.Add("AhoraOCX.CheckBoxUser", "chkVerBobinas", GForm.Controls("PanMain"))
    With chkVerBobinas
        .ActivarScripts = True
        .CaptionControl = "Ver todas las bobinas"
        .CaptionVisible = True 
        .CaptionWidth = 1500 
        .Enabled = True 
        .Move 100, 100, 2000, 300 
        .Value = False
        .Visible = True
    End With

    Set GrdEnlazarBobinas = gForm.Controls.Add("AhoraOCX.cntGridUsuario", "GrdEnlazarBobinas", GForm.Controls("PanMain"))
    With GrdEnlazarBobinas
        .ActivarScripts = True
        .AplicaEstilo
        .Agregar = False
        .Editar = True
        .Enabled = True
        .Eliminar = False
        .CargaObjetos = False
        .EditarPorObjeto = False
        .AgregaColumna "IdBobina", 0, "IdBobina", True
        .AgregaColumna "RefBobina", 1200, "Ref. Bobina", True
        .AgregaColumna "NumBobina", 1200, "Num. Bobina", True
        .AgregaColumna "Ancho", 1350, "Ancho (cm)", True, "", False, "#,##0.00"
        .AgregaColumna "Gramaje", 1350, "Gramaje (Gr/m2)", True, "", False, "#,##0.00"
        .AgregaColumna "IdCalidad", 2200, "Calidad", True, "SELECT IdCalidad, Descrip FROM PERS_Tipos_Calidad_Papel", False, "", False, "SELECT IdCalidad, Descrip FROM PERS_Tipos_Calidad_Papel"
        .AgregaColumna "Asignada", 1200, "Asignada", True
        .AgregaColumna "Marcar", 1200, "Marcar", False
        .From = "PERS_Bobinas"
        .WHERE = "WHERE RefTrabajo = '" & refTrabajo & "'"
        .Move 100, 445, 10800, 4000 
        .Refresca = True
        .Visible = True
    End With
    
End Sub ' Initialize

Sub Botonera_AfterExecute(aBotonera, aBoton)
    ' Obtiene los valores del formulario padre
    Set paramsGForm = gcn.DameNewCollection
    paramsGForm = Split(GForm.Tag, ",")
    idTrabajo = paramsGForm(0)
    idLinea = paramsGForm(1)

    ' Establece los parametros para el procedimiento almacendo
    Set params = gcn.DameNewCollection
    params.Add idTrabajo
    params.Add idLinea

    If aBoton.Name = "btnAsignarBobinas" Then
        If GCN.EjecutaStoreCol("PPERS_Asignar_Bobinas_I", params) Then
            GCN.Obj.ShowMsgBox("Bobinas asignadas correctamente.")
        Else
            GCN.Obj.ShowMsgBox("Ha ocurrido algún error al asignar las bobinas.")
        End If
    ElseIf aBoton.Name = "btnDesasignarBobinas" Then
        If GCN.EjecutaStoreCol("PPERS_Desasignar_Bobinas_D", params) Then
            GCN.Obj.ShowMsgBox("Bobinas desaasignadas correctamente.")
        Else
            GCN.Obj.ShowMsgBox("Ha ocurrido algún error al desasignar las bobinas.")
        End If
    End If

    ActualizarGrid()
End Sub ' Botonera_AfterExecute

Sub Check_Click(aCheckBox)
  If aCheckBox.Name = "chkVerBobinas" Then
    If aCheckBox.Value Then
      GForm.Controls("GrdEnlazarBobinas").WHERE = ""
      GForm.Controls("GrdEnlazarBobinas").Refrescar
    Else
        Set params = gcn.DameNewCollection
        params = Split(GForm.Tag, ",")
        idTrabajo = params(0)
        idLinea = params(1)
        refTrabajo = params(2)
        GForm.Controls("GrdEnlazarBobinas").WHERE = "WHERE RefTrabajo = '" & refTrabajo & "'"
        GForm.Controls("GrdEnlazarBobinas").Refrescar
    End If
  End If
End Sub ' Check_Click

Sub Grid_DblClick(aGrid)
    Dim idBobina
    idBobina = aGrid.GetValue("IdBobina")
    Set lObj = GCN.Obj.DameObjeto("Bobinas", "Where IdBobina = " & idBobina)
    lObj.Show, True
End Sub ' Grid_DblClick

Sub ActualizarGrid() 
        Dim idTrabajo, idLinea, refTrabajo
    If GForm.Tag <> "" Then
        Set params = gcn.DameNewCollection
        params = Split(GForm.Tag, ",")
        idTrabajo = params(0)
        idLinea = params(1)
        refTrabajo = params(2)
    End If

    GCN.ExecuteSql "UPDATE PERS_Bobinas SET Asignada = 0, Marcar = 0"
    GCN.ExecuteSql "UPDATE PERS_Bobinas SET Asignada = 1 WHERE IdBobina IN (SELECT IdBobina FROM PERS_Trabajos_Lineas_Bobinas WHERE IdTrabajo = " & idTrabajo & " AND IdLinea = " & idLinea & ")"
    GForm.Controls("GrdEnlazarBobinas").Refrescar
End Sub ' ActualizarGrid