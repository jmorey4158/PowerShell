Get-Command -Module Microsoft.Online.SharePoint.PowerShell "Get-*"| ForEach-Object {Get-Member -InputObject $._ } | Export-Csv -Path "deleted\WindowsPowerShell\Modules\SPO\SpoMembers.csv"
