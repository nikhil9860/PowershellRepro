Get-CalendarDiagnosticObjects -Identity nikhil@nikhil9860.com | where {$_.ClientInfoString -cmatch "AppId=cc15fd57-2c6c-4117-a88c-83b1d56b4bbe"}

$Var = ("nikhil@nikhil9860.com","Test@nikhil9860.com")



foreach($v In $Var){


for($i=0; $i -le 100 ; $i++ ){

Write-Output "Checking for:"$v

Get-CalendarDiagnosticObjects -Identity $v | where {$_.ClientInfoString -cmatch "AppId=cc15fd57-2c6c-4117-a88c-83b1d56b4bbe"}

Start-Sleep (10)

}


Start-Sleep(60)

}




New-InboxRule -Name "Forwad to White" -Mailbox "nikhil@nikhil9860.com" -ForwardTo "Whiteu@nikhil9860.com"

Get-InboxRule -Mailbox nikhil@nikhil9860.com



