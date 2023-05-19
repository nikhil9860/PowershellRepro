Import-Csv -Path C:\Users\nikhi\Documents\Output.csv | ForEach-Object {
 
 
 #Write-Host "$($_.Emailaddress)"

Get-Mailbox -Identity "$($_.Emailaddress)"
 
 
 }

