'  GCN.AhoraProceso "AhoraScripts.AbrirFrmGenerico", False, "FrmEnlazarClientesContactos", GCN.Sesion.MainForm, False
Sub Initialize()
    Set params = gcn.DameNewCollection
    GCN.EjecutaStoreCol "PPERS_Crear_Temporales_Clientes_Contactos", params
    
     ' Etiqueta superior
    GForm.Caption = "Enlace de clientes y contactos"

    ' Tamaño del formulario
    GForm.Move GForm.Left, GForm.Top + 500, GForm.Width + 1600, GForm.Height

    With GForm.Botonera
        .ActivarScripts = True
        .BotonesMantenimiento = 4
        .BotonAdd "Enlazar", "btnEnlazar", "", 0, False, 123
        .Boton("botGuardar").Visible = False
        .Boton("botNuevo").Visible = False
        .Boton("botEliminar").Visible = False
        .Boton("botImprimir").Visible = False
        .SeguridadObjeto = 0
    End With ' Botonera

    Set lblCliente = gForm.Controls.Add("VB.Label", "lblCliente", GForm.Controls("PanMain")) 
    With lblCliente 
        .Width = 4000 
        .Left = 1700
        .Top = 50
        .Visible = True 
        .Caption = "Clientes" 
        .FontSize = 11
        .FontName = "Verdana" 
        .FontBold = True 
        .ForeColor = RGB(0, 0, 0)
    End With

    Set GrdClientes = gForm.Controls.Add("AhoraOCX.cntGridUsuario", "GrdClientes", GForm.Controls("PanMain"))
    With GrdClientes
        .ActivarScripts = True
        .Visible = True
        .AplicaEstilo
        .Agregar = False
        .Editar = True
        .Enabled = True
        .Eliminar = False
        .AgregaColumna "IdCliente", 0, "Código"
        .AgregaColumna "Cliente", 2500, "Cliente"
        .AgregaColumna "Marcado", 500, "Asignar"
        .FROM = "PERS_TEMP_Clientes_Datos"
        .Refresca = True
        .Move 100, 400, 4000, 4700 
    End With ' GrdClientes

    Set lblDirEnvio = gForm.Controls.Add("VB.Label","lblDirEnvio", GForm.Controls("PanMain")) 
    With lblDirEnvio 
        .Width = 4000 
        .Left = 7100
        .Top = 50
        .Visible = True 
        .Caption = "Direcciones de envío" 
        .FontSize = 11
        .FontName = "Verdana" 
        .FontBold = True 
        .ForeColor = RGB(0, 0, 0)
    End With

    Set GrdContactos = gForm.Controls.Add("AhoraOCX.cntGridUsuario", "GrdContactos", GForm.Controls("PanMain"))
    With GrdContactos
        .ActivarScripts = True
        .Visible = True
        .AplicaEstilo
        .Agregar = False
        .Editar = True
        .Enabled = True
        .Eliminar = False
        .AgregaColumna "IdContacto", 0, "Código"
        .AgregaColumna "Nombre", 2500, "Contacto"
        .AgregaColumna "Direccion", 4000, "Dirección"
        .AgregaColumna "Marcado", 500, "Asignar"
        .FROM = "PERS_TEMP_Contactos"
        .Refresca = True
        .Move 4200, 400, 8000, 4700 
    End With ' GrdContactos

End Sub ' Initialize

Sub Botonera_AfterExecute(aBotonera, aBoton)
    If aBoton.Name = "btnEnlazar" Then
        Set params = gcn.DameNewCollection
        If GCN.EjecutaStoreCol("PPERS_Enlazar_Clientes_Contactos", params) Then
            GCN.Obj.ShowMsgBox("Enlace realizado con éxito.")
        Else
            GCN.Obj.ShowMsgBox("Ha ocurrido un error al realizar el enlace.")
        End If
    End If  
End Sub ' Botonera_AfterExecute