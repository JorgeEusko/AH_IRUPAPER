'  GCN.AhoraProceso "AhoraScripts.AbrirFrmGenerico", False, "FrmGridBobinas", GCN.Sesion.MainForm, False
Sub Initialize()
    ' Etiqueta superior
    GForm.Caption = "Grid Bobinas"

    ' Tamaño del formulario
    GForm.Move GForm.Left + 2250, GForm.Top, GForm.Width + 1200, GForm.Height - 400

    Dim refTrabajo
    If GForm.Tag <> "" Then
        refTrabajo = GForm.Tag
    End If

    With GForm.Botonera
        .ActivarScripts = True
        .BotonesMantenimiento = 4
        .Boton("botGuardar").Visible = False
        .Boton("botNuevo").Visible = False
        .Boton("botEliminar").Visible = False
        .Boton("botImprimir").Visible = False
        .SeguridadObjeto = 0
    End With ' Botonera

    Set GrdBobinas = gForm.Controls.Add("AhoraOCX.cntGridUsuario", "GrdBobinas", GForm.Controls("PanMain"))
    With GrdBobinas
        .ActivarScripts = True
        .AplicaEstilo
        .Agregar = False
        .Editar = True
        .Enabled = True
        .Eliminar = False
        .CargaObjetos = False
        .EditarPorObjeto = False
        .AgregaColumna "IdBobina", 1000, "IdBobina", True
        .AgregaColumna "RefBobina", 1200, "Ref. Bobina", True
        .AgregaColumna "RefTrabajo", 1500, "RefTrabajo", True
        .AgregaColumna "Ancho", 1200, "Ancho", True, "", False, "#,##0.00"
        .AgregaColumna "Gramaje", 1200, "Gramaje", True, "", False, "#,##0.00"
        .AgregaColumna "Metros", 1200, "Metros", False, "", False, "#,##0.00"
        .AgregaColumna "Kilos", 1200, "Kilos", False, "", False, "#,##0.00"
        .AgregaColumna "IdCalidad", 2200, "Calidad", True, "SELECT IdCalidad, Descrip FROM PERS_Tipos_Calidad_Papel", False, "", False, "SELECT IdCalidad, Descrip FROM PERS_Tipos_Calidad_Papel"
        .From = "PERS_Bobinas"
        .WHERE = "WHERE RefTrabajo = '" & refTrabajo & "'"
        .Move 100, 200, 12000, 4300 
        .Refresca = True
        .Visible = True
    End With
    
End Sub ' Initialize

Sub Grid_BeforeUpdate(aGrid,aCancel)
    Dim kilos, metros, ancho, gramaje

    kilos = CDbl(GForm.Controls("GrdBobinas").GetValue("Kilos"))
    metros = CDbl(GForm.Controls("GrdBobinas").GetValue("Metros"))
    ancho = CDbl(GForm.Controls("GrdBobinas").GetValue("Ancho"))
    gramaje = CDbl(GForm.Controls("GrdBobinas").GetValue("Gramaje"))
    
    If kilos > 0 And metros = 0  Then
        GForm.Controls("GrdBobinas").SetValue "Metros", CStr((kilos / (ancho * gramaje)) * 100000)
    ElseIf metros > 0 And kilos = 0Then
        GForm.Controls("GrdBobinas").SetValue "Kilos", CStr((ancho * gramaje * (metros / 100000)))
    End If
End Sub ' Grid_BeforeUpdate