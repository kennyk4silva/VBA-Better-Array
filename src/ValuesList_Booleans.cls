VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "ValuesList_Booleans"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Implements IValuesList

'@Folder("Tests.Dependencies.IValuesList.Implementations")

Private IsObjectType As Boolean

Private Values(0 To 1) As Boolean

Private Sub Class_Initialize()
    Values(0) = True
    Values(1) = False
    IsObjectType = False
End Sub

Public Property Get IValuesList_IsObjectType() As Boolean
    IValuesList_IsObjectType = IsObjectType
End Property

Public Function IValuesList_GetRandomValue() As Variant
    IValuesList_GetRandomValue = Values(rand(LBound(Values), UBound(Values)))
End Function

Private Function rand(ByVal Max As Long, Optional ByVal Min As Long = 0) As Long
    Randomize: rand = Int(Rnd * (Max - Min) + 1) + Min
End Function

