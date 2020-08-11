VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} UserForm1 
   Caption         =   "Usuario y contraseña -Dame una mano"
   ClientHeight    =   7575
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   4305
   OleObjectBlob   =   "UserForm1.frx":0000
   ShowModal       =   0   'False
   StartUpPosition =   1  'Centrar en propietario
End
Attribute VB_Name = "UserForm1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub CommandButton1_Click()
Unload Me
UserFormingreso.Show
End Sub

Private Sub CommandButton2_Click()
Dim usuario As String
Dim password As Variant
Dim DatoEncontrado

UsuarioExistente = Application.WorksheetFunction.CountIf(Range("D3:D12"), _
    Me.txtUsuario.Value)
Set Rango = Range("D3:D12")
If Me.txtUsuario.Value = "" Or Me.txtPassword.Value = "" Then
    MsgBox "Por favor introduce usuario y contraseña", vbExclamation, Blog
    Me.txtUsuario.SetFocus
ElseIf UsuarioExistente = 0 Then
    MsgBox "El usuario '" & Me.txtUsuario & "' no existe", vbExclamation, Blog
ElseIf UsuarioExistente = 1 Then
    DatoEncontrado = Rango.Find(What:=Me.txtUsuario.Value, MatchCase:=True).Address
    Contrasenia = Range(DatoEncontrado).Offset(0, 1).Value
    If Range(DatoEncontrado).Value = Me.txtUsuario.Value And Contrasenia = _
    Me.txtPassword.Value Then
        
        'Aquí va el código para dar acceso a todo lo que el programador decida
        Unload Me
        UserFormPrincipal.Show
    Else
        MsgBox "La contraseña es inválida", vbExclamation, Blog
    End If
End If
End Sub



