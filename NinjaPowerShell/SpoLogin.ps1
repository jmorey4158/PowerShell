
$username = "JamesM@VeritasPublishingLLC.onmicrosoft.com"
$password = "Jesus#316"
$cred = New-Object -TypeName System.Management.Automation.PSCredential -argumentlist $userName, $(convertto-securestring $Password -asplaintext -force)
$url = "https://veritaspublishingllc-admin.sharepoint.com"
Connect-SPOService -Url $url -Credential $cred