
$username = "NMAE@COMPANY.onmicrosoft.com"
$password = "<DELETED>"
$cred = New-Object -TypeName System.Management.Automation.PSCredential -argumentlist $userName, $(convertto-securestring $Password -asplaintext -force)
$url = "<DELETED>admin.sharepoint.com"
Connect-SPOService -Url $url -Credential $cred
