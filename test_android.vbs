Set grid = CreateObject("Experitest.GridVBClient")

grid.SetConnectionInfo "amit.nahum", "Aa123456", "DBS", "sales.experitest.com", 443, true

Set vbclient = grid.LockDeviceForExecution("DBS Android", WScript.Arguments(1), 10, 20000)

vbclient.SetReporter2 "xml", "c:\vbreports\dbs", "DBS Android"

'Wscript.Echo "Build ID = " & WScript.Arguments(0)

vbclient.SetProperty "report:test.name", "DBS Ideal Demo"

vbclient.SetProperty "report:build.id", WScript.Arguments(0)

vbclient.SetProperty "report:user.runner", "Siva"

vbclient.Launch "com.dbs.ideal/.modules.login.LoginActivity", false, true

vbclient.Sleep 2000

vbclient.Click "NATIVE", "xpath=//*[@id='needHelpButton']", 0, 1

vbclient.Click "NATIVE", "xpath=//*[@text='About']", 0, 1

vbclient.ElementGetText "NATIVE", "xpath=//*[@text='Troubleshooting ID']/..//*[not(@text='Troubleshooting ID') and not(@id='dividerBottom')]", 0

vbclient.Sleep 5000

vbclient.ApplicationClose ""

vbclient.Sleep 5000

vbclient.GenerateReport2 false

vbclient.ReleaseClient