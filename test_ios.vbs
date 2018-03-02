Dim gridClient, client
Dim oFS, d, dc, s, n
Set filesys = CreateObject("Scripting.FileSystemObject")
Set grid = CreateObject("Experitest.GridVBClient")

grid.SetConnectionInfo "amit.nahum", "Aa123456", "Default", "sales.experitest.com", 443, true

Set vbclient = grid.LockDeviceForExecution("iOS VB DEMO", WScript.Arguments(0), 10, 20000)

vbclient.SetReporter2 "pdf", "C:\Users\amit.nahum\Downloads\Demo\vbscript\vbscriptGrid\reports", "VB iOS"

vbclient.SetProperty "report:vb.test.name", "VBScript Demo"

vbclient.SetProperty "report:build.id", "12"

vbclient.Launch "com.experitest.ExperiBank", false, true

vbclient.ElementSendText "NATIVE", "xpath=//*[@placeholder='Username']", 0 , "company"

vbclient.ElementSendText "NATIVE", "xpath=//*[@placeholder='Password']", 0 , "company"

vbclient.Click "NATIVE", "xpath=//*[@text='Login']", 0, 1

vbclient.sleep 4000

vbclient.Click "NATIVE", "xpath=//*[@text='Logout']", 0, 1

vbclient.ApplicationClose "com.experitest.ExperiBank" 

vbclient.sleep 2000

reportFolder = vbclient.GenerateReport2(false)

If filesys.FolderExists(reportFolder) Then
  filesys.GetFolder(reportFolder).Name = "myReport"
End If

vbclient.ReleaseClient