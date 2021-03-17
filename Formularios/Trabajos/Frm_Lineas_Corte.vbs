Sub Initialize()
    ' Etiqueta superior
    GForm.Caption = "Líneas de Corte"

    ' Tamaño del formulario
    GForm.Move GForm.Left, GForm.Top + 500, GForm.Width - 775, GForm.Height - 600

    Set GrdLineasCorte = gForm.Controls.Add("AhoraOCX.cntGridUsuario", "GrdLineasCorte", GForm.Controls("PanMain"))
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
        .AgregaColumna "Palets", 1500, "Palets", False, "", False, "#,##0.00", True
        .AgregaColumna "ResmasPorPalet", 1500, "Resmas/Palet", False, "", False, "#,##0.00", True
        .AgregaColumna "PaletsPendientes", 1500, "Palets pendientes", True, "", False, "#,##0.00", True
        .AgregaColumna "PaletsEnviados", 1500, "Palets enviados", True, "", False, "#,##0.00", True
        .FROM = "PERS_Trabajos_Lineas_Corte"
        .Move 210, 200, 9500, 4000 
        .Refresca = True
        .Visible = True
    End With

    If GForm.Tag <> "" Then
        Dim idTrabajo, idLinea
        Set params = gcn.DameNewCollection

        params = Split(GForm.Tag, ",")
        idTrabajo = params(0)
        idLinea = params(1)

        With GForm.Controls("GrdLineasCorte")
            .Where = "WHERE IdTrabajo = " & idTrabajo & " AND IdLinea = " & idLinea
            .Campo("IdTrabajo").Default = "SELECT IdTrabajo FROM Pers_Trabajos WHERE IdTrabajo = " & CInt(idTrabajo)
            .Campo("IdLinea").Default = "SELECT IdLinea FROM PERS_Trabajos_Lineas WHERE IdTrabajo = " & CInt(idTrabajo) & " AND IdLinea = " & CInt(idLinea)
            .Campo("IdLineaCorte").Default = "SELECT ISNULL(MAX(IdLineaCorte), 0) + 1 FROM PERS_Trabajos_Lineas_Corte WHERE IdTrabajo = " & CInt(idTrabajo) & " AND IdLinea = " & CInt(idLinea)
        End With
    End If
End Sub ' Initialize