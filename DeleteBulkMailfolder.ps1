$RequiredScopes = @("Mail.ReadWrite")
Connect-MgGraph -Scopes $RequiredScopes 
Disconnect-MgGraph



Get-MgUserMailFolder -UserId nikhil@nikhil9860.com -Top 230 | Export-Csv -Path C:\Temp\Folders.csv



Import-Csv -Path C:\Temp\Folders.csv| ForEach-Object {
 
 
 Write-Host "$($_.DisplayName)"

 Remove-MgUserMailFolder -UserId nikhil@nikhil9860.com -MailFolderId "$($_.ID)"

 }


