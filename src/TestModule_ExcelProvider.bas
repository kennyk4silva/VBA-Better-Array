Attribute VB_Name = "TestModule_ExcelProvider"
Option Explicit
Option Private Module

'@TestModule
'@Folder("Tests.Dependencies.ExcelProvider.Tests")

'@IgnoreModule ProcedureNotUsed
'@IgnoreModule LineLabelNotUsed
'@IgnoreModule EmptyMethod

'Private Assert As Object
'Move to early bind
Private Assert As AssertClass

'Private Fakes As Object
'Move to early bind
'@Ignore VariableNotUsed
Private Fakes As FakesProvider

'@ModuleInitialize
Private Sub ModuleInitialize()
    'this method runs once per module.
'    Set Assert = CreateObject("Rubberduck.AssertClass")
'    Set Fakes = CreateObject("Rubberduck.FakesProvider")
    ' Move to early binding
    Set Assert = New AssertClass
    Set Fakes = New FakesProvider
End Sub

'@ModuleCleanup
Private Sub ModuleCleanup()
    'this method runs once per module.
    Set Assert = Nothing
    Set Fakes = Nothing
End Sub

'@TestInitialize
Private Sub TestInitialize()
    'this method runs before every test in the module.
End Sub

'@TestCleanup
Private Sub TestCleanup()
    'this method runs after every test in the module.
End Sub

'@TestMethod("ExcelProvider_Constructor")
Private Sub Constructor_CanInstantiate_SUTNotNothing()
    On Error GoTo TestFail
    
    'Arrange:
    Dim SUT As ExcelProvider
    'Act:
    Set SUT = New ExcelProvider
    'Assert:
    Assert.IsNotNothing SUT

TestExit:
    Exit Sub
TestFail:
    Assert.Fail "Test raised an error: #" & Err.number & " - " & Err.description
End Sub

'@TestMethod("ExcelProvider_ExcelApplication")
Private Sub ExcelApplication_ReturnsExcelInstance_InstanceIsCorrectType()
    On Error GoTo TestFail
    
    'Arrange:
    Dim SUT As ExcelProvider
    Set SUT = New ExcelProvider
    
    Dim expected As String
    Dim actual As String
    expected = "Microsoft Excel"
    
    'Act:
    actual = SUT.ExcelApplication.Name
    
    'Assert:
    Assert.AreEqual expected, actual, "Actual <> expected"

TestExit:
    Exit Sub
TestFail:
    Assert.Fail "Test raised an error: #" & Err.number & " - " & Err.description
End Sub


'@TestMethod("ExcelProvider_CurrentWorkbook")
Private Sub CurrentWorkbook_ReturnsWorkbook_CurrentWorkbookNotNothing()
    On Error GoTo TestFail
    
    'Arrange:
    Dim SUT As ExcelProvider
    Set SUT = New ExcelProvider
    Dim returned As Object
    Dim expected As String
    Dim actual As String
    expected = "Workbook"
    'Act:
    Set returned = SUT.CurrentWorkbook
    actual = TypeName(returned)
    'Assert:
    Assert.AreEqual expected, actual, "Actual <> expected"

TestExit:
    Exit Sub
TestFail:
    Assert.Fail "Test raised an error: #" & Err.number & " - " & Err.description
End Sub

'@TestMethod("ExcelProvider_CurrentWorksheet")
Private Sub CurrentWorksheet_ReturnsWorksheet_ReturnsTypeWorksheet()
    On Error GoTo TestFail
    
    'Arrange:
    Dim SUT As ExcelProvider
    Set SUT = New ExcelProvider
    
    Dim expected As String
    Dim actual As String
    Dim returned As Object
    expected = "Worksheet"
    
    'Act:
    Set returned = SUT.CurrentWorksheet
    actual = TypeName(returned)
    'Assert:
    Assert.AreEqual expected, actual, "actual has incorrect type"
TestExit:
    Exit Sub
TestFail:
    Assert.Fail "Test raised an error: #" & Err.number & " - " & Err.description
End Sub

'@TestMethod("ExcelProvider_CurrentWorksheet")
Private Sub CurrentWorksheet_ReturnsWorksheet_WorksheetIsChildOfCurrentWorkbook()
    On Error GoTo TestFail
    
    'Arrange:
    Dim SUT As ExcelProvider
    Set SUT = New ExcelProvider
    
    Dim expected As Object
    Dim actual As Object
    
    'Act:
    Set expected = SUT.CurrentWorkbook
    Set actual = SUT.CurrentWorksheet
        
    'Assert:
    Assert.AreSame expected, actual.Parent, "actual <> expected"
TestExit:
    Exit Sub
TestFail:
    Assert.Fail "Test raised an error: #" & Err.number & " - " & Err.description
End Sub

'@TestMethod("ExcelProvider_CurrentWorksheet")
Private Sub CurrentWorksheet_CanSetRangeValue_ReturnsCorrectValue()
    On Error GoTo TestFail
    
    'Arrange:
    Dim SUT As ExcelProvider
    Set SUT = New ExcelProvider
    
    Dim address As String
    Dim expected As String
    Dim actual As String
    
    address = "A1"
    expected = "Hello World"
    'Act:
    SUT.CurrentWorksheet.Range(address) = expected
    actual = SUT.CurrentWorksheet.Range(address)
    'Assert:
    Assert.AreEqual actual, expected, "actual <> expected"
TestExit:
    Exit Sub
TestFail:
    Assert.Fail "Test raised an error: #" & Err.number & " - " & Err.description
End Sub

